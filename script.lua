local a = game:GetService("ReplicatedStorage")
local b = game.Players.LocalPlayer
local c = Instance.new("ScreenGui")
c.Parent = b.PlayerGui
c.Name = "MultiSend by LK-GONNA11"

-- Interface principale (boîte de spam)
local d = Instance.new("Frame")
d.Size = UDim2.new(0, 400, 0, 300)
d.Position = UDim2.new(0.5, -200, 0.5, -150)
d.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
d.BorderSizePixel = 0
d.Parent = c
d.AnchorPoint = Vector2.new(0.5, 0.5)
d.Draggable = true
d.Active = true
d.Selectable = true

-- Titre de l'interface
local e = Instance.new("TextLabel")
e.Size = UDim2.new(1, 0, 0, 40)
e.BackgroundTransparency = 1
e.Text = "MultiSend by LK-GONNA11"
e.TextColor3 = Color3.fromRGB(255, 255, 255)
e.TextSize = 24
e.TextStrokeTransparency = 0.5
e.Font = Enum.Font.SourceSansBold
e.Parent = d

-- Zone pour écrire le message
local f = Instance.new("TextBox")
f.Size = UDim2.new(1, -20, 0, 50)
f.Position = UDim2.new(0, 10, 0, 50)
f.PlaceholderText = "Your message..."
f.TextColor3 = Color3.fromRGB(255, 255, 255)
f.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
f.BorderSizePixel = 0
f.TextSize = 18
f.Font = Enum.Font.SourceSans
f.Parent = d

-- Zone pour spécifier le nombre de messages
local g = Instance.new("TextBox")
g.Size = UDim2.new(1, -20, 0, 50)
g.Position = UDim2.new(0, 10, 0, 110)
g.PlaceholderText = "Number of messages"
g.TextColor3 = Color3.fromRGB(255, 255, 255)
g.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
g.BorderSizePixel = 0
g.TextSize = 18
g.Font = Enum.Font.SourceSans
g.Parent = d

-- Bouton pour envoyer les messages
local h = Instance.new("TextButton")
h.Size = UDim2.new(0, 100, 0, 40)
h.Position = UDim2.new(0, 10, 0, 170)
h.Text = "Send"
h.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
h.TextColor3 = Color3.fromRGB(255, 255, 255)
h.Font = Enum.Font.SourceSansBold
h.TextSize = 20
h.Parent = d

-- Bouton pour fermer la fenêtre
local i = Instance.new("TextButton")
i.Size = UDim2.new(0, 50, 0, 30)
i.Position = UDim2.new(1, -60, 0, 10)
i.Text = "X"
i.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
i.TextColor3 = Color3.fromRGB(255, 255, 255)
i.Font = Enum.Font.SourceSansBold
i.Parent = d

-- Logo en haut à gauche
local j = Instance.new("ImageButton")
j.Size = UDim2.new(0, 40, 0, 40)
j.Position = UDim2.new(0, 10, 0, 10)
j.Image = "rbxassetid://94030720100977"  -- Remplacez par votre propre ID d'image
j.Visible = false
j.Parent = c

-- Fonction pour envoyer des messages
local function sendMessage(msg)
    local messageRequest = a:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    messageRequest:FireServer(msg, "All")
end

-- Fonction pour contourner la modération avec des caractères similaires
local function obfuscate(text)
    local letter_map = {
        ["a"]="а", ["e"]="е", ["o"]="о", ["c"]="с", ["y"]="у", ["l"]="Ⅼ", 
        ["i"]="Ⅰ", ["t"]="𝑡", ["n"]="𝑛", ["s"]="ѕ", ["m"]="𝓂", ["u"]="𝓊", 
        ["h"]="һ", ["p"]="р", ["r"]="г", ["b"]="в", ["d"]="ⅾ", ["f"]="ƒ"
    }

    text = text:gsub(".", function(c)
        return letter_map[c:lower()] or c
    end)

    text = text:gsub("([aeiou])", "%1")  -- Ajoute un espace invisible après chaque voyelle pour éviter la modération
    return text
end

-- Liste de mots potentiellement modérés
local k = {"badword1", "badword2", "badword3", "shit"}

-- Fonction pour vérifier si un message est modéré
local function isModerated(text)
    for _, v in ipairs(k) do
        if text:lower():find(v) then
            return true
        end
    end
    return false
end

-- Lorsque le bouton "Send" est cliqué
h.MouseButton1Click:Connect(function()
    local msg = f.Text
    local numMessages = tonumber(g.Text) or 1  -- Par défaut 1 si l'entrée est invalide

    if msg and msg ~= "" then
        if isModerated(msg) then
            msg = obfuscate(msg)  -- Appliquer l'obfuscation si c'est un mot modéré
        end
        
        for i = 1, numMessages do
            sendMessage(msg)
        end
    end
end)

-- Lorsque le bouton "X" est cliqué (fermer la fenêtre et afficher le logo)
i.MouseButton1Click:Connect(function()
    d.Visible = false
    j.Visible = true
end)

-- Lorsque le logo est cliqué (réouvrir la fenêtre)
j.MouseButton1Click:Connect(function()
    d.Visible = true
    j.Visible = false
end)

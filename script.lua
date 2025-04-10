local _0xA3F9 = game:GetService("ReplicatedStorage")
local _0xE2D5 = game.Players.LocalPlayer
local _0x94F7 = Instance.new("ScreenGui")
_0x94F7.Parent = _0xE2D5.PlayerGui
_0x94F7.Name = "MultiSend by LK-GONNA11"

local _0xC83D = Instance.new("Frame")
_0xC83D.Size = UDim2.new(0, 400, 0, 300)
_0xC83D.Position = UDim2.new(0.5, -200, 0.5, -150)
_0xC83D.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0xC83D.BorderSizePixel = 0
_0xC83D.Parent = _0x94F7
_0xC83D.AnchorPoint = Vector2.new(0.5, 0.5)
_0xC83D.Draggable = true
_0xC83D.Active = true
_0xC83D.Selectable = true

local _0x58E0 = Instance.new("TextLabel")
_0x58E0.Size = UDim2.new(1, 0, 0, 40)
_0x58E0.BackgroundTransparency = 1
_0x58E0.Text = "MultiSend by LK-GONNA11"
_0x58E0.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x58E0.TextSize = 24
_0x58E0.TextStrokeTransparency = 0.5
_0x58E0.Font = Enum.Font.SourceSansBold
_0x58E0.Parent = _0xC83D

local _0x8712 = Instance.new("TextBox")
_0x8712.Size = UDim2.new(1, -20, 0, 50)
_0x8712.Position = UDim2.new(0, 10, 0, 50)
_0x8712.PlaceholderText = "Your message..."
_0x8712.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x8712.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_0x8712.BorderSizePixel = 0
_0x8712.TextSize = 18
_0x8712.Font = Enum.Font.SourceSans
_0x8712.Parent = _0xC83D

local _0xB9C0 = Instance.new("TextBox")
_0xB9C0.Size = UDim2.new(1, -20, 0, 50)
_0xB9C0.Position = UDim2.new(0, 10, 0, 110)
_0xB9C0.PlaceholderText = "Number of messages"
_0xB9C0.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xB9C0.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_0xB9C0.BorderSizePixel = 0
_0xB9C0.TextSize = 18
_0xB9C0.Font = Enum.Font.SourceSans
_0xB9C0.Parent = _0xC83D

local _0x5A3B = Instance.new("TextButton")
_0x5A3B.Size = UDim2.new(0, 100, 0, 40)
_0x5A3B.Position = UDim2.new(0, 10, 0, 170)
_0x5A3B.Text = "Send"
_0x5A3B.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
_0x5A3B.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x5A3B.Font = Enum.Font.SourceSansBold
_0x5A3B.TextSize = 20
_0x5A3B.Parent = _0xC83D

local _0xB1D3 = Instance.new("TextButton")
_0xB1D3.Size = UDim2.new(0, 50, 0, 30)
_0xB1D3.Position = UDim2.new(1, -60, 0, 10)
_0xB1D3.Text = "X"
_0xB1D3.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
_0xB1D3.TextColor3 = Color3.fromRGB(255, 255, 255)
_0xB1D3.Font = Enum.Font.SourceSansBold
_0xB1D3.Parent = _0xC83D

local _0x19D3 = Instance.new("ImageButton")
_0x19D3.Size = UDim2.new(0, 40, 0, 40)
_0x19D3.Position = UDim2.new(0, 10, 0, 10)
_0x19D3.Image = "rbxassetid://171531973"
_0x19D3.Visible = false
_0x19D3.Parent = _0x94F7

local function _0x5F89(_0xF3B0)
    local _0x77C9 = _0xA3F9:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
    _0x77C9:FireServer(_0xF3B0, "All")
end

local function _0x2A3D(_0x9F47)
    local _0xAB1D = {
        ["a"]="а", ["e"]="е", ["o"]="о", ["c"]="с", ["y"]="у", ["l"]="Ⅼ", 
        ["i"]="Ⅰ", ["t"]="𝑡", ["n"]="𝑛", ["s"]="ѕ", ["m"]="𝓂", ["u"]="𝓊", 
        ["h"]="һ", ["p"]="р", ["r"]="г", ["b"]="в", ["d"]="ⅾ", ["f"]="ƒ"
    }

    _0x9F47 = _0x9F47:gsub(".", function(_0x7117)
        return _0xAB1D[_0x7117:lower()] or _0x7117
    end)

    _0x9F47 = _0x9F47:gsub("([aeiou])", "%1")  
    return _0x9F47
end

local _0xE5B0 = {"badword1", "badword2", "badword3", "shit"}

local function _0x70F1(_0x2714)
    for _, _0x712A in ipairs(_0xE5B0) do
        if _0x2714:lower():find(_0x712A) then
            return true
        end
    end
    return false
end

_0x5A3B.MouseButton1Click:Connect(function()
    local _0x6F92 = _0x8712.Text
    local _0x5F13 = tonumber(_0xB9C0.Text) or 1

    if _0x6F92 and _0x6F92 ~= "" then
        if _0x70F1(_0x6F92) then
            _0x6F92 = _0x2A3D(_0x6F92)  
        end
        
        for _0x20F1 = 1, _0x5F13 do
            _0x5F89(_0x6F92)
        end
    end
end)

_0xB1D3.MouseButton1Click:Connect(function()
    _0xC83D.Visible = false
    _0x19D3.Visible = true
end)

_0x19D3.MouseButton1Click:Connect(function()
    _0xC83D.Visible = true
    _0x19D3.Visible = false
end)

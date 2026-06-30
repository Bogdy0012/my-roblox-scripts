-- Script modular - rulează doar ce vrei tu

local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Workspace = game:GetService("Workspace")

-- ===== 1. INVIZIBILITATE =====
local function makeMeInvisible()
    for _, part in pairs(Character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = 1
            part.CanCollide = false
        end
    end
    LocalPlayer.NameDisplayDistance = 0
    print("✅ Tu esti invizibil!")
end

-- ===== 2. ASCUNDE BRAINROT-URILE =====
local function hideBrainrots()
    local count = 0
    for _, obj in pairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and obj.Name and string.find(obj.Name, "Brain") then
            obj.Transparency = 1
            obj.CanCollide = false
            count = count + 1
        end
    end
    print("✅ " .. count .. " brainrot-uri ascunse!")
end

-- ===== 3. GUI CU LINK =====
local function createLinkGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LinkGUI"
    screenGui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 200)
    frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 35)
    frame.BackgroundTransparency = 0.2
    frame.Active = true
    frame.Draggable = true
    frame.Parent = screenGui
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 35)
    title.Text = "🔗 INTRODU LINKUL"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.TextScaled = true
    title.Parent = frame
    
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0, 35)
    textBox.Position = UDim2.new(0.05, 0, 0.30, 0)
    textBox.PlaceholderText = "https://www.roblox.com/games/..."
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 14
    textBox.Parent = frame
    
    local sendBtn = Instance.new("TextButton")
    sendBtn.Size = UDim2.new(0.9, 0, 0, 35)
    sendBtn.Position = UDim2.new(0.05, 0, 0.55, 0)
    sendBtn.Text = "📤 TRIMITE"
    sendBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70)
    sendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    sendBtn.Font = Enum.Font.GothamBold
    sendBtn.TextScaled = true
    sendBtn.Parent = frame
    sendBtn.MouseButton1Click:Connect(function()
        if textBox.Text and textBox.Text ~= "" then
            print("📤 Link: " .. textBox.Text)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "✅ Link primit!",
                Text = "Link-ul a fost salvat!",
                Duration = 2
            })
            textBox.Text = ""
        end
    end)
    
    screenGui.Parent = LocalPlayer.PlayerGui
    print("✅ GUI creat!")
end

-- ===== RULEAZĂ =====
makeMeInvisible()
hideBrainrots()
createLinkGUI()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ GATA!",
    Text = "Introdu linkul in GUI!",
    Duration = 3
})

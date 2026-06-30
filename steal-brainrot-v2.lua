-- Test invizibilitate Xeno
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

for _, part in pairs(Character:GetDescendants()) do
    if part:IsA("BasePart") then
        part.Transparency = 1
    end
end

LocalPlayer.NameDisplayDistance = 0
print("✅ Invizibil!")

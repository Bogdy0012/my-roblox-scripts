-- SCRIPT XENO - METODA 2 (blocare prin toate serviciile)
-- Rulează în Xeno

local SoundService = game:GetService("SoundService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- ===== 1. VOLUM GLOBAL LA 0 =====
SoundService.Volume = 0

-- ===== 2. OPREȘTE TOATE SUNETELE DIN JOC =====
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Sound") then
        v.Volume = 0
        v:Stop()
        v.Playing = false
    end
end

-- ===== 3. OPREȘTE SUNETELE DIN WORKSPACE =====
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Sound") then
        v.Volume = 0
        v:Stop()
        v.Playing = false
    end
end

-- ===== 4. OPREȘTE SUNETELE DIN PLAYERS =====
for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("Sound") then
                v.Volume = 0
                v:Stop()
                v.Playing = false
            end
        end
    end
end

-- ===== 5. OPREȘTE SUNETELE DIN PLAYER (TU) =====
if LocalPlayer.Character then
    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
        if v:IsA("Sound") then
            v.Volume = 0
            v:Stop()
            v.Playing = false
        end
    end
end

-- ===== 6. BLOCEAZĂ ORICE SUNET NOU =====
game.DescendantAdded:Connect(function(v)
    if v:IsA("Sound") then
        v.Volume = 0
        v:Stop()
        v.Playing = false
    end
end)

-- ===== 7. LOOP DE SIGURANȚĂ =====
spawn(function()
    while true do
        task.wait(0.05)
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Sound") and (v.Volume > 0 or v.Playing == true) then
                v.Volume = 0
                v:Stop()
                v.Playing = false
            end
        end
    end
end)

print("🔇 TOATE SUNETELE OPRITE!")

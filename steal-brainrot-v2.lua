-- SCRIPT XENO - LINIȘTE TOTALĂ
-- Doar oprește toate sunetele, nimic altceva

local SoundService = game:GetService("SoundService")

-- 1. Volum global la 0
SoundService.Volume = 0

-- 2. Oprește toate sunetele existente
for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Sound") then
        v.Volume = 0
        v:Stop()
        v.Playing = false
    end
end

-- 3. Oprește ORICE sunet nou creat (CHEIA!)
game.DescendantAdded:Connect(function(v)
    if v:IsA("Sound") then
        v.Volume = 0
        v:Stop()
        v.Playing = false
    end
end)

-- 4. Blochează și sunetele din Workspace (loop de siguranță)
spawn(function()
    while true do
        task.wait(0.1)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Sound") then
                v.Volume = 0
                v:Stop()
                v.Playing = false
            end
        end
    end
end)

print("✅ TOATE SUNETELE SUNT OPRITE!")

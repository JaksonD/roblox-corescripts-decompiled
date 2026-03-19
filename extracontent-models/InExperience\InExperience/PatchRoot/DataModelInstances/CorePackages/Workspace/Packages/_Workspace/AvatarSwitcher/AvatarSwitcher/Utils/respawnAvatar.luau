local l_Players_0 = game:GetService("Players");
return function(v1) --[[ Line: 9 ]] --[[ Name: respawnAvatar ]]
    -- upvalues: l_Players_0 (copy)
    local v2, v3 = v1();
    if not v2 then
        return;
    elseif v3 then
        v3:Fire();
        return;
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if l_LocalPlayer_0 then
            local l_Character_0 = l_LocalPlayer_0.Character;
            if l_Character_0 then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 and l_Humanoid_0:IsA("Humanoid") then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        end;
        return;
    end;
end;
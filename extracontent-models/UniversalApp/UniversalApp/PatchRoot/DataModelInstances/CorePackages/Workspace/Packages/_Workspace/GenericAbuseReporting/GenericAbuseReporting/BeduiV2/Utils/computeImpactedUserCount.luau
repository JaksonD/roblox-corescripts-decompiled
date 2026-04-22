local l_Players_0 = game:GetService("Players");
return function(v1, v2) --[[ Line: 11 ]] --[[ Name: computeImpactedUserCount ]]
    -- upvalues: l_Players_0 (copy)
    if not v1 or not v1.participants then
        return 0;
    else
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v2)));
        if not l_l_Players_0_PlayerByUserId_0 or not l_l_Players_0_PlayerByUserId_0.Character or not l_l_Players_0_PlayerByUserId_0.Character.PrimaryPart then
            return 0;
        else
            local l_Position_0 = l_l_Players_0_PlayerByUserId_0.Character.PrimaryPart.Position;
            local v5 = 0;
            for v6 in pairs(v1.participants) do
                local v7 = tonumber(v6);
                if v7 and v7 ~= l_l_Players_0_PlayerByUserId_0.UserId then
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v7);
                    if l_l_Players_0_PlayerByUserId_1 and l_l_Players_0_PlayerByUserId_1.Character and l_l_Players_0_PlayerByUserId_1.Character.PrimaryPart and (l_l_Players_0_PlayerByUserId_1.Character.PrimaryPart.Position - l_Position_0).Magnitude <= 160 then
                        v5 = v5 + 1;
                    end;
                end;
            end;
            return v5;
        end;
    end;
end;
local l_Players_0 = game:GetService("Players");
return function(v1) --[[ Line: 4 ]] --[[ Name: getPlayerFromPart ]]
    -- upvalues: l_Players_0 (copy)
    if not v1 then
        return nil;
    else
        for _, v3 in pairs(l_Players_0:GetPlayers()) do
            local l_Character_0 = v3.Character;
            if l_Character_0 and v1:IsDescendantOf(l_Character_0) then
                return v3;
            end;
        end;
        return nil;
    end;
end;
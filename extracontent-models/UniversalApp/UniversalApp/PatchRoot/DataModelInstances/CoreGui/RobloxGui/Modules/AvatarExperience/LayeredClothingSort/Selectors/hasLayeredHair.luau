local function v5(v0) --[[ Line: 7 ]]
    local l_Humanoid_0 = v0.Humanoid;
    if not l_Humanoid_0 then
        return false;
    else
        for _, v3 in (l_Humanoid_0:GetAccessories()) do
            local l_MeshPart_0 = v3:FindFirstChildWhichIsA("MeshPart");
            if l_MeshPart_0 and l_MeshPart_0:FindFirstChild("HairAttachment") and l_MeshPart_0:FindFirstChildWhichIsA("WrapLayer") then
                return true;
            end;
        end;
        return false;
    end;
end;
return function(v6) --[[ Line: 33 ]]
    -- upvalues: v5 (copy)
    local l_CurrentCharacter_0 = v6.AvatarExperience.AvatarScene.Character.CurrentCharacter;
    if not l_CurrentCharacter_0 then
        return false;
    else
        return (v5(l_CurrentCharacter_0));
    end;
end;
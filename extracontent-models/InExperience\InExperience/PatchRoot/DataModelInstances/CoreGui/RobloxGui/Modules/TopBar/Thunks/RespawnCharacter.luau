local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Flags.FFlagTopBarDeprecateRespawnRodux);
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarEditorServiceBustCacheEnabled");
if v3 then
    return nil;
else
    return function(v5) --[[ Line: 15 ]]
        -- upvalues: l_game_EngineFeature_0 (copy), l_AvatarEditorService_0 (copy), l_Players_0 (copy)
        local v6 = v5:getState();
        if l_game_EngineFeature_0 then
            l_AvatarEditorService_0:BustAvatarFetchCache();
        end;
        if v6.respawn.customCallback then
            v6.respawn.customCallback:Fire();
            return;
        else
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            if l_Character_0 ~= nil then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 ~= nil and l_Humanoid_0:IsA("Humanoid") then
                    l_Humanoid_0.Health = 0;
                end;
            end;
            return;
        end;
    end;
end;
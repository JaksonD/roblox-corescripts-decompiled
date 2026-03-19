local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunks.CloseMenu);
local v4 = require(l_Parent_0.Actions.SetRespawning);
local v5 = require(l_Parent_0.Utility.SendAnalytics);
local v6 = require(l_Parent_0.Resources.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature("AvatarEditorServiceBustCacheEnabled");
return function(v8) --[[ Line: 14 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_AvatarEditorService_0 (copy), l_Players_0 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy)
    local v9 = v8:getState();
    if v9.respawn.enabled then
        if l_game_EngineFeature_0 then
            l_AvatarEditorService_0:BustAvatarFetchCache();
        end;
        if v9.respawn.customCallback then
            v9.respawn.customCallback:Fire();
        else
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            if l_Character_0 ~= nil then
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if l_Humanoid_0 ~= nil and l_Humanoid_0:IsA("Humanoid") then
                    l_Humanoid_0.Health = 0;
                end;
            end;
        end;
    end;
    v8:dispatch(v4(false));
    v8:dispatch(v3);
    v5(v6.AnalyticsInGameMenuName, v6.AnalyticsRespawnCharacterName, {
        confirmed = v6.AnalyticsConfirmedName
    });
end;
local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.SocialExperiments);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableInExpChatRewrite");
local v3 = game:DefineFastString("InExpChatRewriteDeviceNameBlackList", "");
local v4 = game:DefineFastString("InExpChatRewriteOsVersionBlackList", "");
local v5 = game:DefineFastFlag("EnableDeviceGateForInExpChatRewrite", false);
if l_game_EngineFeature_0 and v5 then
    return not v1.GetIsDeviceGated({
        enabled = v5, 
        featureName = v1.DeviceGateFeature.InExpChatRewrite, 
        deviceNameBlackListString = v3, 
        osVersionBlackListString = v4
    });
else
    return l_game_EngineFeature_0;
end;
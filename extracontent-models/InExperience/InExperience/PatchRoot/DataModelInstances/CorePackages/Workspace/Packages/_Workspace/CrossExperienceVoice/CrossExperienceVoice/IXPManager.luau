local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossExperienceVoice");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_SharedFlags_0 = v1.SharedFlags;
local l_ExperimentCacheManager_0 = v1.ExperimentCacheManager.ExperimentCacheManager;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local v5 = game:DefineFastString("CrossExpVoiceIXPLayer", "Social.PartyVoice");
local v6 = game:DefineFastString("DebugCrossExpVoiceIXPLayer", "");
local l_game_EngineFeature_0 = game:GetEngineFeature("PartyVoiceVolume");
local v8 = {};
v8.__index = v8;
local v9 = game:DefineFastFlag("PartyVoiceDisallowIXPLayerExposureOnInit", false);
local v10 = {
    CrossExpVoiceDebugVariant_0 = {
        partyVoiceExp = false
    }, 
    CrossExpVoiceDebugVariant_1 = {
        partyVoiceExp = true
    }
};
v8.new = function() --[[ Line: 50 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v11 = {
        initialized = false, 
        variant = {}
    };
    setmetatable(v11, v8);
    return v11;
end;
v8.initialize = function(v12) --[[ Line: 61 ]] --[[ Name: initialize ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v5 (copy), v6 (copy), v10 (copy), v9 (copy)
    local v13 = l_ExperimentCacheManager_0.default:getLayerVariables(v5);
    if v13 ~= nil then
        v12.initialized = true;
        v12.variant = table.clone(v13);
    end;
    if v6 ~= "None" then
        v12.initialized = true;
        v12.variant = v10[v6] or v12.variant;
    end;
    if v12.initialized and not v9 then
        v12:logLayerExposure();
    end;
end;
v8.logLayerExposure = function(_) --[[ Line: 81 ]] --[[ Name: logLayerExposure ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v5 (copy)
    l_ExperimentCacheManager_0.default:logLayerExposure(v5);
end;
v8.getHasPartyVoiceVolume = function() --[[ Line: 85 ]] --[[ Name: getHasPartyVoiceVolume ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v8 (copy)
    return l_game_EngineFeature_0 and v8.default.variant.partyVoiceExp;
end;
v8.default = if l_GetFFlagEnableCrossExpVoice_0() then v8.new() else nil;
return v8;
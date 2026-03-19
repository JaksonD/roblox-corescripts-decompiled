local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages._Workspace.SharedFlags.SharedFlags.FFlagSduiExperienceDetailsSocialProof);
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v3 = game:DefineFastString("LuaAppEdpExperimentLayer", "PlayerApp.GameDetailsPage.Exposure");
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local function _(v6) --[[ Line: 13 ]] --[[ Name: getExperimentVariableAndSendExposureLog ]]
    -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v3_0 = v3;
    local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_0, true);
    if v8 and v8[v6] ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_0);
        return v8[v6];
    else
        return nil;
    end;
end;
local function v12() --[[ Line: 25 ]] --[[ Name: getShouldHydrateLegacy ]]
    -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v3_1 = v3;
    local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_1, true);
    if v11 and v11.shouldHydrateLegacy ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_1);
        return v11.shouldHydrateLegacy;
    else
        return nil;
    end;
end;
local function v15() --[[ Line: 29 ]] --[[ Name: getShouldInterleaveSdui ]]
    -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v3_2 = v3;
    local v14 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_2, true);
    if v14 and v14.shouldInterleaveSdui ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_2);
        return v14.shouldInterleaveSdui;
    else
        return nil;
    end;
end;
local function v19() --[[ Line: 33 ]] --[[ Name: getShouldRaisePeekViewBriefHeight ]]
    -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v3_3 = v3;
    local v17 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v3_3, true);
    local v18;
    if v17 and v17.socialProofVariant ~= nil then
        l_ExperimentCacheManager_0.default:sendCustomExposureLog(l_v3_3);
        v18 = v17.socialProofVariant;
    else
        v18 = nil;
    end;
    return v18 == "text";
end;
return {
    getShouldHydrateLegacy = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v12 else nil, 
    getShouldInterleaveSdui = if l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v15 else nil, 
    getShouldRaisePeekViewBriefHeight = if v1 then v19 else nil
};
local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("SquadCoordinationUiExperimentLayer", "Party.Coordination.UI");
local v3 = game:DefineFastString("SquadEnablePartyCoordinationUiVariant", "enablePartyCoordinationUi");
local v4 = game:DefineFastFlag("ForceEnablePartyCoordinationUiChanges3", false);
local v5 = game:DefineFastFlag("EnablePartyCoordinationUiChanges3", false);
local v6 = game:DefineFastFlag("PartyCoordinationUIExposureEnabled", false) and v5;
local function _(v7) --[[ Line: 16 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v8 and v8[v7] ~= nil then
        return v8[v7];
    else
        return false;
    end;
end;
return {
    getPartyCoordinationUiChangesEnabled = function() --[[ Line: 26 ]] --[[ Name: getPartyCoordinationUiChangesEnabled ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v4_0 = v4;
        if not l_v4_0 then
            l_v4_0 = v5;
            if l_v4_0 then
                local l_v3_0 = v3;
                local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v12 and v12[l_v3_0] ~= nil then
                    return v12[l_v3_0];
                else
                    l_v4_0 = false;
                end;
            end;
        end;
        return l_v4_0;
    end, 
    logExposure = function() --[[ Line: 34 ]] --[[ Name: logExposure ]]
        -- upvalues: v6 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v6 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end, 
    isLogExposureEnabled = v6
};
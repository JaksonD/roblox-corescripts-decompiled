local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("SquadCoordinationExperienceJoinExperimentLayer", "Party.Coordination.ExperienceJoin");
local v3 = game:DefineFastFlag("IsSquadCoordinationExperienceJoinExperimentExposureEnabled", false);
local v4 = game:DefineFastFlag("IsSquadLobbySessionEnabled", false);
local function _(v5) --[[ Line: 12 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v6 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v6 and v6[v5] ~= nil then
        return v6[v5];
    else
        return false;
    end;
end;
return {
    getIsSquadLobbySessionEnabled = function() --[[ Line: 23 ]] --[[ Name: getIsSquadLobbySessionEnabled ]]
        -- upvalues: v4 (copy)
        return v4;
    end, 
    getShouldOpenSLPFromExpPickerEnabled = function() --[[ Line: 27 ]] --[[ Name: getShouldOpenSLPFromExpPickerEnabled ]]
        -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
        local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
        if v8 and v8.ShouldOpenSLPFromExpPickerEnabled ~= nil then
            return v8.ShouldOpenSLPFromExpPickerEnabled;
        else
            return false;
        end;
    end, 
    getShouldShowFTUXOnExpPickerEnabled = function() --[[ Line: 31 ]] --[[ Name: getShouldShowFTUXOnExpPickerEnabled ]]
        -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
        local v9 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
        if v9 and v9.ShouldShowFTUXOnExpPickerEnabled ~= nil then
            return v9.ShouldShowFTUXOnExpPickerEnabled;
        else
            return false;
        end;
    end, 
    getIsSearchIconOnExpPickerEnabled = function() --[[ Line: 35 ]] --[[ Name: getIsSearchIconOnExpPickerEnabled ]]
        -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
        local v10 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
        if v10 and v10.IsSearchIconOnExpPickerEnabled ~= nil then
            return v10.IsSearchIconOnExpPickerEnabled;
        else
            return false;
        end;
    end, 
    getIsNewTooltipCopyEnabled = function() --[[ Line: 39 ]] --[[ Name: getIsNewTooltipCopyEnabled ]]
        -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
        local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
        if v11 and v11.IsNewTooltipCopyEnabled ~= nil then
            return v11.IsNewTooltipCopyEnabled;
        else
            return false;
        end;
    end, 
    logExposure = function() --[[ Line: 43 ]] --[[ Name: logExposure ]]
        -- upvalues: v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v3 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};
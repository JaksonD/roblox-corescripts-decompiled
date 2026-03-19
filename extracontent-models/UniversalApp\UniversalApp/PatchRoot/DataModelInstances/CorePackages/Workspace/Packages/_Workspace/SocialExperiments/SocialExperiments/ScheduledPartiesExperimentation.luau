local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("ScheduledPartiesExpLayer", "Party.Schedule");
local v3 = game:DefineFastString("ScheduledPartiesTooltipVariant", "enableScheduledPartiesTooltip");
local v4 = game:DefineFastFlag("EnableScheduledSquadsTooltip", false);
local v5 = game:DefineFastFlag("EnableScheduledPartiesExperimentation", false);
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local function _(v7) --[[ Line: 13 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v8 and v8[v7] ~= nil then
        return v8[v7];
    else
        return false;
    end;
end;
return {
    getScheduledPartiesTooltipEnabled = function() --[[ Line: 23 ]] --[[ Name: getScheduledPartiesTooltipEnabled ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy), l_GetFFlagIsSquadEnabled_0 (copy)
        local l_v4_0 = v4;
        if not l_v4_0 then
            l_v4_0 = v5;
            if l_v4_0 then
                local l_v3_0 = v3;
                local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                l_v4_0 = (if v12 then v12[l_v3_0] ~= nil and v12[l_v3_0] else false) and l_GetFFlagIsSquadEnabled_0();
            end;
        end;
        return l_v4_0;
    end, 
    logExposure = function() --[[ Line: 32 ]] --[[ Name: logExposure ]]
        -- upvalues: v5 (copy), l_ExperimentCacheManager_0 (copy), v3 (copy)
        if v5 and l_ExperimentCacheManager_0.default:getLayerVariables(v3) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v3);
        end;
    end
};
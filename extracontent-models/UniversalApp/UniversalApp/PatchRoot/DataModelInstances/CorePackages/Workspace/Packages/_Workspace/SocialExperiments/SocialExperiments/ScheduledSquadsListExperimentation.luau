local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("ScheduledSquadsListExpLayer", "");
local v3 = game:DefineFastString("ScheduledSquadsListChatLandingScreenEntrypointVariant", "enableTopBarEntrypoint");
local v4 = game:DefineFastFlag("EnableScheduledSquadsListExperimentation_dev", false);
local v5 = game:DefineFastFlag("EnableScheduledSquadsTopBarEntrypoint_dev", false);
local function _(v6) --[[ Line: 15 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v7 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v7 and v7[v6] ~= nil then
        return v7[v6];
    else
        return false;
    end;
end;
return {
    getIsTopBarEntrypointEnabled = function() --[[ Line: 25 ]] --[[ Name: getIsTopBarEntrypointEnabled ]]
        -- upvalues: v5 (copy), v4 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v5_0 = v5;
        if not l_v5_0 then
            l_v5_0 = v4;
            if l_v5_0 then
                local l_v3_0 = v3;
                local v11 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v11 and v11[l_v3_0] ~= nil then
                    return v11[l_v3_0];
                else
                    l_v5_0 = false;
                end;
            end;
        end;
        return l_v5_0;
    end, 
    logExposure = function() --[[ Line: 33 ]] --[[ Name: logExposure ]]
        -- upvalues: v4 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v4 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};
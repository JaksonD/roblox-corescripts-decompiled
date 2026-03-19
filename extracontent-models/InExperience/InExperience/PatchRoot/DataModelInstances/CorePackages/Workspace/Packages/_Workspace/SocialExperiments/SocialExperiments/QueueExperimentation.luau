local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("FStringQueueExpLayer", "Party.Coordination.ExperienceJoin");
local v3 = game:DefineFastString("QueueEnableAutoJoinNewServerVariant", "enableAutoJoinNewServer");
local v4 = game:DefineFastString("QueueEnableJoinNewServerVariant", "enableJoinNewServerButton");
local v5 = game:DefineFastFlag("ForceEnableQueueAutoJoinNewServer_dev", false);
local v6 = game:DefineFastFlag("ForceEnableQueueJoinNewServerButton_dev", false);
local v7 = game:DefineFastFlag("EnableQueueExperimentation_dev", false);
local function _(v8) --[[ Line: 15 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v9 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v9 and v9[v8] ~= nil then
        return v9[v8];
    else
        return false;
    end;
end;
return {
    getIsJoinNewServerButtonEnabled = function() --[[ Line: 30 ]] --[[ Name: getIsJoinNewServerButtonEnabled ]]
        -- upvalues: v6 (copy), v7 (copy), v4 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v6_0 = v6;
        if not l_v6_0 then
            l_v6_0 = v7;
            if l_v6_0 then
                local l_v4_0 = v4;
                local v13 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v13 and v13[l_v4_0] ~= nil then
                    return v13[l_v4_0];
                else
                    l_v6_0 = false;
                end;
            end;
        end;
        return l_v6_0;
    end, 
    getIsAutoJoinNewServerEnabled = function() --[[ Line: 25 ]] --[[ Name: getIsAutoJoinNewServerEnabled ]]
        -- upvalues: v5 (copy), v7 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v5_0 = v5;
        if not l_v5_0 then
            l_v5_0 = v7;
            if l_v5_0 then
                local l_v3_0 = v3;
                local v16 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v16 and v16[l_v3_0] ~= nil then
                    return v16[l_v3_0];
                else
                    l_v5_0 = false;
                end;
            end;
        end;
        return l_v5_0;
    end, 
    logExposure = function() --[[ Line: 35 ]] --[[ Name: logExposure ]]
        -- upvalues: v7 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v7 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};
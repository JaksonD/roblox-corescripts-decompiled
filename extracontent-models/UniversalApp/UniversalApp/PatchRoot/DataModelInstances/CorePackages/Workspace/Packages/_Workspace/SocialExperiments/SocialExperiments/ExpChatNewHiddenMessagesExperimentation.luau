local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("ExpChatHiddenMessagesExpLayer", "ExperienceChat.HiddenMessages");
local v3 = game:DefineFastString("ExpChatHiddenMessagesNewDesignVariant", "enableNewDesign");
local v4 = game:DefineFastString("ExpChatHiddenMessagesSystemMessageNudgeVariant", "enableSystemMessageNudge");
local v5 = game:DefineFastFlag("ExpChatEnableTypingIndicatorExperimentation", false);
local v6 = game:DefineFastFlag("ExpChatEnableHiddenMessagesNewDesign", false);
local v7 = game:DefineFastFlag("ExpChatEnableHiddenMessagesSystemMessageNudge", false);
local function _(v8) --[[ Line: 19 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: l_ExperimentCacheManager_0 (copy), v2 (copy)
    local v9 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
    if v9 and v9[v8] ~= nil then
        return v9[v8];
    else
        return false;
    end;
end;
return {
    getExpChatHiddenMessagesNewDesignEnabled = function() --[[ Line: 29 ]] --[[ Name: getExpChatHiddenMessagesNewDesignEnabled ]]
        -- upvalues: v6 (copy), v5 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v6_0 = v6;
        if not l_v6_0 then
            l_v6_0 = v5;
            if l_v6_0 then
                local l_v3_0 = v3;
                local v13 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v13 and v13[l_v3_0] ~= nil then
                    return v13[l_v3_0];
                else
                    l_v6_0 = false;
                end;
            end;
        end;
        return l_v6_0;
    end, 
    getExpChatNewHiddenMessagesSystemMessageNudgeEnabled = function() --[[ Line: 37 ]] --[[ Name: getExpChatNewHiddenMessagesSystemMessageNudgeEnabled ]]
        -- upvalues: v7 (copy), v5 (copy), v4 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        local l_v7_0 = v7;
        if not l_v7_0 then
            l_v7_0 = v5;
            if l_v7_0 then
                local l_v4_0 = v4;
                local v16 = l_ExperimentCacheManager_0.default:getLayerVariables(v2);
                if v16 and v16[l_v4_0] ~= nil then
                    return v16[l_v4_0];
                else
                    l_v7_0 = false;
                end;
            end;
        end;
        return l_v7_0;
    end, 
    logExposure = function() --[[ Line: 45 ]] --[[ Name: logExposure ]]
        -- upvalues: v5 (copy), l_ExperimentCacheManager_0 (copy), v2 (copy)
        if v5 and l_ExperimentCacheManager_0.default:getLayerVariables(v2) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};
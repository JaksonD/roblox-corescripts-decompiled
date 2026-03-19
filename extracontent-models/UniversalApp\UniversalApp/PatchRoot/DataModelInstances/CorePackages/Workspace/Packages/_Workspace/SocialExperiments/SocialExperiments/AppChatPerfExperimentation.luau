local l_Parent_0 = script:FindFirstAncestor("SocialExperiments").Parent;
local l_ExperimentCacheManager_0 = require(l_Parent_0.ExperimentCacheManager).ExperimentCacheManager;
local v2 = game:DefineFastString("AppChatPerfExperimentLayer", "Party.Chat.Perf");
local function _(v3) --[[ Line: 8 ]] --[[ Name: getIsUserInTreatment ]]
    -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
    local l_v2_0 = v2;
    local v5 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_0);
    if v5 and v5[v3] ~= nil then
        return v5[v3];
    else
        return false;
    end;
end;
return {
    getChatLandingPaginationEnabled = function() --[[ Line: 19 ]] --[[ Name: getChatLandingPaginationEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_1 = v2;
        local v8 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_1);
        if v8 and v8.IsChatLandingPaginationEnabled ~= nil then
            return v8.IsChatLandingPaginationEnabled;
        else
            return false;
        end;
    end, 
    getChatConversationPaginationEnabled = function() --[[ Line: 23 ]] --[[ Name: getChatConversationPaginationEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_2 = v2;
        local v10 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_2);
        if v10 and v10.IsChatConversationPaginationEnabled ~= nil then
            return v10.IsChatConversationPaginationEnabled;
        else
            return false;
        end;
    end, 
    getChatMembersPaginationEnabled = function() --[[ Line: 27 ]] --[[ Name: getChatMembersPaginationEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_3 = v2;
        local v12 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_3);
        if v12 and v12.IsChatMembersPaginationEnabled ~= nil then
            return v12.IsChatMembersPaginationEnabled;
        else
            return false;
        end;
    end, 
    getChatConversationRenderingFixEnabled = function() --[[ Line: 31 ]] --[[ Name: getChatConversationRenderingFixEnabled ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_4 = v2;
        local v14 = l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_4);
        if v14 and v14.IsChatConversationRenderingFixEnabled ~= nil then
            return v14.IsChatConversationRenderingFixEnabled;
        else
            return false;
        end;
    end, 
    logExposure = function() --[[ Line: 35 ]] --[[ Name: logExposure ]]
        -- upvalues: v2 (copy), l_ExperimentCacheManager_0 (copy)
        local l_v2_5 = v2;
        if l_ExperimentCacheManager_0.default:getLayerVariables(l_v2_5) ~= nil then
            l_ExperimentCacheManager_0.default:logLayerExposure(v2);
        end;
    end
};
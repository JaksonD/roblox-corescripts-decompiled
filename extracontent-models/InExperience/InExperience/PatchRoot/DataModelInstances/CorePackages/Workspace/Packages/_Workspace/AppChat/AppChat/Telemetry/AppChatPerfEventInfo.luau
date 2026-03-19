local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfEvent);
local v2 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local v3 = {
    ChatLandingTTI = {
        baseName = "AppChat_TTI_ChatLanding", 
        page = "ChatLanding"
    }, 
    ChatConversationTTI = {
        baseName = "AppChat_TTI_ChatConversation", 
        page = "ChatConversation"
    }
};
local v4 = {
    ScrollConversationList = {
        name = "AppChat_Scroll_ConversationList", 
        parentTTI = v1.ChatLandingTTI
    }, 
    PaginationConversationList = {
        name = "AppChat_Pagination_ConversationList", 
        parentTTI = v1.ChatLandingTTI
    }, 
    ScrollMessageList = {
        name = "AppChat_Scroll_MessageList", 
        parentTTI = v1.ChatConversationTTI
    }, 
    PaginationMessageList = {
        name = "AppChat_Pagination_MessageList", 
        parentTTI = v1.ChatConversationTTI
    }, 
    MessageSendToPendingRender = {
        name = "AppChat_Message_SendToPendingRender", 
        parentTTI = v1.ChatConversationTTI
    }, 
    MessageSendResponseToFinalRender = {
        name = "AppChat_Message_SendResponseToFinalRender", 
        parentTTI = v1.ChatConversationTTI
    }, 
    MessageSendToFinalRender = {
        name = "AppChat_Message_SendToFinalRender", 
        parentTTI = v1.ChatConversationTTI
    }, 
    MessageReceiveToRender = {
        name = "AppChat_Message_ReceiveToRender", 
        parentTTI = v1.ChatConversationTTI
    }
};
return {
    Events = v1, 
    TTI_CATEGORY = "AppChat", 
    isTTIEvent = function(v5) --[[ Line: 86 ]] --[[ Name: isTTIEvent ]]
        -- upvalues: v3 (copy)
        return v3[v5] ~= nil;
    end, 
    isIntervalEvent = function(v6) --[[ Line: 90 ]] --[[ Name: isIntervalEvent ]]
        -- upvalues: v4 (copy)
        return v4[v6] ~= nil;
    end, 
    getTTIBaseName = function(v7) --[[ Line: 98 ]] --[[ Name: getTTIBaseName ]]
        -- upvalues: v3 (copy)
        return v3[v7].baseName;
    end, 
    getTTIPage = function(v8) --[[ Line: 102 ]] --[[ Name: getTTIPage ]]
        -- upvalues: v3 (copy)
        return v3[v8].page;
    end, 
    getTTICategory = function() --[[ Line: 106 ]] --[[ Name: getTTICategory ]]
        return "AppChat";
    end, 
    buildTTIEventName = function(v9, v10, v11) --[[ Line: 111 ]] --[[ Name: buildTTIEventName ]]
        -- upvalues: v3 (copy), v2 (copy)
        return v3[v9].baseName .. (v2.isPlacementInExperience(v10) and "_InExp" or "_UA") .. (v11 and "_Cold" or "_Warm");
    end, 
    getIntervalName = function(v12) --[[ Line: 127 ]] --[[ Name: getIntervalName ]]
        -- upvalues: v4 (copy)
        return v4[v12].name;
    end, 
    getParentTTI = function(v13) --[[ Line: 131 ]] --[[ Name: getParentTTI ]]
        -- upvalues: v4 (copy)
        return v4[v13].parentTTI;
    end, 
    getIntervalsForTTI = function(v14) --[[ Line: 136 ]] --[[ Name: getIntervalsForTTI ]]
        -- upvalues: v4 (copy)
        local v15 = {};
        for v16, v17 in v4 do
            if v17.parentTTI == v14 then
                table.insert(v15, v16);
            end;
        end;
        return v15;
    end
};
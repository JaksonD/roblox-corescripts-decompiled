local v0 = {};
local function _(v1) --[[ Line: 32 ]] --[[ Name: coerceToString ]]
    if v1 == nil then
        return "";
    else
        return (tostring(v1));
    end;
end;
v0.sanitizeSegment = function(v3) --[[ Line: 39 ]] --[[ Name: sanitizeSegment ]]
    return ((v3 == nil and "" or tostring(v3)):gsub("%s+", "_"):gsub("[^%w_]", ""));
end;
v0.build = function(v4) --[[ Line: 50 ]] --[[ Name: build ]]
    -- upvalues: v0 (copy)
    local v5 = {};
    for _, v7 in v4 do
        local v8 = v0.sanitizeSegment(v7);
        if v8 ~= "" then
            table.insert(v5, v8);
        end;
    end;
    return table.concat(v5, "-");
end;
v0.chatLandingTopBarIconButton = function(v9) --[[ Line: 61 ]] --[[ Name: chatLandingTopBarIconButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatLanding", 
        "topBar", 
        "button", 
        v9
    });
end;
v0.chatLandingConversationListHeader = function(v10) --[[ Line: 71 ]] --[[ Name: chatLandingConversationListHeader ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatLanding", 
        "conversationList", 
        "conversationListHeader", 
        v10
    });
end;
v0.chatLandingConversationEntry = function(v11) --[[ Line: 81 ]] --[[ Name: chatLandingConversationEntry ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatLanding", 
        "conversationList", 
        "conversationEntry", 
        v11
    });
end;
v0.chatLandingConversationEntrySquadButton = function(v12) --[[ Line: 91 ]] --[[ Name: chatLandingConversationEntrySquadButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatLanding", 
        "conversationList", 
        "conversationEntry", 
        "button", 
        (("squad_%*"):format(v12))
    });
end;
v0.chatDetailsTopBarActionButton = function(v13) --[[ Line: 102 ]] --[[ Name: chatDetailsTopBarActionButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatDetails", 
        "topBar", 
        "button", 
        v13
    });
end;
v0.chatDetailsListActionButton = function(v14) --[[ Line: 112 ]] --[[ Name: chatDetailsListActionButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatDetails", 
        "detailsList", 
        "button", 
        v14
    });
end;
v0.chatDetailsParticipantMoreButton = function(v15) --[[ Line: 122 ]] --[[ Name: chatDetailsParticipantMoreButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatDetails", 
        "detailsList", 
        "participantList", 
        "participantEntry", 
        "button", 
        (("%*_moreDetails"):format(v15))
    });
end;
v0.chatConversationTopBarButton = function(v16) --[[ Line: 134 ]] --[[ Name: chatConversationTopBarButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatConversation", 
        "topBar", 
        "button", 
        v16
    });
end;
v0.chatConversationSystemMessageCard = function(v17) --[[ Line: 144 ]] --[[ Name: chatConversationSystemMessageCard ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatConversation", 
        "messageList", 
        "systemMessageCard", 
        if type(v17) == "table" then table.concat(v17, "_") else v17
    });
end;
v0.chatConversationSystemMessage = function(v18) --[[ Line: 154 ]] --[[ Name: chatConversationSystemMessage ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "chatConversation", 
        "messageList", 
        "systemMessageText", 
        v18
    });
end;
v0.selectChatMembersUserCellWithCheckbox = function(v19, v20) --[[ Line: 164 ]] --[[ Name: selectChatMembersUserCellWithCheckbox ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "selectChatMembers", 
        "friendsList", 
        "userCellWithCheckbox", 
        "checkbox", 
        (("%*_%*"):format(v19, v20 and "checked" or "unchecked"))
    });
end;
v0.selectChatMembersSearchInput = function(v21) --[[ Line: 175 ]] --[[ Name: selectChatMembersSearchInput ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "selectChatMembers", 
        "searchBar", 
        "textInput", 
        v21
    });
end;
v0.selectChatMembersTopBarActionButton = function(v22) --[[ Line: 185 ]] --[[ Name: selectChatMembersTopBarActionButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        "chat", 
        "selectChatMembers", 
        "topBar", 
        "button", 
        v22
    });
end;
return v0;
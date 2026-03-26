local v0 = {};
local function _(v1) --[[ Line: 19 ]] --[[ Name: coerceToString ]]
    if v1 == nil then
        return "";
    else
        return (tostring(v1));
    end;
end;
v0.sanitizeSegment = function(v3) --[[ Line: 26 ]] --[[ Name: sanitizeSegment ]]
    return ((v3 == nil and "" or tostring(v3)):gsub("%s+", "_"):gsub("[^%w_]", ""));
end;
v0.build = function(v4) --[[ Line: 37 ]] --[[ Name: build ]]
    -- upvalues: v0 (copy)
    local v5 = {
        v0.sanitizeSegment(v4.page), 
        v0.sanitizeSegment(v4.subpage), 
        v0.sanitizeSegment(v4.section), 
        v0.sanitizeSegment(v4.element), 
        v0.sanitizeSegment(v4.state)
    };
    return table.concat(v5, "-");
end;
v0.chatLandingTopBarIconButton = function(v6) --[[ Line: 54 ]] --[[ Name: chatLandingTopBarIconButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "topBar", 
        element = "button", 
        state = v6
    });
end;
v0.chatLandingConversationListHeader = function(v7) --[[ Line: 64 ]] --[[ Name: chatLandingConversationListHeader ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "conversationList", 
        element = "conversationListHeader", 
        state = v7
    });
end;
v0.chatLandingConversationEntry = function(v8) --[[ Line: 74 ]] --[[ Name: chatLandingConversationEntry ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "conversationList", 
        element = "conversationEntry", 
        state = v8
    });
end;
v0.chatLandingConversationEntrySquadButton = function(v9) --[[ Line: 84 ]] --[[ Name: chatLandingConversationEntrySquadButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "conversationList", 
        element = "conversationEntry_button", 
        state = ("%*_squad"):format(v9)
    });
end;
v0.chatDetailsTopBarActionButton = function(v10) --[[ Line: 94 ]] --[[ Name: chatDetailsTopBarActionButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatDetails", 
        section = "topBar", 
        element = "button", 
        state = v10
    });
end;
v0.chatDetailsListActionButton = function(v11) --[[ Line: 104 ]] --[[ Name: chatDetailsListActionButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatDetails", 
        section = "detailsList", 
        element = "button", 
        state = v11
    });
end;
v0.chatDetailsParticipantMoreButton = function(v12) --[[ Line: 114 ]] --[[ Name: chatDetailsParticipantMoreButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatDetails", 
        section = "detailsList", 
        element = "participantEntry_button", 
        state = ("%*_moreDetails"):format(v12)
    });
end;
return v0;
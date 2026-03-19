local v0 = {};
local function _(v1) --[[ Line: 14 ]] --[[ Name: coerceToString ]]
    if v1 == nil then
        return "";
    else
        return (tostring(v1));
    end;
end;
v0.sanitizeSegment = function(v3) --[[ Line: 21 ]] --[[ Name: sanitizeSegment ]]
    return ((v3 == nil and "" or tostring(v3)):gsub("%s+", "_"):gsub("[^%w_]", ""));
end;
v0.build = function(v4) --[[ Line: 32 ]] --[[ Name: build ]]
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
v0.chatLandingTopBarIconButton = function(v6) --[[ Line: 49 ]] --[[ Name: chatLandingTopBarIconButton ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "topBar", 
        element = "iconButton", 
        state = v6
    });
end;
v0.chatLandingConversationListHeader = function(v7) --[[ Line: 59 ]] --[[ Name: chatLandingConversationListHeader ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "conversationList", 
        element = "conversationListHeader", 
        state = v7
    });
end;
v0.chatLandingConversationEntry = function(v8) --[[ Line: 69 ]] --[[ Name: chatLandingConversationEntry ]]
    -- upvalues: v0 (copy)
    return v0.build({
        page = "chat", 
        subpage = "chatLanding", 
        section = "conversationList", 
        element = "conversationEntry", 
        state = v8
    });
end;
return v0;
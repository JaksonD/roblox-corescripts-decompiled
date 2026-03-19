local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = {};
v2.__index = v2;
v2.DiagCounters = {
    FetchedOlderConversation = game:DefineFastString("RoactChatFetchedOlderConversationCounter", "RoactChatFetchedOlderConversation"), 
    LuaShareGameInputBarEntry = game:DefineFastString("LuaShareGameRoactChatInputBarEntryCounter", "LuaShareGameRoactChatInputBarEntry"), 
    LuaShareGameInputBarInvite = game:DefineFastString("LuaShareGameRoactChatInputBarInviteCounter", "LuaShareGameRoactChatInputBarInvite"), 
    UserLoadedChat = game:DefineFastString("RoactChatUserLoadedCounter", "RoactChatUserLoaded")
};
v2.DiagCounters.ChatDetailsProfile = game:DefineFastString("RoactChatNavigationChatDetailsProfileCounter", "RoactChatNavigationChatDetailsProfile");
v2.DiagCounters.ChatConversationProfile = game:DefineFastString("RoactChatNavigationChatConversationProfileCounter", "RoactChatNavigationChatConversationProfile");
v2.NavigationEvents = {
    ChatDetailsProfile = "ChatDetailsProfile", 
    ChatConversationProfile = "ChatConversationProfile"
};
local v3 = {
    [v2.NavigationEvents.ChatConversationProfile] = {
        subpage = "peekView", 
        page = "playerProfile", 
        btn = "chatIcon"
    }, 
    [v2.NavigationEvents.ChatDetailsProfile] = {
        subpage = "peekView", 
        page = "playerProfile", 
        btn = "chatDetailsMenu"
    }
};
v2.new = function(v4, v5) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v5, "RoactChatAnalytics must be passed the ID of the local user");
    local v6 = {
        _diagImpl = v4.Diag, 
        _eventStreamImpl = v4.EventStream, 
        hasAlreadyFetchedOlderConversations = false, 
        localUserId = v5
    };
    setmetatable(v6, v2);
    return v6;
end;
v2.withEventStream = function(v7, v8) --[[ Line: 66 ]] --[[ Name: withEventStream ]]
    v7._eventStreamImpl = v8;
    return v7;
end;
v2.withDiag = function(v9, v10) --[[ Line: 71 ]] --[[ Name: withDiag ]]
    v9._diagImpl = v10;
    return v9;
end;
v2.userFetchedOlderConversations = function(v11) --[[ Line: 76 ]] --[[ Name: userFetchedOlderConversations ]]
    -- upvalues: v2 (copy)
    if v11.hasAlreadyFetchedOlderConversations then
        return;
    else
        v11.hasAlreadyFetchedOlderConversations = true;
        local v12 = {
            uid = v11.localUserId
        };
        v11._eventStreamImpl:setRBXEventStream("roactChat", "userFetchedOlderConversations", v12);
        local l_FetchedOlderConversation_0 = v2.DiagCounters.FetchedOlderConversation;
        v11._diagImpl:reportCounter(l_FetchedOlderConversation_0, 1);
        return;
    end;
end;
v2.inputShareGameInviteSent = function(v14, v15, v16, v17, v18, v19) --[[ Line: 96 ]] --[[ Name: inputShareGameInviteSent ]]
    -- upvalues: v2 (copy)
    local v20 = table.concat(v19, ",");
    local v21 = {
        btn = "roactChatInputBar", 
        placeId = tostring(v15), 
        gameId = tostring(v16), 
        senderId = v17, 
        conversationId = tostring(v18), 
        participants = v20
    };
    v14._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", v21);
    local l_LuaShareGameInputBarInvite_0 = v2.DiagCounters.LuaShareGameInputBarInvite;
    v14._diagImpl:reportCounter(l_LuaShareGameInputBarInvite_0, 1);
end;
v2.inputShareGameEntryPoint = function(v23, v24) --[[ Line: 115 ]] --[[ Name: inputShareGameEntryPoint ]]
    -- upvalues: v2 (copy)
    local v25 = {
        btn = "roactChatInputBar", 
        uid = v23.localUserId, 
        cid = tostring(v24)
    };
    v23._eventStreamImpl:setRBXEventStream("touch", "inputShareGameInviteSent", v25);
    local l_LuaShareGameInputBarEntry_0 = v2.DiagCounters.LuaShareGameInputBarEntry;
    v23._diagImpl:reportCounter(l_LuaShareGameInputBarEntry_0, 1);
end;
v2.loadGameLinkCardInChat = function(v27, v28, v29) --[[ Line: 130 ]] --[[ Name: loadGameLinkCardInChat ]]
    local v30 = {
        uid = v27.localUserId, 
        cid = tostring(v28), 
        pid = tostring(v29)
    };
    v27._eventStreamImpl:setRBXEventStream("roactChat", "loadGameLinkCardInChat", v30);
end;
v2.userLoadedChat = function(v31) --[[ Line: 141 ]] --[[ Name: userLoadedChat ]]
    -- upvalues: v2 (copy)
    local v32 = {
        uid = v31.localUserId
    };
    v31._eventStreamImpl:setRBXEventStream("roactChat", "userLoadedChat", v32);
    local l_UserLoadedChat_0 = v2.DiagCounters.UserLoadedChat;
    v31._diagImpl:reportCounter(l_UserLoadedChat_0, 1);
end;
v2.navigate = function(v34, v35) --[[ Line: 153 ]] --[[ Name: navigate ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    assert(v3[v35], "Invalid navigation option given");
    v34._diagImpl:reportCounter(v2.DiagCounters[v35], 1);
    v34._eventStreamImpl:setRBXEventStream("chat", "buttonClick", v1.Dictionary.join({
        uid = v34.localUserId
    }, v3[v35]));
end;
return v2;
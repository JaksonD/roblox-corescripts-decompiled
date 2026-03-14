local l_Parent_0 = script:FindFirstAncestor("GameInvite").Parent;
local v1 = require(l_Parent_0.Cryo);
game:DefineFastFlag("LuaAppInviteEventsIncludePlaceId", false);
game:DefineFastFlag("GameInviteModalIncludeLinkIdInShareButton", false);
local v2 = {};
v2.__index = v2;
v2.ButtonName = {
    SettingsHub = "settingsHub", 
    ModalPrompt = "modalPrompt", 
    GameDetailsMoreMenu = "uaGameDetailsMoreMenu", 
    GameDetailsPlayWithFriendsMenu = "uaGameDetailsPlayWithFriendsMenu"
};
v2.EventName = {
    InviteSent = "inputShareGameInviteSent", 
    EntryPoint = "inputShareGameEntryPoint", 
    LinkGenerated = "linkGenerated", 
    ShareButtonClick = "buttonClick", 
    InviteSearchFocused = "inviteSearchFocused", 
    GameInviteModal = "gameInviteModal"
};
v2.ActionType = {
    ModalOpen = "modalOpen", 
    InviteTriggered = "inviteTriggered", 
    ModalClose = "modalClose", 
    InviteFailure = "inviteFailure"
};
v2.DiagCounters = {
    EntryPoint = {
        [v2.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubEntryCounter"), 
        [v2.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptEntryCounter")
    }, 
    InviteSent = {
        [v2.ButtonName.SettingsHub] = settings():GetFVariable("LuaShareGameSettingsHubInviteCounter"), 
        [v2.ButtonName.ModalPrompt] = settings():GetFVariable("LuaShareGameModalPromptInviteCounter")
    }
};
v2.new = function() --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {
        _eventStreamImpl = nil, 
        _diagImpl = nil, 
        _buttonName = nil
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.withEventStream = function(v4, v5) --[[ Line: 59 ]] --[[ Name: withEventStream ]]
    v4._eventStreamImpl = v5;
    return v4;
end;
v2.withDiag = function(v6, v7) --[[ Line: 64 ]] --[[ Name: withDiag ]]
    v6._diagImpl = v7;
    return v6;
end;
v2.withButtonName = function(v8, v9) --[[ Line: 69 ]] --[[ Name: withButtonName ]]
    v8._buttonName = v9;
    return v8;
end;
v2.onActivatedInviteSent = function(v10, _, v12, v13, v14, v15) --[[ Line: 74 ]] --[[ Name: onActivatedInviteSent ]]
    -- upvalues: v2 (copy)
    local v16 = v10:_getButtonName();
    local v17 = "inGame";
    if v10:_getIsUniversalApp() then
        v17 = "inApp";
    end;
    local l_InviteSent_0 = v2.EventName.InviteSent;
    local v19 = table.concat(v13, ",");
    local v20 = nil;
    local v21 = nil;
    if v10:_getIsUniversalApp() then
        v20 = tostring(v14);
        v21 = tostring(v15);
    else
        v20 = tostring(game.PlaceId);
        v21 = tostring(game.GameId);
    end;
    local v22 = {
        btn = v16, 
        placeId = v20, 
        gameId = v21, 
        conversationId = tostring(v12), 
        participants = v19
    };
    v10:_getEventStream():setRBXEventStream(v17, l_InviteSent_0, v22);
    local v23 = v2.DiagCounters.InviteSent[v10:_getButtonName()];
    if v23 then
        v10:_getDiag():reportCounter(v23, 1);
    end;
end;
v2.inputShareGameEntryPoint = function(v24, v25, v26) --[[ Line: 106 ]] --[[ Name: inputShareGameEntryPoint ]]
    -- upvalues: v2 (copy)
    local v27 = v24:_getButtonName();
    local v28 = "inGame";
    if v24:_getIsUniversalApp() then
        v28 = "inApp";
    end;
    local l_EntryPoint_0 = v2.EventName.EntryPoint;
    local v30 = nil;
    local v31 = nil;
    if v24:_getIsUniversalApp() then
        v30 = tostring(v25);
        v31 = tostring(v26);
    else
        v30 = tostring(game.PlaceId);
        v31 = tostring(game.GameId);
    end;
    local v32 = {
        btn = v27, 
        placeId = v30, 
        gameId = v31
    };
    v24:_getEventStream():setRBXEventStream(v28, l_EntryPoint_0, v32);
    local v33 = v2.DiagCounters.EntryPoint[v24:_getButtonName()];
    if v33 then
        v24:_getDiag():reportCounter(v33, 1);
    end;
end;
v2.linkGenerated = function(v34, v35) --[[ Line: 134 ]] --[[ Name: linkGenerated ]]
    -- upvalues: v2 (copy)
    local l_LinkGenerated_0 = v2.EventName.LinkGenerated;
    local v37 = {
        linkType = v35.linkType, 
        linkId = v35.linkId, 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage"
    };
    v34:_getEventStream():setRBXEventStream("shareLinks", l_LinkGenerated_0, v37);
end;
v2.onShareButtonClick = function(v38, v39) --[[ Line: 146 ]] --[[ Name: onShareButtonClick ]]
    -- upvalues: v2 (copy)
    local l_ShareButtonClick_0 = v2.EventName.ShareButtonClick;
    local v41 = {
        btn = "shareServerInviteLink", 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage", 
        linkId = if game:GetFastFlag("GameInviteModalIncludeLinkIdInShareButton") then v39 else nil, 
        isShortUrlEnabled = true
    };
    v38:_getEventStream():setRBXEventStream("shareLinks", l_ShareButtonClick_0, v41);
end;
v2.onSearchFocused = function(v42) --[[ Line: 159 ]] --[[ Name: onSearchFocused ]]
    -- upvalues: v2 (copy)
    local l_InviteSearchFocused_0 = v2.EventName.InviteSearchFocused;
    local v44 = "inGame";
    local v45 = {
        btn = v42:_getButtonName(), 
        page = "inGameMenu", 
        subpage = "inviteFriendsPage"
    };
    if v42:_getIsUniversalApp() then
        v44 = "inApp";
        v45.page = "inAppGameDetails";
    end;
    v42:_getEventStream():setRBXEventStream(v44, l_InviteSearchFocused_0, v45);
end;
v2.sendEvent = function(v46, v47, v48, v49) --[[ Line: 174 ]] --[[ Name: sendEvent ]]
    -- upvalues: v1 (copy)
    local l_Args_0 = v48.Args;
    if game:GetFastFlag("LuaAppInviteEventsIncludePlaceId") then
        l_Args_0 = v1.Dictionary.join(l_Args_0, {
            placeId = if v46:_getIsUniversalApp() and v49 and v49.place_id then v49.place_id else game.PlaceId
        });
    end;
    if v49 then
        l_Args_0 = v1.Dictionary.join(l_Args_0, v49);
    end;
    v46:_getEventStream():setRBXEventStream(v47, v48.Type, l_Args_0);
end;
v2.sendGameInviteModalEvent = function(v51, v52, v53) --[[ Line: 191 ]] --[[ Name: sendGameInviteModalEvent ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v54 = {
        place_id = if v51:_getIsUniversalApp() and v53 and v53.place_id then v53.place_id else game.PlaceId
    };
    if v53 then
        v54 = v1.Dictionary.join(v54, v53);
    end;
    v51:_getEventStream():setRBXEventStream(v52, v2.EventName.GameInviteModal, v54);
end;
v2._getEventStream = function(v55) --[[ Line: 205 ]] --[[ Name: _getEventStream ]]
    assert(v55._eventStreamImpl, "EventStream implementation not found. Did you forget to construct withEventStream?");
    return v55._eventStreamImpl;
end;
v2._getDiag = function(v56) --[[ Line: 210 ]] --[[ Name: _getDiag ]]
    assert(v56._diagImpl, "Diag implementation not found. Did you forget to construct withDiag?");
    return v56._diagImpl;
end;
v2._getButtonName = function(v57) --[[ Line: 215 ]] --[[ Name: _getButtonName ]]
    assert(v57._buttonName, "ButtonName not found. Did you forget to construct withButtonName?");
    return v57._buttonName;
end;
v2._getIsUniversalApp = function(v58) --[[ Line: 220 ]] --[[ Name: _getIsUniversalApp ]]
    -- upvalues: v2 (copy)
    assert(v58._buttonName, "ButtonName not found. Did you forget to construct withButtonName?");
    local v59 = true;
    if v58._buttonName ~= v2.ButtonName.GameDetailsMoreMenu then
        v59 = v58._buttonName == v2.ButtonName.GameDetailsPlayWithFriendsMenu;
    end;
    return v59;
end;
return v2;
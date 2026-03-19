local v0 = {};
v0.__index = v0;
v0.ButtonName = {
    LuaChatInputBar = "luaChatInputBar", 
    LuaGameDetails = "luaGameDetails"
};
v0.EventName = {
    InviteSent = "inputShareGameInviteSent", 
    EntryPoint = "inputShareGameEntryPoint"
};
v0.DiagCounters = {
    EntryPoint = {
        [v0.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarEntryCounter", "LuaShareGameLuaChatInputBarEntryCounter"), 
        [v0.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsEntryCounter", "LuaShareGameLuaGameDetailsEntryCounter")
    }, 
    InviteSent = {
        [v0.ButtonName.LuaChatInputBar] = game:DefineFastString("LuaShareGameLuaChatInputBarInviteCounter", "LuaShareGameLuaChatInputBarInviteCounter"), 
        [v0.ButtonName.LuaGameDetails] = game:DefineFastString("LuaShareGameLuaGameDetailsInviteCounter", "LuaShareGameLuaGameDetailsInviteCounter")
    }
};
v0.new = function(v1, v2, v3) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(v1, "EventStream implementation not found.");
    assert(v2, "Diag implementation not found.");
    assert(v3, "ButtonName not found.");
    return (setmetatable({
        _eventStreamImpl = v1, 
        _diagImpl = v2, 
        _buttonName = v3
    }, v0));
end;
v0.onActivatedInviteSent = function(v4, v5, v6, v7, v8, v9) --[[ Line: 50 ]] --[[ Name: onActivatedInviteSent ]]
    -- upvalues: v0 (copy)
    local v10 = v4:_getButtonName();
    local l_InviteSent_0 = v0.EventName.InviteSent;
    local v12 = table.concat(v9, ",");
    local v13 = {
        btn = v10, 
        placeId = tostring(v5), 
        gameId = tostring(v6), 
        senderId = v7, 
        conversationId = tostring(v8), 
        participants = v12
    };
    v4:_getEventStream():setRBXEventStream("touch", l_InviteSent_0, v13);
    local v14 = v0.DiagCounters.InviteSent[v4:_getButtonName()];
    if v14 then
        v4:_getDiag():reportCounter(v14, 1);
    end;
end;
v0.inputShareGameEntryPoint = function(v15, v16, v17) --[[ Line: 71 ]] --[[ Name: inputShareGameEntryPoint ]]
    -- upvalues: v0 (copy)
    local v18 = v15:_getButtonName();
    local l_EntryPoint_0 = v0.EventName.EntryPoint;
    local v20 = {
        btn = v18, 
        placeId = v16 and tostring(v16), 
        gameId = v17 and tostring(v17)
    };
    v15:_getEventStream():setRBXEventStream("touch", l_EntryPoint_0, v20);
    local v21 = v0.DiagCounters.EntryPoint[v15:_getButtonName()];
    if v21 then
        v15:_getDiag():reportCounter(v21, 1);
    end;
end;
v0._getEventStream = function(v22) --[[ Line: 89 ]] --[[ Name: _getEventStream ]]
    return v22._eventStreamImpl;
end;
v0._getDiag = function(v23) --[[ Line: 93 ]] --[[ Name: _getDiag ]]
    return v23._diagImpl;
end;
v0._getButtonName = function(v24) --[[ Line: 97 ]] --[[ Name: _getButtonName ]]
    return v24._buttonName;
end;
return v0;
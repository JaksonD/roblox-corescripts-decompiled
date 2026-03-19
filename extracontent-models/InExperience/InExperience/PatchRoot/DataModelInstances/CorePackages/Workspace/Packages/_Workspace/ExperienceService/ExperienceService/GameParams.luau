local _ = require(script.Parent.GameProtocolTypes);
local v1 = {
    new = function() --[[ Line: 9 ]] --[[ Name: new ]]
        return {
            referralPage = "LuaChat"
        };
    end
};
v1.fromPlaceId = function(v2) --[[ Line: 17 ]] --[[ Name: fromPlaceId ]]
    -- upvalues: v1 (copy)
    local v3 = v1.new();
    v3.placeId = v2;
    return v3;
end;
v1.fromUserId = function(v4, v5) --[[ Line: 25 ]] --[[ Name: fromUserId ]]
    -- upvalues: v1 (copy)
    local v6 = v1.new();
    v6.userId = v4;
    v6.placeId = v5;
    return v6;
end;
v1.fromPlaceInstance = function(v7, v8) --[[ Line: 32 ]] --[[ Name: fromPlaceInstance ]]
    -- upvalues: v1 (copy)
    local v9 = v1.new();
    v9.placeId = v7;
    v9.gameInstanceId = v8;
    return v9;
end;
v1.fromConversationId = function(v10, v11) --[[ Line: 41 ]] --[[ Name: fromConversationId ]]
    -- upvalues: v1 (copy)
    local v12 = v1.new();
    v12.placeId = v10;
    v12.conversationId = v11;
    return v12;
end;
v1.fromParams = function(v13) --[[ Line: 50 ]] --[[ Name: fromParams ]]
    -- upvalues: v1 (copy)
    local v14 = v1.new();
    for v15, v16 in pairs(v13) do
        v14[v15] = v16;
    end;
    return v14;
end;
return v1;
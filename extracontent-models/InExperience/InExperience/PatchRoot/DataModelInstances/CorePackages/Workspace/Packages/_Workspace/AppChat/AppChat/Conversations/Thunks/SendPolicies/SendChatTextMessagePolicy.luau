local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local v3 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local v4 = require(l_script_FirstAncestor_0.Models.MessageModel);
local v5 = require(script.Parent.SendChatMessagePolicy);
local v6 = setmetatable({}, v5);
v6.__index = v6;
v6.new = function(v7, v8, v9, v10, v11) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v5 (copy)
    v3:info("New policy constructed for conversationId: {} messageText: {}, replyingToId: {}", v8, v9, if v10 then v10.id else nil);
    local v12 = v5:new(v8, v10);
    setmetatable(v12, v7);
    v12.messageText = v9;
    v12.decorators = v11;
    return v12;
end;
v6.sendMessage = function(v13, _) --[[ Line: 31 ]] --[[ Name: sendMessage ]]
    -- upvalues: v3 (copy), v2 (copy)
    v3:info("sendMessage - conversationId: {} messageText: {}, replyingToId: {}", v13.conversationId, v13.messageText, if v13.replyingToMessage then v13.replyingToMessage.id else nil);
    return v2.http.SendChatTextMessage(nil, v13.conversationId, v13.messageText, if v13.replyingToMessage then v13.replyingToMessage.id else nil);
end;
v6.sendingMessagePayload = function(v15) --[[ Line: 47 ]] --[[ Name: sendingMessagePayload ]]
    -- upvalues: v4 (copy)
    return {
        messageType = v4.MessageTypes.PlainText, 
        content = v15.messageText
    };
end;
return v6;
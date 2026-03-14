local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.MessageContextMenu);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v8 = {
    messageId = "", 
    conversationId = "", 
    inputBoxRef = nil
};
MessageContextMenuContainer = function(v9) --[[ Line: 32 ]] --[[ Name: MessageContextMenuContainer ]]
    -- upvalues: v3 (copy), v8 (copy), v7 (copy), l_useLocalUserId_0 (copy), v4 (copy), v5 (copy)
    local v10 = v3.Dictionary.union(v8, v9);
    local v11 = v7(v10.conversationId);
    local v12 = nil;
    if v11 and v11.messages then
        v12 = v11.messages:Get(v10.messageId);
    end;
    local v13 = l_useLocalUserId_0();
    if v12 then
        local v14 = v12.senderTargetId == v13;
        return v4.createElement(v5, v3.Dictionary.union(v10, {
            message = v12, 
            userOwnsMessage = v14
        }));
    else
        return nil;
    end;
end;
return v4.memo(MessageContextMenuContainer);
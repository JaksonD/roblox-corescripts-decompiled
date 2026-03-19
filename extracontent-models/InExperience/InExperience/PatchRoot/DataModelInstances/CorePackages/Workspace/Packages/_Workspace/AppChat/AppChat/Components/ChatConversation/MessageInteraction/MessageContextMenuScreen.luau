local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v3 = require(script.Parent.MessageContextMenuContainer);
MessageContextMenuScreen = function() --[[ Line: 12 ]] --[[ Name: MessageContextMenuScreen ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), v3 (copy)
    local v4 = l_useNavigation_0();
    return v1.createElement(v3, {
        messageId = v4.getParam("messageId"), 
        conversationId = v4.getParam("conversationId"), 
        inputBoxRef = v4.getParam("inputBoxRef")
    });
end;
return MessageContextMenuScreen;
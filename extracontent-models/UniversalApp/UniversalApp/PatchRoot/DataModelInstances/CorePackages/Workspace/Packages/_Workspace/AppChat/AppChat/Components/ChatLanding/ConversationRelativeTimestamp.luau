local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationListUnreadDot);
return function(v5) --[[ Line: 14 ]] --[[ Name: ConversationRelativeTimestamp ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v6 = v4 and v5.hasUnreadMessages;
    local v7 = not v4 and v5.hasUnreadMessages;
    return v2.createElement(v3.View, {
        tag = "row auto-xy align-y-center gap-xsmall"
    }, {
        timestamp = v2.createElement(v3.Text, {
            tag = {
                ["auto-xy"] = true, 
                ["text-title-small content-emphasis"] = v7, 
                ["text-body-small content-default"] = not v7
            }, 
            LayoutOrder = 1, 
            Text = v5.timestampText
        }), 
        unreadDot = if v6 then v2.createElement(v3.View, {
            tag = "size-200-200 radius-circle bg-action-emphasis", 
            LayoutOrder = 2
        }) else nil
    });
end;
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local v6 = {
    layoutOrder = 2, 
    userText = "", 
    contentText = ""
};
ReplyComposeBarText = function(v7) --[[ Line: 22 ]] --[[ Name: ReplyComposeBarText ]]
    -- upvalues: v2 (copy), v6 (copy), v1 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v8 = v2.Dictionary.union(v6, v7);
    return v1.createElement(l_View_0, {
        tag = "col fill auto-y align-x-left clip", 
        LayoutOrder = v8.layoutOrder
    }, {
        UserReplyingTo = v1.createElement(l_Text_0, {
            tag = "text-caption-medium content-muted text-truncate-end text-align-x-left auto-xy", 
            Text = v8.userText, 
            LayoutOrder = 1
        }), 
        ContentReplyingTo = v1.createElement(l_Text_0, {
            tag = "text-body-medium content-emphasis text-truncate-end text-align-x-left auto-xy", 
            Text = v8.contentText, 
            LayoutOrder = 2
        })
    });
end;
return v1.memo(ReplyComposeBarText);
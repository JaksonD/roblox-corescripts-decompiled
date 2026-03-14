local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_script_FirstAncestor_0.Common.getMessageText);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Foundation);
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
return function(v8) --[[ Line: 36 ]] --[[ Name: ChatLineReportVerbatim ]]
    -- upvalues: v4 (copy), v3 (copy), l_View_0 (copy), v2 (copy), l_Text_0 (copy)
    local v9, v10 = v4.useState(nil);
    local v11 = v3(v8.selectedMessage.useTranslation, v8.selectedMessage.translation, v8.selectedMessage.text);
    local v12 = v8.selectedMessage.prefixText or "";
    local v13 = v9 or v12;
    local l_userId_0 = v8.selectedMessage.userId;
    if l_userId_0 and l_userId_0.data then
        local l_names_0 = l_userId_0.data.userProfiles[1].names;
        v10((string.gsub(v13, l_names_0.displayName, l_names_0.combinedName)));
    end;
    return v4.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 0, v2.SelectableChatLineHeight), 
        tag = "radius-medium padding-left-medium padding-right-medium stroke-neutral stroke-standard"
    }, {
        messageFrame = v4.createElement(l_View_0, {
            tag = "auto-xy position-center-left anchor-center-left"
        }, {
            messageText = v4.createElement(l_Text_0, {
                Text = ("%* %*"):format(v13, v11), 
                TextTruncate = Enum.TextTruncate.SplitWord, 
                TextScaled = false, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = true, 
                tag = "auto-xy content-muted"
            })
        })
    });
end;
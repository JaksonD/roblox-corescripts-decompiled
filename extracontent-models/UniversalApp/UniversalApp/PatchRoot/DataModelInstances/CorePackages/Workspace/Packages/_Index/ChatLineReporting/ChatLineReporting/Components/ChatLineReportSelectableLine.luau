local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.getMessageText);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_InputLabel_0 = v4.InputLabel;
local l_Text_0 = v4.Text;
local l_View_0 = v4.View;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(l_script_FirstAncestor_0.Components.ChatLineReportEyebrow);
local v10 = game:DefineFastFlag("ChatLineReportingReplaceInputLabel", false);
return function(v11) --[[ Line: 33 ]] --[[ Name: ChatLineReportSelectableLine ]]
    -- upvalues: v3 (copy), v2 (copy), l_View_0 (copy), v8 (copy), v9 (copy), v10 (copy), l_Text_0 (copy), l_InputLabel_0 (copy)
    local v12, v13 = v3.useState(nil);
    local v14 = v2(v11.message.useTranslation, v11.message.translation, v11.message.text);
    local v15 = v11.message.prefixText or "";
    local v16 = v12 or v15;
    local l_userId_0 = v11.message.userId;
    if l_userId_0 and l_userId_0.data then
        local l_names_0 = l_userId_0.data.userProfiles[1].names;
        v13((string.gsub(v16, l_names_0.displayName, l_names_0.combinedName)));
    end;
    return v3.createElement(l_View_0, {
        Size = if v11.chatLineReportingReworkEnabled then nil else UDim2.new(0, v11.scrollViewSizeX - v8.SelectableLineScrollbarOffset, 1, 0), 
        LayoutOrder = 2, 
        tag = if v11.chatLineReportingReworkEnabled then ("col auto-xy %*"):format(v11.tag) else "col"
    }, {
        eyebrow = v3.createElement(v9, {
            message = v11.message, 
            localizedText = v11.localizedText
        }), 
        chatText = if v10 then v3.createElement(l_Text_0, {
            Text = ("%* %*"):format(v16, v14), 
            RichText = true, 
            tag = "auto-xy text-wrap text-align-x-left", 
            LayoutOrder = 2
        }) else v3.createElement(l_InputLabel_0, {
            Text = ("%* %*"):format(v16, v14), 
            RichText = true, 
            LayoutOrder = 2
        })
    });
end;
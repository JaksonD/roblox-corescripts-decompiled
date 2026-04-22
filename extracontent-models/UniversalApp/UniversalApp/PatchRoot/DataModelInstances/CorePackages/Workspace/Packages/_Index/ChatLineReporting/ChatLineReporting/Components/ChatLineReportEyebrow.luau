local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_InputLabel_0 = v4.InputLabel;
local l_InputLabelSize_0 = v4.Enums.InputLabelSize;
local l_FFlagEnableGlobalChatAbuseReporting_0 = require(l_Parent_0.SharedFlags).FFlagEnableGlobalChatAbuseReporting;
local function _(v9, v10) --[[ Line: 20 ]] --[[ Name: getEyebrowText ]]
    -- upvalues: v2 (copy)
    if string.match(v9, v2.ChannelTypes.Whisper) then
        return v10.localizedText.ChatEyebrowSentPrivately;
    else
        return v10.localizedText.ChatEyebrowSentInAnotherChat;
    end;
end;
return function(v12) --[[ Line: 28 ]] --[[ Name: ChatLineReportEyebrow ]]
    -- upvalues: l_FFlagEnableGlobalChatAbuseReporting_0 (copy), v2 (copy), v3 (copy), l_View_0 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy)
    if (not l_FFlagEnableGlobalChatAbuseReporting_0 or v12.message.textChannel) and v12.message.textChannel.Name ~= v2.ChannelTypes.General then
        local l_createElement_0 = v3.createElement;
        local l_l_View_0_0 = l_View_0;
        local v15 = {
            tag = "auto-xy bg-shift-200 padding-left-xsmall padding-right-xsmall radius-small", 
            LayoutOrder = 1
        };
        local v16 = {};
        local l_createElement_1 = v3.createElement;
        local l_l_InputLabel_0_0 = l_InputLabel_0;
        local v19 = {};
        local l_Name_0 = v12.message.textChannel.Name;
        v19.Text = if string.match(l_Name_0, v2.ChannelTypes.Whisper) then v12.localizedText.ChatEyebrowSentPrivately else v12.localizedText.ChatEyebrowSentInAnotherChat;
        v19.RichText = true;
        v19.size = l_InputLabelSize_0.Small;
        v16.eyebrowLabel = l_createElement_1(l_l_InputLabel_0_0, v19);
        return (l_createElement_0(l_l_View_0_0, v15, v16));
    else
        return nil;
    end;
end;
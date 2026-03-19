local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatLineReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_View_0 = v4.View;
local l_InputLabel_0 = v4.InputLabel;
local l_InputLabelSize_0 = v4.Enums.InputLabelSize;
local function _(v8, v9) --[[ Line: 19 ]] --[[ Name: getEyebrowText ]]
    -- upvalues: v2 (copy)
    if string.match(v8, v2.ChannelTypes.Whisper) then
        return v9.localizedText.ChatEyebrowSentPrivately;
    else
        return v9.localizedText.ChatEyebrowSentInAnotherChat;
    end;
end;
return function(v11) --[[ Line: 27 ]] --[[ Name: ChatLineReportEyebrow ]]
    -- upvalues: v2 (copy), v3 (copy), l_View_0 (copy), l_InputLabel_0 (copy), l_InputLabelSize_0 (copy)
    if v11.message.textChannel.Name ~= v2.ChannelTypes.General then
        local l_createElement_0 = v3.createElement;
        local l_l_View_0_0 = l_View_0;
        local v14 = {
            tag = "auto-xy bg-shift-200 padding-left-xsmall padding-right-xsmall radius-small", 
            LayoutOrder = 1
        };
        local v15 = {};
        local l_createElement_1 = v3.createElement;
        local l_l_InputLabel_0_0 = l_InputLabel_0;
        local v18 = {};
        local l_Name_0 = v11.message.textChannel.Name;
        v18.Text = if string.match(l_Name_0, v2.ChannelTypes.Whisper) then v11.localizedText.ChatEyebrowSentPrivately else v11.localizedText.ChatEyebrowSentInAnotherChat;
        v18.RichText = true;
        v18.size = l_InputLabelSize_0.Small;
        v15.eyebrowLabel = l_createElement_1(l_l_InputLabel_0_0, v18);
        return (l_createElement_0(l_l_View_0_0, v14, v15));
    else
        return nil;
    end;
end;
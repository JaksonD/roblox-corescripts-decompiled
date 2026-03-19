local l_Parent_0 = script:FindFirstAncestor("DsaIllegalContentReporting").Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Localization);
local v6 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v6.usePreferredInput;
local l_ControlState_0 = v3.Enums.ControlState;
local l_Text_0 = v3.Text;
local l_useLocalization_0 = v5.Hooks.useLocalization;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_View_0 = v3.View;
local v13 = {
    OPEN_CUSTOM_WEBVIEW = 20
};
return v4.memo(function() --[[ Line: 24 ]] --[[ Name: OSAReportLink ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_usePreferredInput_0 (copy), v6 (copy), l_useLocalization_0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), v13 (copy), l_ControlState_0 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v14 = l_useTokens_0();
    local v15, v16 = v4.useState(nil);
    local v17 = l_usePreferredInput_0() == v6.Input.Directional;
    local v18 = v6.useIsSpatial();
    local v19 = v17 or v18;
    local v20 = l_useLocalization_0({
        HelpPageTitle = "Feature.ReportAbuse.DSAIllegal.ReportPageTitle", 
        OSACopy1 = "Feature.ReportAbuse.Message.OSACopy1", 
        OSACopy2 = "Feature.ReportAbuse.Message.OSACopy2", 
        OSACopy3 = "Feature.ReportAbuse.Message.OSACopy3", 
        OSACopy4 = "Feature.ReportAbuse.Message.OSACopy4", 
        OSACopyReadOnly = "Feature.ReportAbuse.Message.OSACopyReadOnly"
    });
    local v22 = v4.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: l_HttpService_0 (ref), v20 (copy), l_GuiService_0 (ref), v13 (ref)
        local v21 = l_HttpService_0:JSONEncode({
            title = v20.HelpPageTitle, 
            presentationStyle = nil, 
            visible = true, 
            url = "https://www.roblox.com/illegal-content-reporting"
        });
        l_GuiService_0:BroadcastNotification(v21, v13.OPEN_CUSTOM_WEBVIEW);
    end, {});
    local v24 = v4.useCallback(function(v23) --[[ Line: 50 ]]
        -- upvalues: l_ControlState_0 (ref), v16 (copy), v14 (copy)
        if v23 == l_ControlState_0.Hover then
            v16(v14.Color.State.Hover);
            return;
        elseif v23 == l_ControlState_0.Pressed then
            v16(v14.Color.State.Press);
            return;
        else
            v16(nil);
            return;
        end;
    end, {});
    return v4.createElement(l_View_0, {
        tag = "size-full col gap-small"
    }, {
        OSALink = v4.createElement(l_Text_0, {
            Text = if v19 then ("<b>%*</b>"):format(v20.OSACopyReadOnly) else ("<b>%*</b>"):format(v20.OSACopy4), 
            RichText = true, 
            backgroundStyle = v15, 
            fontStyle = v14.Typography.BodySmall, 
            textStyle = v14.Color.Content.Emphasis, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            onActivated = if v19 then nil else v22, 
            onStateChanged = if v19 then nil else v24, 
            tag = "auto-xy radius-small padding-xsmall", 
            LayoutOrder = 2
        })
    });
end);
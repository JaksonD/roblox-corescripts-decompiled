local l_script_FirstAncestor_0 = script:FindFirstAncestor("DsaIllegalContentReporting");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_script_FirstAncestor_0.Utility.Constants);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.React);
local l_StyleProviderWithDefaultTheme_0 = require(l_Parent_0.Style).StyleProviderWithDefaultTheme;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local v9 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v9.usePreferredInput;
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v15 = {
    OPEN_CUSTOM_WEBVIEW = 20
};
local l_GetFFlagDSAReadOnlyLinkForConsole_0 = require(l_Parent_0.SharedFlags).GetFFlagDSAReadOnlyLinkForConsole;
DSAReportLink = function() --[[ Line: 28 ]] --[[ Name: DSAReportLink ]]
    -- upvalues: l_useStyle_0 (copy), l_usePreferredInput_0 (copy), v9 (copy), l_isInExperienceUIVREnabled_0 (copy), l_GetFFlagDSAReadOnlyLinkForConsole_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_StyledTextLabel_0 (copy), l_LinkButton_0 (copy), l_HttpService_0 (copy), v3 (copy), l_GuiService_0 (copy), v15 (copy)
    local v17 = l_useStyle_0();
    local v18 = l_usePreferredInput_0() == v9.Input.Directional;
    local v19 = false;
    if l_isInExperienceUIVREnabled_0 then
        v19 = v9.useIsSpatial();
    end;
    local v20 = l_GetFFlagDSAReadOnlyLinkForConsole_0() and v18 or if l_isInExperienceUIVREnabled_0 then v19 else false;
    local v21 = l_useLocalization_0({
        reportLinkText = "Feature.ReportAbuse.DSAIllegal.ReportLink", 
        readonlyLinkText = "Feature.DynamicUI.Translation.Reporting.IllegalContentEUBody"
    });
    local v23 = if v20 then v6.createElement(l_StyledTextLabel_0, {
        layoutOrder = 2, 
        size = UDim2.new(0, 500, 0, 60), 
        lineHeight = 1, 
        text = v21.readonlyLinkText, 
        textXAlignment = Enum.TextXAlignment.Center, 
        textYAlignment = Enum.TextYAlignment.Center, 
        fontStyle = v17.Font.Body, 
        colorStyle = v17.Theme.TextEmphasis, 
        fluidSizing = true, 
        richText = false
    }) else v6.createElement(l_LinkButton_0, {
        fontStyle = v18 and "CaptionBody" or "Footer", 
        size = UDim2.new(0, 100, 0, 20), 
        text = v21.reportLinkText, 
        layoutOrder = 2, 
        onActivated = function() --[[ Line: 62 ]] --[[ Name: onActivated ]]
            -- upvalues: l_HttpService_0 (ref), v3 (ref), l_GuiService_0 (ref), v15 (ref)
            local v22 = l_HttpService_0:JSONEncode({
                title = v3.HELP_PAGE_TITLE, 
                presentationStyle = nil, 
                visible = true, 
                url = v3.DSA_REPORT_LINK
            });
            l_GuiService_0:BroadcastNotification(v22, v15.OPEN_CUSTOM_WEBVIEW);
        end
    });
    return v6.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, {
        Layout = v6.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v6.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 16)
        }), 
        Divider = v6.createElement("Frame", {
            BackgroundColor3 = v17.Theme.Divider.Color, 
            BackgroundTransparency = v17.Theme.Divider.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            LayoutOrder = 0
        }), 
        Link = v23
    });
end;
WrapperContainer = function() --[[ Line: 98 ]] --[[ Name: WrapperContainer ]]
    -- upvalues: v6 (copy), l_StyleProviderWithDefaultTheme_0 (copy)
    return v6.createElement(l_StyleProviderWithDefaultTheme_0, {
        withDarkTheme = true
    }, {
        Button = v6.createElement(DSAReportLink)
    });
end;
return WrapperContainer;
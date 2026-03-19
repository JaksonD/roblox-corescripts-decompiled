local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.withLocalization);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local l_Button_0 = v7.Button;
local l_ButtonVariant_0 = v7.Enums.ButtonVariant;
local l_ButtonSize_0 = v7.Enums.ButtonSize;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local l_withStyle_0 = v2.Style.withStyle;
local v15 = v3.PureComponent:extend("HomePageUpsellCard");
v15.didMount = function(v16) --[[ Line: 29 ]] --[[ Name: didMount ]]
    v16.props.authEventAnalytics.reportModalShown("homepageUpsellCard", "homepage");
end;
v15.render = function(v17) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v5 (copy), l_FormFactor_0 (copy), l_Text_0 (copy), v3 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_ButtonSize_0 (copy)
    return l_withStyle_0(function(v18) --[[ Line: 34 ]]
        -- upvalues: v17 (copy), v5 (ref), l_FormFactor_0 (ref), l_Text_0 (ref), v3 (ref), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref)
        local l_Theme_0 = v18.Theme;
        local l_Color_0 = l_Theme_0.TextEmphasis.Color;
        local l_Font_0 = v18.Font.Header2.Font;
        local v22 = v18.Font.BaseSize * v18.Font.Header2.RelativeSize;
        local l_formFactor_0 = v17.props.formFactor;
        return v5({
            addButtonText = "Feature.ContactMethodUpsell.Action.SecureYourAccount", 
            addTitleText = "Feature.ContactMethodUpsell.Description.HomePageUpsellCardAddPhoneText"
        })(function(v24) --[[ Line: 45 ]]
            -- upvalues: l_formFactor_0 (copy), l_FormFactor_0 (ref), l_Text_0 (ref), v18 (copy), v3 (ref), l_Theme_0 (copy), l_Font_0 (copy), l_Color_0 (copy), v22 (copy), l_Button_0 (ref), l_ButtonVariant_0 (ref), l_ButtonSize_0 (ref), v17 (ref)
            local v25 = UDim2.new(1, 0, 0, 0);
            local v26 = 12;
            local l_Vertical_0 = Enum.FillDirection.Vertical;
            if l_formFactor_0 == l_FormFactor_0.WIDE then
                v26 = 20;
                l_Vertical_0 = Enum.FillDirection.Horizontal;
                v25 = UDim2.new(1, -l_Text_0.GetTextWidth(v24.addButtonText, v18.Font.CaptionHeader.Font, v18.Font.BaseSize * v18.Font.CaptionHeader.RelativeSize) - 30, 0, 0);
            end;
            return v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                UISizeConstraint = v3.createElement("UISizeConstraint", {
                    MaxSize = Vector2.new(650, 1e999)
                }), 
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = l_Vertical_0, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v26)
                }), 
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 12)
                }), 
                UIStroke = v3.createElement("UIStroke", {
                    Thickness = 1, 
                    Color = l_Theme_0.SystemPrimaryDefault.Color, 
                    Transparency = 0.7
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12), 
                    PaddingTop = UDim.new(0, 12), 
                    PaddingBottom = UDim.new(0, 12)
                }), 
                TitleTextLabel = v3.createElement("TextLabel", {
                    Size = v25, 
                    LayoutOrder = 1, 
                    Font = l_Font_0, 
                    BorderSizePixel = 0, 
                    Text = v24.addTitleText, 
                    TextColor3 = l_Color_0, 
                    TextSize = v22, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }), 
                CallToActionButton = v3.createElement(l_Button_0, {
                    variant = l_ButtonVariant_0.SubEmphasis, 
                    size = l_ButtonSize_0.Medium, 
                    text = v24.addButtonText, 
                    onActivated = v17.props.buttonClickCallback, 
                    width = UDim.new(1, 0), 
                    LayoutOrder = 2
                })
            });
        end);
    end);
end;
v15 = v4.connect(function(v28, _) --[[ Line: 121 ]]
    return {
        formFactor = v28.FormFactor
    };
end)(v15);
return (l_RoactServices_0.connect({
    authEventAnalytics = v13
})(v15));
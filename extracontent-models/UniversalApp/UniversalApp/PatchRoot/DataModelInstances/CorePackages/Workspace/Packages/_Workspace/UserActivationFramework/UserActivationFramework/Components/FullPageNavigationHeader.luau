local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_IconButton_0 = v3.App.Button.IconButton;
local l_IconSize_0 = v3.App.Constant.IconSize;
local l_Images_0 = v3.App.ImageSet.Images;
local l_TextButton_0 = v3.App.Button.TextButton;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_Text_0 = require(l_Parent_0.Foundation).Text;
local l_GetFFlagEnableSignupFoundationText_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableSignupFoundationText;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Types);
local _ = require(l_script_FirstAncestor_0.Components.ActivationFrameworkTokenMapper);
local v16 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
return function(v17) --[[ Line: 34 ]] --[[ Name: FullPageNavigationHeader ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v2 (copy), v16 (copy), l_TextButton_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy), l_Images_0 (copy), l_StyledTextLabel_0 (copy), l_GetFFlagEnableSignupFoundationText_0 (copy), l_Text_0 (copy)
    local v18 = l_useLocalization_0({
        headingText = v17.headingTextKey, 
        titleText = v17.titleTextKey, 
        bodyText = v17.bodyTextKey, 
        ixpTitleText = v17.ixpTitleTextKey, 
        ixpBodyText = v17.ixpBodyTextKey, 
        skipText = v17.skipProps.skipButtonTextKey
    });
    local l_titleText_0 = v18.titleText;
    local l_bodyText_0 = v18.bodyText;
    if type(v18.ixpTitleText) == "string" and #v18.ixpTitleText > 0 then
        l_titleText_0 = v18.ixpTitleText;
    end;
    if type(v18.ixpBodyText) == "string" and #v18.ixpBodyText > 0 then
        l_bodyText_0 = v18.ixpBodyText;
    end;
    local v21 = l_useStyle_0();
    local l_ActivationFramework_0 = l_useDesignTokens_0().LuaApps.ActivationFramework;
    local l_activationFrameworkState_0 = v2.useContext(v16).activationFrameworkState;
    local function v24() --[[ Line: 60 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), v17 (copy)
        if l_activationFrameworkState_0.isLoading then
            return;
        else
            v17.backProps.onBack();
            return;
        end;
    end;
    local function v25() --[[ Line: 67 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), v17 (copy)
        if l_activationFrameworkState_0.isLoading then
            return;
        else
            v17.skipProps.onSkip();
            return;
        end;
    end;
    local v26 = v17.skipProps.shouldShowSkipButton and v2.createElement(l_TextButton_0, {
        text = v18.skipText, 
        onActivated = v25, 
        Size = UDim2.new(1, 0, 1, 0), 
        AutomaticSize = Enum.AutomaticSize.XY
    }) or nil;
    local v27 = v17.backProps.shouldShowBackButton and v2.createElement(l_IconButton_0, {
        iconSize = l_IconSize_0.Medium, 
        icon = l_Images_0[v17.backProps.icon], 
        onActivated = v24
    }) or nil;
    local function v28() --[[ Line: 91 ]]
        -- upvalues: v17 (copy), v2 (ref), l_StyledTextLabel_0 (ref), v18 (copy), v21 (copy)
        if v17.headingTextKey == nil then
            return nil;
        else
            return v2.createElement(l_StyledTextLabel_0, {
                text = v18.headingText, 
                fontStyle = v21.Font.Header1, 
                colorStyle = v21.Theme.TextEmphasis, 
                textXAlignment = Enum.TextXAlignment.Center, 
                textYAlignment = Enum.TextYAlignment.Center
            });
        end;
    end;
    local function _() --[[ Line: 106 ]]
        -- upvalues: l_ActivationFramework_0 (copy)
        return l_ActivationFramework_0.headerIconSize + 8;
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 10)
        }), 
        TopRow = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_ActivationFramework_0.headerIconSize + 8), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            BackButton = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, -8, 0.5, 0), 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                BackButtonContent = v27
            }), 
            HeadingFrame = v2.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AutomaticSize = Enum.AutomaticSize.X
            }, {
                HeadingTextContent = v28()
            }), 
            SkipButton = v2.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Position = UDim2.fromScale(1, 0.5), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                SkipButtonContent = v26
            })
        }), 
        BottomRow = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            Title = if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
                Text = l_titleText_0, 
                fontStyle = {
                    LineHeight = 1
                }, 
                TextWrapped = true, 
                tag = "text-heading-medium text-align-x-left auto-xy content-emphasis"
            }) else v2.createElement(l_StyledTextLabel_0, {
                text = l_titleText_0, 
                fontStyle = v21.Font.Title, 
                colorStyle = v21.Theme.TextEmphasis, 
                textWrapped = true, 
                automaticSize = Enum.AutomaticSize.XY, 
                lineHeight = 1
            }), 
            Body = if l_GetFFlagEnableSignupFoundationText_0() then v2.createElement(l_Text_0, {
                Text = l_bodyText_0, 
                fontStyle = {
                    LineHeight = 1
                }, 
                tag = "text-body-medium text-align-x-left auto-xy content-default", 
                TextWrapped = true
            }) else v2.createElement(l_StyledTextLabel_0, {
                text = l_bodyText_0, 
                fontStyle = v21.Font.Body, 
                colorStyle = v21.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.XY, 
                textWrapped = true, 
                lineHeight = 1
            })
        })
    });
end;
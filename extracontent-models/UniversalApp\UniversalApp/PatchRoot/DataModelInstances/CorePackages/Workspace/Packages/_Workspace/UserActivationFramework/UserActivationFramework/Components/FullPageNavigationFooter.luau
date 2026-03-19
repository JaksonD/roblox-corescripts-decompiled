local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserActivationFramework");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local _ = require(l_script_FirstAncestor_0.Types);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Context.FullPageActivationFrameworkContext);
local v9 = require(l_Parent_0.AuthAnalytics);
local l_EventStreamConstants_0 = v9.EventStreamConstants;
local l_authButtonClick_0 = v9.Events.authButtonClick;
local v12 = require(l_script_FirstAncestor_0.Hooks.useAttemptNextNavigation);
local l_Button_0 = v3.App.Button.Button;
local l_Images_0 = v3.App.ImageSet.Images;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v17 = require(l_Parent_0.Foundation);
local l_Text_0 = v17.Text;
local l_View_0 = v17.View;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = v17.Hooks.useTokens;
local v22 = game:DefineFastFlag("UseUiBloxDividerForActivationFrameworkFooter", false);
return function(v23) --[[ Line: 37 ]] --[[ Name: FullPageNavigationFooter ]]
    -- upvalues: v2 (copy), v8 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v12 (copy), l_ButtonType_0 (copy), l_authButtonClick_0 (copy), l_EventStreamConstants_0 (copy), l_Button_0 (copy), l_Images_0 (copy), l_View_0 (copy), v22 (copy), l_StyledTextLabel_0 (copy), l_Text_0 (copy), l_ButtonStack_0 (copy)
    local v24 = v2.useContext(v8);
    local l_primaryButton_0 = v23.primaryButton;
    local l_secondaryButton_0 = v23.secondaryButton;
    local v27 = l_useStyle_0();
    local v28 = l_useDesignTokens_0();
    local v29 = l_useTokens_0();
    local l_ActivationFramework_0 = v28.LuaApps.ActivationFramework;
    local v31 = {
        orText = "Authentication.SignUp.Description.Or"
    };
    if l_primaryButton_0 then
        v31.primaryText = l_primaryButton_0.buttonTextKey;
    end;
    if l_secondaryButton_0 then
        v31.secondaryText = l_secondaryButton_0.buttonTextKey;
    end;
    local v32 = l_useLocalization_0(v31);
    local v33 = v12(v23.navigation);
    local v34 = {};
    if l_secondaryButton_0 and l_secondaryButton_0.shouldShowButton then
        table.insert(v34, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                text = v32.secondaryText, 
                onActivated = function() --[[ Line: 70 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v24 (copy), l_EventStreamConstants_0 (ref), v33 (copy), l_secondaryButton_0 (ref)
                    l_authButtonClick_0(v24.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.SecondaryButton, v24.activationFrameworkState.currentState);
                    v33(l_secondaryButton_0);
                end, 
                isDisabled = not l_secondaryButton_0.isButtonEnabled
            }
        });
    end;
    if l_primaryButton_0 and l_primaryButton_0.shouldShowButton then
        table.insert(v34, {
            buttonType = l_ButtonType_0.PrimaryContextual, 
            props = {
                text = v32.primaryText, 
                onActivated = function() --[[ Line: 92 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v24 (copy), l_EventStreamConstants_0 (ref), v33 (copy), l_primaryButton_0 (ref)
                    l_authButtonClick_0(v24.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.PrimaryButton, v24.activationFrameworkState.currentState);
                    v33(l_primaryButton_0);
                end, 
                isDisabled = not l_primaryButton_0.isButtonEnabled
            }
        });
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        ButtonStack = if v23.shouldShowButtonDivider then v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_ActivationFramework_0.footerButtonMarginBetweenPx)
            }), 
            PrimaryButton = l_primaryButton_0 and l_primaryButton_0.shouldShowButton and v2.createElement(l_Button_0, {
                text = v32.primaryText, 
                icon = if l_primaryButton_0.icon then l_Images_0[l_primaryButton_0.icon] else nil, 
                onActivated = function() --[[ Line: 130 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v24 (copy), l_EventStreamConstants_0 (ref), v33 (copy), l_primaryButton_0 (ref)
                    l_authButtonClick_0(v24.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.PrimaryButton, v24.activationFrameworkState.currentState);
                    v33(l_primaryButton_0);
                end, 
                size = UDim2.new(1, 0, 0, l_ActivationFramework_0.footerButtonHeightPx), 
                buttonType = l_ButtonType_0.PrimaryContextual, 
                isDisabled = not l_primaryButton_0.isButtonEnabled, 
                layoutOrder = 1
            }), 
            Divider = v23.shouldShowButtonDivider and v2.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, l_ActivationFramework_0.footerButtonHeightPx), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                DividerLine = v2.createElement(l_View_0, {
                    tag = "stroke-default size-full-0 auto-y position-center-center anchor-center-center", 
                    ZIndex = 1
                }), 
                DividerText = if v22 then v2.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v27.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 2
                }, {
                    UIPadding = v2.createElement("UIPadding", {
                        PaddingRight = UDim.new(0, v29.Padding.Small), 
                        PaddingLeft = UDim.new(0, v29.Padding.Small)
                    }), 
                    DividerTextLabel = v2.createElement(l_StyledTextLabel_0, {
                        text = v32.orText, 
                        fontStyle = v29.Typography.LabelMedium, 
                        colorStyle = v27.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Center, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1
                    })
                }) else v2.createElement(l_Text_0, {
                    Text = v32.orText, 
                    BackgroundTransparency = 1, 
                    tag = "text-label-medium text-align-x-center text-align-y-center auto-xy position-center-center anchor-center-center padding-small bg-surface-0", 
                    ZIndex = 2
                })
            }), 
            SecondaryButton = l_secondaryButton_0 and l_secondaryButton_0.shouldShowButton and v2.createElement(l_Button_0, {
                text = v32.secondaryText, 
                icon = if l_secondaryButton_0.icon then l_Images_0[l_secondaryButton_0.icon] else nil, 
                size = UDim2.new(1, 0, 0, l_ActivationFramework_0.footerButtonHeightPx), 
                onActivated = function() --[[ Line: 192 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v24 (copy), l_EventStreamConstants_0 (ref), v33 (copy), l_secondaryButton_0 (ref)
                    l_authButtonClick_0(v24.activationFrameworkState.namespace, l_EventStreamConstants_0.Button.SecondaryButton, v24.activationFrameworkState.currentState);
                    v33(l_secondaryButton_0);
                end, 
                buttonType = l_ButtonType_0.Secondary, 
                isDisabled = not l_secondaryButton_0.isButtonEnabled, 
                layoutOrder = 3
            })
        }) else v2.createElement(l_ButtonStack_0, {
            buttons = v34, 
            buttonHeight = l_ActivationFramework_0.footerButtonHeightPx, 
            marginBetween = l_ActivationFramework_0.footerButtonMarginBetweenPx, 
            forcedFillDirection = Enum.FillDirection.Vertical
        })
    });
end;
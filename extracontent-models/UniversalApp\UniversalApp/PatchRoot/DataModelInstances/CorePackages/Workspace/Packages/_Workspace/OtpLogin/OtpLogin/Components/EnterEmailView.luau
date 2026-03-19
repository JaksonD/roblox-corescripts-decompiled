local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = l_UIBlox_0.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local v10 = require(script.Parent.InputField);
local v11 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v12 = require(l_Parent_0.Analytics.EventConstants);
local function v18(v13, v14, v15, v16) --[[ Line: 31 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v17 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v14, 
                text = v13, 
                isDisabled = v15
            }
        }
    };
    return {
        buttonHeight = v16, 
        forcedFillDirection = Enum.FillDirection.Vertical, 
        buttons = v17
    };
end;
return function(v19) --[[ Line: 56 ]] --[[ Name: EnterEmailView ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_React_0 (copy), v11 (copy), v12 (copy), l_PartialPageModal_0 (copy), v18 (copy), v10 (copy)
    local v20 = l_useStyle_0();
    local v21 = l_useDesignTokens_0();
    local v22 = l_useLocalization_0({
        emailPlaceholder = "Authentication.Login.Label.Email", 
        continueButton = "Authentication.OneTimePasscode.Action.Continue"
    });
    local v23 = l_getPartialPageModalMiddleContentWidth_0(v19.screenSize.X);
    local v24 = l_React_0.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v19 (copy)
        return v19.isDisabled or string.len(v19.errorMessage) > 0 or string.len(v19.email) == 0;
    end, {
        v19.isDisabled, 
        v19.errorMessage, 
        v19.email
    });
    l_React_0.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v11 (ref), v12 (ref), v19 (copy)
        v11.sendPageLoadEvent(v12.ctx.sendOtp, v19.origin);
    end, {});
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v19.enterEmailTitle, 
        screenSize = v19.screenSize, 
        buttonStackProps = v18(v22.continueButton, v19.handleContinue, v24(), v21.Global.Size_600), 
        onCloseClicked = v19.onClose, 
        position = v19.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v19.keyboardHeight) or nil, 
        anchorPoint = v19.isKeyboardShowing and Vector2.new(0.5, 1) or nil
    }, {
        Middle = l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v21.Global.Size_300), 
                PaddingBottom = UDim.new(0, v21.Global.Size_300)
            }), 
            ListLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v21.Global.Size_150)
            }), 
            BodyText = l_React_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = v19.enterEmailDescription, 
                TextSize = v20.Font.BaseSize, 
                TextColor3 = v20.Theme.TextDefault.Color, 
                TextTransparency = v20.Theme.TextDefault.Transparency, 
                Font = v20.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, v23, 0, 0), 
                LayoutOrder = 1
            }), 
            EmailInput = l_React_0.createElement(v10, {
                text = v19.email, 
                disabled = v19.isDisabled, 
                onChange = v19.onEmailTextChange, 
                errorMessage = v19.errorMessage, 
                placeholder = v22.emailPlaceholder, 
                LayoutOrder = 2
            })
        })
    });
end;
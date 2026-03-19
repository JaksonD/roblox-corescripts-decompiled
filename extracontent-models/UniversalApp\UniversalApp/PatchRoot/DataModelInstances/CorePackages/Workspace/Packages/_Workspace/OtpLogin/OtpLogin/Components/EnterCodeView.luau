local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_React_0 = v1.React;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = l_UIBlox_0.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_LinkButton_0 = l_UIBlox_0.App.Button.LinkButton;
local l_Checkbox_0 = l_UIBlox_0.App.InputButton.Checkbox;
local v10 = require(l_Parent_0.Utils.debounce);
local l_useLocalization_0 = v1.Localization.Hooks.useLocalization;
local l_useDesignTokens_0 = v1.Style.useDesignTokens;
local l_useState_0 = l_React_0.useState;
local v14 = require(l_Parent_0.Analytics.AnalyticsEvents);
local v15 = require(l_Parent_0.Analytics.EventConstants);
local v16 = require(l_Parent_0.Common.otpLoginConstants);
local v17 = require(script.Parent.InputField);
local v18 = game:DefineFastFlag("EnableKoreaKISAComplianceModularized", false);
return function(v19) --[[ Line: 49 ]] --[[ Name: EnterCodeView ]]
    -- upvalues: l_useStyle_0 (copy), l_useDesignTokens_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_React_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_useState_0 (copy), l_ButtonType_0 (copy), v10 (copy), v14 (copy), v15 (copy), l_LinkButton_0 (copy), v18 (copy), l_PartialPageModal_0 (copy), l_Checkbox_0 (copy), v17 (copy)
    local v20 = l_useStyle_0();
    local v21 = l_useDesignTokens_0();
    local v22 = l_getPartialPageModalMiddleContentWidth_0(v19.screenSize.X);
    local v23, v24 = l_React_0.useState(true);
    local v25, v26 = l_React_0.useState(v16.DEFAULT_TIMER_COOLDOWN);
    local v27 = l_useLocalization_0({
        placeholderKey = "Authentication.OneTimePasscode.Label.SixDigitCode", 
        buttonKey = "Authentication.OneTimePasscode.Action.Resend", 
        buttonDisabledKey = "Authentication.OneTimePasscode.Label.CodeSent", 
        footerDescriptionKey = "Authentication.OneTimePasscode.Description.DidntReceiveCode", 
        changeEmailKey = "Authentication.OneTimePasscode.Action.ChangeEmailV2", 
        helpButtonKey = "Authentication.OneTimePasscode.Action.GetHelp", 
        complianceCheckboxMessageKey = v19.complianceCheckboxMessageKey
    });
    local v28, v29 = l_useState_0("");
    local v30, v31 = l_useState_0(false);
    local function _(v32) --[[ Line: 68 ]] --[[ Name: handleComplianceBoxClick ]]
        -- upvalues: v31 (copy)
        v31(v32);
    end;
    local function v34(v35, v36) --[[ Line: 72 ]] --[[ Name: countDown ]]
        -- upvalues: v26 (copy), v34 (copy), v24 (copy)
        local v37 = v36 - (tick() - v35);
        if v37 > 0 then
            v26((math.round(v37)));
            task.delay(1, function() --[[ Line: 78 ]]
                -- upvalues: v34 (ref), v35 (copy), v36 (copy)
                v34(v35, v36);
            end);
            return;
        else
            v26(0);
            v24(false);
            return;
        end;
    end;
    local function v46(v38, v39, v40, v41) --[[ Line: 87 ]] --[[ Name: getButtonStackProps ]]
        -- upvalues: v24 (copy), v26 (copy), v34 (copy), v23 (copy), v25 (copy), l_ButtonType_0 (ref), v19 (copy), v21 (copy)
        local function v43() --[[ Line: 93 ]] --[[ Name: handleButtonClick ]]
            -- upvalues: v41 (copy), v24 (ref), v26 (ref), v40 (copy), v34 (ref)
            v41();
            v24(true);
            v26(v40);
            local v42 = tick();
            v34(v42, v40);
        end;
        local function _() --[[ Line: 101 ]] --[[ Name: getButtonText ]]
            -- upvalues: v23 (ref), v39 (copy), v25 (ref), v38 (copy)
            if v23 then
                return v39 .. " (" .. v25 .. ")";
            else
                return v38;
            end;
        end;
        local v45 = {
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = v43, 
                    text = if v23 then v39 .. " (" .. v25 .. ")" else v38, 
                    isDisabled = v23 or v19.isDisabled
                }
            }
        };
        return {
            buttonHeight = v21.Global.Size_600, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = v45
        };
    end;
    local v48 = l_React_0.useCallback(function(v47) --[[ Line: 127 ]]
        -- upvalues: v19 (copy)
        return v47:gsub("{email}", v19.email);
    end, {
        v19.email
    });
    local v50 = l_React_0.useCallback(v10(function(v49) --[[ Line: 132 ]]
        -- upvalues: v14 (ref), v15 (ref), v19 (copy), v16 (ref), v29 (copy)
        v14.sendFormInteractionEvent(v15.ctx.enterOtp, v19.origin, v15.field.code);
        if v49.Text then
            v49.Text = string.sub(v49.Text:gsub("%D", ""), 1, v16.DEFAULT_CODE_LENGTH);
            v29(v49.Text);
            v19.clearErrorMessage();
        end;
    end, 0.5), {
        v29
    });
    local function v51() --[[ Line: 145 ]] --[[ Name: footer ]]
        -- upvalues: l_React_0 (ref), v21 (copy), v27 (copy), v20 (copy), l_LinkButton_0 (ref), v19 (copy)
        return l_React_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            Padding = l_React_0.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v21.Global.Size_200)
            }), 
            ListLayout = l_React_0.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v21.Global.Size_100)
            }), 
            FooterText = l_React_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Text = v27.footerDescriptionKey, 
                TextSize = v21.Global.FontSize_100, 
                TextColor3 = v20.Theme.TextDefault.Color, 
                TextTransparency = v20.Theme.TextDefault.Transparency, 
                Font = v20.Font.Body.Font, 
                LayoutOrder = 4
            }), 
            LinkFrame = l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 5
            }, {
                LinkListLayout = l_React_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                ChangeEmailButton = l_React_0.createElement(l_LinkButton_0, {
                    text = v27.changeEmailKey, 
                    onActivated = v19.returnToEnterEmail, 
                    layoutOrder = 6, 
                    position = UDim2.fromScale(0.25, 0)
                }), 
                Hyphen = l_React_0.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = "-", 
                    TextSize = v21.Global.FontSize_100, 
                    TextColor3 = v20.Theme.TextDefault.Color, 
                    TextTransparency = v20.Theme.TextDefault.Transparency, 
                    Font = v20.Font.Footer.Font, 
                    LayoutOrder = 7
                }), 
                HelpButton = l_React_0.createElement(l_LinkButton_0, {
                    text = v27.helpButtonKey, 
                    onActivated = v19.navigateToHelp, 
                    layoutOrder = 8, 
                    position = UDim2.fromScale(0.75, 0)
                })
            })
        });
    end;
    local function _() --[[ Line: 207 ]] --[[ Name: shouldShowComplianceCheckbox ]]
        -- upvalues: v18 (ref), v19 (copy)
        return v18 and v19.complianceCheckboxMessageKey and v19.complianceCheckboxMessageKey ~= "";
    end;
    l_React_0.useEffect(function() --[[ Line: 213 ]]
        -- upvalues: v34 (copy), v16 (ref), v14 (ref), v15 (ref), v19 (copy)
        v34(tick(), v16.DEFAULT_TIMER_COOLDOWN);
        v14.sendPageLoadEvent(v15.ctx.enterOtp, v19.origin);
    end, {});
    l_React_0.useEffect(function() --[[ Line: 220 ]]
        -- upvalues: v28 (copy), v16 (ref), v19 (copy), v30 (copy)
        if string.len(v28) == v16.DEFAULT_CODE_LENGTH then
            if v19.complianceCheckboxMessageKey then
                if v30 then
                    v19.onSubmitCode(v28);
                    return;
                end;
            else
                v19.onSubmitCode(v28);
            end;
        end;
    end, {
        v28, 
        (tostring(v30))
    });
    return l_React_0.createElement(l_PartialPageModal_0, {
        title = v19.enterCodeTitle, 
        screenSize = v19.screenSize, 
        buttonStackProps = v46(v27.buttonKey, v27.buttonDisabledKey, v16.DEFAULT_TIMER_COOLDOWN, v19.onResendCode), 
        footerContent = v51, 
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
                Text = v48(v19.enterCodeDescription), 
                TextSize = v20.Font.BaseSize, 
                TextColor3 = v20.Theme.TextDefault.Color, 
                TextTransparency = v20.Theme.TextDefault.Transparency, 
                Font = v20.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, v22, 0, 0), 
                LayoutOrder = 1
            }), 
            ComplianceCheckboxContainer = v18 and v19.complianceCheckboxMessageKey and v19.complianceCheckboxMessageKey ~= "" and l_React_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(0, v22, 0, 0), 
                LayoutOrder = 4
            }, {
                Layout = l_React_0.createElement("UIListLayout", {
                    Padding = UDim.new(0, 8), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Checkbox = l_React_0.createElement(l_Checkbox_0, {
                    text = "", 
                    isSelected = v30, 
                    onActivated = function() --[[ Line: 292 ]] --[[ Name: onActivated ]]
                        -- upvalues: v30 (copy), v31 (copy)
                        local v53 = not v30;
                        v31(v53);
                    end, 
                    layoutOrder = 2
                }), 
                CheckboxBodyText = l_React_0.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Text = v27.complianceCheckboxMessageKey, 
                    TextSize = v20.Font.BaseSize, 
                    TextColor3 = v20.Theme.TextDefault.Color, 
                    TextTransparency = v20.Theme.TextDefault.Transparency, 
                    Font = v20.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    Size = UDim2.new(0, v22 * 0.9, 0, 0), 
                    LayoutOrder = 3, 
                    [l_React_0.Event.Activated] = function() --[[ Line: 310 ]]
                        -- upvalues: v30 (copy), v31 (copy)
                        local v54 = not v30;
                        v31(v54);
                    end
                })
            }), 
            CodeInput = l_React_0.createElement(v17, {
                text = v28, 
                textInputType = Enum.TextInputType.Number, 
                disabled = v19.isDisabled, 
                onChange = v50, 
                errorMessage = v19.errorMessage, 
                placeholder = v27.placeholderKey, 
                LayoutOrder = 3
            })
        })
    });
end;
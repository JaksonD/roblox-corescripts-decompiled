local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_TextInputBoxWithBorder_0 = require(l_Parent_0.AuthCommon).Components.TextInputBoxWithBorder;
local l_PartialPageModal_0 = v3.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v3.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local v11 = require(l_script_FirstAncestor_0.Flags.GetFFlagDisableVerifyPhoneViewOnSuccess);
return function(v12) --[[ Line: 42 ]] --[[ Name: VerifyPhoneView ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_ButtonType_0 (copy), v11 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), l_PartialPageModal_0 (copy), l_TextInputBoxWithBorder_0 (copy), l_LinkButton_0 (copy)
    local v13 = l_useStyle_0();
    local v14 = {
        titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone", 
        verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode", 
        placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode", 
        descriptionKey = "Feature.VerificationUpsell.Label.EnterCode", 
        buttonKey = "Feature.VerificationUpsell.Action.ResendCode", 
        buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent", 
        changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber"
    };
    if v12.extraButtonKey and v12.extraButtonKey ~= "" then
        v14.extraButtonKey = v12.extraButtonKey;
    end;
    local v15 = l_useLocalization_0(v14);
    local v16, v17 = v2.useState(false);
    local v18, v19 = v2.useState(0);
    local function v33(v20, v21, v22, v23, v24, v25) --[[ Line: 62 ]] --[[ Name: getButtonStackProps ]]
        -- upvalues: v17 (copy), v19 (copy), v16 (copy), v18 (copy), l_ButtonType_0 (ref), v11 (ref), v12 (copy)
        local function v30() --[[ Line: 70 ]] --[[ Name: handleButtonClick ]]
            -- upvalues: v23 (copy), v17 (ref), v19 (ref), v22 (copy)
            v23();
            v17(true);
            v19(v22);
            local v26 = tick();
            local function v27() --[[ Line: 76 ]] --[[ Name: countDown ]]
                -- upvalues: v26 (copy), v22 (ref), v19 (ref), v27 (copy), v17 (ref)
                local v28 = tick() - v26;
                local v29 = v22 - v28;
                if v29 > 0 then
                    v19((math.round(v29)));
                    task.delay(1, v27);
                    return;
                else
                    v19(0);
                    v17(false);
                    return;
                end;
            end;
            v27();
        end;
        local function _() --[[ Line: 91 ]] --[[ Name: getButtonText ]]
            -- upvalues: v16 (ref), v21 (copy), v18 (ref), v20 (copy)
            if v16 then
                return v21 .. " (" .. v18 .. ")";
            else
                return v20;
            end;
        end;
        local v32 = {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = v30, 
                    text = if v16 then v21 .. " (" .. v18 .. ")" else v20, 
                    isDisabled = v16 or v11() and v12.isDisabled
                }
            }
        };
        if v25 and v24 and v24 ~= "" then
            table.insert(v32, 1, {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = v25, 
                    text = v24, 
                    isDisabled = v11() and v12.isDisabled
                }
            });
        end;
        return {
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical, 
            buttons = v32
        };
    end;
    local function _(v34) --[[ Line: 130 ]] --[[ Name: getBodyText ]]
        -- upvalues: v12 (copy)
        return v34:gsub("{phoneNumber}", "+" .. v12.prefix .. v12.phoneNumber);
    end;
    local v36 = l_getPartialPageModalMiddleContentWidth_0(v12.screenSize.X);
    return v2.createElement(l_PartialPageModal_0, {
        title = v15.titleKey, 
        screenSize = v12.screenSize, 
        buttonStackProps = v33(v15.buttonKey, v15.buttonDisabledKey, 10, v12.onResendPhoneCode, v15.extraButtonKey, v12.onExtraButtonClick), 
        onCloseClicked = v12.onClose, 
        position = v12.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v12.keyboardHeight) or nil, 
        anchorPoint = v12.isKeyboardShowing and Vector2.new(0.5, 1) or nil
    }, {
        Middle = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            ContentPadding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 24), 
                PaddingBottom = UDim.new(0, 24)
            }), 
            ListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 12)
            }), 
            BodyText = v2.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Text = v15.descriptionKey:gsub("{phoneNumber}", "+" .. v12.prefix .. v12.phoneNumber), 
                TextSize = v13.Font.BaseSize, 
                TextColor3 = v13.Theme.TextDefault.Color, 
                TextTransparency = v13.Theme.TextDefault.Transparency, 
                Font = v13.Font.Body.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.new(0, v36, 0, 0)
            }), 
            TextBox = v2.createElement(l_TextInputBoxWithBorder_0, {
                text = v12.code, 
                textInputType = v12.useOTPInputType and Enum.TextInputType.OneTimePassword or Enum.TextInputType.Number, 
                textInputHeight = 36, 
                layoutOrder = 2, 
                placeholderText = v15.placeholderKey, 
                errorText = v12.errorMessage, 
                onChangeTextCallback = v12.onCodeTextChange, 
                Size = UDim2.new(1, 0, 0, 0), 
                onFocused = v12.onCodeInputFocus
            }), 
            ChangePhoneButton = v2.createElement(l_LinkButton_0, {
                text = v15.changePhoneNumberKey, 
                onActivated = v12.returnToAddPhone, 
                layoutOrder = 3, 
                fontStyle = "CaptionBody", 
                minPaddingX = 0, 
                minPaddingY = 0
            })
        })
    });
end;
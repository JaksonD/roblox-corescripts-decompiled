local l_Parent_0 = script:FindFirstAncestor("PhoneUpsell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_TextField_0 = v2.App.Input.TextField;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v2.App.Dialog.Alert.InteractiveAlert;
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
local function v15(v9, v10, v11, v12, v13) --[[ Line: 35 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v14 = {
        {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v10, 
                text = v9, 
                isDisabled = v11
            }
        }
    };
    if v13 and v12 and v12 ~= "" then
        table.insert(v14, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v13, 
                text = v12, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        forcedFillDirection = Enum.FillDirection.Horizontal, 
        buttons = v14
    };
end;
return function(v16) --[[ Line: 72 ]] --[[ Name: InGameVerifyPhoneView ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_InteractiveAlert_0 (copy), v15 (copy), l_TextField_0 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy)
    local v17 = l_useStyle_0();
    local l_Tokens_0 = v17.Tokens;
    local v19 = {
        titleKey = "Feature.VerificationUpsell.Heading.VerifyYourPhone", 
        verificationCodeKey = "Feature.VerificationUpsell.Heading.VerificationCode", 
        placeholderKey = "Feature.VerificationUpsell.Label.SixDigitCode", 
        descriptionKey = "Feature.VerificationUpsell.Label.EnterCode", 
        buttonKey = "Feature.VerificationUpsell.Action.ResendCode", 
        buttonDisabledKey = "Feature.VerificationUpsell.Action.CodeResent", 
        changePhoneNumberKey = "Feature.VerificationUpsell.Action.ChangePhoneNumber", 
        editPhoneDescriptionKey = "Feature.VerificationUpsell.Action.EditPhoneNumber"
    };
    if v16.extraButtonKey and v16.extraButtonKey ~= "" then
        v19.extraButtonKey = v16.extraButtonKey;
    end;
    local v20 = l_useLocalization_0(v19);
    local v21, v22 = v1.useState(0);
    local v23 = v21 ~= 0;
    local function _(v24) --[[ Line: 97 ]] --[[ Name: getBodyText ]]
        -- upvalues: v16 (copy)
        return v24:gsub("{phoneNumber}", "+" .. v16.prefix .. v16.phoneNumber);
    end;
    local function v30() --[[ Line: 101 ]] --[[ Name: handleResendButtonClick ]]
        -- upvalues: v16 (copy), v22 (copy)
        v16.onResendPhoneCode();
        v22(10);
        local v26 = tick();
        local function v27() --[[ Line: 106 ]] --[[ Name: countDown ]]
            -- upvalues: v26 (copy), v22 (ref), v27 (copy)
            local v28 = 10 - (tick() - v26);
            if v28 > 0 then
                v22((math.ceil(v28)));
                task.delay(1, v27);
                return;
            else
                v22(0);
                return;
            end;
        end;
        local v29 = 10 - (tick() - v26);
        if v29 > 0 then
            v22((math.ceil(v29)));
            task.delay(1, v27);
            return;
        else
            v22(0);
            return;
        end;
    end;
    local v31 = if v23 then v20.buttonDisabledKey .. " (" .. v21 .. ")" else v20.buttonKey;
    local v32 = v16.errorMessage and v16.errorMessage ~= "";
    return v1.createElement(l_InteractiveAlert_0, {
        title = v20.titleKey, 
        screenSize = v16.screenSize, 
        buttonStackInfo = v15(v31, v30, v23, v20.editPhoneDescriptionKey, v16.onExtraButtonClick), 
        onCloseClicked = v16.onClose, 
        position = v16.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v16.keyboardHeight) or nil, 
        anchorPoint = v16.isKeyboardShowing and Vector2.new(0.5, 1) or nil, 
        middleContent = function() --[[ Line: 139 ]] --[[ Name: middleContent ]]
            -- upvalues: v1 (ref), l_Tokens_0 (copy), l_TextField_0 (ref), v16 (copy), v32 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v17 (copy), v20 (copy)
            return v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                ListLayout = v1.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
                }), 
                v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 0
                }, {
                    ListLayout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
                    }), 
                    TextBox = v1.createElement(l_TextField_0, {
                        text = v16.code, 
                        placeholder = "", 
                        required = true, 
                        onChange = function(v33) --[[ Line: 165 ]] --[[ Name: onChange ]]
                            -- upvalues: v16 (ref)
                            v16.onCodeTextChange({
                                Text = v33
                            });
                        end, 
                        LayoutOrder = 1, 
                        width = UDim.new(1, 0), 
                        error = v32, 
                        textInputType = if v16.useOTPInputType then Enum.TextInputType.OneTimePassword else Enum.TextInputType.Number, 
                        onFocusGained = if l_GetFFlagAddMorePhoneUpsellEvents_0() then v16.onCodeInputFocus else nil
                    }), 
                    ErrorText = v32 and v1.createElement("TextLabel", {
                        Text = v16.errorMessage, 
                        TextTransparency = 0, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        BackgroundTransparency = 1, 
                        TextColor3 = l_Tokens_0.Global.Color.Red.Color3, 
                        Font = v17.Font.Body.Font, 
                        TextSize = v17.Font.BaseSize * v17.Font.CaptionSmall.RelativeSize, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = 2
                    })
                }), 
                BodyText = v1.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v20.descriptionKey:gsub("{phoneNumber}", "+" .. v16.prefix .. v16.phoneNumber), 
                    TextSize = v17.Font.BaseSize * v17.Font.CaptionHeader.RelativeSize, 
                    TextColor3 = v17.Theme.TextDefault.Color, 
                    TextTransparency = v17.Theme.TextDefault.Transparency, 
                    Font = v17.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0)
                })
            });
        end
    });
end;
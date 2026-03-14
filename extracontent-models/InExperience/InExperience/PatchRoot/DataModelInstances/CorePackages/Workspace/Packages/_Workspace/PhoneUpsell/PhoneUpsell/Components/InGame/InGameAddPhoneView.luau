local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.AuthCommon);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local v11 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_TextField_0 = v5.App.Input.TextField;
local v13 = require(l_script_FirstAncestor_0.Components.InGame.CountryCodeButton);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_CountryCodeDropdownContainer_0 = v6.Components.InGame.CountryCodeDropdownContainer;
local l_useExternalEvent_0 = require(l_Parent_0.RoactUtils).Hooks.useExternalEvent;
local l_GetFFlagAddMorePhoneUpsellEvents_0 = require(l_Parent_0.SharedFlags).GetFFlagAddMorePhoneUpsellEvents;
local l_FFlagInExperienceAddPhoneViewNewCopy_0 = require(l_Parent_0.SharedFlags).FFlagInExperienceAddPhoneViewNewCopy;
local v19 = {
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    buttonKey = l_FFlagInExperienceAddPhoneViewNewCopy_0 and "Feature.AccountSettings.Action.Verify" or "Feature.VerificationUpsell.Action.Next", 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA", 
    prefix = "1"
};
local function v26(v20, v21, v22, v23, v24) --[[ Line: 68 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v25 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v21, 
                text = v20, 
                isDisabled = v22
            }
        }
    };
    if v23 and v23 ~= "" then
        table.insert(v25, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v24, 
                text = v23, 
                isDisabled = false
            }
        });
    end;
    return {
        buttonHeight = 48, 
        buttons = v25
    };
end;
return function(v27) --[[ Line: 103 ]] --[[ Name: InGameAddPhoneView ]]
    -- upvalues: v11 (copy), v19 (copy), l_FFlagInExperienceAddPhoneViewNewCopy_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v3 (copy), l_Text_0 (copy), l_useExternalEvent_0 (copy), l_UserInputService_0 (copy), v4 (copy), v13 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (copy), l_TextField_0 (copy), l_InteractiveAlert_0 (copy), v26 (copy), l_CountryCodeDropdownContainer_0 (copy)
    local v28 = v11(v19, v27);
    local v29 = if l_FFlagInExperienceAddPhoneViewNewCopy_0 then {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        subtitleKey = "Feature.AccountSettings.Description.AddPhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.AccountSettings.Description.NotShownPublicly", 
        titleKey = v28.titleKey, 
        descriptionKey = v28.descriptionKey, 
        buttonKey = v28.buttonKey, 
        legalTextKey = v28.legalTextKey
    } else {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        disclaimerKey = "Feature.VerificationUpsell.Description.VerificationCodeSmsFeesMayApply", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v28.titleKey, 
        descriptionKey = v28.descriptionKey, 
        buttonKey = v28.buttonKey, 
        legalTextKey = v28.legalTextKey
    };
    if v28.extraButtonKey and v28.extraButtonKey ~= "" then
        v29.extraButtonKey = v28.extraButtonKey;
    end;
    local v30 = l_useStyle_0();
    local l_Tokens_0 = v30.Tokens;
    local l_TextField_1 = l_Tokens_0.Component.TextField;
    local l_Font_0 = l_TextField_1.Base.Field.Typography.Font;
    local l_FontSize_0 = l_TextField_1.Base.Field.Typography.FontSize;
    local v35 = l_useLocalization_0(v29);
    local l_BaseSize_0 = v30.Font.BaseSize;
    local l_RelativeSize_0 = v30.Font.CaptionHeader.RelativeSize;
    local l_isDisabled_0 = v28.isDisabled;
    local l_Gap_0 = l_Tokens_0.Component.StatWidget.Container.Gap;
    local l_Size_600_0 = l_Tokens_0.Global.Size_600;
    local l_prefix_0 = v28.countryCode.prefix;
    local v42, v43 = v3.useState(false);
    local v44 = math.max(l_Text_0.GetTextWidth(l_prefix_0, l_Font_0, l_FontSize_0) + 24, l_Size_600_0);
    local v45, v46 = v3.useState(300);
    local function v48(v47) --[[ Line: 154 ]]
        -- upvalues: v46 (copy)
        v46(v47.AbsoluteSize.X);
    end;
    local v49 = v3.useRef(nil);
    local v50 = v3.useRef(nil);
    local v51 = v3.useRef(nil);
    local v52 = Vector2.new(0, 0);
    local v53 = Vector2.new(0, 0);
    local v54 = Vector2.new(0, 0);
    if v49.current then
        v52 = v49.current.AbsolutePosition;
    end;
    if v50.current then
        v53 = v50.current.AbsolutePosition;
    end;
    if v51.current then
        v54 = v51.current.AbsolutePosition;
    end;
    local v55 = math.min(v28.screenSize.Y - (v52.Y + l_Size_600_0 + l_Gap_0 - v53.Y) - l_Gap_0, 400);
    local v60 = v3.useCallback(function(v56) --[[ Line: 184 ]]
        -- upvalues: l_Size_600_0 (copy), l_Gap_0 (copy), v54 (ref), v45 (copy), v55 (ref), v44 (copy), v42 (copy), v43 (copy)
        local v57 = l_Size_600_0 + l_Gap_0;
        local v58 = false;
        if v56.Position.X > v54.X then
            v58 = false;
            if v56.Position.X < v54.X + v45 then
                v58 = false;
                if v56.Position.Y > v54.Y + v57 then
                    v58 = v56.Position.Y < v54.Y + v57 + v55;
                end;
            end;
        end;
        local v59 = false;
        if v56.Position.X > v54.X then
            v59 = false;
            if v56.Position.X < v54.X + v44 then
                v59 = false;
                if v56.Position.Y > v54.Y then
                    v59 = v56.Position.Y < v54.Y + l_Size_600_0;
                end;
            end;
        end;
        if v42 and not v58 and not v59 then
            v43(false);
        end;
    end, {
        v42, 
        v54, 
        v45, 
        v44, 
        l_Size_600_0
    });
    l_useExternalEvent_0(l_UserInputService_0.InputBegan, v60);
    local v61 = v28.errorMessage and v28.errorMessage ~= "";
    local v63 = v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        [v4.Ref] = v49
    }, {
        ListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
        }), 
        PhoneInputContainer = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 0
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_Gap_0)
            }), 
            CountryCodeButton = v3.createElement(v13, {
                countryPrefix = "+" .. l_prefix_0, 
                onButtonClick = function() --[[ Line: 237 ]] --[[ Name: onButtonClick ]]
                    -- upvalues: v43 (copy), v42 (copy), l_GetFFlagAddMorePhoneUpsellEvents_0 (ref), v28 (copy)
                    v43(not v42);
                    if l_GetFFlagAddMorePhoneUpsellEvents_0 then
                        v28.onCountryCodeSelectorClick();
                    end;
                end, 
                size = UDim2.new(0, v44, 0, l_Tokens_0.Global.Size_600), 
                layoutOrder = 1, 
                font = l_Font_0, 
                textSize = l_FontSize_0, 
                forwardRef = v51, 
                error = v61
            }), 
            PhoneInputBox = v3.createElement(l_TextField_0, {
                text = v28.phoneNumber, 
                placeholder = "", 
                required = true, 
                onChange = function(v62) --[[ Line: 254 ]] --[[ Name: onChange ]]
                    -- upvalues: v28 (copy)
                    v28.onPhoneNumberTextChange({
                        Text = v62
                    });
                end, 
                LayoutOrder = 2, 
                width = UDim.new(1, -(v44 + l_Gap_0)), 
                error = v61, 
                textInputType = if v28.usePhoneNumberTextType then Enum.TextInputType.Phone else Enum.TextInputType.Number, 
                onFocusGained = if l_GetFFlagAddMorePhoneUpsellEvents_0() then v28.onPhoneInputFocus else nil
            })
        }), 
        ErrorText = v61 and v3.createElement("TextLabel", {
            Text = v28.errorMessage, 
            TextTransparency = 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true, 
            BackgroundTransparency = 1, 
            TextColor3 = l_Tokens_0.Global.Color.Red.Color3, 
            Font = v30.Font.Body.Font, 
            TextSize = l_BaseSize_0 * v30.Font.CaptionSmall.RelativeSize, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        })
    });
    local v64 = v3.createElement(l_InteractiveAlert_0, {
        screenSize = v28.screenSize, 
        buttonStackInfo = v26(v35.buttonKey, v28.onSetPhoneNumber, l_isDisabled_0, v35.extraButtonKey, v28.onExtraButtonClick), 
        position = v28.isKeyboardShowing and UDim2.new(0.5, 0, 1, -v28.keyboardHeight) or UDim2.fromScale(0.5, 0.5), 
        anchorPoint = v28.isKeyboardShowing and Vector2.new(0.5, 1) or nil, 
        title = v35.titleKey, 
        onAbsoluteSizeChanged = v48, 
        onCloseClicked = v28.onClose, 
        middleContent = l_FFlagInExperienceAddPhoneViewNewCopy_0 and function() --[[ Line: 298 ]]
            -- upvalues: v3 (ref), l_Tokens_0 (copy), v35 (copy), l_BaseSize_0 (copy), v30 (copy), v63 (copy), l_RelativeSize_0 (copy)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                AddPhoneViewFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
                    }), 
                    SubtitleText = v3.createElement("TextLabel", {
                        LayoutOrder = -1, 
                        BackgroundTransparency = 1, 
                        Text = v35.subtitleKey, 
                        TextSize = l_BaseSize_0, 
                        TextColor3 = v30.Theme.TextEmphasis.Color, 
                        TextTransparency = v30.Theme.TextEmphasis.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    PhoneInput = v63, 
                    PhonePrivacyText = v3.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Text = v35.phonePrivacyDisclaimerKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v30.Theme.TextEmphasis.Color, 
                        TextTransparency = v30.Theme.TextEmphasis.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }), 
                    PrivacyText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Text = v35.disclaimerKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v30.Theme.TextEmphasis.Color, 
                        TextTransparency = v30.Theme.TextEmphasis.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
        end or function() --[[ Line: 357 ]]
            -- upvalues: v3 (ref), l_Tokens_0 (copy), v63 (copy), v35 (copy), l_BaseSize_0 (copy), l_RelativeSize_0 (copy), v30 (copy)
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                AddPhoneViewFrame = v3.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    ListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, l_Tokens_0.Global.Space_100)
                    }), 
                    PhoneInput = v63, 
                    PrivacyText = v3.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Text = v35.disclaimerKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v30.Theme.TextEmphasis.Color, 
                        TextTransparency = v30.Theme.TextEmphasis.Transparency, 
                        Font = v30.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                })
            });
        end
    });
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        [v4.Ref] = v50
    }, {
        AddPhoneView = v64, 
        CountryCodeSelectorFrame = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(0, v45 - 24, 0, 0), 
            ZIndex = 2, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, v52.X - v53.X, 0, v52.Y + l_Size_600_0 + l_Gap_0 - v53.Y)
        }, {
            CountryCodeDropdown = v3.createElement(l_CountryCodeDropdownContainer_0, {
                dropdownVisible = v42, 
                position = UDim2.new(0, 0, 0, 0), 
                maxHeight = v55, 
                onCountryCodeSelected = function(v65) --[[ Line: 416 ]] --[[ Name: onCountryCodeSelected ]]
                    -- upvalues: v28 (copy), v43 (copy)
                    v28.setCountryCode(v65);
                    v43(false);
                end
            })
        })
    });
end;
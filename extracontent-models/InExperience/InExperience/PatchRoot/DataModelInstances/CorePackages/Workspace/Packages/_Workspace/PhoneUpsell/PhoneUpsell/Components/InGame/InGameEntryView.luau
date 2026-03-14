local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local v8 = require(l_script_FirstAncestor_0.Utils.mergeProps);
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_Checkbox_0 = v3.App.InputButton.Checkbox;
local l_GetFFlagDisablePVUpsellDataConsent_0 = require(l_Parent_0.SharedFlags).GetFFlagDisablePVUpsellDataConsent;
local function v12() --[[ Line: 49 ]] --[[ Name: noOp ]]

end;
local v13 = {
    onClose = v12, 
    isButtonDisabled = false, 
    onExtraButtonClick = v12, 
    isExtraButtonDisabled = false, 
    alwaysShowLegalText = false, 
    requireLegalTextCheckbox = false, 
    legalTextKey = "Feature.VerificationUpsell.Description.ShortCodeLegalDisclaimerUA", 
    prefix = "1"
};
local function v22(v14, v15, v16, v17, v18, v19, v20) --[[ Line: 62 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v21 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v16, 
                text = v14, 
                isDisabled = v17
            }
        }
    };
    if v18 and v18 ~= "" then
        table.insert(v21, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v19, 
                text = v18, 
                isDisabled = v20
            }
        });
    end;
    return {
        buttonHeight = v15, 
        buttons = v21
    };
end;
return function(v23) --[[ Line: 98 ]] --[[ Name: InGameEntryView ]]
    -- upvalues: v8 (copy), v13 (copy), v2 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_InteractiveAlert_0 (copy), v22 (copy), l_GetFFlagDisablePVUpsellDataConsent_0 (copy), l_Checkbox_0 (copy), l_LinkButton_0 (copy)
    local v24 = v8(v13, v23);
    local v25, v26 = v2.useState(false);
    local v27 = {
        phoneNumberKey = "Feature.VerificationUpsell.Label.PhoneNumber", 
        phonePrivacyDisclaimerKey = "Feature.VerificationUpsell.Description.PhoneNumberNeverPublic", 
        termsOfUseKey = "Feature.VerificationUpsell.Action.TermsOfUse", 
        privacyPolicyKey = "Feature.VerificationUpsell.Action.PrivacyPolicy", 
        titleKey = v24.titleKey, 
        descriptionKey = v24.descriptionKey, 
        buttonKey = v24.buttonKey, 
        legalTextKey = v24.legalTextKey
    };
    if v24.extraButtonKey and v24.extraButtonKey ~= "" then
        v27.extraButtonKey = v24.extraButtonKey;
    end;
    local v28 = l_useStyle_0();
    local l_BaseSize_0 = v28.Font.BaseSize;
    local l_RelativeSize_0 = v28.Font.CaptionHeader.RelativeSize;
    local l_Space_75_0 = v28.Tokens.Global.Space_75;
    local v32 = l_useLocalization_0(v27);
    v32.legalTextKey = v32.legalTextKey:gsub("{buttonText}", v32.buttonKey);
    return v2.createElement(l_InteractiveAlert_0, {
        title = v32.titleKey, 
        screenSize = v24.screenSize, 
        buttonStackInfo = v22(v32.buttonKey, v28.Tokens.Global.Size_600, v24.onButtonClick, v24.isButtonDisabled, v32.extraButtonKey, v24.onExtraButtonClick, v24.isExtraButtonDisabled), 
        onCloseClicked = v24.onClose, 
        middleContent = function() --[[ Line: 137 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v32 (copy), l_BaseSize_0 (copy), v28 (copy)
            return v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                BodyText = v2.createElement("TextLabel", {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Text = v32.descriptionKey, 
                    TextSize = l_BaseSize_0, 
                    TextColor3 = v28.Theme.TextDefault.Color, 
                    TextTransparency = v28.Theme.TextDefault.Transparency, 
                    Font = v28.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    RichText = true
                })
            });
        end, 
        footerContent = not l_GetFFlagDisablePVUpsellDataConsent_0() and function() --[[ Line: 160 ]]
            -- upvalues: v2 (ref), v28 (copy), v24 (copy), l_Space_75_0 (copy), l_Checkbox_0 (ref), v26 (copy), v25 (copy), v32 (copy), l_BaseSize_0 (copy), l_RelativeSize_0 (copy), l_LinkButton_0 (ref)
            local l_createElement_0 = v2.createElement;
            local v34 = "Frame";
            local v35 = {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            };
            local v36 = {
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v28.Tokens.Global.Space_150)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, v28.Tokens.Global.Space_75)
                }), 
                LegalTextContainer = if v24.requireLegalTextCheckbox then v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, l_Space_75_0)
                    }), 
                    LegalCheckbox = v2.createElement(l_Checkbox_0, {
                        onActivated = v26, 
                        isSelected = v25, 
                        text = ""
                    }), 
                    LegalText = v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v32.legalTextKey, 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v28.Theme.TextDefault.Color, 
                        TextTransparency = v28.Theme.TextDefault.Transparency, 
                        Font = v28.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, -(26 + l_Space_75_0), 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    })
                }) else (v24.alwaysShowLegalText or v24.countryCode.prefix == "1") and v2.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Text = v32.legalTextKey, 
                    TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                    TextColor3 = v28.Theme.TextDefault.Color, 
                    TextTransparency = v28.Theme.TextDefault.Transparency, 
                    Font = v28.Font.Body.Font, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                })
            };
            local v37 = false;
            if v24.countryCode.prefix == "1" then
                v37 = v2.createElement("Frame", {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TermsOfUseButton = v2.createElement(l_LinkButton_0, {
                        text = v32.termsOfUseKey, 
                        onActivated = v24.onTermsOfUseClick, 
                        layoutOrder = 5, 
                        fontStyle = "CaptionBody", 
                        size = UDim2.fromScale(0.2, 0.2)
                    }), 
                    TextButtonDivider = v2.createElement("TextLabel", {
                        LayoutOrder = 6, 
                        BackgroundTransparency = 1, 
                        Text = "-", 
                        TextSize = l_BaseSize_0 * l_RelativeSize_0, 
                        TextColor3 = v28.Theme.TextDefault.Color, 
                        TextTransparency = v28.Theme.TextDefault.Transparency, 
                        Font = v28.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextWrapped = true, 
                        AutomaticSize = Enum.AutomaticSize.XY
                    }), 
                    PrivacyPolicyButton = v2.createElement(l_LinkButton_0, {
                        text = v32.privacyPolicyKey, 
                        onActivated = v24.onPrivacyPolicyClick, 
                        layoutOrder = 7, 
                        fontStyle = "CaptionBody"
                    })
                });
            end;
            v36.LegalButtonsContainer = v37;
            return l_createElement_0(v34, v35, v36);
        end or function() --[[ Line: 265 ]]
            return nil;
        end
    });
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AmpUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v5 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_LinkButton_0 = v5.App.Button.LinkButton;
local l_TextField_0 = v5.App.Input.TextField;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_StyledTextLabel_0 = v5.App.Text.StyledTextLabel;
local v12 = require(l_Parent_0.Cryo);
local v13 = require(l_script_FirstAncestor_0.Common.useOnScreenKeyboardHeight);
local v14 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnableFoundationUIVPCUpsell);
local v15 = require(l_Parent_0.Foundation);
local l_Dialog_0 = v15.Dialog;
local l_DialogSize_0 = v15.Enums.DialogSize;
local l_ButtonVariant_0 = v15.Enums.ButtonVariant;
local function v20(v19) --[[ Line: 38 ]] --[[ Name: selectScreenSize ]]
    return v19.ScreenSize;
end;
return function(v21) --[[ Line: 42 ]] --[[ Name: VPCNewParentUpsell ]]
    -- upvalues: l_useSelector_0 (copy), v20 (copy), v13 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v12 (copy), v14 (copy), v2 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_StyledTextLabel_0 (copy), l_TextField_0 (copy), l_LinkButton_0 (copy), l_ButtonVariant_0 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local l_onCollectEmailAndSendRequest_0 = v21.onCollectEmailAndSendRequest;
    local l_onCancel_0 = v21.onCancel;
    local v24 = l_useSelector_0(v20);
    local l_onTextChange_0 = v21.onTextChange;
    local l_canSendRequest_0 = v21.canSendRequest;
    local l_textInput_0 = v21.textInput;
    local l_errorText_0 = v21.errorText;
    local l_openPrivacyPolicyLink_0 = v21.openPrivacyPolicyLink;
    local l_isChildSubjectToParentalControls_0 = v21.isChildSubjectToParentalControls;
    local v31 = v13();
    local v32 = if v21.disablePortal then v21.disablePortal else false;
    local v33 = l_useStyle_0();
    local v34 = l_useLocalization_0(v12.Dictionary.join(v21.messageStrings, {
        directionsTextSubjectToParentalControls = {
            "Feature.Parents.Description.EnterParentEmailV4"; 
            lineBreak = "\n\n"
        }, 
        directionsTextNotSubjectToParentalControls = {
            "Feature.Parents.Description.EnterParentEmailWithoutParentalControl"; 
            lineBreak = "\n\n"
        }, 
        privacyPolicyFooter = {
            "Feature.Parents.Description.ParentalEmailFooter"; 
            linkStart = "", 
            linkEnd = ""
        }
    }));
    local l_titleText_0 = v34.titleText;
    local l_buttonText_0 = v34.buttonText;
    local v37 = "";
    v37 = if l_isChildSubjectToParentalControls_0 then if v14() then string.format("%s\n\n%s\n", v34.childInstructions, v34.parentInstructionsPC) else string.format("%s\n", v34.directionsTextSubjectToParentalControls) else if v14() then string.format("%s\n\n%s\n", v34.childInstructions, v34.parentInstructionsNoPC) else string.format("%s\n", v34.directionsTextNotSubjectToParentalControls);
    local l_textFieldHeaderText_0 = v34.textFieldHeaderText;
    if v14() then
        return v2.createElement(l_Dialog_0.Root, {
            size = l_DialogSize_0.Large, 
            onClose = l_onCancel_0, 
            disablePortal = v32
        }, {
            DialogTitle = v2.createElement(l_Dialog_0.Title, {
                text = l_titleText_0
            }), 
            DialogContent = v2.createElement(l_Dialog_0.Content, {
                LayoutOrder = 2
            }, {
                Frame = v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    HeaderText = v2.createElement(l_StyledTextLabel_0, {
                        text = v37, 
                        fontStyle = v33.Font.CaptionHeader, 
                        colorStyle = v33.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        textWrapped = true, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        layoutOrder = 1, 
                        lineHeight = 1
                    }), 
                    TextboxFrame = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            Padding = UDim.new(0, 10)
                        }), 
                        TextFieldHeader = v2.createElement(l_StyledTextLabel_0, {
                            text = l_textFieldHeaderText_0, 
                            fontStyle = v33.Font.Header2, 
                            colorStyle = v33.Theme.TextDefault, 
                            textWrapped = true, 
                            automaticSize = Enum.AutomaticSize.XY, 
                            layoutOrder = 0
                        }), 
                        TextField = v2.createElement(l_TextField_0, {
                            text = l_textInput_0, 
                            placeholder = v34.emailPlaceholder, 
                            required = true, 
                            hint = l_errorText_0, 
                            error = not (l_errorText_0 == ""), 
                            onChange = l_onTextChange_0, 
                            width = UDim.new(1, 0), 
                            layoutOrder = 1
                        })
                    }), 
                    DisclaimerFrame = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Disclaimer = v2.createElement(l_StyledTextLabel_0, {
                            text = v34.privacyPolicyFooter, 
                            fontStyle = v33.Font.Footer, 
                            colorStyle = v33.Theme.TextDefault, 
                            textXAlignment = Enum.TextXAlignment.Left, 
                            textWrapped = true, 
                            automaticSize = Enum.AutomaticSize.XY, 
                            layoutOrder = 1, 
                            lineHeight = 1
                        }), 
                        PrivacyPolicy = v2.createElement(l_LinkButton_0, {
                            text = v34.privacyLinkText, 
                            layoutOrder = 2, 
                            fontStyle = "Footer", 
                            underlineAlwaysEnabled = false, 
                            onActivated = l_openPrivacyPolicyLink_0
                        })
                    })
                })
            }), 
            DialogActions = v2.createElement(l_Dialog_0.Actions, {
                LayoutOrder = 3, 
                actions = {
                    {
                        text = l_buttonText_0, 
                        variant = l_ButtonVariant_0.Standard, 
                        onActivated = function() --[[ Line: 190 ]] --[[ Name: onActivated ]]
                            -- upvalues: l_onCollectEmailAndSendRequest_0 (copy), l_textInput_0 (copy)
                            l_onCollectEmailAndSendRequest_0(l_textInput_0);
                        end, 
                        isDisabled = not l_canSendRequest_0
                    }
                }
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            title = l_titleText_0, 
            screenSize = v24, 
            position = v31 > 0 and UDim2.new(0.5, 0, 1, -v31 * 0.8) or UDim2.fromScale(0.5, 0.5), 
            anchorPoint = v31 > 0 and Vector2.new(0.5, 1) or nil, 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = function() --[[ Line: 210 ]] --[[ Name: onActivated ]]
                                -- upvalues: l_onCollectEmailAndSendRequest_0 (copy), l_textInput_0 (copy)
                                l_onCollectEmailAndSendRequest_0(l_textInput_0);
                            end, 
                            text = l_buttonText_0, 
                            isDisabled = not l_canSendRequest_0
                        }
                    }
                }
            }, 
            onCloseClicked = l_onCancel_0, 
            bottomPadding = 0, 
            middleContent = function() --[[ Line: 221 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), l_StyledTextLabel_0 (ref), v37 (ref), v33 (copy), l_textFieldHeaderText_0 (copy), l_TextField_0 (ref), l_textInput_0 (copy), v34 (copy), l_errorText_0 (copy), l_onTextChange_0 (copy), l_LinkButton_0 (ref), l_openPrivacyPolicyLink_0 (copy)
                return v2.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top
                    }), 
                    HeaderText = v2.createElement(l_StyledTextLabel_0, {
                        text = v37, 
                        fontStyle = v33.Font.CaptionHeader, 
                        colorStyle = v33.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Top, 
                        textWrapped = true, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        layoutOrder = 1
                    }), 
                    TextboxFrame = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            Padding = UDim.new(0, 10)
                        }), 
                        TextFieldHeader = v2.createElement(l_StyledTextLabel_0, {
                            text = l_textFieldHeaderText_0, 
                            fontStyle = v33.Font.Header2, 
                            colorStyle = v33.Theme.TextDefault, 
                            textWrapped = true, 
                            automaticSize = Enum.AutomaticSize.XY, 
                            layoutOrder = 0
                        }), 
                        TextField = v2.createElement(l_TextField_0, {
                            text = l_textInput_0, 
                            placeholder = v34.emailPlaceholder, 
                            required = true, 
                            hint = l_errorText_0, 
                            error = not (l_errorText_0 == ""), 
                            onChange = l_onTextChange_0, 
                            width = UDim.new(1, 0), 
                            layoutOrder = 1
                        })
                    }), 
                    DisclaimerFrame = v2.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 3
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }), 
                        Disclaimer = v2.createElement(l_StyledTextLabel_0, {
                            text = v34.privacyPolicyFooter, 
                            fontStyle = v33.Font.Footer, 
                            colorStyle = v33.Theme.TextDefault, 
                            textXAlignment = Enum.TextXAlignment.Left, 
                            textWrapped = true, 
                            automaticSize = Enum.AutomaticSize.XY, 
                            layoutOrder = 1
                        }), 
                        PrivacyPolicy = v2.createElement(l_LinkButton_0, {
                            text = v34.privacyLinkText, 
                            layoutOrder = 2, 
                            fontStyle = "Footer", 
                            underlineAlwaysEnabled = false, 
                            onActivated = l_openPrivacyPolicyLink_0
                        })
                    })
                });
            end
        });
    end;
end;
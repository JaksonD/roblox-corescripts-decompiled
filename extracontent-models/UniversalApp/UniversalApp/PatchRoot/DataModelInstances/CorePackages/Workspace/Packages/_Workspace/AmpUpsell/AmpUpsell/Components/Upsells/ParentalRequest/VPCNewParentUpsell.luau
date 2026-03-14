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
local function v15(v14) --[[ Line: 31 ]] --[[ Name: selectScreenSize ]]
    return v14.ScreenSize;
end;
return function(v16) --[[ Line: 35 ]] --[[ Name: VPCNewParentUpsell ]]
    -- upvalues: l_useSelector_0 (copy), v15 (copy), v13 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v12 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_StyledTextLabel_0 (copy), l_TextField_0 (copy), l_LinkButton_0 (copy)
    local l_onCollectEmailAndSendRequest_0 = v16.onCollectEmailAndSendRequest;
    local l_onCancel_0 = v16.onCancel;
    local v19 = l_useSelector_0(v15);
    local l_onTextChange_0 = v16.onTextChange;
    local l_canSendRequest_0 = v16.canSendRequest;
    local l_textInput_0 = v16.textInput;
    local l_errorText_0 = v16.errorText;
    local l_openPrivacyPolicyLink_0 = v16.openPrivacyPolicyLink;
    local l_isChildSubjectToParentalControls_0 = v16.isChildSubjectToParentalControls;
    local v26 = v13();
    local v27 = l_useStyle_0();
    local v28 = l_useLocalization_0(v12.Dictionary.join(v16.messageStrings, {
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
    local l_titleText_0 = v28.titleText;
    local l_buttonText_0 = v28.buttonText;
    local v31 = "";
    v31 = if l_isChildSubjectToParentalControls_0 then string.format("%s\n", v28.directionsTextSubjectToParentalControls) else string.format("%s\n", v28.directionsTextNotSubjectToParentalControls);
    local l_textFieldHeaderText_0 = v28.textFieldHeaderText;
    return v2.createElement(l_InteractiveAlert_0, {
        title = l_titleText_0, 
        screenSize = v19, 
        position = v26 > 0 and UDim2.new(0.5, 0, 1, -v26 * 0.8) or UDim2.fromScale(0.5, 0.5), 
        anchorPoint = v26 > 0 and Vector2.new(0.5, 1) or nil, 
        buttonStackInfo = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = function() --[[ Line: 82 ]] --[[ Name: onActivated ]]
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
        middleContent = function() --[[ Line: 93 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), l_StyledTextLabel_0 (ref), v31 (ref), v27 (copy), l_textFieldHeaderText_0 (copy), l_TextField_0 (ref), l_textInput_0 (copy), v28 (copy), l_errorText_0 (copy), l_onTextChange_0 (copy), l_LinkButton_0 (ref), l_openPrivacyPolicyLink_0 (copy)
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
                    text = v31, 
                    fontStyle = v27.Font.CaptionHeader, 
                    colorStyle = v27.Theme.TextDefault, 
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
                        fontStyle = v27.Font.Header2, 
                        colorStyle = v27.Theme.TextDefault, 
                        textWrapped = true, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        layoutOrder = 0
                    }), 
                    TextField = v2.createElement(l_TextField_0, {
                        text = l_textInput_0, 
                        placeholder = v28.emailPlaceholder, 
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
                        text = v28.privacyPolicyFooter, 
                        fontStyle = v27.Font.Footer, 
                        colorStyle = v27.Theme.TextDefault, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textWrapped = true, 
                        automaticSize = Enum.AutomaticSize.XY, 
                        layoutOrder = 1
                    }), 
                    PrivacyPolicy = v2.createElement(l_LinkButton_0, {
                        text = v28.privacyLinkText, 
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
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Parent_0.AppBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_FullscreenPageWithSafeArea_0 = v5.FullscreenPageWithSafeArea;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local v14 = require(l_Parent_0.Foundation);
local l_Text_0 = v14.Text;
local l_TextInput_0 = v14.TextInput;
local l_Button_0 = v14.Button;
local l_ButtonVariant_0 = v14.Enums.ButtonVariant;
local l_InputSize_0 = v14.Enums.InputSize;
local l_Divider_0 = v14.Divider;
local l_DividerVariant_0 = v14.Enums.DividerVariant;
local l_Orientation_0 = v14.Enums.Orientation;
local l_useTokens_0 = v14.Hooks.useTokens;
local l_ScrollView_0 = v14.ScrollView;
local l_Visibility_0 = v14.Enums.Visibility;
local l_SystemBanner_0 = v14.SystemBanner;
local l_AlertVariant_0 = v14.Enums.AlertVariant;
local l_AlertSeverity_0 = v14.Enums.AlertSeverity;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_useClearFocusOnUnmount_0 = require(l_script_FirstAncestor_0.Hooks).useClearFocusOnUnmount;
local l_GetUserById_0 = require(l_Parent_0.AuthCommon).Thunks.GetUserById;
local v32 = require(l_script_FirstAncestor_0.Store.AccountRecoveryContext);
local v33 = require(l_script_FirstAncestor_0.Thunks.SendCode);
local _ = require(l_script_FirstAncestor_0.Common.AccountRecoveryRequestTypes);
local v35 = require(l_script_FirstAncestor_0.Components.Constants);
local v36 = require(l_script_FirstAncestor_0.Components.PhoneDropdown);
local v37 = require(l_script_FirstAncestor_0.Components.RecoveryHeader);
local v38 = require(l_script_FirstAncestor_0.Enums.ContactMethodType);
local v39 = require(l_script_FirstAncestor_0.Components.UserHeader);
local v40 = require(l_script_FirstAncestor_0.Utils.IdentifierUtils);
local v41 = require(l_script_FirstAncestor_0.Enums.IdentifierType);
local v42 = require(l_script_FirstAncestor_0.Enums.RecoveryMethodType);
local v43 = require(l_script_FirstAncestor_0.Enums.AccountRecoveryPageState);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v45 = require(l_script_FirstAncestor_0.Analytics.EventService);
return function(v46) --[[ Line: 68 ]]
    -- upvalues: v3 (copy), v32 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v38 (copy), v42 (copy), l_useClearFocusOnUnmount_0 (copy), l_GetUserById_0 (copy), l_Logger_0 (copy), v33 (copy), v40 (copy), v45 (copy), l_HttpService_0 (copy), v35 (copy), v43 (copy), v41 (copy), l_useLocalization_0 (copy), l_FullscreenPageWithSafeArea_0 (copy), v37 (copy), l_ScrollView_0 (copy), l_Visibility_0 (copy), v39 (copy), l_Text_0 (copy), l_SystemBanner_0 (copy), l_AlertSeverity_0 (copy), l_AlertVariant_0 (copy), v36 (copy), l_StyledTextLabel_0 (copy), l_TextInput_0 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_Divider_0 (copy), l_DividerVariant_0 (copy), l_Orientation_0 (copy)
    local v47 = v3.useContext(v32);
    local v48 = l_useStyle_0();
    local v49 = l_useTokens_0();
    local v50 = l_useDesignTokens_0();
    local v51 = l_useDispatch_0();
    local v52 = l_useRoactService_0(l_RoactNetworking_0);
    local v53, v54 = v3.useState(false);
    local v55, v56 = v3.useState("");
    local v57, v58 = v3.useState("");
    local v59, v60 = v3.useState("");
    local v61, v62 = v3.useState(1);
    local v63, v64 = v3.useState(false);
    local v65, v66 = v3.useState("");
    local v67, v68 = v3.useState(Vector2.new(0, 0));
    local v69 = v46.navigation.getParam("userID");
    local v70 = v46.navigation.getParam("isSecondContactMethodVerification") or false;
    local v71 = v46.navigation.getParam("previousRecoveryMethod") or "";
    local v72 = v46.navigation.getParam("previousRecoveryMethodTypes");
    local v73 = v46.navigation.getParam("closeRecoveryOnBack") or false;
    local v74 = false;
    if v69 ~= nil then
        v74 = v69 ~= 0;
    end;
    local v75 = v74 and not v70;
    local l_Email_0 = v38.Email;
    if v70 and v72 and #v72 > 0 then
        for _, v78 in ipairs(v72) do
            if v78 == v42.Phone then
                l_Email_0 = v38.Phone;
            end;
        end;
    end;
    local v79 = v70 and l_Email_0 == v38.Phone;
    l_useClearFocusOnUnmount_0();
    v3.useEffect(function() --[[ Line: 114 ]]
        -- upvalues: v74 (copy), l_GetUserById_0 (ref), v52 (copy), v69 (copy), v58 (copy), v56 (copy), l_Logger_0 (ref)
        if v74 then
            l_GetUserById_0(v52, v69):andThen(function(v80) --[[ Line: 116 ]]
                -- upvalues: v58 (ref), v56 (ref)
                v58(v80.name);
                v56(v80.displayName);
            end):catch(function(v81) --[[ Line: 119 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error getting user info: {}", v81);
            end);
        end;
    end, {});
    local function _(v82, v83, v84) --[[ Line: 125 ]]
        -- upvalues: v51 (copy), v33 (ref), v52 (copy), v70 (copy)
        return v51(v33(v52, {
            recoverySessionId = v82, 
            contactMethod = v83, 
            contactMethodType = v84, 
            contactMethodNumber = v70 and 1 or 0
        }));
    end;
    local function v92(v86) --[[ Line: 138 ]]
        -- upvalues: v64 (copy), v66 (copy), v40 (ref), v59 (copy), v53 (copy), v47 (copy), v61 (copy), v45 (ref), v51 (copy), v33 (ref), v52 (copy), v70 (copy), l_Logger_0 (ref), l_HttpService_0 (ref), v35 (ref)
        v64(true);
        v66("");
        local v87 = v40.getIdentifierType(v59, v53);
        local v88 = v40.identifierTypeToContactMethodType(v87);
        local v89 = v40.formatIdentifier(v59, v87, v47.state.phonePrefixList[v61]);
        v45.sendContactMethodSentEvent(v47.state.recoverySessionId, v87);
        local l_recoverySessionId_0 = v47.state.recoverySessionId;
        v51(v33(v52, {
            recoverySessionId = l_recoverySessionId_0, 
            contactMethod = v89, 
            contactMethodType = v88, 
            contactMethodNumber = v70 and 1 or 0
        })):andThen(function(v91) --[[ Line: 155 ]]
            -- upvalues: l_Logger_0 (ref), l_HttpService_0 (ref), v66 (ref), v35 (ref), v64 (ref), v86 (copy), v87 (copy), v88 (copy), v59 (ref)
            if v91.isError then
                l_Logger_0:warning("Error sending code: {}", l_HttpService_0:JSONEncode(v91));
                v66(v91.errorKey or v35.UnknownErrorKey);
                v64(false);
                return;
            else
                v86(v87, v88, v59);
                return;
            end;
        end);
    end;
    local function v96(v93, v94, v95) --[[ Line: 167 ]]
        -- upvalues: v74 (copy), v46 (copy), v43 (ref), v41 (ref), v69 (copy), v57 (copy), v55 (copy), v70 (copy), v54 (copy), v60 (copy), v64 (copy), v66 (copy)
        if v74 then
            v46.navigation.navigate(v43.VerifyCodeScreen, {
                identifierInfo = {
                    identifierType = v41.Username, 
                    contactMethodType = v94, 
                    userId = v69, 
                    username = v57, 
                    displayName = v55
                }, 
                contactMethodNumber = v70 and 1 or 0
            });
        else
            v46.navigation.navigate(v43.VerifyCodeScreen, {
                identifierInfo = {
                    identifierType = v93, 
                    contactMethodType = v94, 
                    contactMethod = v95
                }, 
                contactMethodNumber = v70 and 1 or 0
            });
        end;
        v54(false);
        v60("");
        v64(false);
        v66("");
    end;
    local function v98(v97) --[[ Line: 200 ]]
        -- upvalues: v67 (copy), v68 (copy)
        if v67 ~= v97.AbsoluteSize then
            v68(v97.AbsoluteSize);
        end;
    end;
    local v99 = l_useLocalization_0({
        recoveryHeadingText = "Authentication.AccountRecovery.Heading.RobloxAccountRecovery", 
        secondMethodHeadingText = "Authentication.AccountRecovery.Heading.EnterSecondMethod", 
        previousMethodVerifiedText = {
            "Authentication.AccountRecovery.Label.PreviousContactMethodVerification"; 
            contactMethod = v71
        }, 
        enterPhoneOrAnotherEmailText = "Authentication.AccountRecovery.Description.EnterPhoneOrAnotherEmail", 
        enterEmailAddressText = "Authentication.AccountRecovery.Description.EnterEmailAddress", 
        phoneText = "Authentication.AccountRecovery.LabelPhone", 
        emailText = "Authentication.AccountRecovery.LabelEmail", 
        nextButtonText = "Authentication.AccountRecovery.Action.Next", 
        sendCodeButtonText = "Authentication.AccountRecovery.Action.SendCode", 
        orText = "Authentication.AccountRecovery.Label.Or", 
        usePhoneInsteadText = "Authentication.AccountRecovery.Action.UsePhoneInstead", 
        useEmailInsteadText = "Authentication.AccountRecovery.Action.UseEmailInstead", 
        enterContactMethodAssociatedWithYourAccountText = "Authentication.AccountRecovery.Description.EnterContactMethodAssociatedWithYourAccount", 
        sendCodeContactMethodConfirmation = "Authentication.AccountRecovery.Description.SendCodeContactMethodConfirmation", 
        errorText = if v65 ~= "" then v65 else nil
    });
    return v3.createElement(l_FullscreenPageWithSafeArea_0, {
        includeStatusBar = true, 
        BackgroundColor3 = v48.Theme.BackgroundDefault.Color
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v50.Global.Space_100), 
            PaddingLeft = UDim.new(0, v50.Global.Space_150), 
            PaddingRight = UDim.new(0, v50.Global.Space_150), 
            PaddingBottom = UDim.new(0, v50.Global.Space_100)
        }), 
        Wrapper = v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            Header = v3.createElement(v37, {
                LayoutOrder = 1, 
                onBackActivated = function() --[[ Line: 248 ]] --[[ Name: onBackActivated ]]
                    -- upvalues: v73 (copy), v47 (copy), v46 (copy)
                    if v73 then
                        v47.parentNavigation.goBack();
                        return;
                    else
                        v46.navigation.goBack();
                        return;
                    end;
                end, 
                backButtonDisabled = v63, 
                recoveryHeadingText = v70 and v99.secondMethodHeadingText or v99.recoveryHeadingText, 
                currentComponent = "sendCode", 
                recoverySessionId = v47.state.recoverySessionId
            }), 
            Content = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                PreScrollContent = v3.createElement("Frame", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    [v3.Change.AbsoluteSize] = v98
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v50.Global.Space_100), 
                        PaddingRight = UDim.new(0, v50.Global.Space_100)
                    }), 
                    UIListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v50.Global.Space_20)
                    }), 
                    RecoveryHeadingSpacing = v3.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, v50.Global.Space_250), 
                        BackgroundTransparency = 1
                    })
                }), 
                InputsOverflowScrollView = v3.createElement(l_ScrollView_0, {
                    LayoutOrder = 2, 
                    scroll = {
                        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                        CanvasSize = UDim2.new(1, 0, 0, 0), 
                        ScrollingDirection = Enum.ScrollingDirection.Y, 
                        scrollBarVisibility = l_Visibility_0.Always
                    }, 
                    Size = UDim2.new(1, 0, 1, -v67.Y)
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v50.Global.Space_100), 
                        PaddingRight = UDim.new(0, v50.Global.Space_100)
                    }), 
                    UIListLayout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v50.Global.Space_20)
                    }), 
                    UserHeader = v75 and v3.createElement(v39, {
                        LayoutOrder = 2, 
                        userId = v69, 
                        displayName = v55, 
                        username = v57
                    }), 
                    UserHeaderSpacing = v75 and v3.createElement("Frame", {
                        LayoutOrder = 3, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_300), 
                        BackgroundTransparency = 1
                    }), 
                    BodyText = not v70 and v3.createElement(l_Text_0, {
                        LayoutOrder = 4, 
                        Text = v75 and v99.enterContactMethodAssociatedWithYourAccountText or v99.sendCodeContactMethodConfirmation, 
                        TextWrapped = true, 
                        fontStyle = v49.Typography.BodyMedium, 
                        textStyle = v49.Color.Content.Default, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        padding = {
                            bottom = UDim.new(0, v49.Size.Size_300)
                        }
                    }), 
                    SecondContactMethodText = v70 and v3.createElement(l_SystemBanner_0, {
                        LayoutOrder = 5, 
                        severity = l_AlertSeverity_0.Info, 
                        variant = l_AlertVariant_0.Standard, 
                        title = v99.previousMethodVerifiedText, 
                        description = l_Email_0 == v38.Phone and v99.enterEmailAddressText or v99.enterPhoneOrAnotherEmailText
                    }), 
                    SecondContactMethodTextSpacing = v70 and v3.createElement("Frame", {
                        LayoutOrder = 6, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_400), 
                        BackgroundTransparency = 1
                    }), 
                    PhoneDropdown = v53 and not v79 and v3.createElement(v36, {
                        LayoutOrder = 7, 
                        value = v61, 
                        onChange = function(v100) --[[ Line: 362 ]] --[[ Name: onChange ]]
                            -- upvalues: v62 (copy)
                            v62(v100);
                        end, 
                        phonePrefixList = v47.state.phonePrefixList, 
                        topOffset = v50.Global.Space_800 * 3
                    }), 
                    PhoneDropdownSpacing = v53 and not v79 and v3.createElement("Frame", {
                        LayoutOrder = 8, 
                        Size = UDim2.new(1, 0, 0, v50.Global.Space_250), 
                        BackgroundTransparency = 1
                    }), 
                    ContactMethodLabel = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 9, 
                        text = v53 and v99.phoneText or v99.emailText, 
                        fontStyle = v49.Typography.TitleMedium, 
                        colorStyle = v48.Theme.TextEmphasis, 
                        automaticSize = Enum.AutomaticSize.XY
                    }), 
                    ContactMethodLabelSpacing = v3.createElement("Frame", {
                        LayoutOrder = 10, 
                        Size = UDim2.new(1, 0, 0, v50.Global.Space_50), 
                        BackgroundTransparency = 1
                    }), 
                    ContactMethodField = v3.createElement(l_TextInput_0, {
                        LayoutOrder = 11, 
                        text = v59, 
                        label = "", 
                        width = UDim.new(1, 0), 
                        textInputType = v53 and Enum.TextInputType.Phone or Enum.TextInputType.Email, 
                        onChanged = function(v101) --[[ Line: 393 ]] --[[ Name: onChanged ]]
                            -- upvalues: v65 (copy), v66 (copy), v60 (copy)
                            if v65 ~= "" then
                                v66("");
                            end;
                            v60(v101);
                        end, 
                        isDisabled = v63, 
                        size = l_InputSize_0.Medium
                    }), 
                    ErrorTextSpacing = v3.createElement("Frame", {
                        LayoutOrder = 12, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_200), 
                        BackgroundTransparency = 1
                    }), 
                    ErrorTextLabel = v3.createElement(l_Text_0, {
                        Text = v99.errorText or "", 
                        fontStyle = v49.Typography.CaptionSmall, 
                        textStyle = v49.Color.System.Alert, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        LayoutOrder = 13
                    }), 
                    NextButtonSpacing = v3.createElement("Frame", {
                        LayoutOrder = 14, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_300), 
                        BackgroundTransparency = 1
                    }), 
                    NextButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 15, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        size = l_InputSize_0.Medium, 
                        text = v74 and v99.nextButtonText or v99.sendCodeButtonText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 428 ]] --[[ Name: onActivated ]]
                            -- upvalues: v92 (copy), v96 (copy)
                            v92(v96);
                        end, 
                        isDisabled = #v59 < 3, 
                        isLoading = v63
                    }), 
                    DividerSpacing = not v79 and v3.createElement("Frame", {
                        LayoutOrder = 16, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_900), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputDivider = not v79 and v3.createElement("Frame", {
                        LayoutOrder = 17, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y
                    }, {
                        LabelContainer = v3.createElement("Frame", {
                            BackgroundColor3 = v48.Theme.BackgroundDefault.Color, 
                            BackgroundTransparency = 0, 
                            BorderSizePixel = 0, 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            ZIndex = 2
                        }, {
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingLeft = UDim.new(0, v50.Global.Space_100), 
                                PaddingRight = UDim.new(0, v50.Global.Space_100), 
                                PaddingTop = UDim.new(0, v50.Global.Space_25), 
                                PaddingBottom = UDim.new(0, v50.Global.Space_25)
                            }), 
                            Label = v3.createElement(l_Text_0, {
                                Text = v99.orText, 
                                fontStyle = v49.Typography.LabelMedium, 
                                textStyle = v49.Color.ActionStandard.Foreground, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                TextXAlignment = Enum.TextXAlignment.Center, 
                                TextYAlignment = Enum.TextYAlignment.Center
                            })
                        }), 
                        Divider = v3.createElement(l_Divider_0, {
                            variant = l_DividerVariant_0.Default, 
                            orientation = l_Orientation_0.Horizontal, 
                            ZIndex = 1
                        })
                    }), 
                    SwitchInputButtonSpacing = not v79 and v3.createElement("Frame", {
                        LayoutOrder = 18, 
                        Size = UDim2.new(1, 0, 0, v49.Size.Size_700), 
                        BackgroundTransparency = 1
                    }), 
                    SwitchInputButton = not v79 and v3.createElement(l_Button_0, {
                        LayoutOrder = 19, 
                        variant = l_ButtonVariant_0.Standard, 
                        size = l_InputSize_0.Medium, 
                        text = v53 and v99.useEmailInsteadText or v99.usePhoneInsteadText, 
                        width = UDim.new(1, 0), 
                        onActivated = function() --[[ Line: 488 ]] --[[ Name: onActivated ]]
                            -- upvalues: v45 (ref), v47 (copy), v53 (copy), v54 (copy), v60 (copy)
                            v45.sendSwitchedInputEvent(v47.state.recoverySessionId, not v53, "sendCode");
                            v54(not v53);
                            v60("");
                        end, 
                        isDisabled = v63
                    })
                })
            })
        })
    });
end;
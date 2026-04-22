local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v12 = require(l_CorePackages_0.Packages.Foundation);
local l_Image_0 = v12.Image;
local l_useTokens_0 = v12.Hooks.useTokens;
local l_View_0 = v12.View;
local l_Text_0 = v12.Text;
local l_TextInput_0 = v12.TextInput;
local l_InputSize_0 = v12.Enums.InputSize;
local l_Text_1 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v21 = require(l_Modules_0.LuaApp.Thunks.Authentication.CrossDeviceLogin);
local v22 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsAuthEvents);
local v23 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v24 = require(l_Modules_0.LuaApp.Http.Requests.GetIXPLayerParameters);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceLoginUsingQRCodes);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableCrossDeviceEnterCodeRefresh);
local v27 = require(l_Modules_0.LuaApp.FitChildren);
local v28 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v29 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_TextInputBoxWithBorder_0 = v29.Components.TextInputBoxWithBorder;
local l_AuthStatefulRoundCornerBorder_0 = v29.Components.AuthStatefulRoundCornerBorder;
local l_Button_0 = v7.App.Button.Button;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local v34 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDevicePhoneLayout);
local v35 = require(l_Modules_0.LuaApp.Components.Authentication.CrossDeviceLogin.CrossDeviceTabletLayout);
local v36 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
local l_GetFFlagEnableAuthsecImageUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAuthsecImageUpdate;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v40 = l_Images_0["icons/graphic/lock_xxlarge"];
game:DefineFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments", false);
game:DefineFastFlag("EnableXDLCodeValidationExperiment", false);
local function _(v41) --[[ Line: 78 ]] --[[ Name: sanitizeEnterCode ]]
    return v41:gsub("[^%w]", ""):upper():sub(1, 6);
end;
local function _() --[[ Line: 82 ]] --[[ Name: getLocalPlayerDisplayName ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        return "Player";
    else
        local l_DisplayName_0 = l_LocalPlayer_0.DisplayName;
        if l_DisplayName_0 and l_DisplayName_0 ~= "" then
            return l_DisplayName_0;
        else
            return l_LocalPlayer_0.Name;
        end;
    end;
end;
local function _(v46) --[[ Line: 94 ]] --[[ Name: escapeForRichText ]]
    return v46:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;");
end;
local v48 = v4.PureComponent:extend("CrossDeviceEnterCodePage");
v48.init = function(v49) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v36 (copy), v25 (copy), v26 (copy), v23 (copy), v4 (copy)
    v49.latestSanitizedCode = "";
    v49:setState({
        inputCode = "", 
        inputErrorKey = "", 
        placeholderTextOverride = "", 
        disableSubmissionForBadCode = false, 
        isConfirming = false, 
        isFocused = false
    });
    v49.onFocus = function() --[[ Line: 112 ]]
        -- upvalues: v49 (copy)
        v49:setState({
            inputErrorKey = "", 
            isFocused = true
        });
    end;
    v49.onFocusLost = function(_, v51) --[[ Line: 119 ]]
        -- upvalues: v49 (copy)
        if v51 and #v49.state.inputCode == 6 then
            v49.confirmButtonPressed();
            return;
        else
            v49:setState({
                isFocused = false
            });
            return;
        end;
    end;
    v49.getVerifyCodeImage = function(v52) --[[ Line: 129 ]]
        -- upvalues: v12 (ref)
        if v52 == v12.Enums.Theme.Dark then
            return "icons/graphic/verifyCode_dark";
        else
            return "icons/graphic/verifyCode_light";
        end;
    end;
    v49.onTextChanged = function(v53) --[[ Line: 137 ]]
        -- upvalues: v49 (copy), v36 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 144 ]]
            -- upvalues: v53 (copy), v49 (ref)
            local v54 = v53.Text:gsub("[^%w]", ""):upper():sub(1, 6);
            if v54 ~= v53.Text then
                v53.Text = v54;
                return;
            else
                v49:setState({
                    inputCode = v53.Text
                });
                return;
            end;
        end);
        if not l_status_0 then
            v36:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(l_result_0))));
        end;
    end;
    v49.onRefreshCodeChanged = function(v57) --[[ Line: 159 ]]
        -- upvalues: v49 (copy), v36 (ref)
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 160 ]]
            -- upvalues: v57 (copy), v49 (ref)
            local v58 = v57:gsub("[^%w]", ""):upper():sub(1, 6);
            v49.latestSanitizedCode = v58;
            v49.setInputText(v58);
            v49:setState({
                inputCode = v58
            });
        end);
        if not l_status_1 then
            v36:warning(string.format("Text validation error in CrossDeviceEnderCodeView: %s", (tostring(l_result_1))));
        end;
    end;
    v49.attemptDeeplinkCode = true;
    v49.confirmingCode = false;
    v49.confirmButtonPressed = function() --[[ Line: 175 ]]
        -- upvalues: v49 (copy), v25 (ref), v26 (ref), v23 (ref)
        if not v49.confirmingCode then
            v49.confirmingCode = true;
            v49:setState({
                isConfirming = true, 
                isFocused = false
            });
            local v61 = nil;
            local v62 = nil;
            if v25() and v49.attemptDeeplinkCode and v49.props.code then
                v61 = v49.props.code;
                v62 = "qrCode";
            else
                v61 = v49.state.inputCode;
                v62 = "alphaNumericCode";
            end;
            if v26() and v62 == "alphaNumericCode" then
                v61 = v49.latestSanitizedCode;
            end;
            v49.attemptDeeplinkCode = false;
            if v25() then
                v49.props.authAnalytics.reportButtonClickedWithCType(v23.Context.QuickLogin, v23.Button.EnterDeviceCode, v62);
            else
                v49.props.authAnalytics.reportButtonClicked(v23.Context.QuickLogin, v23.Button.EnterDeviceCode);
            end;
            do
                local l_v61_0 = v61;
                v49.props.validateCode(v49.props.networking, l_v61_0):andThen(function(v64) --[[ Line: 212 ]]
                    -- upvalues: v49 (ref), l_v61_0 (ref)
                    v49.acceptInputCode(l_v61_0, v64.DeviceInfo);
                end, v49.clearInputCode);
            end;
        end;
    end;
    local v65, v66 = v4.createBinding("");
    v49.inputText = v65;
    v49.setInputText = v66;
    v49.clearInputCode = function(v67) --[[ Line: 219 ]]
        -- upvalues: v49 (copy)
        v49.confirmingCode = false;
        v49.latestSanitizedCode = "";
        v49.setInputText("");
        local v68 = "Authentication.Login.Response.SomethingWentWrong";
        if v67.Body == "\"CodeInvalid\"" then
            v68 = "Authentication.CrossDevice.Response.InvalidCode";
        elseif v67.Body == "\"InvalidLocation\"" then
            v68 = "Authentication.CrossDevice.Label.InvalidLocationError";
        end;
        v49:setState({
            inputCode = "", 
            inputErrorKey = v68, 
            isConfirming = false
        });
    end;
    v49.acceptInputCode = function(v69, v70) --[[ Line: 236 ]]
        -- upvalues: v49 (copy)
        if v49.props.confirmDeviceCode then
            v49.props.confirmDeviceCode(v69, v70);
        end;
    end;
end;
v48.didMount = function(v71) --[[ Line: 243 ]] --[[ Name: didMount ]]
    -- upvalues: v23 (copy), v24 (copy)
    if v71.props.code then
        local v72 = v71.props.code:gsub("[^%w]", ""):upper():sub(1, 6);
        v71.setInputText(v72);
        v71.latestSanitizedCode = v72;
        v71:setState({
            inputCode = v72
        });
        v71.confirmButtonPressed();
    end;
    v71.isMounted = true;
    v71.props.authAnalytics.reportScreenLoaded(v23.Context.QuickLogin);
    if game:GetFastFlag("EnablePlayerAppCrossDeviceEnterCodeExperiments") then
        v24(v71.props.networking, "PlayerApp.CrossDeviceLogin.ConfirmCode", {
            "HintTextOverride"
        }):andThen(function(v73) --[[ Line: 262 ]]
            -- upvalues: v71 (copy)
            local v74 = v73 and v73.responseBody;
            if v74 and v71.isMounted then
                local l_HintTextOverride_0 = v74.HintTextOverride;
                local l_ShouldDisableSubmissionForBadCode_0 = v74.ShouldDisableSubmissionForBadCode;
                v71:setState({
                    placeholderTextOverride = l_HintTextOverride_0 or "", 
                    disableSubmissionForBadCode = l_ShouldDisableSubmissionForBadCode_0 or false
                });
            end;
        end, function() --[[ Line: 272 ]]

        end);
    end;
end;
v48.willUnmount = function(v77) --[[ Line: 278 ]] --[[ Name: willUnmount ]]
    v77.isMounted = false;
end;
v48.renderEnterCodeRefresh = function(v78, v79, v80, v81) --[[ Line: 282 ]] --[[ Name: renderEnterCodeRefresh ]]
    -- upvalues: v9 (copy), l_Text_1 (copy), l_Players_0 (copy), v4 (copy), l_View_0 (copy), l_Text_0 (copy), l_TextInput_0 (copy), l_InputSize_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    return v9({
        refreshHeadline = "Authentication.CrossDevice.Heading.SigninAnotherDevice", 
        refreshIntro = "Authentication.CrossDevice.Label.SigninInstructionHeading", 
        refreshStep1 = "Authentication.CrossDevice.Label.SigninInstructionOne", 
        refreshStep2 = "Authentication.CrossDevice.Label.SigninInstructionTwo", 
        refreshStep3 = "Authentication.CrossDevice.Label.SigninInstructionThree", 
        refreshSecurityFooter = "Authentication.CrossDevice.Label.QuickSignInWarning", 
        refreshContinue = "Authentication.CrossDevice.Label.Continue", 
        refreshPlaceholder = "Authentication.CrossDevice.Label.EnterCodeTextBox"
    })(function(v82) --[[ Line: 292 ]]
        -- upvalues: v78 (copy), v79 (copy), l_Text_1 (ref), l_Players_0 (ref), v81 (copy), v4 (ref), l_View_0 (ref), l_Text_0 (ref), l_TextInput_0 (ref), l_InputSize_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), v80 (copy)
        local l_inputCode_0 = v78.state.inputCode;
        local v84 = v78.state.inputErrorKey == "";
        local l_isConfirming_0 = v78.state.isConfirming;
        local l_designTokens_0 = v78.props.designTokens;
        local l_Font_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyFont.Font;
        local l_Color3_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
        local l_Transparency_0 = l_designTokens_0.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
        local l_Color3_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
        local l_BaseSize_0 = v79.Font.BaseSize;
        local l_refreshContinue_0 = v82.refreshContinue;
        local v93 = v78.props.tokens.Padding.Medium * 2;
        local v94 = l_Text_1.GetTextWidth(l_refreshContinue_0, l_Font_0, l_BaseSize_0) + v93;
        local l_refreshIntro_0 = v82.refreshIntro;
        local v96 = "{username}";
        local v97 = "<b>";
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        local v99;
        if not l_LocalPlayer_1 then
            v99 = "Player";
        else
            local l_DisplayName_1 = l_LocalPlayer_1.DisplayName;
            v99 = if l_DisplayName_1 and l_DisplayName_1 ~= "" then l_DisplayName_1 else l_LocalPlayer_1.Name;
        end;
        l_refreshIntro_0 = l_refreshIntro_0:gsub(v96, v97 .. v99:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;") .. "</b>");
        local v101 = v78.state.placeholderTextOverride ~= "" and v78.state.placeholderTextOverride or v82.refreshPlaceholder;
        v96 = {
            Color3 = l_Color3_1, 
            Transparency = l_Transparency_0
        };
        local v102 = {
            Color3 = l_Color3_0, 
            Transparency = l_Transparency_0
        };
        v97 = l_designTokens_0.Global;
        local l_Size_1000_0 = v78.props.tokens.Size.Size_1000;
        local l_Space_150_0 = v97.Space_150;
        v99 = v78.props.highKeyboardMode and not v81;
        l_LocalPlayer_1 = l_designTokens_0.LuaApps.CrossDeviceLogin.verticalPadding;
        return v4.createElement(l_View_0, {
            tag = "col align-x-left gap-xsmall size-full-0 auto-y", 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = if v99 then UDim2.new(0, 0, 0, -l_LocalPlayer_1) else nil, 
            padding = {
                left = UDim.new(0, 0), 
                right = UDim.new(0, 0)
            }
        }, {
            CopyBlock = not v99 and v4.createElement(l_View_0, {
                tag = "col align-x-left gap-xsmall size-full-0 auto-y", 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                padding = {
                    bottom = UDim.new(0, l_Space_150_0)
                }
            }, {
                HeadlineWrap = v4.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y", 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    padding = {
                        bottom = UDim.new(0, l_Space_150_0)
                    }
                }, {
                    Headline = v4.createElement(l_Text_0, {
                        tag = "size-full-0 auto-xy text-heading-small text-wrap text-align-x-left", 
                        LayoutOrder = 1, 
                        Text = v82.refreshHeadline, 
                        TextWrapped = true
                    })
                }), 
                Intro = v4.createElement(l_Text_0, {
                    tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left", 
                    LayoutOrder = 2, 
                    Text = l_refreshIntro_0, 
                    RichText = true, 
                    TextWrapped = true
                }), 
                StepsIndent = v4.createElement(l_View_0, {
                    tag = "col gap-xxsmall size-full-0 auto-y", 
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    padding = {
                        left = UDim.new(0, 18)
                    }
                }, {
                    Step1 = v4.createElement(l_Text_0, {
                        tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left", 
                        LayoutOrder = 1, 
                        Text = v82.refreshStep1, 
                        TextWrapped = true
                    }), 
                    Step2 = v4.createElement(l_Text_0, {
                        tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left", 
                        LayoutOrder = 2, 
                        Text = v82.refreshStep2, 
                        TextWrapped = true
                    }), 
                    Step3 = v4.createElement(l_Text_0, {
                        tag = "size-full-0 auto-xy text-body-medium text-wrap text-align-x-left", 
                        LayoutOrder = 3, 
                        Text = v82.refreshStep3, 
                        TextWrapped = true
                    })
                })
            }) or nil, 
            InputRow = v4.createElement(l_View_0, {
                tag = "row items-stretch gap-small size-full-0 auto-y", 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                padding = {
                    bottom = UDim.new(0, l_Space_150_0)
                }
            }, {
                InputWrap = v4.createElement(l_View_0, {
                    tag = "grow auto-y", 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    CodeField = v4.createElement(l_TextInput_0, {
                        LayoutOrder = 1, 
                        label = "", 
                        text = v78.inputText, 
                        onChanged = v78.onRefreshCodeChanged, 
                        placeholder = v101, 
                        width = UDim.new(1, 0), 
                        hasError = not v84, 
                        size = l_InputSize_0.Medium, 
                        onFocusGained = v78.onFocus, 
                        onFocusLost = function() --[[ Line: 423 ]] --[[ Name: onFocusLost ]]
                            -- upvalues: v78 (ref)
                            v78:setState({
                                isFocused = false
                            });
                        end, 
                        onReturnPressed = function() --[[ Line: 428 ]] --[[ Name: onReturnPressed ]]
                            -- upvalues: v78 (ref)
                            if #v78.state.inputCode == 6 then
                                v78.confirmButtonPressed();
                            end;
                        end
                    })
                }), 
                ContinueButtonWrap = v4.createElement(l_View_0, {
                    tag = "col", 
                    LayoutOrder = 2, 
                    Size = UDim2.new(0, v94, 0, l_Size_1000_0), 
                    BackgroundTransparency = 1
                }, {
                    ContinueButton = v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = l_refreshContinue_0, 
                        isDisabled = game:GetFastFlag("EnableXDLCodeValidationExperiment") and v78.state.disableSubmissionForBadCode and #l_inputCode_0 < 6 or l_inputCode_0 == "", 
                        isLoading = l_isConfirming_0, 
                        onActivated = v78.confirmButtonPressed, 
                        [v4.Ref] = v78.props.continueButtonRef
                    })
                })
            }), 
            InputError = not v84 and v4.createElement(l_View_0, {
                tag = "col size-full-0 auto-y", 
                LayoutOrder = 4, 
                BackgroundTransparency = 1, 
                padding = {
                    bottom = UDim.new(0, l_Space_150_0)
                }
            }, {
                ErrorText = v4.createElement(l_Text_0, {
                    tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left", 
                    LayoutOrder = 1, 
                    Text = v80.inputError, 
                    TextWrapped = true, 
                    textStyle = v96
                })
            }) or nil, 
            SecurityFooter = v4.createElement(l_Text_0, {
                tag = "size-full-0 auto-xy text-body-small text-wrap text-align-x-left", 
                LayoutOrder = 6, 
                Text = v82.refreshSecurityFooter, 
                TextWrapped = true, 
                textStyle = v102
            })
        });
    end);
end;
v48.render = function(v105) --[[ Line: 483 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v9 (copy), v26 (copy), v4 (copy), v35 (copy), v34 (copy), l_GetFFlagEnableAuthsecImageUpdate_0 (copy), l_Image_0 (copy), l_ImageSetLabel_0 (copy), v40 (copy), v27 (copy), v28 (copy), l_TextInputBoxWithBorder_0 (copy), l_AuthStatefulRoundCornerBorder_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_Text_1 (copy)
    local l_isWideView_0 = v105.props.isWideView;
    local l_inputCode_1 = v105.state.inputCode;
    local v108 = v105.state.inputErrorKey == "";
    local l_isConfirming_1 = v105.state.isConfirming;
    local l_isFocused_0 = v105.state.isFocused;
    return l_withStyle_0(function(v111) --[[ Line: 491 ]]
        -- upvalues: v9 (ref), v108 (copy), v105 (copy), l_isWideView_0 (copy), v26 (ref), v4 (ref), v35 (ref), v34 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v40 (ref), v27 (ref), v28 (ref), l_TextInputBoxWithBorder_0 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_isFocused_0 (copy), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_1 (copy), l_inputCode_1 (copy), l_Text_1 (ref)
        return v9({
            tabletHeader = "Authentication.CrossDevice.Heading.LoginAnotherDevice", 
            warningHeader = "Authentication.CrossDevice.Heading.LoginWarning", 
            warning1 = "Authentication.CrossDevice.Label.Warning1", 
            warning2 = "Authentication.CrossDevice.Label.Warning2", 
            placeholderText = "Authentication.CrossDevice.Label.EnterOtherDeviceCode", 
            enter = "Authentication.CrossDevice.Action.Enter", 
            inputError = not v108 and v105.state.inputErrorKey or nil
        })(function(v112) --[[ Line: 500 ]]
            -- upvalues: v105 (ref), l_isWideView_0 (ref), v111 (copy), v26 (ref), v4 (ref), v35 (ref), v34 (ref), l_GetFFlagEnableAuthsecImageUpdate_0 (ref), l_Image_0 (ref), l_ImageSetLabel_0 (ref), v40 (ref), v27 (ref), v28 (ref), l_TextInputBoxWithBorder_0 (ref), v108 (ref), l_AuthStatefulRoundCornerBorder_0 (ref), l_isFocused_0 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_isConfirming_1 (ref), l_inputCode_1 (ref), l_Text_1 (ref)
            local l_designTokens_1 = v105.props.designTokens;
            local v114 = l_isWideView_0 and v105.props.tokens.Size.Size_2000 * 2 or v105.props.tokens.Size.Size_2000 * 4;
            local v115 = l_isWideView_0 and v105.props.tokens.Size.Size_2200 or v105.props.tokens.Size.Size_2200 * 2;
            local v116 = not l_isWideView_0 and v105.props.tokens.Size.Size_350 or 0;
            local v117 = UDim2.fromOffset(l_designTokens_1.LuaApps.CrossDeviceLogin.iconSize, l_designTokens_1.LuaApps.CrossDeviceLogin.iconSize);
            local l_Font_1 = l_designTokens_1.LuaApps.CrossDeviceLogin.headerFont.Font;
            local l_FontSize_0 = l_designTokens_1.LuaApps.CrossDeviceLogin.headerFont.FontSize;
            local l_Color3_2 = l_designTokens_1.LuaApps.CrossDeviceLogin.headerTextColor.Color3;
            local l_headerPadding_0 = l_designTokens_1.LuaApps.CrossDeviceLogin.headerPadding;
            local l_Font_2 = l_designTokens_1.LuaApps.CrossDeviceLogin.bodyFont.Font;
            local l_FontSize_1 = l_designTokens_1.LuaApps.CrossDeviceLogin.bodyFont.FontSize;
            local l_Color3_3 = l_designTokens_1.LuaApps.CrossDeviceLogin.bodyTextColor.Color3;
            local l_Transparency_1 = l_designTokens_1.LuaApps.CrossDeviceLogin.headerTextColor.Transparency;
            local l_Font_3 = l_designTokens_1.LuaApps.CrossDeviceLogin.textAlertFont.Font;
            local l_FontSize_2 = l_designTokens_1.LuaApps.CrossDeviceLogin.textAlertFont.FontSize;
            local l_Color3_4 = l_designTokens_1.LuaApps.CrossDeviceLogin.textAlertColor.Color3;
            local l_BaseSize_1 = v111.Font.BaseSize;
            local v130 = v105.state.placeholderTextOverride ~= "" and v105.state.placeholderTextOverride or v112.placeholderText;
            if v26() then
                return v105:renderEnterCodeRefresh(v111, v112, l_isWideView_0);
            else
                return v4.createElement(l_isWideView_0 and v35 or v34, {
                    TabletHeaderText = v112.tabletHeader, 
                    Style = v111, 
                    HighKeyboardMode = v105.props.highKeyboardMode, 
                    Icon = l_GetFFlagEnableAuthsecImageUpdate_0() and v4.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = l_isWideView_0 and v117 or UDim2.new(0, v114, 0, v115 - v116), 
                        BackgroundTransparency = 1
                    }, {
                        Image = v4.createElement(l_Image_0, {
                            Image = v105.getVerifyCodeImage(v105.props.tokens.Config.ColorMode.Name), 
                            ScaleType = Enum.ScaleType.Fit, 
                            Size = UDim2.new(0, v114, 0, v115), 
                            Position = UDim2.new(0.5, 0, 0.5, -v116 / 2), 
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        })
                    }) or v4.createElement(l_ImageSetLabel_0, {
                        Size = v117, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = v40, 
                        ImageColor3 = v111.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0
                    }), 
                    WarningText = v4.createElement(v27.FitFrame, {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -20, 0, 0), 
                        fitAxis = v27.FitAxis.Height, 
                        BackgroundTransparency = 1
                    }, {
                        Align = v4.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Padding = UDim.new(0, 6), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        TopWarning = v4.createElement(v28, {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v112.warningHeader, 
                            TextWrapped = true, 
                            Font = l_Font_1, 
                            TextSize = l_FontSize_0, 
                            TextColor3 = l_Color3_2, 
                            TextTransparency = l_Transparency_1, 
                            TextXAlignment = l_isWideView_0 and Enum.TextXAlignment.Left or Enum.TextXAlignment.Center, 
                            fitAxis = v27.FitAxis.Height, 
                            BackgroundTransparency = 1
                        }), 
                        Padding = v4.createElement("Frame", {
                            LayoutOrder = 2, 
                            Size = UDim2.new(1, 0, 0, l_headerPadding_0), 
                            BackgroundTransparency = 1
                        }), 
                        BulletPoint1 = v4.createElement(v28, {
                            LayoutOrder = 3, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v112.warning1, 
                            TextWrapped = true, 
                            Font = l_Font_2, 
                            TextSize = l_FontSize_1, 
                            TextColor3 = l_Color3_3, 
                            TextTransparency = l_Transparency_1, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fitAxis = v27.FitAxis.Height, 
                            BackgroundTransparency = 1
                        }), 
                        BulletPoint2 = v4.createElement(v28, {
                            LayoutOrder = 4, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Text = v112.warning2, 
                            TextWrapped = true, 
                            Font = l_Font_2, 
                            TextSize = l_FontSize_1, 
                            TextColor3 = l_Color3_3, 
                            TextTransparency = l_Transparency_1, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fitAxis = v27.FitAxis.Height, 
                            BackgroundTransparency = 1
                        })
                    }), 
                    InputBox = v4.createElement(l_TextInputBoxWithBorder_0, {
                        layoutOrder = 3, 
                        placeholderText = v130, 
                        borderState = not v108 and l_AuthStatefulRoundCornerBorder_0.BorderState.Error or l_isFocused_0 and l_AuthStatefulRoundCornerBorder_0.BorderState.Focused or l_AuthStatefulRoundCornerBorder_0.BorderState.Default, 
                        text = v105.inputText, 
                        onFocused = v105.onFocus, 
                        onFocusLost = v105.onFocusLost, 
                        onChangeTextCallback = v105.onTextChanged
                    }), 
                    InputWarning = not v108 and v4.createElement(v28, {
                        LayoutOrder = 4, 
                        Size = UDim2.new(1, -6, 0, l_FontSize_2), 
                        Position = UDim2.new(0, 3, 1, 3), 
                        BackgroundTransparency = 1, 
                        Font = l_Font_3, 
                        TextSize = l_FontSize_2, 
                        TextColor3 = l_Color3_4, 
                        TextTransparency = l_Transparency_1, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Text = v112.inputError, 
                        TextWrapped = true, 
                        fitAxis = v27.FitAxis.Height
                    }), 
                    ConfirmCodeButton = v4.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        size = UDim2.new(1, 0, 1, 0), 
                        text = v112.enter, 
                        [v4.Ref] = v105.props.continueButtonRef, 
                        onActivated = v105.confirmButtonPressed, 
                        isLoading = l_isConfirming_1, 
                        isDisabled = game:GetFastFlag("EnableXDLCodeValidationExperiment") and v105.state.disableSubmissionForBadCode and #l_inputCode_1 < 6 or l_inputCode_1 == ""
                    }), 
                    ConfirmCodeButtonWidth = l_Text_1.GetTextWidth(v112.enter, l_Font_2, l_BaseSize_1) + 40
                });
            end;
        end);
    end);
end;
local v131 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
v48 = v131.connectUserLayer({
    l_AppUserLayers_0.ExposureLayer, 
    l_AppUserLayers_0.AccessLayer
}, function(_, _) --[[ Line: 666 ]]
    return {};
end)(v48);
v48 = l_RoactServices_0.connect({
    networking = v11, 
    authAnalytics = v22
})(v48);
local v140 = v6.connect(function(v135, _) --[[ Line: 675 ]]
    return {
        screenSize = v135.ScreenSize
    };
end, function(v137) --[[ Line: 679 ]]
    -- upvalues: v21 (copy)
    return {
        validateCode = function(v138, v139) --[[ Line: 681 ]] --[[ Name: validateCode ]]
            -- upvalues: v137 (copy), v21 (ref)
            return v137(v21.EnterCode(v138, v139));
        end
    };
end)(v48);
return function(v141) --[[ Line: 688 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v5 (copy), v140 (copy), v3 (copy)
    local v142 = l_useDesignTokens_0();
    local v143 = l_useTokens_0();
    return v5.createElement(v140, v3.Dictionary.join(v141, {
        designTokens = v142, 
        tokens = v143
    }));
end;
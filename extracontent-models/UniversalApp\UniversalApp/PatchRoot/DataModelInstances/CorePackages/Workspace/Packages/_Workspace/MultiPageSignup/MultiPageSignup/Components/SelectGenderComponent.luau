local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.UIBlox);
local v8 = require(l_Parent_0.Cryo);
local v9 = require(l_Parent_0.AuthSignup);
local l_SignUp_0 = v9.Thunks.SignUp;
local l_SignUpV2ErrorCodes_0 = v9.Enums.SignUpV2ErrorCodes;
local v12 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v12.RoactNetworking;
local l_AppGuiService_0 = v12.AppGuiService;
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v21 = require(l_script_FirstAncestor_0.Hooks.useShowDisclaimerLinks);
local l_FetchSignupUserAgreements_0 = require(l_Parent_0.UserAgreements).FetchSignupUserAgreements;
local l_OpenAccountSwitchingErrorOverlay_0 = require(l_Parent_0.AccountSwitcher).OpenAccountSwitchingErrorOverlay;
local l_CloseCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Thunks.CloseCentralOverlay;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local v27 = require(l_Parent_0.AuthCommon);
local l_DisclaimerLinks_0 = v27.Components.DisclaimerLinks;
local l_LogoutAllLoggedInUsers_0 = v27.Thunks.LogoutAllLoggedInUsers;
local l_AppStorageUtilities_0 = v27.Utils.AppStorageUtilities;
local l_User_0 = v27.Thunks.User;
local l_AuthLocalStorageKeys_0 = v27.Enums.AuthLocalStorageKeys;
local l_AccountSwitcherConstants_0 = v27.Common.AccountSwitcherConstants;
local l_FetchAndStoreUserAppLaunchInfo_0 = v27.Thunks.FetchAndStoreUserAppLaunchInfo;
local l_LogoutReasonNames_0 = v27.Enums.LogoutReasonNames;
local v36 = require(l_Parent_0.UserActivationFramework);
local l_FullPageActivationFrameworkContext_0 = v36.Context.FullPageActivationFrameworkContext;
local l_ActivationFrameworkWrapper_0 = v36.Components.ActivationFrameworkWrapper;
local l_PayloadKey_0 = v36.Enums.PayloadKey;
local l_CallbackStatus_0 = v36.Enums.CallbackStatus;
local l_useAttemptNextNavigation_0 = v36.Hooks.useAttemptNextNavigation;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Button_0 = v7.App.Button.Button;
local v44 = require(l_script_FirstAncestor_0.Components.PasskeyErrorAlert);
local v45 = require(l_Parent_0.AuthAnalytics);
local v46 = require(l_script_FirstAncestor_0.Analytics.MultiPageSignupConstants);
local l_EventStreamConstants_0 = v45.EventStreamConstants;
local l_authClientError_0 = v45.Events.authClientError;
local l_authButtonClick_0 = v45.Events.authButtonClick;
local l_authMsgShown_0 = v45.Events.authMsgShown;
local v51 = require(l_Parent_0.SharedFlags);
local l_GetFFlagEnableMultiPageSignupV2Updates_0 = v51.GetFFlagEnableMultiPageSignupV2Updates;
local l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 = v51.FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage;
local l_FFlagEnableSignupUnavailableInRegionError_0 = v51.FFlagEnableSignupUnavailableInRegionError;
local l_FFlagAddReasonToEveryLogout_0 = v51.FFlagAddReasonToEveryLogout;
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = v51.GetFFlagEnableAccountSwitcherFoundationDesign;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = v51.GetFFlagEnableAccountSwitcherRedesignIXP;
local v58 = require(l_Parent_0.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_Parent_0.ExperimentLayers).AppBtidLayers;
local v60 = {
    Male = "Male", 
    Female = "Female", 
    Unknown = "Unknown"
};
return function(v61) --[[ Line: 90 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDesignTokens_0 (copy), v5 (copy), l_FullPageActivationFrameworkContext_0 (copy), v60 (copy), v21 (copy), l_useAttemptNextNavigation_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy), v58 (copy), l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), l_useDispatch_0 (copy), l_RoactAnalytics_0 (copy), l_AppGuiService_0 (copy), l_useAppPolicy_0 (copy), v6 (copy), l_LogoutAllLoggedInUsers_0 (copy), l_CloseCentralOverlay_0 (copy), l_AppStorageUtilities_0 (copy), l_User_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_FFlagAddReasonToEveryLogout_0 (copy), l_GuiService_0 (copy), l_LogoutReasonNames_0 (copy), l_authMsgShown_0 (copy), l_EventStreamConstants_0 (copy), l_OpenAccountSwitchingErrorOverlay_0 (copy), l_PayloadKey_0 (copy), l_SignUp_0 (copy), l_useLocalization_0 (copy), l_ButtonType_0 (copy), l_CallbackStatus_0 (copy), l_ActivationFrameworkWrapper_0 (copy), l_GetFFlagEnableMultiPageSignupV2Updates_0 (copy), l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 (copy), l_HttpService_0 (copy), l_FetchSignupUserAgreements_0 (copy), v8 (copy), l_FetchAndStoreUserAppLaunchInfo_0 (copy), l_authClientError_0 (copy), l_SignUpV2ErrorCodes_0 (copy), l_AccountSwitcherConstants_0 (copy), l_FFlagEnableSignupUnavailableInRegionError_0 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), l_DisclaimerLinks_0 (copy), l_Button_0 (copy), l_authButtonClick_0 (copy), v46 (copy), v44 (copy)
    local v62 = l_useRoactService_0(l_RoactNetworking_0);
    local v63 = l_useDesignTokens_0();
    local v64 = v5.useContext(l_FullPageActivationFrameworkContext_0);
    local l_activationFrameworkState_0 = v64.activationFrameworkState;
    local v66, v67 = v5.useState(v60.Unknown);
    local v68 = v21();
    local v69, v70 = v5.useState(false);
    local v71 = l_useAttemptNextNavigation_0(v61.navigation);
    local l_monoDeps_0 = v64.monoDeps;
    local v74 = not l_GetFFlagEnableAccountSwitcherRedesignIXP_0() or v58.useBrowserTrackerExperiment({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v73) --[[ Line: 105 ]]
        -- upvalues: l_AppBtidLayers_0 (ref)
        return (v73[l_AppBtidLayers_0.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true;
    end);
    local v75 = l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and v74;
    local l_ResetAppState_0 = l_monoDeps_0.ResetAppState;
    local l_Logout_0 = l_monoDeps_0.Logout;
    local v78 = l_useDispatch_0();
    local v79 = l_useRoactService_0(l_RoactAnalytics_0);
    local v80 = l_useRoactService_0(l_AppGuiService_0);
    local v82 = l_useAppPolicy_0(function(v81) --[[ Line: 121 ]]
        return v81;
    end);
    local function _() --[[ Line: 125 ]]
        -- upvalues: v78 (copy), l_ResetAppState_0 (copy), v6 (ref)
        v78(l_ResetAppState_0());
        return v6.resolve();
    end;
    local function _(v84, v85) --[[ Line: 130 ]]
        -- upvalues: l_LogoutAllLoggedInUsers_0 (ref)
        return l_LogoutAllLoggedInUsers_0(v84, v85);
    end;
    local function _(v87, v88, v89) --[[ Line: 134 ]]
        -- upvalues: v78 (copy), l_Logout_0 (copy)
        return v78(l_Logout_0(v87, v88, v89));
    end;
    local function v91() --[[ Line: 138 ]]
        -- upvalues: v78 (copy), l_CloseCentralOverlay_0 (ref)
        return v78(l_CloseCentralOverlay_0());
    end;
    local function v100() --[[ Line: 142 ]]
        -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), v62 (copy), l_LogoutAllLoggedInUsers_0 (ref), v78 (copy), l_ResetAppState_0 (copy), v6 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_FFlagAddReasonToEveryLogout_0 (ref), l_GuiService_0 (ref), l_LogoutReasonNames_0 (ref), l_Logout_0 (copy), l_CloseCentralOverlay_0 (ref)
        local v92 = l_AppStorageUtilities_0.getAccountBlob();
        local v93 = l_User_0.fromLocalStorage().userId ~= -1;
        l_LogoutAllLoggedInUsers_0(v62, v92):await();
        if v93 == true then
            v78(l_ResetAppState_0());
            local v94 = v6.resolve();
            l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, "");
            l_AppStorageService_0:Flush();
            if l_FFlagAddReasonToEveryLogout_0 then
                v94 = v62;
                local l_l_GuiService_0_0 = l_GuiService_0;
                local l_MultiStepSignupAccountSwitchNotAllowed_0 = l_LogoutReasonNames_0.MultiStepSignupAccountSwitchNotAllowed;
                local _ = v78(l_Logout_0(v94, l_l_GuiService_0_0, l_MultiStepSignupAccountSwitchNotAllowed_0));
            else
                local _ = v78(l_Logout_0(v62, l_GuiService_0, nil));
            end;
        end;
        local _ = v78(l_CloseCentralOverlay_0());
    end;
    local function _(v101, v102, v103, v104, v105, v106, v107, v108) --[[ Line: 165 ]]
        -- upvalues: l_authMsgShown_0 (ref), v61 (copy), l_activationFrameworkState_0 (copy), l_EventStreamConstants_0 (ref), v78 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref)
        l_authMsgShown_0(v61.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.AccountSwitchingErrorModalShown, v107);
        return v78(l_OpenAccountSwitchingErrorOverlay_0(v101, v102, v103, v104, v105, v106, v107, v108));
    end;
    local function _(v110) --[[ Line: 196 ]]
        -- upvalues: l_activationFrameworkState_0 (copy), l_PayloadKey_0 (ref), l_SignUp_0 (ref), v62 (copy), v80 (copy), v79 (copy), v82 (copy)
        local v111 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] == "true";
        return l_SignUp_0(v62, nil, v80, v79, v82, v110, v111);
    end;
    local v113 = (tonumber(l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupAge]) or 100) < 13;
    local v114 = l_useLocalization_0({
        genderMale = "Authentication.SignUp.Label.GenderMale", 
        genderFemale = "Authentication.SignUp.Label.GenderFemale", 
        genderBoy = "Authentication.SignUp.Labely.Boy", 
        genderGirl = "Authentication.SignUp.Label.Girl"
    });
    local v124 = (function() --[[ Line: 222 ]] --[[ Name: useButtonStates ]]
        -- upvalues: v5 (ref), l_ButtonType_0 (ref), v67 (copy), v60 (ref)
        local v115, v116 = v5.useState(l_ButtonType_0.Secondary);
        local v117, v118 = v5.useState(l_ButtonType_0.Secondary);
        local v119, v120 = v5.useState(l_ButtonType_0.Secondary);
        local function v123(v121, v122) --[[ Line: 227 ]] --[[ Name: changeButtonState ]]
            -- upvalues: v116 (copy), l_ButtonType_0 (ref), v118 (copy), v120 (copy), v67 (ref), v60 (ref)
            v116(l_ButtonType_0.Secondary);
            v118(l_ButtonType_0.Secondary);
            v120(l_ButtonType_0.Secondary);
            if v121 == l_ButtonType_0.Secondary then
                v122(l_ButtonType_0.PrimarySystem);
                return;
            else
                v122(l_ButtonType_0.Secondary);
                v67(v60.Unknown);
                return;
            end;
        end;
        return {
            maleButtonState = v115, 
            femaleButtonState = v117, 
            preferNotToSayButtonState = v119, 
            changeMaleButtonState = function() --[[ Line: 246 ]] --[[ Name: changeMaleButtonState ]]
                -- upvalues: v67 (ref), v60 (ref), v123 (copy), v115 (copy), v116 (copy)
                v67(v60.Male);
                v123(v115, v116);
            end, 
            changeFemaleButtonState = function() --[[ Line: 250 ]] --[[ Name: changeFemaleButtonState ]]
                -- upvalues: v67 (ref), v60 (ref), v123 (copy), v117 (copy), v118 (copy)
                v67(v60.Female);
                v123(v117, v118);
            end, 
            changePreferNotToSayButtonState = function() --[[ Line: 254 ]] --[[ Name: changePreferNotToSayButtonState ]]
                -- upvalues: v67 (ref), v60 (ref), v123 (copy), v119 (copy), v120 (copy)
                v67(v60.Unknown);
                v123(v119, v120);
            end
        };
    end)();
    local v125 = {
        buttonTextKey = "", 
        shouldShowButton = false, 
        isButtonEnabled = false, 
        onButtonClicked = function() --[[ Line: 270 ]] --[[ Name: onButtonClicked ]]
            -- upvalues: l_CallbackStatus_0 (ref)
            return {
                payloadAddendum = nil, 
                status = l_CallbackStatus_0.NeedsReset
            };
        end
    };
    return v5.createElement(l_ActivationFrameworkWrapper_0, {
        namespace = v61.namespace, 
        titleTextKey = "Authentication.SignUp.Header.GenderPage6", 
        bodyTextKey = "Authentication.SignUp.Description.GenderHelp2", 
        headingTextKey = "Authentication.SignUp.Action.CreateAccount", 
        primaryButton = {
            buttonTextKey = l_GetFFlagEnableMultiPageSignupV2Updates_0() and "CommonUI.Controls.Action.Done" or "Authentication.SignUp.Action.CreateAccount", 
            shouldShowButton = true, 
            isButtonEnabled = true, 
            onButtonClicked = function() --[[ Line: 286 ]] --[[ Name: onButtonClicked ]]
                -- upvalues: l_activationFrameworkState_0 (copy), l_PayloadKey_0 (ref), l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 (ref), l_HttpService_0 (ref), l_FetchSignupUserAgreements_0 (ref), v62 (copy), v79 (copy), v8 (ref), v66 (copy), l_SignUp_0 (ref), v80 (copy), v82 (copy), l_AppStorageUtilities_0 (ref), l_User_0 (ref), l_FetchAndStoreUserAppLaunchInfo_0 (ref), l_authClientError_0 (ref), v61 (copy), l_EventStreamConstants_0 (ref), l_CallbackStatus_0 (ref), l_SignUpV2ErrorCodes_0 (ref), v70 (copy), v75 (copy), v100 (copy), v91 (copy), l_AccountSwitcherConstants_0 (ref), l_authMsgShown_0 (ref), v78 (copy), l_OpenAccountSwitchingErrorOverlay_0 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v63 (copy)
                local v126 = {};
                local v127 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupAgreedUserAgreements];
                if l_FFlagEnableMultipageSignupNonInteractiveUserAgreementsPage_0 and v127 and #v127 > 0 then
                    v126 = l_HttpService_0:JSONDecode(v127);
                else
                    local _, v131 = l_FetchSignupUserAgreements_0(v62, v79):andThen(function(v128) --[[ Line: 297 ]]
                        -- upvalues: v8 (ref)
                        return v8.List.map(v128, function(v129) --[[ Line: 298 ]]
                            return v129.id;
                        end);
                    end):await();
                    v126 = v131;
                end;
                local v132 = {
                    username = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername], 
                    birthday = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupBirthdayTimestampUtc], 
                    password = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupPassword], 
                    gender = v66, 
                    agreementIds = v126, 
                    passkeySessionId = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupPasskeySessionId], 
                    passkeyRegistrationResponse = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupPasskeyResult]
                };
                local v133 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.CredentialsProtocolPasswordRegistrationAvailable] == "true";
                local v134;
                v134, v132 = l_SignUp_0(v62, nil, v80, v79, v82, v132, v133):andThen(function(v135) --[[ Line: 315 ]]
                    -- upvalues: l_AppStorageUtilities_0 (ref), l_User_0 (ref), l_FetchAndStoreUserAppLaunchInfo_0 (ref), v62 (ref), l_authClientError_0 (ref), v61 (ref), l_EventStreamConstants_0 (ref), l_CallbackStatus_0 (ref), l_PayloadKey_0 (ref), v66 (ref)
                    l_AppStorageUtilities_0.setAccountBlob(v135.responseBody.accountBlob);
                    l_AppStorageUtilities_0.setDiscoveryClientFallbackCache("");
                    l_AppStorageUtilities_0.flush();
                    l_User_0.clearLocalStorage();
                    if not l_FetchAndStoreUserAppLaunchInfo_0(v62) then
                        l_authClientError_0(v61.namespace, l_EventStreamConstants_0.State.FetchUserInfoError);
                        return {
                            status = l_CallbackStatus_0.PageError
                        };
                    else
                        return {
                            payloadAddendum = {
                                [l_PayloadKey_0.SignupGender] = v66
                            }, 
                            status = l_CallbackStatus_0.Success
                        };
                    end;
                end, function(v136) --[[ Line: 336 ]]
                    -- upvalues: l_SignUpV2ErrorCodes_0 (ref), v70 (ref), l_CallbackStatus_0 (ref), v75 (ref), v100 (ref), v91 (ref), l_AccountSwitcherConstants_0 (ref), l_activationFrameworkState_0 (ref), l_PayloadKey_0 (ref), l_authMsgShown_0 (ref), v61 (ref), l_EventStreamConstants_0 (ref), v78 (ref), l_OpenAccountSwitchingErrorOverlay_0 (ref), l_authClientError_0 (ref), l_FFlagEnableSignupUnavailableInRegionError_0 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v63 (ref)
                    if v136 == l_SignUpV2ErrorCodes_0.PasskeyRegistrationFailed then
                        v70(true);
                        return {
                            status = l_CallbackStatus_0.PageError
                        };
                    elseif v136 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired or v136 == l_SignUpV2ErrorCodes_0.ParentEmptyAccountSwitchBlobRequired then
                        local v137 = v75 and "Authentication.AccountSwitch.Header.SignOutOtherAccounts" or "Authentication.AccountSwitch.Header.LogoutAllAccounts";
                        local v138 = v75 and "Authentication.AccountSwitch.Description.ContinueSignOutOthers" or v136 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired and "Authentication.AccountSwitch.Description.LogoutConfirmation" or "Authentication.AccountSwitch.Description.ParentLogoutConfirmation";
                        local v139 = v75 and "Authentication.AccountSwitch.Action.Continue" or "Authentication.AccountSwitch.Action.LogoutAllAccounts";
                        local l_v100_0 = v100;
                        local l_v91_0 = v91;
                        local v142 = if v136 == l_SignUpV2ErrorCodes_0.EmptyAccountSwitchBlobRequired then l_AccountSwitcherConstants_0.AccountSwitcherLoginEmptyBlobRequiredError else l_AccountSwitcherConstants_0.AccountSwitcherParentLoginEmptyBlobRequiredError;
                        local v143 = l_activationFrameworkState_0.payloadTable[l_PayloadKey_0.SignupUsername];
                        l_authMsgShown_0(v61.namespace, l_activationFrameworkState_0.currentState, l_EventStreamConstants_0.Field.AccountSwitchingErrorModalShown, v142);
                        local _ = v78(l_OpenAccountSwitchingErrorOverlay_0(v137, v138, v139, "Authentication.CrossDevice.Action.CancelLogin", l_v100_0, l_v91_0, v142, v143));
                        return {
                            status = l_CallbackStatus_0.PageError
                        };
                    else
                        l_authClientError_0(v61.namespace, l_EventStreamConstants_0.State.GenericSignupError .. "," .. tostring(v136));
                        local v145 = "Authentication.Login.Response.SomethingWentWrong";
                        if l_FFlagEnableSignupUnavailableInRegionError_0 and v136 == l_SignUpV2ErrorCodes_0.UnavailableInRegion then
                            v145 = "Authentication.SignUp.Description.RobloxNotAvailableInRegion";
                        end;
                        v78(l_SetCurrentToastMessage_0({
                            toastType = l_ToastType_0.NetworkingError, 
                            toastMessage = v145, 
                            toastIconColorStyle = {
                                Color = v63.Global.Color.Red.Color3, 
                                Transparency = 0
                            }, 
                            slideIn = true
                        }));
                        return {
                            status = l_CallbackStatus_0.PageError
                        };
                    end;
                end):await();
                if v134 and v132 then
                    return v132;
                else
                    return {
                        status = l_CallbackStatus_0.PageError
                    };
                end;
            end
        }, 
        navigation = v61.navigation, 
        shouldExpandMiddleContent = true, 
        subFooterContent = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                FillDirection = Enum.FillDirection.Vertical
            }), 
            DisclaimerLinks = if v68 then v5.createElement(l_DisclaimerLinks_0, {
                ctx = v61.namespace, 
                state = l_activationFrameworkState_0.currentState
            }) else nil
        })
    }, {
        Content = v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v63.Global.Space_200)
            }), 
            MaleButton = v5.createElement(l_Button_0, {
                buttonType = v124.maleButtonState, 
                layoutOrder = 2, 
                size = UDim2.new(1, 0, 0, v63.Global.Size_600), 
                text = if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v113 then v114.genderBoy else v114.genderMale, 
                onActivated = function() --[[ Line: 439 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v46 (ref), v124 (copy)
                    l_authButtonClick_0(v46.ctx.multiPageSignup, v46.btn.male, v46.state.selectGenderComponent);
                    v124.changeMaleButtonState();
                end
            }), 
            FemaleButton = v5.createElement(l_Button_0, {
                buttonType = v124.femaleButtonState, 
                layoutOrder = 3, 
                size = UDim2.new(1, 0, 0, v63.Global.Size_600), 
                text = if l_GetFFlagEnableMultiPageSignupV2Updates_0() and v113 then v114.genderGirl else v114.genderFemale, 
                onActivated = function() --[[ Line: 456 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_authButtonClick_0 (ref), v46 (ref), v124 (copy)
                    l_authButtonClick_0(v46.ctx.multiPageSignup, v46.btn.female, v46.state.selectGenderComponent);
                    v124.changeFemaleButtonState();
                end
            })
        }), 
        ErrorToastContainer = v69 and v5.createElement(v44, {
            onActivated = function() --[[ Line: 467 ]] --[[ Name: onActivated ]]
                -- upvalues: v70 (copy), v71 (copy), v125 (copy)
                v70(false);
                v71(v125);
            end
        })
    });
end;
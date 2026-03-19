local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Http.Requests.GetUserAppLaunchInfo);
local v8 = require(script.Parent.User);
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
local v10 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v12 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v13 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v14 = require(script.Parent.ClearApp);
local v15 = require(script.Parent.AppStorageUtilities);
local v16 = require(l_Modules_0.LuaApp.AppPage);
local v17 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v18 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v19 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.AppSessionCheckCounterNames);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v23 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v24 = require(l_Modules_0.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay);
local v25 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v26 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local v28 = require(l_Modules_0.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay);
local v29 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUsersRoles);
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local l_LinkingProtocol_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).LinkingProtocol;
local v33 = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil;
local v34 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v36 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v37 = game:DefineFastFlag("EnableLaunchAppCheckForAccountSwitchGameParams", false);
local v38 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local v39 = game:DefineFastFlag("FixDeeplinkingInCachedRoutingCases", false);
local l_HttpService_0 = game:GetService("HttpService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v43 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreAnalyticsEvents_0 = v43.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v43.Analytics.KeystoreEventConstants;
local l_KeystoreConstants_0 = v43.Common.KeystoreConstants;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_HandlePreHomePageRouting_0 = require(l_CorePackages_0.Workspace.Packages.PreHomePage).HandlePreHomePageRouting;
local v50 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagPreHomePageRoutingEnabled_0 = v50.FFlagPreHomePageRoutingEnabled;
local l_FFlagPasskeyUpsellEnabled_0 = v50.FFlagPasskeyUpsellEnabled;
local l_FFlagEnableMagicLogin_0 = v50.FFlagEnableMagicLogin;
local l_FFlagEnablePostAuthRoutingInAllCases_0 = v50.FFlagEnablePostAuthRoutingInAllCases;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v50.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagDisableKeystoreUnderageDeletion_0 = v50.GetFFlagDisableKeystoreUnderageDeletion;
local l_SetMagicLoginAdvertisement_0 = require(l_CorePackages_0.Workspace.Packages.LoginV2).Thunks.SetMagicLoginAdvertisement;
local l_FFlagEnableRecordLogin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableRecordLogin;
local l_updateLoginEntryData_0 = v43.Utils.updateLoginEntryData;
local function _(v60, v61) --[[ Line: 84 ]] --[[ Name: handleUserLoggedIn ]]
    -- upvalues: l_GuiService_0 (copy), v19 (copy), l_SetAuthenticationStatus_0 (copy), v18 (copy)
    l_GuiService_0:BroadcastNotification(v60:toJsonData(), v19.DID_LOG_IN);
    v61:dispatch(l_SetAuthenticationStatus_0(v18.LOGGED_IN));
end;
local function v71(v63, v64, v65, v66, v67) --[[ Line: 89 ]] --[[ Name: navigateToPostAuthLandingPage ]]
    -- upvalues: v39 (copy), l_LinkingProtocol_0 (copy), v15 (copy), v12 (copy), v16 (copy), v35 (copy), v36 (copy), l_FFlagPreHomePageRoutingEnabled_0 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_HandlePreHomePageRouting_0 (copy)
    local v68 = if v39 then l_LinkingProtocol_0:getLastLuaURL() ~= nil and l_LinkingProtocol_0:getLastLuaURL() ~= "" else false;
    local v69 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v15.getSignupActionRequired() else "";
    if v64 and v66.isUnder13 then
        v63:dispatch(v12({
            {
                name = v16.UAppBlock
            }
        }));
        return;
    elseif v69 == "auth" then
        if v35() or v36() then
            v63:dispatch(v12({
                {
                    name = v16.AddAuthMethodPage
                }
            }));
            return;
        else
            v15.setSignupActionRequired("");
            v15.flush();
            v63:dispatch(v12({
                {
                    name = v65
                }
            }));
            return;
        end;
    elseif l_FFlagPreHomePageRoutingEnabled_0 or l_FFlagPasskeyUpsellEnabled_0 then
        l_HandlePreHomePageRouting_0(v67, v63, v12):andThen(function(v70) --[[ Line: 113 ]]
            -- upvalues: v68 (copy), v63 (copy), v12 (ref), v65 (copy)
            if not v70 and not v68 then
                v63:dispatch(v12({
                    {
                        name = v65
                    }
                }));
            end;
        end);
        return;
    else
        if v39 then
            if not v68 then
                v63:dispatch(v12({
                    {
                        name = v65
                    }
                }));
                return;
            end;
        else
            v63:dispatch(v12({
                {
                    name = v65
                }
            }));
        end;
        return;
    end;
end;
local function v73() --[[ Line: 127 ]]
    -- upvalues: l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v27 (copy), l_default_0 (copy), l_KeystoreConstants_0 (copy)
    local v72 = l_HttpService_0:JSONEncode({
        server = l_ContentProvider_0.BaseUrl
    });
    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
        return v27(v72);
    else
        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v72, l_KeystoreConstants_0.KeystoreTimeout);
    end;
end;
local function v74(v75, v76, v77, v78, v79, v80, v81, v82, v83, v84) --[[ Line: 142 ]] --[[ Name: handleAccountInfo ]]
    -- upvalues: v33 (copy), v7 (copy), l_RbxAnalyticsService_0 (copy), v20 (copy), v21 (copy), v37 (copy), v15 (copy), l_ExperienceService_0 (copy), v8 (copy), v38 (copy), l_GetFFlagDisableKeystoreUnderageDeletion_0 (copy), v73 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_FFlagEnableRecordLogin_0 (copy), l_updateLoginEntryData_0 (copy), v25 (copy), v24 (copy), l_FFlagEnablePostAuthRoutingInAllCases_0 (copy), v71 (copy), v14 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v23 (copy), l_LocalizationService_0 (copy), v13 (copy), v29 (copy), v35 (copy), l_MemStorageService_0 (copy), v17 (copy), v10 (copy), l_GuiService_0 (copy), v19 (copy), l_SetAuthenticationStatus_0 (copy), v18 (copy), l_FFlagEnableMagicLogin_0 (copy), l_SetMagicLoginAdvertisement_0 (copy), l_StatusCodes_0 (copy), l_default_1 (copy), l_TelemetryConfigs_0 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v26 (copy), v34 (copy), v28 (copy), v74 (copy)
    local v85 = "";
    if v33 then
        v85 = v33:StartSpan("luaAccountInfo", "");
    end;
    if v82 then
        v82:logEventOnce("lua_auth_request_begin");
    end;
    v7(v75):andThen(function(v86) --[[ Line: 162 ]]
        -- upvalues: v82 (copy), v33 (ref), v85 (ref), l_RbxAnalyticsService_0 (ref), v20 (ref), v21 (ref), v37 (ref), v15 (ref), l_ExperienceService_0 (ref), v8 (ref), v38 (ref), l_GetFFlagDisableKeystoreUnderageDeletion_0 (ref), v73 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_FFlagEnableRecordLogin_0 (ref), l_updateLoginEntryData_0 (ref), v79 (copy), v25 (ref), v24 (ref), l_FFlagEnablePostAuthRoutingInAllCases_0 (ref), v76 (copy), v71 (ref), v83 (copy), v80 (copy), v75 (copy), v78 (copy), v14 (ref), v84 (ref), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v23 (ref), v81 (copy), v77 (copy), l_LocalizationService_0 (ref), v13 (ref), v29 (ref), v35 (ref), l_MemStorageService_0 (ref), v17 (ref), v10 (ref), l_GuiService_0 (ref), v19 (ref), l_SetAuthenticationStatus_0 (ref), v18 (ref), l_FFlagEnableMagicLogin_0 (ref), l_SetMagicLoginAdvertisement_0 (ref)
        if v82 then
            v82:logEventOnce("lua_auth_request_end");
        end;
        if v33 and v85 ~= "" then
            v33:FinishSpan(v85);
        end;
        l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_Ok");
        v20(v21.Success, 1);
        if v37 then
            local v87 = v15.getAccountSwitchStartupGameParams();
            if v87 then
                v15.clearAccountSwitchStartupGameParams();
                v15.flush();
                l_ExperienceService_0:LaunchExperience(v87, "AuthTicket", nil);
            end;
        end;
        local v88 = v8.fromUserInfoRequest(v86);
        if v38 and v88.userId ~= nil and v88.userId ~= -1 and v88.isUnder13 == true and not l_GetFFlagDisableKeystoreUnderageDeletion_0() then
            v73():andThen(function() --[[ Line: 195 ]]
                -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v88 (copy)
                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.underageDelete, (tostring(v88.userId)));
            end);
        end;
        if l_FFlagEnableRecordLogin_0 then
            pcall(function() --[[ Line: 204 ]]
                -- upvalues: l_updateLoginEntryData_0 (ref), v88 (copy)
                l_updateLoginEntryData_0(v88.userId, {
                    displayName = v88.displayName
                });
            end);
        end;
        if v79:getState().CentralOverlay.OverlayType == v25.AccountAuthenticationFailureOverlay then
            v79:dispatch(v24());
            if not l_FFlagEnablePostAuthRoutingInAllCases_0 and v88:isEqual(v76) then
                v71(v79, v83, v80, v88, v75);
            end;
        end;
        if not v88:isEqual(v76) then
            v88:setToLocalPlayer();
            v88:setToLocalStorage();
            if v78 then
                v79:dispatch(v14());
                v84 = false;
            end;
            v79:dispatch(l_GetLocalUser_0());
            v79:dispatch(l_ReceivedUserCountryCode_0(v88.countryCode));
            if not l_FFlagEnablePostAuthRoutingInAllCases_0 then
                v71(v79, v83, v80, v88, v75);
            end;
            v23.initializeUserLayers(v88.userId);
        end;
        if l_FFlagEnablePostAuthRoutingInAllCases_0 then
            v71(v79, v83, v80, v88, v75);
        end;
        if not v84 then
            v84 = true;
            v81();
        end;
        local v89 = {};
        table.insert(v89, v77:andThen(function(v90) --[[ Line: 270 ]]
            -- upvalues: v15 (ref), l_LocalizationService_0 (ref)
            v15.setRobloxLocaleId(v90.generalExperienceLocale);
            v15.setGameLocaleId(v90.ugcLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v90.generalExperienceLocale);
        end));
        local v91 = v13(v75, v88.userId);
        v79:dispatch(v29(v75));
        local v92 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v15.getSignupActionRequired() else "";
        local v93 = false;
        if v92 == "auth" then
            v93 = v35();
        end;
        table.insert(v89, v91:andThen(function(v94) --[[ Line: 288 ]]
            -- upvalues: v15 (ref), v93 (copy), l_MemStorageService_0 (ref), v17 (ref)
            v15.setAuthenticatedTheme(v94);
            if not v93 then
                l_MemStorageService_0:Fire(v17.ThemeUpdate, v94);
            end;
        end));
        v10.Batch(v89):andThen(function() --[[ Line: 298 ]]
            -- upvalues: v15 (ref)
            v15.flush();
        end);
        local l_v79_0 = v79;
        l_GuiService_0:BroadcastNotification(v88:toJsonData(), v19.DID_LOG_IN);
        l_v79_0:dispatch(l_SetAuthenticationStatus_0(v18.LOGGED_IN));
        if l_FFlagEnableMagicLogin_0 then
            l_SetMagicLoginAdvertisement_0(true);
        end;
    end, function(v96) --[[ Line: 306 ]]
        -- upvalues: l_RbxAnalyticsService_0 (ref), l_StatusCodes_0 (ref), v20 (ref), v21 (ref), l_default_1 (ref), l_TelemetryConfigs_0 (ref), v38 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v73 (ref), v37 (ref), v15 (ref), v26 (ref), v78 (copy), v79 (copy), v75 (copy), v77 (copy), v34 (ref), v28 (ref), v74 (ref), v76 (copy), v80 (copy), v81 (copy)
        if v96.HttpError ~= Enum.HttpError.ConnectFail then
            l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_Error");
        else
            l_RbxAnalyticsService_0:ReportCounter("Network_AccountInfo_None");
        end;
        if v96.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
            v20(v21.Failure401Unauthenticated, 1);
        else
            v20(v21.FailureUnknownError, 1);
        end;
        v20(v21.Failure, 1);
        if v96.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
            pcall(function() --[[ Line: 322 ]]
                -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref)
                l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.NoCookieForCachedUserTelemetryConfig, 1);
            end);
            if v38 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
                l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.remoteLogoutDelete);
                v73();
            end;
            if v37 then
                v15.clearAccountSwitchStartupGameParams();
                v15.flush();
            end;
            v26(v78, v79, v75, v77, v34.UnauthorizedAutoLogin, nil, nil, false);
            return;
        else
            v28(v79, function() --[[ Line: 355 ]]
                -- upvalues: v74 (ref), v75 (ref), v76 (ref), v77 (ref), v78 (ref), v79 (ref), v80 (ref), v81 (ref)
                v74(v75, v76, v77, v78, v79, v80, v81);
            end);
            return;
        end;
    end);
end;
return v74;
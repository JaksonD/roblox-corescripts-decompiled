local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Players_0 = game:GetService("Players");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.Logout);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v8 = require(script.Parent.ClearApp);
local v9 = require(script.Parent.AppStorageUtilities);
local v10 = require(script.Parent.GetLocaleAndGotoLoginPage);
local v11 = require(script.Parent.User);
local v12 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v14 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v16 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local v19 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v20 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons);
local v21 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v22 = require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants);
local v23 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v24 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local l_AuthLocalStorageKeys_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.AuthLocalStorageKeys;
local l_LoginMethods_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Enums.LoginMethods;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v28 = game:DefineFastFlag("UseResetAppStateForLogout2", false);
local v29 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v33 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreAnalyticsEvents_0 = v33.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v33.Analytics.KeystoreEventConstants;
local l_KeystoreConstants_0 = v33.Common.KeystoreConstants;
local v37 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics);
local l_DefaultUnauthenticatedConstants_0 = v33.Common.DefaultUnauthenticatedConstants;
local l_authClientError_0 = v37.Events.authClientError;
local v40 = require(l_Modules_0.LuaApp.Flags.FFlagEnableInvoluntaryLogoutEvent);
local l_FFlagEnableLogoutV3_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLogoutV3;
local l_FFlagEnableLastLoginMethodTracking_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLastLoginMethodTracking;
local l_GetFFlagEnableStorePreviousAccountData_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableStorePreviousAccountData;
local l_StorePreviousAccountData_0 = v33.Thunks.StorePreviousAccountData;
local v45 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableMagicLogin_0 = v45.FFlagEnableMagicLogin;
local l_SetMagicLoginAdvertisement_0 = require(l_CorePackages_0.Workspace.Packages.LoginV2).Thunks.SetMagicLoginAdvertisement;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v45.GetFFlagKeystoreAutoLoginAvailable;
local v49 = require(l_Modules_0.LuaApp.Flags.FFlagEnableTelemetryV2Logouts);
local l_LuaLogoutTelemetryConfig_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs.LuaLogoutTelemetryConfig;
local v51 = game:DefineFastFlag("EnableRecordSignOut", false);
local l_recordSignOut_0 = v33.Utils.recordSignOut;
return function(v53, v54, v55, v56) --[[ Line: 64 ]]
    -- upvalues: l_Logger_0 (copy), v51 (copy), v21 (copy), l_recordSignOut_0 (copy), l_FFlagEnableMagicLogin_0 (copy), l_SetMagicLoginAdvertisement_0 (copy), v40 (copy), l_FFlagEnableLogoutV3_0 (copy), v11 (copy), l_authClientError_0 (copy), l_DefaultUnauthenticatedConstants_0 (copy), l_FFlagEnableLastLoginMethodTracking_0 (copy), v9 (copy), l_LoginMethods_0 (copy), l_AppStorageService_0 (copy), l_AuthLocalStorageKeys_0 (copy), l_GetFFlagEnableStorePreviousAccountData_0 (copy), l_StorePreviousAccountData_0 (copy), v5 (copy), l_Players_0 (copy), v29 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v24 (copy), l_default_0 (copy), l_KeystoreConstants_0 (copy), v12 (copy), v28 (copy), v23 (copy), l_SetAuthenticationStatus_0 (copy), v4 (copy), v10 (copy), v19 (copy), v20 (copy), v49 (copy), l_TelemetryService_0 (copy), l_LuaLogoutTelemetryConfig_0 (copy), v7 (copy), v8 (copy), l_ExperimentCacheManager_0 (copy), v18 (copy), v22 (copy), l_MemStorageService_0 (copy), v14 (copy), v16 (copy)
    return function(v57) --[[ Line: 65 ]]
        -- upvalues: l_Logger_0 (ref), v51 (ref), v55 (copy), v21 (ref), l_recordSignOut_0 (ref), l_FFlagEnableMagicLogin_0 (ref), l_SetMagicLoginAdvertisement_0 (ref), v40 (ref), l_FFlagEnableLogoutV3_0 (ref), v11 (ref), l_authClientError_0 (ref), l_DefaultUnauthenticatedConstants_0 (ref), v56 (copy), l_FFlagEnableLastLoginMethodTracking_0 (ref), v9 (ref), l_LoginMethods_0 (ref), l_AppStorageService_0 (ref), l_AuthLocalStorageKeys_0 (ref), l_GetFFlagEnableStorePreviousAccountData_0 (ref), l_StorePreviousAccountData_0 (ref), v5 (ref), v53 (copy), l_Players_0 (ref), v29 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v24 (ref), l_default_0 (ref), l_KeystoreConstants_0 (ref), v12 (ref), v28 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v4 (ref), v10 (ref), v19 (ref), v20 (ref), v49 (ref), l_TelemetryService_0 (ref), l_LuaLogoutTelemetryConfig_0 (ref), v54 (copy), v7 (ref), v8 (ref), l_ExperimentCacheManager_0 (ref), v18 (ref), v22 (ref), l_MemStorageService_0 (ref), v14 (ref), v16 (ref)
        l_Logger_0:info(string.format("[%f] Logout() (Universal App)", tick()));
        if v51 then
            local v58 = v55 ~= v21.ManageAccountsRemoveCurrentUser;
            local l_v58_0 = v58 --[[ copy: 1 -> 8 ]];
            pcall(function() --[[ Line: 69 ]]
                -- upvalues: l_recordSignOut_0 (ref), l_v58_0 (copy)
                l_recordSignOut_0(nil, l_v58_0);
            end);
        end;
        local v60 = nil;
        local v61 = nil;
        local v62 = nil;
        local v63 = nil;
        if l_FFlagEnableMagicLogin_0 then
            l_SetMagicLoginAdvertisement_0(false);
        end;
        if v40 or l_FFlagEnableLogoutV3_0 then
            v60 = v11.fromLocalStorage();
            v61 = v55 or v21.Unknown;
            v62 = tostring(v60.userId);
        end;
        if v40 then
            l_authClientError_0(l_DefaultUnauthenticatedConstants_0.DefaultClientErrorReason, v61, v56, v62);
        end;
        local v64 = false;
        if l_FFlagEnableLastLoginMethodTracking_0 then
            local v65 = v9.getLastSuccessfulSignInMethod();
            local v66 = true;
            if v65 ~= l_LoginMethods_0.Email then
                v66 = true;
                if v65 ~= l_LoginMethods_0.EmailOtp then
                    v66 = v65 == l_LoginMethods_0.Phone;
                end;
            end;
            v64 = v66;
        end;
        if not v64 then
            local v67 = v11.fromLocalStorage() and v11.fromLocalStorage().username;
            if v67 and v67 ~= "" then
                l_AppStorageService_0:SetItem(l_AuthLocalStorageKeys_0.CredentialValue, v67);
            end;
        end;
        if l_GetFFlagEnableStorePreviousAccountData_0() then
            l_StorePreviousAccountData_0();
        end;
        v63 = if l_FFlagEnableLogoutV3_0 then v5(v53, v61, v56, v62) else v5(v53);
        l_Players_0:SetLocalPlayerInfo(-1, "", "", 0, true);
        if v29 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
            local v68 = l_HttpService_0:JSONEncode({
                server = l_ContentProvider_0.BaseUrl
            });
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.intentionalLogoutDelete);
            if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                v24(v68);
            else
                l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v68, l_KeystoreConstants_0.KeystoreTimeout);
            end;
        end;
        v12.Batch({
            v63
        }):andThen(function() --[[ Line: 145 ]]
            -- upvalues: v28 (ref), v57 (copy), v23 (ref), l_SetAuthenticationStatus_0 (ref), v4 (ref), v10 (ref), v53 (ref), l_AppStorageService_0 (ref), v19 (ref), v20 (ref), v55 (ref), v21 (ref), v49 (ref), l_TelemetryService_0 (ref), l_LuaLogoutTelemetryConfig_0 (ref), v54 (ref), v7 (ref), v8 (ref), v11 (ref), l_ExperimentCacheManager_0 (ref), v18 (ref), v22 (ref), v9 (ref), l_MemStorageService_0 (ref), v14 (ref), v16 (ref)
            if v28 then
                v57:dispatch(v23());
                v57:dispatch(l_SetAuthenticationStatus_0(v4.LOGGED_OUT));
                v57:dispatch(v10(v53));
                l_AppStorageService_0:flush();
                v19.default:logRobloxTelemetryEvent(v20, nil, {
                    lualogoutreasons = v55 or v21.Unknown
                });
                if v49 then
                    l_TelemetryService_0:LogCounter(l_LuaLogoutTelemetryConfig_0, {
                        customFields = {
                            reason = v55 or v21.Unknown
                        }
                    }, 1);
                end;
                v54:BroadcastNotification("", v7.DID_LOG_OUT);
                return;
            else
                v57:dispatch(v8());
                v57:dispatch(l_SetAuthenticationStatus_0(v4.LOGGED_OUT));
                v57:dispatch(v10(v53));
                v11.clearLocalStorage();
                l_ExperimentCacheManager_0.default:clearCache();
                if v18() then
                    l_AppStorageService_0:SetItem(v22.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}");
                end;
                v9.setRobloxLocaleId("");
                v9.setDiscoveryClientFallbackCache("");
                l_AppStorageService_0:flush();
                l_MemStorageService_0:Fire(v14.ThemeUpdate, "dark");
                l_MemStorageService_0:SetItem(v14.RobuxBalance, "0");
                l_MemStorageService_0:SetItem(v14.RobuxBalanceLocalized, "--");
                v16.clearUserLayers();
                v19.default:logRobloxTelemetryEvent(v20, nil, {
                    lualogoutreasons = v55 or v21.Unknown
                });
                if v49 then
                    l_TelemetryService_0:LogCounter(l_LuaLogoutTelemetryConfig_0, {
                        customFields = {
                            reason = v55 or v21.Unknown
                        }
                    }, 1);
                end;
                v54:BroadcastNotification("", v7.DID_LOG_OUT);
                return;
            end;
        end);
    end;
end;
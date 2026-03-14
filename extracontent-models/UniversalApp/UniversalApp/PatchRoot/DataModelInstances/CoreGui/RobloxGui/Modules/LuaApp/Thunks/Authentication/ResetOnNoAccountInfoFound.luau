local l_CoreGui_0 = game:GetService("CoreGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.LuaApp.PromiseUtilities);
local v6 = require(script.Parent.AppStorageUtilities);
local v7 = require(script.Parent.ClearApp);
local l_GuiService_0 = game:GetService("GuiService");
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v11 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v12 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v13 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v14 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v15 = require(l_Modules_0.LuaApp.FlagSettings);
local v16 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v17 = require(l_Modules_0.LuaApp.Thunks.NavigateToRoute);
local v18 = require(l_Modules_0.LuaApp.AppPage);
local v19 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v20 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v22 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v23 = require(l_Modules_0.LuaApp.Analytics.RobloxTelemetryConfigs.LuaLogoutReasons);
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local v26 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v19.GetFFlagKeystoreAutoLoginAvailable;
local v28 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreAnalyticsEvents_0 = v28.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v28.Analytics.KeystoreEventConstants;
local v31 = require(l_Modules_0.LuaApp.Flags.FFlagEnableTelemetryV2Logouts);
local l_LuaLogoutTelemetryConfig_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs.LuaLogoutTelemetryConfig;
local l_GetFFlagEnableStorePreviousAccountData_0 = v19.GetFFlagEnableStorePreviousAccountData;
local l_StorePreviousAccountData_0 = v28.Thunks.StorePreviousAccountData;
local l_FFlagEnableCallingLogoutOnResetIXP_0 = v19.FFlagEnableCallingLogoutOnResetIXP;
local l_FFlagEnableLuaLoginRevamp_0 = v19.FFlagEnableLuaLoginRevamp;
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local l_IXPService_0 = game:GetService("IXPService");
local function _() --[[ Line: 54 ]] --[[ Name: isEnableCallingLogoutOnResetFromIxp ]]
    -- upvalues: l_IXPService_0 (copy), l_AppBtidLayers_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
        -- upvalues: l_IXPService_0 (ref), l_AppBtidLayers_0 (ref)
        return l_IXPService_0:GetBrowserTrackerLayerVariables(l_AppBtidLayers_0.LandingLayer);
    end);
    if l_status_0 and l_result_0 ~= nil and l_result_0.iOSEnableCallingLogoutOnReset ~= nil then
        return l_result_0.iOSEnableCallingLogoutOnReset;
    else
        return true;
    end;
end;
local _ = function(v42) --[[ Line: 68 ]] --[[ Name: hasNonNilEntries ]]
    if v42 == nil then
        return false;
    else
        for _, v44 in pairs(v42) do
            if v44 ~= nil then
                return true;
            end;
        end;
        return false;
    end;
end;
return function(v46, v47, v48, v49, v50, v51, v52, v53) --[[ Line: 82 ]]
    -- upvalues: v5 (copy), v6 (copy), l_LocalizationService_0 (copy), l_FFlagEnableCallingLogoutOnResetIXP_0 (copy), l_IXPService_0 (copy), l_AppBtidLayers_0 (copy), v11 (copy), v10 (copy), l_GuiService_0 (copy), l_GetFFlagEnableStorePreviousAccountData_0 (copy), l_StorePreviousAccountData_0 (copy), v7 (copy), l_MemStorageService_0 (copy), v14 (copy), l_SetAuthenticationStatus_0 (copy), v13 (copy), v22 (copy), v23 (copy), v31 (copy), l_TelemetryService_0 (copy), l_LuaLogoutTelemetryConfig_0 (copy), v15 (copy), v12 (copy), v18 (copy), l_getAppFeaturePolicies_0 (copy), v17 (copy), v26 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), l_FFlagEnableLuaLoginRevamp_0 (copy), v16 (copy), v20 (copy), l_ExperimentCacheManager_0 (copy)
    v5.Batch({
        v49
    }):andThen(function(v54) --[[ Line: 92 ]]
        -- upvalues: v6 (ref), l_LocalizationService_0 (ref), v46 (copy), l_FFlagEnableCallingLogoutOnResetIXP_0 (ref), l_IXPService_0 (ref), l_AppBtidLayers_0 (ref), v50 (copy), v11 (ref), v47 (copy), v10 (ref), v48 (copy), l_GuiService_0 (ref), l_GetFFlagEnableStorePreviousAccountData_0 (ref), l_StorePreviousAccountData_0 (ref), v7 (ref), l_MemStorageService_0 (ref), v14 (ref), l_SetAuthenticationStatus_0 (ref), v13 (ref), v22 (ref), v23 (ref), v31 (ref), l_TelemetryService_0 (ref), l_LuaLogoutTelemetryConfig_0 (ref), v15 (ref), v12 (ref), v18 (ref), l_getAppFeaturePolicies_0 (ref), v17 (ref), v51 (copy), v26 (ref), l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v53 (copy), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), l_FFlagEnableLuaLoginRevamp_0 (ref), v52 (copy), v16 (ref), v20 (ref), l_ExperimentCacheManager_0 (ref)
        local v55 = false;
        local v56 = false;
        if v54 and v54[1] then
            v54[1]:match(function(v57) --[[ Line: 94 ]]
                -- upvalues: v6 (ref), l_LocalizationService_0 (ref)
                v6.setRobloxLocaleId(v57.signupAndLoginLocale);
                l_LocalizationService_0:SetRobloxLocaleId(v57.signupAndLoginLocale);
            end);
        end;
        if v46 then
            if l_FFlagEnableCallingLogoutOnResetIXP_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 55 ]]
                    -- upvalues: l_IXPService_0 (ref), l_AppBtidLayers_0 (ref)
                    return l_IXPService_0:GetBrowserTrackerLayerVariables(l_AppBtidLayers_0.LandingLayer);
                end);
                if (not l_status_1 or not (l_result_1 ~= nil) or not (l_result_1.iOSEnableCallingLogoutOnReset ~= nil) or l_result_1.iOSEnableCallingLogoutOnReset) and v50 == v11.UnauthorizedAutoLogin then
                    v47:dispatch(v10(v48, l_GuiService_0, v50));
                    v55 = true;
                end;
            end;
            if not v55 then
                if l_GetFFlagEnableStorePreviousAccountData_0() then
                    l_StorePreviousAccountData_0();
                end;
                v47:dispatch(v7());
                l_MemStorageService_0:Fire(v14.ThemeUpdate, "dark");
            end;
        end;
        v55 = false;
        v47:dispatch(l_SetAuthenticationStatus_0(v13.LOGGED_OUT));
        if v50 ~= nil then
            v22.default:logRobloxTelemetryEvent(v23, nil, {
                lualogoutreasons = v50
            });
        end;
        if v31 then
            l_TelemetryService_0:LogCounter(l_LuaLogoutTelemetryConfig_0, {
                customFields = {
                    reason = v50 or v11.Unknown
                }
            }, 1);
        end;
        if v15.WeChatLoginEnabled() then
            v47:dispatch(v12({
                {
                    name = v18.WeChatLoginWrapper
                }
            }));
        elseif v15.LuaAppLoginUIEnabled() then
            if l_getAppFeaturePolicies_0().getUseSingleSignOn() then
                v47:dispatch(v17({
                    {
                        name = v18.SingleSignOnContainer
                    }
                }));
            else
                local l_v51_0 = v51;
                local v61;
                if l_v51_0 == nil then
                    v61 = false;
                else
                    for _, v63 in pairs(l_v51_0) do
                        if v63 ~= nil then
                            v61 = true;
                            v56 = true;
                        end;
                        if v56 then
                            break;
                        end;
                    end;
                    if not v56 then
                        v61 = false;
                    end;
                end;
                v56 = false;
                if (v26 or l_GetFFlagKeystoreAutoLoginAvailable_0()) and v51 and v61 then
                    local v64 = {};
                    if v53 == nil or v53 == false then
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.redirectToLandingPage);
                        v47:dispatch(v12({
                            {
                                name = v18.Landing, 
                                extraProps = v64
                            }
                        }));
                    elseif l_FFlagEnableLuaLoginRevamp_0 then
                        v64.forcedUsernameOverride = v51.username;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.redirectToLoginPage);
                        v47:dispatch(v12({
                            {
                                name = v18.Landing, 
                                extraProps = {}
                            }, 
                            {
                                name = v18.LoginV2, 
                                extraProps = v64
                            }
                        }));
                    else
                        v64.usernameFromIosKeychain = v51.username;
                        if v52 then
                            v64.passwordFromIosKeychain = v51.password;
                        end;
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.redirectToLoginPage);
                        v47:dispatch(v12({
                            {
                                name = v18.Landing, 
                                extraProps = {}
                            }, 
                            {
                                name = v18.Login, 
                                extraProps = v64
                            }
                        }));
                    end;
                else
                    if l_GetFFlagEnableStorePreviousAccountData_0() then
                        l_StorePreviousAccountData_0();
                    end;
                    v47:dispatch(v12({
                        {
                            name = v18.Landing, 
                            extraProps = {}
                        }
                    }));
                end;
            end;
        else
            v47:dispatch(v16({
                name = v18.LoginNative
            }));
        end;
        v20.clearUserLayers();
        l_ExperimentCacheManager_0.default:clearCache();
    end);
end;
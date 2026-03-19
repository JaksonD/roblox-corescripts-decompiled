local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.LuaApp.Http.Requests.GetUserAppLaunchInfo);
local v7 = require(script.Parent.User);
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
local v9 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v11 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v12 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v13 = require(script.Parent.ClearApp);
local v14 = require(script.Parent.AppStorageUtilities);
local v15 = require(l_Modules_0.LuaApp.AppPage);
local v16 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v17 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v18 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v19 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v20 = require(l_Modules_0.LuaApp.Analytics.Events.AppSessionCheckCounterNames);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v22 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v23 = require(l_Modules_0.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay);
local v24 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v25 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound);
local v26 = require(l_Modules_0.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay);
local v27 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local v28 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUsersRoles);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local v30 = game:GetEngineFeature("AppTracing") and game:GetService("TracerService") or nil;
local v31 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local v34 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_HttpService_0 = game:GetService("HttpService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v38 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreAnalyticsEvents_0 = v38.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v38.Analytics.KeystoreEventConstants;
local l_KeystoreConstants_0 = v38.Common.KeystoreConstants;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_default_1 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_HandlePreHomePageRouting_0 = require(l_CorePackages_0.Workspace.Packages.PreHomePage).HandlePreHomePageRouting;
local v45 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagPreHomePageRoutingEnabled_0 = v45.FFlagPreHomePageRoutingEnabled;
local l_FFlagPasskeyUpsellEnabled_0 = v45.FFlagPasskeyUpsellEnabled;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v45.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagDisableKeystoreUnderageDeletion_0 = v45.GetFFlagDisableKeystoreUnderageDeletion;
local function _(v50, v51) --[[ Line: 73 ]] --[[ Name: handleUserLoggedIn ]]
    -- upvalues: l_GuiService_0 (copy), v18 (copy), l_SetAuthenticationStatus_0 (copy), v17 (copy)
    l_GuiService_0:BroadcastNotification(v50:toJsonData(), v18.DID_LOG_IN);
    v51:dispatch(l_SetAuthenticationStatus_0(v17.LOGGED_IN));
end;
local function v60(v53, v54, v55, v56, v57) --[[ Line: 78 ]] --[[ Name: navigateToPostAuthLandingPage ]]
    -- upvalues: v14 (copy), v11 (copy), v15 (copy), v32 (copy), v33 (copy), l_FFlagPreHomePageRoutingEnabled_0 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_HandlePreHomePageRouting_0 (copy)
    local v58 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v14.getSignupActionRequired() else "";
    if v54 and v56.isUnder13 then
        v53:dispatch(v11({
            {
                name = v15.UAppBlock
            }
        }));
        return;
    elseif v58 == "auth" then
        if v32() or v33() then
            v53:dispatch(v11({
                {
                    name = v15.AddAuthMethodPage
                }
            }));
            return;
        else
            v14.setSignupActionRequired("");
            v14.flush();
            v53:dispatch(v11({
                {
                    name = v55
                }
            }));
            return;
        end;
    elseif l_FFlagPreHomePageRoutingEnabled_0 or l_FFlagPasskeyUpsellEnabled_0 then
        l_HandlePreHomePageRouting_0(v57, v53, v11):andThen(function(v59) --[[ Line: 99 ]]
            -- upvalues: v53 (copy), v11 (ref), v55 (copy)
            if not v59 then
                v53:dispatch(v11({
                    {
                        name = v55
                    }
                }));
            end;
        end);
        return;
    else
        v53:dispatch(v11({
            {
                name = v55
            }
        }));
        return;
    end;
end;
local function v67(v61, v62, v63, v64, v65, v66) --[[ Line: 109 ]] --[[ Name: clearAuthFailureOverlayOnSuccess ]]
    -- upvalues: v24 (copy), v23 (copy), v60 (copy)
    if v61:getState().CentralOverlay.OverlayType == v24.AccountAuthenticationFailureOverlay then
        v61:dispatch(v23());
        if v62:isEqual(v63) then
            v60(v61, v64, v65, v62, v66);
        end;
    end;
end;
local function v76(v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 131 ]] --[[ Name: handleUserMismatchAndUpdatePreloadStarted ]]
    -- upvalues: v13 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v60 (copy), v22 (copy)
    if not v68:isEqual(v69) then
        v68:setToLocalPlayer();
        v68:setToLocalStorage();
        if v71 then
            v70:dispatch(v13());
            v72 = false;
        end;
        v70:dispatch(l_GetLocalUser_0());
        v70:dispatch(l_ReceivedUserCountryCode_0(v68.countryCode));
        v60(v70, v73, v74, v68, v75);
        v22.initializeUserLayers(v68.userId);
    end;
    return v72;
end;
local function v87(v77, v78, v79, v80) --[[ Line: 163 ]] --[[ Name: fetchAndApplyUserSettings ]]
    -- upvalues: v14 (copy), l_LocalizationService_0 (copy), v12 (copy), v28 (copy), v32 (copy), l_MemStorageService_0 (copy), v16 (copy), v9 (copy)
    local v81 = {};
    table.insert(v81, v77:andThen(function(v82) --[[ Line: 167 ]]
        -- upvalues: v14 (ref), l_LocalizationService_0 (ref)
        v14.setRobloxLocaleId(v82.generalExperienceLocale);
        v14.setGameLocaleId(v82.ugcLocale);
        l_LocalizationService_0:SetRobloxLocaleId(v82.generalExperienceLocale);
    end));
    local v83 = v12(v78, v79.userId);
    v80:dispatch(v28(v78));
    local v84 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v14.getSignupActionRequired() else "";
    local v85 = false;
    if v84 == "auth" then
        v85 = v32();
    end;
    table.insert(v81, v83:andThen(function(v86) --[[ Line: 185 ]]
        -- upvalues: v14 (ref), v85 (copy), l_MemStorageService_0 (ref), v16 (ref)
        v14.setAuthenticatedTheme(v86);
        if not v85 then
            l_MemStorageService_0:Fire(v16.ThemeUpdate, v86);
        end;
    end));
    v9.Batch(v81):andThen(function() --[[ Line: 195 ]]
        -- upvalues: v14 (ref)
        v14.flush();
    end);
end;
local function v89() --[[ Line: 200 ]]
    -- upvalues: l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v27 (copy), l_default_0 (copy), l_KeystoreConstants_0 (copy)
    local v88 = l_HttpService_0:JSONEncode({
        server = l_ContentProvider_0.BaseUrl
    });
    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
        return v27(v88);
    else
        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v88, l_KeystoreConstants_0.KeystoreTimeout);
    end;
end;
local function v91(v90) --[[ Line: 215 ]] --[[ Name: handleUnderageKeychainDeletion ]]
    -- upvalues: v34 (copy), l_GetFFlagDisableKeystoreUnderageDeletion_0 (copy), v89 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy)
    if v34 and v90.userId ~= nil and v90.userId ~= -1 and v90.isUnder13 == true and not l_GetFFlagDisableKeystoreUnderageDeletion_0() then
        v89():andThen(function() --[[ Line: 223 ]]
            -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v90 (copy)
            l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.underageDelete, (tostring(v90.userId)));
        end);
    end;
end;
local function _(v92) --[[ Line: 232 ]] --[[ Name: reportAccountInfoAnalytics ]]
    -- upvalues: l_StatusCodes_0 (copy), v19 (copy), v20 (copy)
    if v92 == l_StatusCodes_0.UNAUTHORIZED then
        v19(v20.Failure401Unauthenticated, 1);
    else
        v19(v20.FailureUnknownError, 1);
    end;
    v19(v20.Failure, 1);
end;
local function v98(v94, v95, v96, v97) --[[ Line: 242 ]] --[[ Name: handleUnauthorizedError ]]
    -- upvalues: l_default_1 (copy), l_TelemetryConfigs_0 (copy), v34 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v89 (copy), v25 (copy), v31 (copy)
    spawn(function() --[[ Line: 243 ]]
        -- upvalues: l_default_1 (ref), l_TelemetryConfigs_0 (ref)
        l_default_1:logRobloxTelemetryCounter(l_TelemetryConfigs_0.NoCookieForCachedUserTelemetryConfig, 1);
    end);
    if v34 or l_GetFFlagKeystoreAutoLoginAvailable_0() then
        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.remoteLogoutDelete);
        v89();
    end;
    v25(v94, v95, v96, v97, v31.UnauthorizedAutoLogin, nil, nil, false);
end;
local function _(v99, v100, v101, v102, v103, v104, v105) --[[ Line: 269 ]] --[[ Name: handleRetryableError ]]
    -- upvalues: v26 (copy)
    v26(v99, function() --[[ Line: 278 ]]
        -- upvalues: v101 (copy), v100 (copy), v102 (copy), v103 (copy), v99 (copy), v104 (copy), v105 (copy)
        handleAccountInfoFromLua(v101, v100, v102, v103, v99, v104, v105);
    end);
end;
local function _(v107, v108, v109, v110, v111, v112, v113, v114) --[[ Line: 291 ]] --[[ Name: handleAccountInfoError ]]
    -- upvalues: l_StatusCodes_0 (copy), v19 (copy), v20 (copy), v98 (copy), v26 (copy)
    if v107 == l_StatusCodes_0.UNAUTHORIZED then
        v19(v20.Failure401Unauthenticated, 1);
    else
        v19(v20.FailureUnknownError, 1);
    end;
    v19(v20.Failure, 1);
    if v107 == l_StatusCodes_0.UNAUTHORIZED then
        v98(v108, v109, v110, v111);
        return;
    else
        v26(v109, function() --[[ Line: 278 ]]
            -- upvalues: v112 (copy), v110 (copy), v111 (copy), v108 (copy), v109 (copy), v113 (copy), v114 (copy)
            handleAccountInfoFromLua(v112, v110, v111, v108, v109, v113, v114);
        end);
        return;
    end;
end;
handleAccountInfoFromLua = function(v116, v117, v118, v119, v120, v121, v122, v123, v124, v125) --[[ Line: 320 ]] --[[ Name: handleAccountInfoFromLua ]]
    -- upvalues: v30 (copy), v6 (copy), v19 (copy), v20 (copy), v7 (copy), v91 (copy), v67 (copy), v76 (copy), v87 (copy), l_GuiService_0 (copy), v18 (copy), l_SetAuthenticationStatus_0 (copy), v17 (copy), l_StatusCodes_0 (copy), v98 (copy), v26 (copy)
    local v126 = "";
    if v30 then
        v126 = v30:StartSpan("luaAccountInfo", "");
    end;
    if v123 then
        v123:logEventOnce("lua_auth_request_begin");
    end;
    v6(v117):andThen(function(v127) --[[ Line: 340 ]]
        -- upvalues: v123 (copy), v30 (ref), v126 (ref), v19 (ref), v20 (ref), v7 (ref), v91 (ref), v67 (ref), v120 (copy), v116 (copy), v124 (copy), v121 (copy), v117 (copy), v125 (ref), v76 (ref), v119 (copy), v122 (copy), v87 (ref), v118 (copy), l_GuiService_0 (ref), v18 (ref), l_SetAuthenticationStatus_0 (ref), v17 (ref)
        if v123 then
            v123:logEventOnce("lua_auth_request_end");
        end;
        if v30 and v126 ~= "" then
            v30:FinishSpan(v126);
        end;
        v19(v20.Success, 1);
        local v128 = v7.fromUserInfoRequest(v127);
        v91(v128);
        v67(v120, v128, v116, v124, v121, v117);
        v125 = v76(v128, v116, v120, v119, v125, v124, v121, v117);
        if not v125 then
            v125 = true;
            v122();
        end;
        v87(v118, v117, v128, v120);
        local l_v120_0 = v120;
        l_GuiService_0:BroadcastNotification(v128:toJsonData(), v18.DID_LOG_IN);
        l_v120_0:dispatch(l_SetAuthenticationStatus_0(v17.LOGGED_IN));
    end, function(v130) --[[ Line: 391 ]]
        -- upvalues: v119 (copy), v120 (copy), v117 (copy), v118 (copy), v116 (copy), v121 (copy), v122 (copy), l_StatusCodes_0 (ref), v19 (ref), v20 (ref), v98 (ref), v26 (ref)
        local l_StatusCode_0 = v130.StatusCode;
        local l_v119_0 = v119;
        local l_v120_1 = v120;
        local l_v117_0 = v117;
        local l_v118_0 = v118;
        local l_v116_0 = v116;
        local l_v121_0 = v121;
        local l_v122_0 = v122;
        if l_StatusCode_0 == l_StatusCodes_0.UNAUTHORIZED then
            v19(v20.Failure401Unauthenticated, 1);
        else
            v19(v20.FailureUnknownError, 1);
        end;
        v19(v20.Failure, 1);
        if l_StatusCode_0 == l_StatusCodes_0.UNAUTHORIZED then
            v98(l_v119_0, l_v120_1, l_v117_0, l_v118_0);
            return;
        else
            v26(l_v120_1, function() --[[ Line: 278 ]]
                -- upvalues: l_v116_0 (copy), l_v117_0 (copy), l_v118_0 (copy), l_v119_0 (copy), l_v120_1 (copy), l_v121_0 (copy), l_v122_0 (copy)
                handleAccountInfoFromLua(l_v116_0, l_v117_0, l_v118_0, l_v119_0, l_v120_1, l_v121_0, l_v122_0);
            end);
            return;
        end;
    end);
end;
handleSessionCheckSuccess = function(v139, v140, v141, v142, v143, v144, v145, _, v147, v148) --[[ Line: 405 ]] --[[ Name: handleSessionCheckSuccess ]]
    -- upvalues: v7 (copy), v91 (copy), v67 (copy), v76 (copy), v87 (copy), l_GuiService_0 (copy), v18 (copy), l_SetAuthenticationStatus_0 (copy), v17 (copy)
    local v149 = v7.fromLocalStorage();
    v91(v149);
    v67(v143, v149, v140, v147, v144, v139);
    if not v76(v149, v140, v143, v142, v148, v147, v144, v139) then
        v148 = true;
        v145();
    end;
    v87(v141, v139, v149, v143);
    l_GuiService_0:BroadcastNotification(v149:toJsonData(), v18.DID_LOG_IN);
    v143:dispatch(l_SetAuthenticationStatus_0(v17.LOGGED_IN));
end;
handleSessionCheckFailure = function(v150, v151, v152, v153, v154, v155, v156, v157) --[[ Line: 456 ]] --[[ Name: handleSessionCheckFailure ]]
    -- upvalues: l_StatusCodes_0 (copy), v19 (copy), v20 (copy), v98 (copy), v26 (copy)
    if v150 == l_StatusCodes_0.UNAUTHORIZED then
        v19(v20.Failure401Unauthenticated, 1);
    else
        v19(v20.FailureUnknownError, 1);
    end;
    v19(v20.Failure, 1);
    if v150 == l_StatusCodes_0.UNAUTHORIZED then
        v98(v151, v152, v153, v154);
        return;
    else
        v26(v152, function() --[[ Line: 278 ]]
            -- upvalues: v155 (copy), v153 (copy), v154 (copy), v151 (copy), v152 (copy), v156 (copy), v157 (copy)
            handleAccountInfoFromLua(v155, v153, v154, v151, v152, v156, v157);
        end);
        return;
    end;
end;
return {
    handleSessionCheckSuccess = handleSessionCheckSuccess, 
    handleSessionCheckFailure = handleSessionCheckFailure, 
    handleAccountInfoFromLua = handleAccountInfoFromLua
};
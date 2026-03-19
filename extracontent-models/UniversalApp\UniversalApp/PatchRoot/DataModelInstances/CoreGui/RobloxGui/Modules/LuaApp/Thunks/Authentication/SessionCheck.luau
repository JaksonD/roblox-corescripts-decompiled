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
local v13 = require(script.Parent.AppStorageUtilities);
local v14 = require(l_Modules_0.LuaApp.AppPage);
local v15 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v16 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v17 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v18 = require(l_Modules_0.LuaApp.Thunks.CloseAccountAuthenticationFailureOverlay);
local v19 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v20 = require(l_Modules_0.LuaApp.Thunks.ApiFetchUsersRoles);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local l_HttpService_0 = game:GetService("HttpService");
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v25 = require(l_CorePackages_0.Workspace.Packages.AuthCommon);
local l_KeystoreAnalyticsEvents_0 = v25.Analytics.KeystoreAnalyticsEvents;
local l_KeystoreEventConstants_0 = v25.Analytics.KeystoreEventConstants;
local l_KeystoreConstants_0 = v25.Common.KeystoreConstants;
local l_HandlePreHomePageRouting_0 = require(l_CorePackages_0.Workspace.Packages.PreHomePage).HandlePreHomePageRouting;
local v30 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagPreHomePageRoutingEnabled_0 = v30.FFlagPreHomePageRoutingEnabled;
local l_FFlagPasskeyUpsellEnabled_0 = v30.FFlagPasskeyUpsellEnabled;
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v30.GetFFlagKeystoreAutoLoginAvailable;
local l_GetFFlagDisableKeystoreUnderageDeletion_0 = v30.GetFFlagDisableKeystoreUnderageDeletion;
local v37 = require(l_Modules_0.LuaApp.Thunks.Authentication.ShowAccountAuthenticationFailureOverlay);
local v38 = require(l_Modules_0.LuaApp.Thunks.Authentication.DeleteAllCredentialsFromKeystore);
local v39 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v40 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
local l_AppStartupSequenceTag_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppStartupSequenceTag;
local l_AppPrefetch_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppPrefetch;
local l_InvoluntaryLogoutAnalyticsEvents_0 = v25.Analytics.InvoluntaryLogoutAnalyticsEvents;
local v44 = require(l_Modules_0.LuaApp.EventStreamConstants);
local function _(v45, v46) --[[ Line: 64 ]] --[[ Name: handleUserLoggedIn ]]
    -- upvalues: l_InvoluntaryLogoutAnalyticsEvents_0 (copy), v44 (copy), l_GuiService_0 (copy), v17 (copy), l_SetAuthenticationStatus_0 (copy), v16 (copy)
    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckDidLogin);
    l_GuiService_0:BroadcastNotification(v45:toJsonData(), v17.DID_LOG_IN);
    v46:dispatch(l_SetAuthenticationStatus_0(v16.LOGGED_IN));
end;
local function v49() --[[ Line: 74 ]]
    -- upvalues: l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v38 (copy), l_default_0 (copy), l_KeystoreConstants_0 (copy)
    local v48 = l_HttpService_0:JSONEncode({
        server = l_ContentProvider_0.BaseUrl
    });
    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
        return v38(v48);
    else
        return l_default_0:deleteAllCredentialsFromiOSKeychain(l_default_0.CredentialsTypes.iosKeychainPassword, v48, l_KeystoreConstants_0.KeystoreTimeout);
    end;
end;
local function v55(v50, v51, _, v53) --[[ Line: 90 ]] --[[ Name: navigateToPostAuthPage ]]
    -- upvalues: v13 (copy), v33 (copy), v11 (copy), v14 (copy), l_FFlagPreHomePageRoutingEnabled_0 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), l_HandlePreHomePageRouting_0 (copy)
    if (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v13.getSignupActionRequired() else "") == "auth" then
        if v33() then
            v50:dispatch(v11({
                {
                    name = v14.AddAuthMethodPage
                }
            }));
            return;
        else
            v13.setSignupActionRequired("");
            v13.flush();
            v50:dispatch(v11({
                {
                    name = v51
                }
            }));
            return;
        end;
    elseif l_FFlagPreHomePageRoutingEnabled_0 or l_FFlagPasskeyUpsellEnabled_0 then
        l_HandlePreHomePageRouting_0(v53, v50, v11):andThen(function(v54) --[[ Line: 104 ]]
            -- upvalues: v50 (copy), v11 (ref), v51 (copy)
            if not v54 then
                v50:dispatch(v11({
                    {
                        name = v51
                    }
                }));
            end;
        end);
        return;
    else
        v50:dispatch(v11({
            {
                name = v51
            }
        }));
        return;
    end;
end;
local function _(v56) --[[ Line: 114 ]] --[[ Name: isUserModerated ]]
    local l_Moderation_0 = v56:getState().Moderation;
    return l_Moderation_0 and l_Moderation_0.userModerated or false;
end;
local function v59(v60, v61, v62, v63, _, v65) --[[ Line: 119 ]] --[[ Name: sessionCheck ]]
    -- upvalues: l_InvoluntaryLogoutAnalyticsEvents_0 (copy), v44 (copy), v39 (copy), v14 (copy), l_AppStartupSequenceTag_0 (copy), l_AppPrefetch_0 (copy), v40 (copy), v6 (copy), v7 (copy), l_GetFFlagDisableKeystoreUnderageDeletion_0 (copy), v49 (copy), l_KeystoreAnalyticsEvents_0 (copy), l_KeystoreEventConstants_0 (copy), v19 (copy), v18 (copy), v55 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v13 (copy), l_LocalizationService_0 (copy), v12 (copy), v20 (copy), l_MemStorageService_0 (copy), v15 (copy), v9 (copy), l_GuiService_0 (copy), v17 (copy), l_SetAuthenticationStatus_0 (copy), v16 (copy), l_StatusCodes_0 (copy), v37 (copy), v59 (copy)
    return function(v66) --[[ Line: 120 ]]
        -- upvalues: l_InvoluntaryLogoutAnalyticsEvents_0 (ref), v44 (ref), v39 (ref), v60 (copy), v14 (ref), l_AppStartupSequenceTag_0 (ref), l_AppPrefetch_0 (ref), v40 (ref), v62 (copy), v63 (copy), v65 (copy), v6 (ref), v7 (ref), l_GetFFlagDisableKeystoreUnderageDeletion_0 (ref), v49 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v19 (ref), v18 (ref), v61 (copy), v55 (ref), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v13 (ref), l_LocalizationService_0 (ref), v12 (ref), v20 (ref), l_MemStorageService_0 (ref), v15 (ref), v9 (ref), l_GuiService_0 (ref), v17 (ref), l_SetAuthenticationStatus_0 (ref), v16 (ref), l_StatusCodes_0 (ref), v37 (ref), v59 (ref)
        local l_Moderation_1 = v66:getState().Moderation;
        if l_Moderation_1 and l_Moderation_1.userModerated or false then
            l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckSkippedForModeratedUser);
            return;
        else
            local v68 = v39(v60);
            l_Moderation_1 = v14.Home;
            local l_l_AppStartupSequenceTag_0_0 = l_AppStartupSequenceTag_0;
            local l_l_AppPrefetch_0_0 = l_AppPrefetch_0;
            local function v71() --[[ Line: 136 ]]
                -- upvalues: v66 (copy), v40 (ref), v60 (ref), v62 (ref), v63 (ref), v65 (ref), l_l_AppStartupSequenceTag_0_0 (copy), l_l_AppPrefetch_0_0 (copy)
                return v66:dispatch(v40(v60, v60, v62, v63, v65, l_l_AppStartupSequenceTag_0_0, l_l_AppPrefetch_0_0));
            end;
            return v6(v60):andThen(function(v72) --[[ Line: 150 ]]
                -- upvalues: l_InvoluntaryLogoutAnalyticsEvents_0 (ref), v44 (ref), v7 (ref), l_GetFFlagDisableKeystoreUnderageDeletion_0 (ref), v49 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v66 (copy), v19 (ref), v18 (ref), v61 (ref), v55 (ref), l_Moderation_1 (copy), v60 (ref), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v68 (copy), v13 (ref), l_LocalizationService_0 (ref), v12 (ref), v20 (ref), l_MemStorageService_0 (ref), v15 (ref), v9 (ref), l_GuiService_0 (ref), v17 (ref), l_SetAuthenticationStatus_0 (ref), v16 (ref)
                l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckSuccess);
                local v73 = v7.fromUserInfoRequest(v72);
                if v73.userId ~= nil and v73.userId ~= -1 and v73.isUnder13 == true and not l_GetFFlagDisableKeystoreUnderageDeletion_0() then
                    v49():andThen(function() --[[ Line: 164 ]]
                        -- upvalues: l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v73 (copy)
                        l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.underageDelete, (tostring(v73.userId)));
                    end);
                end;
                if v66:getState().CentralOverlay.OverlayType == v19.AccountAuthenticationFailureOverlay then
                    v66:dispatch(v18());
                    if v73:isEqual(v61) then
                        l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckLocalPlayerMatch);
                        v55(v66, l_Moderation_1, v73, v60);
                    end;
                end;
                if not v73:isEqual(v61) then
                    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckLocalPlayerMismatch);
                    v73:setToLocalPlayer();
                    v73:setToLocalStorage();
                    v66:dispatch(l_GetLocalUser_0());
                    v66:dispatch(l_ReceivedUserCountryCode_0(v73.countryCode));
                    v55(v66, l_Moderation_1, v73, v60);
                end;
                local v74 = {};
                table.insert(v74, v68:andThen(function(v75) --[[ Line: 201 ]]
                    -- upvalues: v13 (ref), l_LocalizationService_0 (ref)
                    v13.setRobloxLocaleId(v75.generalExperienceLocale);
                    v13.setGameLocaleId(v75.ugcLocale);
                    l_LocalizationService_0:SetRobloxLocaleId(v75.generalExperienceLocale);
                end));
                local v76 = v12(v60, v73.userId);
                v66:dispatch(v20(v60));
                local v77 = (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v13.getSignupActionRequired() else "") == "auth";
                table.insert(v74, v76:andThen(function(v78) --[[ Line: 218 ]]
                    -- upvalues: v13 (ref), v77 (copy), l_MemStorageService_0 (ref), v15 (ref)
                    v13.setAuthenticatedTheme(v78);
                    if not v77 then
                        l_MemStorageService_0:Fire(v15.ThemeUpdate, v78);
                    end;
                end));
                v9.Batch(v74):andThen(function() --[[ Line: 228 ]]
                    -- upvalues: v13 (ref)
                    v13.flush();
                end);
                local l_v66_0 = v66;
                l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckDidLogin);
                l_GuiService_0:BroadcastNotification(v73:toJsonData(), v17.DID_LOG_IN);
                l_v66_0:dispatch(l_SetAuthenticationStatus_0(v16.LOGGED_IN));
            end, function(v80) --[[ Line: 232 ]]
                -- upvalues: l_StatusCodes_0 (ref), l_InvoluntaryLogoutAnalyticsEvents_0 (ref), v44 (ref), l_KeystoreAnalyticsEvents_0 (ref), l_KeystoreEventConstants_0 (ref), v49 (ref), v37 (ref), v66 (copy), v59 (ref), v60 (ref), v61 (ref), v68 (copy), l_Moderation_1 (copy), v71 (copy)
                if v80.StatusCode == l_StatusCodes_0.UNAUTHORIZED then
                    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, v44.Context.SessionCheckUnauthorized);
                    l_KeystoreAnalyticsEvents_0.sendPageLoadEvent(l_KeystoreEventConstants_0.origin.remoteLogoutDelete);
                    v49();
                    return;
                else
                    l_InvoluntaryLogoutAnalyticsEvents_0.sendImmediatelyPageLoadEvent(v44.Origin.LandingScreen, "ErrorCode: " .. tostring(v80.StatusCode) .. " Msg: " .. tostring(v80));
                    v37(v66, function() --[[ Line: 247 ]]
                        -- upvalues: v59 (ref), v60 (ref), v61 (ref), v68 (ref), l_Moderation_1 (ref), v71 (ref)
                        v59(v60, v61, v68, true, l_Moderation_1, v71);
                    end);
                    return;
                end;
            end);
        end;
    end;
end;
return v59;
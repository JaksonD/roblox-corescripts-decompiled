local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v5 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v6 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v7 = require(l_Modules_0.LuaApp.Thunks.FetchTheme);
local v8 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
local v10 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
local v11 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v12 = require(l_Modules_0.LuaApp.Thunks.Authentication.ClearApp);
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.AppStorageUtilities);
local v14 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v15 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local l_SetAuthenticationStatus_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationStatus).Actions.SetAuthenticationStatus;
local v19 = require(l_Modules_0.LuaApp.Http.Requests.GetAccountInfo);
local v20 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v21 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v22 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v23 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_StatusCodes_0 = require(l_CorePackages_0.Workspace.Packages.Http).StatusCodes;
local v25 = require(l_Modules_0.Luobu.Analytics.Events.AppSessionCheckCounterNames);
local v26 = require(l_Modules_0.LuaApp.AppPage);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v28 = require(l_Modules_0.LuaApp.Promise);
local v29 = require(l_Modules_0.LuaApp.PromiseUtilities);
local l_AuthenticationProtocol_0 = require(l_CorePackages_0.Workspace.Packages.AuthenticationProtocol).AuthenticationProtocol;
local function _(v31) --[[ Line: 40 ]] --[[ Name: initABTesting ]]
    -- upvalues: v5 (copy)
    v5.initializeUserLayers(v31);
end;
local function _(v33, v34) --[[ Line: 44 ]] --[[ Name: handleUserLoggedIn ]]
    -- upvalues: l_GuiService_0 (copy), v23 (copy), l_SetAuthenticationStatus_0 (copy), v20 (copy)
    l_GuiService_0:BroadcastNotification(v33:toJsonData(), v23.DID_LOG_IN);
    v34:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
end;
local function v42(v36, v37, v38) --[[ Line: 49 ]] --[[ Name: resetOnNoAccountInfo ]]
    -- upvalues: v6 (copy), v29 (copy), v13 (copy), l_LocalizationService_0 (copy), v12 (copy), l_SetAuthenticationStatus_0 (copy), v20 (copy), v8 (copy), v26 (copy)
    local v39 = v6(v37);
    v29.Batch({
        v39
    }):andThen(function(v40) --[[ Line: 51 ]]
        -- upvalues: v13 (ref), l_LocalizationService_0 (ref), v38 (copy), v36 (copy), v12 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref), v8 (ref), v26 (ref)
        v40[1]:match(function(v41) --[[ Line: 52 ]]
            -- upvalues: v13 (ref), l_LocalizationService_0 (ref)
            v13.setRobloxLocaleId(v41.signupAndLoginLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v41.signupAndLoginLocale);
        end);
        if v38 then
            v36:dispatch(v12());
        end;
        v36:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_OUT));
        v36:dispatch(v8({
            {
                name = v26.Landing
            }
        }));
    end);
end;
local function v56(v43, v44, v45, v46, v47) --[[ Line: 65 ]] --[[ Name: getUserAccountInfo ]]
    -- upvalues: v19 (copy), v25 (copy), v11 (copy), v12 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v8 (copy), v26 (copy), v5 (copy), v10 (copy), v6 (copy), v13 (copy), l_LocalizationService_0 (copy), l_MemStorageService_0 (copy), v21 (copy), v7 (copy), v29 (copy), v28 (copy), l_StatusCodes_0 (copy)
    return v19(v44):andThen(function(v48) --[[ Line: 66 ]]
        -- upvalues: v45 (copy), v25 (ref), v11 (ref), v47 (copy), v46 (copy), v43 (copy), v12 (ref), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v8 (ref), v26 (ref), v5 (ref), v10 (ref), v44 (copy), v6 (ref), v13 (ref), l_LocalizationService_0 (ref), l_MemStorageService_0 (ref), v21 (ref), v7 (ref), v29 (ref), v28 (ref)
        v45.Diag:reportCounter(v25.Success, 1);
        local v49 = v11.fromRequest(v48);
        if not v49:isEqual(v47) or v46.useMSDKWebAuthentication() then
            v49:setToLocalPlayer();
            v49:setToLocalStorage();
            v43:dispatch(v12());
            v43:dispatch(l_GetLocalUser_0());
            v43:dispatch(l_ReceivedUserCountryCode_0(v49.countryCode));
            v43:dispatch(v8({
                {
                    name = v26.Home
                }
            }));
            local l_userId_0 = v49.userId;
            v5.initializeUserLayers(l_userId_0);
        end;
        v43:dispatch(v10(v44, v45, v46));
        local v51 = {};
        table.insert(v51, v6(v44):andThen(function(v52) --[[ Line: 86 ]]
            -- upvalues: v13 (ref), l_LocalizationService_0 (ref)
            v13.setRobloxLocaleId(v52.generalExperienceLocale);
            v13.setGameLocaleId(v52.ugcLocale);
            l_LocalizationService_0:SetRobloxLocaleId(v52.generalExperienceLocale);
        end));
        local v53 = v13.getAuthenticatedTheme();
        l_MemStorageService_0:Fire(v21.ThemeUpdate, v53);
        table.insert(v51, v7(v44, v49.userId):andThen(function(v54) --[[ Line: 98 ]]
            -- upvalues: v13 (ref), l_MemStorageService_0 (ref), v21 (ref)
            v13.setAuthenticatedTheme(v54);
            l_MemStorageService_0:Fire(v21.ThemeUpdate, v54);
        end));
        v29.Batch(v51):andThen(function() --[[ Line: 104 ]]
            -- upvalues: v13 (ref)
            v13.flush();
        end);
        return v28.resolve(v49);
    end, function(v55) --[[ Line: 109 ]]
        -- upvalues: l_StatusCodes_0 (ref), v45 (copy), v25 (ref), v28 (ref)
        if v55.StatusCodes == l_StatusCodes_0.UNAUTHORIZED then
            v45.Diag:reportCounter(v25.Failure401Unauthenticated, 1);
        end;
        v45.Diag:reportCounter(v25.Failure, 1);
        return v28.reject();
    end);
end;
local function _(v57, v58, v59, v60, v61) --[[ Line: 119 ]] --[[ Name: handleCachedUser ]]
    -- upvalues: v5 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v8 (copy), v26 (copy), v56 (copy), l_AuthenticationProtocol_0 (copy), l_Logger_0 (copy), v42 (copy), v14 (copy), l_GuiService_0 (copy), v15 (copy), v23 (copy), l_SetAuthenticationStatus_0 (copy), v20 (copy)
    v61:setToLocalPlayer();
    local l_userId_1 = v61.userId;
    v5.initializeUserLayers(l_userId_1);
    spawn(function() --[[ Line: 124 ]]
        -- upvalues: v57 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v61 (copy), v8 (ref), v26 (ref), v56 (ref), v58 (copy), v59 (copy), v60 (copy), l_AuthenticationProtocol_0 (ref), l_Logger_0 (ref), v42 (ref), v14 (ref), l_GuiService_0 (ref), v15 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
        v57:dispatch(l_GetLocalUser_0());
        v57:dispatch(l_ReceivedUserCountryCode_0(v61.countryCode));
        v57:dispatch(v8({
            {
                name = v26.Home
            }
        }));
        v56(v57, v58, v59, v60, v61):andThen(function(v63) --[[ Line: 129 ]]
            -- upvalues: l_AuthenticationProtocol_0 (ref), l_Logger_0 (ref), v42 (ref), v57 (ref), v58 (ref), v59 (ref), v14 (ref), l_GuiService_0 (ref), v15 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
            local v64, v65 = l_AuthenticationProtocol_0.default:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, l_AuthenticationProtocol_0.AuthMethods.NONE):await();
            if not v64 or v65.statusCode ~= 0 then
                l_Logger_0:info("MSDK Auto Login with ErrorCode: " .. v65.statusCode);
                v42(v57, v58, true);
                v59.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v65.statusCode, 1);
                v57:dispatch(v14(v58, l_GuiService_0, v15.UnauthorizedAutoLogin));
                return;
            else
                local l_v57_0 = v57;
                l_GuiService_0:BroadcastNotification(v63:toJsonData(), v23.DID_LOG_IN);
                l_v57_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                return;
            end;
        end, function() --[[ Line: 142 ]]
            -- upvalues: v42 (ref), v57 (ref), v58 (ref)
            v42(v57, v58, true);
        end);
    end);
end;
local function _(v68, v69, v70, v71, v72, v73) --[[ Line: 148 ]] --[[ Name: handleNoCachedUser ]]
    -- upvalues: v42 (copy), v56 (copy), l_GuiService_0 (copy), v23 (copy), l_SetAuthenticationStatus_0 (copy), v20 (copy)
    if v73 then
        v42(v68, v69, false);
        return;
    else
        spawn(function() --[[ Line: 152 ]]
            -- upvalues: v56 (ref), v68 (copy), v69 (copy), v70 (copy), v71 (copy), v72 (copy), l_GuiService_0 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref), v42 (ref)
            v56(v68, v69, v70, v71, v72):andThen(function(v74) --[[ Line: 153 ]]
                -- upvalues: v68 (ref), l_GuiService_0 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
                local l_v68_0 = v68;
                l_GuiService_0:BroadcastNotification(v74:toJsonData(), v23.DID_LOG_IN);
                l_v68_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
            end, function() --[[ Line: 155 ]]
                -- upvalues: v42 (ref), v68 (ref), v69 (ref)
                v42(v68, v69, false);
            end);
        end);
        return;
    end;
end;
return function(v77, v78, v79, v80) --[[ Line: 162 ]]
    -- upvalues: v11 (copy), l_Logger_0 (copy), v22 (copy), v42 (copy), v56 (copy), l_GuiService_0 (copy), v23 (copy), l_SetAuthenticationStatus_0 (copy), v20 (copy), v5 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v8 (copy), v26 (copy), l_AuthenticationProtocol_0 (copy), v14 (copy), v15 (copy)
    return function(v81) --[[ Line: 168 ]]
        -- upvalues: v11 (ref), v79 (copy), l_Logger_0 (ref), v77 (copy), v78 (copy), v80 (copy), v22 (ref), v42 (ref), v56 (ref), l_GuiService_0 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref), v5 (ref), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v8 (ref), v26 (ref), l_AuthenticationProtocol_0 (ref), v14 (ref), v15 (ref)
        local v82 = v11.fromLocalStorage();
        if v82.userId == -1 or v79.useMSDKWebAuthentication() then
            l_Logger_0:info(string.format("[%f] LaunchLuobuApp::handleNoCachedUser()", tick()));
            local l_v77_0 = v77;
            local l_v78_0 = v78;
            local l_v79_0 = v79;
            if v80 == v22.Startup then
                v42(v81, l_v77_0, false);
                return;
            else
                spawn(function() --[[ Line: 152 ]]
                    -- upvalues: v56 (ref), v81 (copy), l_v77_0 (copy), l_v78_0 (copy), l_v79_0 (copy), v82 (copy), l_GuiService_0 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref), v42 (ref)
                    v56(v81, l_v77_0, l_v78_0, l_v79_0, v82):andThen(function(v86) --[[ Line: 153 ]]
                        -- upvalues: v81 (ref), l_GuiService_0 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
                        local l_v81_0 = v81;
                        l_GuiService_0:BroadcastNotification(v86:toJsonData(), v23.DID_LOG_IN);
                        l_v81_0:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                    end, function() --[[ Line: 155 ]]
                        -- upvalues: v42 (ref), v81 (ref), l_v77_0 (ref)
                        v42(v81, l_v77_0, false);
                    end);
                end);
                return;
            end;
        else
            l_Logger_0:info(string.format("[%f] LaunchLuobuApp::handleCachedUser()", tick()));
            local l_v77_1 = v77;
            local l_v78_1 = v78;
            local l_v79_1 = v79;
            v82:setToLocalPlayer();
            local l_userId_2 = v82.userId;
            v5.initializeUserLayers(l_userId_2);
            spawn(function() --[[ Line: 124 ]]
                -- upvalues: v81 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v82 (copy), v8 (ref), v26 (ref), v56 (ref), l_v77_1 (copy), l_v78_1 (copy), l_v79_1 (copy), l_AuthenticationProtocol_0 (ref), l_Logger_0 (ref), v42 (ref), v14 (ref), l_GuiService_0 (ref), v15 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
                v81:dispatch(l_GetLocalUser_0());
                v81:dispatch(l_ReceivedUserCountryCode_0(v82.countryCode));
                v81:dispatch(v8({
                    {
                        name = v26.Home
                    }
                }));
                v56(v81, l_v77_1, l_v78_1, l_v79_1, v82):andThen(function(v92) --[[ Line: 129 ]]
                    -- upvalues: l_AuthenticationProtocol_0 (ref), l_Logger_0 (ref), v42 (ref), v81 (ref), l_v77_1 (ref), l_v78_1 (ref), v14 (ref), l_GuiService_0 (ref), v15 (ref), v23 (ref), l_SetAuthenticationStatus_0 (ref), v20 (ref)
                    local v93, v94 = l_AuthenticationProtocol_0.default:requestAuth(l_AuthenticationProtocol_0.AuthProviders.MSDK, l_AuthenticationProtocol_0.AuthMethods.NONE):await();
                    if not v93 or v94.statusCode ~= 0 then
                        l_Logger_0:info("MSDK Auto Login with ErrorCode: " .. v94.statusCode);
                        v42(v81, l_v77_1, true);
                        l_v78_1.Diag:reportCounter("MSDKAutoLoginErrorCode_" .. v94.statusCode, 1);
                        v81:dispatch(v14(l_v77_1, l_GuiService_0, v15.UnauthorizedAutoLogin));
                        return;
                    else
                        local l_v81_1 = v81;
                        l_GuiService_0:BroadcastNotification(v92:toJsonData(), v23.DID_LOG_IN);
                        l_v81_1:dispatch(l_SetAuthenticationStatus_0(v20.LOGGED_IN));
                        return;
                    end;
                end, function() --[[ Line: 142 ]]
                    -- upvalues: v42 (ref), v81 (ref), l_v77_1 (ref)
                    v42(v81, l_v77_1, true);
                end);
            end);
            return;
        end;
    end;
end;
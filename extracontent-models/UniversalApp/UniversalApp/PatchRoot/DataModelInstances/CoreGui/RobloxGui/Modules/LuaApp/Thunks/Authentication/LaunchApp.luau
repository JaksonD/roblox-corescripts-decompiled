local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(script.Parent.User);
local l_GetLocalUser_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Thunks.GetLocalUser;
local l_SetLaunchContext_0 = require(l_CorePackages_0.Workspace.Packages.AppStartup).Actions.SetLaunchContext;
local v7 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v8 = require(l_Modules_0.LuaApp.Thunks.FetchLocale);
local v9 = require(l_Modules_0.LuaApp.Thunks.PreloadApplicationData);
local v10 = require(script.Parent.AppStorageUtilities);
local v11 = require(l_Modules_0.LuaApp.AppPage);
local v12 = require(l_Modules_0.LuaApp.FlagSettings);
local v13 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v14 = require(script.Parent.WebLogin);
local v15 = require(l_Modules_0.LuaApp.Enum.WebLaunchOption);
local v16 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local l_PostSignUpAttribution_0 = require(l_CorePackages_0.Workspace.Packages.ExternalAttribution).PostSignUpAttribution;
local v19 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetOnNoAccountInfoFound);
local v21 = require(l_Modules_0.LuaApp.Constants);
local l_AccountSwitcherConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.AccountSwitcherConstants;
local v23 = require(l_Modules_0.LuaApp.Http.Requests.GetUserAppLaunchInfo);
local l_GetCredentialsAvailabilityStore_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Stores.GetCredentialsAvailabilityStore;
local l_parseCredentialsProtocolIsAvailableResponse_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Utils.parseCredentialsProtocolIsAvailableResponse;
local l_ReceivedUserCountryCode_0 = require(l_CorePackages_0.Workspace.Packages.CountryCode).ReceivedUserCountryCode;
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v28 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v29 = require(l_Modules_0.LuaApp.Flags.GetFFlagPasskeySignupEnabled);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableMultiPageSignupExperiment);
local l_FFlagApplyLaunchContextForNewAccountSwitches_0 = v27.FFlagApplyLaunchContextForNewAccountSwitches;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = v27.FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 = v27.FFlagUseIsAvailableCheckForIOSKeychainFetch;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = v27.GetFFlagCheckIsAvailableForKeystoreOperations;
local v35 = require(l_Modules_0.LuaApp.Flags.FFlagEnableIosKeychainLoginLua);
local l_GetFFlagKeystoreAutoLoginAvailable_0 = v27.GetFFlagKeystoreAutoLoginAvailable;
local v37 = require(l_Modules_0.LuaApp.Thunks.Authentication.AttemptLoginWithKeystoreCredentials);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local v40 = require(l_Modules_0.LuaApp.Thunks.Authentication.Login);
local l_KeystoreConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.KeystoreConstants;
local v42 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics);
local l_CheckForAndFireValidCookieForNoCachedUserEvent_0 = v42.RobloxTelemetry.CheckForAndFireValidCookieForNoCachedUserEvent;
local l_TelemetryConfigs_0 = v42.TelemetryConfigs;
local l_authPageload_0 = v42.Events.authPageload;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v47 = require(l_Modules_0.LuaApp.Thunks.Authentication.HandleAccountInfo);
local v48 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHandleEngineSessionCheckAtStartup);
local v49 = game:DefineFastFlag("DisableListenToSessionTerminalStatus", false);
local v50 = require(l_Modules_0.LuaApp.Thunks.Authentication.SessionCheckManager.SessionCheckManager);
local l_Status_0 = v50.Status;
local v52 = require(l_Modules_0.LuaApp.Thunks.Authentication.SessionCheckUtils);
local l_handleSessionCheckSuccess_0 = v52.handleSessionCheckSuccess;
local l_handleSessionCheckFailure_0 = v52.handleSessionCheckFailure;
local v55 = require(l_CorePackages_0.Packages.Promise);
local v56 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol);
local l_default_1 = v56.CredentialsProtocol.default;
local l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 = v56.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout;
local v59 = require(l_Modules_0.LuaApp.Flags.FFlagPrefetchCredentialsProtocolAvailabilityOnLaunch);
local l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 = v27.FFlagMorePageGateAccountSwitcherByCachedVariantId;
local v61 = require(l_Modules_0.LuaApp.Flags.FFlagFixIosKeychainLogin);
local v62 = game:DefineFastFlag("EnableRedirectToLoginPageOn2SV", false);
local l_FFlagEnableNavigateToLoginAfterLogoutAll_0 = v27.FFlagEnableNavigateToLoginAfterLogoutAll;
local function v81(v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75) --[[ Line: 109 ]] --[[ Name: initializeForCachedUser ]]
    -- upvalues: v10 (copy), v29 (copy), v30 (copy), l_MemStorageService_0 (copy), v16 (copy), v19 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), v9 (copy), v47 (copy)
    v68:setToLocalPlayer();
    local v76 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "";
    local v77 = v10.getAuthenticatedTheme();
    local v78 = false;
    if v76 == "auth" then
        v78 = v29() or v30();
    end;
    if v77 ~= "" and not v78 then
        l_MemStorageService_0:Fire(v16.ThemeUpdate, v77);
    end;
    v19.initializeUserLayers(v68.userId);
    spawn(function() --[[ Line: 144 ]]
        -- upvalues: v70 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v68 (copy), v73 (copy), v7 (ref), v11 (ref), v76 (copy), v29 (ref), v30 (ref), v10 (ref), v69 (copy), v9 (ref), v64 (copy), v65 (copy), v66 (copy), v67 (copy), v72 (copy), v74 (copy), v75 (copy), v47 (ref), v71 (copy)
        v70:dispatch(l_GetLocalUser_0());
        v70:dispatch(l_ReceivedUserCountryCode_0(v68.countryCode));
        if v73 and v68.isUnder13 then
            v70:dispatch(v7({
                {
                    name = v11.UAppBlock
                }
            }));
        elseif v76 == "auth" then
            if v29() or v30() then
                v70:dispatch(v7({
                    {
                        name = v11.AddAuthMethodPage
                    }
                }));
            else
                v10.setSignupActionRequired("");
                v10.flush();
                v70:dispatch(v7({
                    {
                        name = v69
                    }
                }));
            end;
        else
            v70:dispatch(v7({
                {
                    name = v69
                }
            }));
        end;
        local function v79() --[[ Line: 162 ]]
            -- upvalues: v70 (ref), v9 (ref), v64 (ref), v65 (ref), v66 (ref), v67 (ref), v72 (ref), v74 (ref), v75 (ref)
            return v70:dispatch(v9(v64, v65, v66, v67, v72, v74, v75));
        end;
        local _ = v70:dispatch(v9(v64, v65, v66, v67, v72, v74, v75));
        v47(v64, v68, v71, true, v70, v69, v79, v72, v73, true);
    end);
end;
local _ = function(v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95) --[[ Line: 195 ]] --[[ Name: handleNavWithDataLoadAndSessionCheck ]]
    -- upvalues: l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), v29 (copy), v30 (copy), v10 (copy), v9 (copy), v47 (copy)
    spawn(function() --[[ Line: 212 ]]
        -- upvalues: v82 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v83 (copy), v84 (copy), v7 (ref), v11 (ref), v85 (copy), v29 (ref), v30 (ref), v10 (ref), v86 (copy), v9 (ref), v87 (copy), v88 (copy), v89 (copy), v90 (copy), v91 (copy), v92 (copy), v93 (copy), v47 (ref), v95 (copy), v94 (copy)
        v82:dispatch(l_GetLocalUser_0());
        v82:dispatch(l_ReceivedUserCountryCode_0(v83.countryCode));
        if v84 and v83.isUnder13 then
            v82:dispatch(v7({
                {
                    name = v11.UAppBlock
                }
            }));
        elseif v85 == "auth" then
            if v29() or v30() then
                v82:dispatch(v7({
                    {
                        name = v11.AddAuthMethodPage
                    }
                }));
            else
                v10.setSignupActionRequired("");
                v10.flush();
                v82:dispatch(v7({
                    {
                        name = v86
                    }
                }));
            end;
        else
            v82:dispatch(v7({
                {
                    name = v86
                }
            }));
        end;
        local function v96() --[[ Line: 230 ]]
            -- upvalues: v82 (ref), v9 (ref), v87 (ref), v88 (ref), v89 (ref), v90 (ref), v91 (ref), v92 (ref), v93 (ref)
            return v82:dispatch(v9(v87, v88, v89, v90, v91, v92, v93));
        end;
        local _ = v82:dispatch(v9(v87, v88, v89, v90, v91, v92, v93));
        v47(v87, v83, v95, v94, v82, v86, v96, v91, v84, true);
    end);
end;
local function v157(v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110) --[[ Line: 263 ]] --[[ Name: initializeForCachedUserV2 ]]
    -- upvalues: v10 (copy), v29 (copy), v30 (copy), l_MemStorageService_0 (copy), v16 (copy), v19 (copy), v9 (copy), v49 (copy), v50 (copy), l_Status_0 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), l_handleSessionCheckSuccess_0 (copy), l_handleSessionCheckFailure_0 (copy), v47 (copy)
    v103:setToLocalPlayer();
    local v111 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "";
    local v112 = v10.getAuthenticatedTheme();
    local v113 = false;
    if v111 == "auth" then
        v113 = v29() or v30();
    end;
    local v114 = "dark";
    if v112 == "light" or v112 == "dark" then
        v114 = v112;
    end;
    if v113 then
        v114 = "dark";
    end;
    l_MemStorageService_0:Fire(v16.ThemeUpdate, v114);
    v19.initializeUserLayers(v103.userId);
    local function v115() --[[ Line: 307 ]]
        -- upvalues: v105 (copy), v9 (ref), v99 (copy), v100 (copy), v101 (copy), v102 (copy), v107 (copy), v109 (copy), v110 (copy)
        return v105:dispatch(v9(v99, v100, v101, v102, v107, v109, v110));
    end;
    if v49 then
        v50:listenToSessionStatusChange(function(v116) --[[ Line: 322 ]]
            -- upvalues: l_Status_0 (ref), v105 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v103 (copy), v108 (copy), v7 (ref), v11 (ref), v111 (copy), v29 (ref), v30 (ref), v10 (ref), v104 (copy), v9 (ref), v99 (copy), v100 (copy), v101 (copy), v102 (copy), v107 (copy), v109 (copy), v110 (copy), l_handleSessionCheckSuccess_0 (ref), v106 (copy), v115 (copy), l_handleSessionCheckFailure_0 (ref), v47 (ref)
            local l_status_0 = v116.status;
            if l_status_0 == l_Status_0.Success then
                v105:dispatch(l_GetLocalUser_0());
                v105:dispatch(l_ReceivedUserCountryCode_0(v103.countryCode));
                if v108 and v103.isUnder13 then
                    v105:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif v111 == "auth" then
                    if v29() or v30() then
                        v105:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        v105:dispatch(v7({
                            {
                                name = v104
                            }
                        }));
                    end;
                else
                    v105:dispatch(v7({
                        {
                            name = v104
                        }
                    }));
                end;
                local _ = v105:dispatch(v9(v99, v100, v101, v102, v107, v109, v110));
                l_handleSessionCheckSuccess_0(v99, v103, v106, true, v105, v104, v115, v107, v108, true);
                return;
            elseif l_status_0 == l_Status_0.Failed then
                local v119 = v116.httpStatusCode or v116.errorStatus;
                l_handleSessionCheckFailure_0(v119, true, v105, v99, v106, v103, v104, v115);
                return;
            else
                local l_v105_0 = v105;
                local l_v103_0 = v103;
                local l_v108_0 = v108;
                local l_v111_0 = v111;
                local l_v104_0 = v104;
                local l_v99_0 = v99;
                local l_v100_0 = v100;
                local l_v101_0 = v101;
                local l_v102_0 = v102;
                local l_v107_0 = v107;
                local l_v109_0 = v109;
                local l_v110_0 = v110;
                local l_v106_0 = v106;
                local l_spawn_0 = spawn;
                local v134 = true;
                l_spawn_0(function() --[[ Line: 212 ]]
                    -- upvalues: l_v105_0 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), l_v103_0 (copy), l_v108_0 (copy), v7 (ref), v11 (ref), l_v111_0 (copy), v29 (ref), v30 (ref), v10 (ref), l_v104_0 (copy), v9 (ref), l_v99_0 (copy), l_v100_0 (copy), l_v101_0 (copy), l_v102_0 (copy), l_v107_0 (copy), l_v109_0 (copy), l_v110_0 (copy), v47 (ref), l_v106_0 (copy), v134 (copy)
                    l_v105_0:dispatch(l_GetLocalUser_0());
                    l_v105_0:dispatch(l_ReceivedUserCountryCode_0(l_v103_0.countryCode));
                    if l_v108_0 and l_v103_0.isUnder13 then
                        l_v105_0:dispatch(v7({
                            {
                                name = v11.UAppBlock
                            }
                        }));
                    elseif l_v111_0 == "auth" then
                        if v29() or v30() then
                            l_v105_0:dispatch(v7({
                                {
                                    name = v11.AddAuthMethodPage
                                }
                            }));
                        else
                            v10.setSignupActionRequired("");
                            v10.flush();
                            l_v105_0:dispatch(v7({
                                {
                                    name = l_v104_0
                                }
                            }));
                        end;
                    else
                        l_v105_0:dispatch(v7({
                            {
                                name = l_v104_0
                            }
                        }));
                    end;
                    local function v135() --[[ Line: 230 ]]
                        -- upvalues: l_v105_0 (ref), v9 (ref), l_v99_0 (ref), l_v100_0 (ref), l_v101_0 (ref), l_v102_0 (ref), l_v107_0 (ref), l_v109_0 (ref), l_v110_0 (ref)
                        return l_v105_0:dispatch(v9(l_v99_0, l_v100_0, l_v101_0, l_v102_0, l_v107_0, l_v109_0, l_v110_0));
                    end;
                    local _ = l_v105_0:dispatch(v9(l_v99_0, l_v100_0, l_v101_0, l_v102_0, l_v107_0, l_v109_0, l_v110_0));
                    v47(l_v99_0, l_v103_0, l_v106_0, v134, l_v105_0, l_v104_0, v135, l_v107_0, l_v108_0, true);
                end);
                return;
            end;
        end);
        return;
    else
        v50:registerSessionStatusChange();
        v50:waitForSessionCheckTerminalStatus():andThen(function(v137) --[[ Line: 394 ]]
            -- upvalues: l_Status_0 (ref), v105 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v103 (copy), v108 (copy), v7 (ref), v11 (ref), v111 (copy), v29 (ref), v30 (ref), v10 (ref), v104 (copy), v9 (ref), v99 (copy), v100 (copy), v101 (copy), v102 (copy), v107 (copy), v109 (copy), v110 (copy), l_handleSessionCheckSuccess_0 (ref), v106 (copy), v115 (copy), l_handleSessionCheckFailure_0 (ref)
            if v137 and v137.status == l_Status_0.Success then
                v105:dispatch(l_GetLocalUser_0());
                v105:dispatch(l_ReceivedUserCountryCode_0(v103.countryCode));
                if v108 and v103.isUnder13 then
                    v105:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif v111 == "auth" then
                    if v29() or v30() then
                        v105:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        v105:dispatch(v7({
                            {
                                name = v104
                            }
                        }));
                    end;
                else
                    v105:dispatch(v7({
                        {
                            name = v104
                        }
                    }));
                end;
                local _ = v105:dispatch(v9(v99, v100, v101, v102, v107, v109, v110));
                l_handleSessionCheckSuccess_0(v99, v103, v106, true, v105, v104, v115, v107, v108, true);
                return;
            else
                if v137 and v137.status == l_Status_0.Failed then
                    l_handleSessionCheckFailure_0(v137.errorStatus, true, v105, v99, v106, v103, v104, v115);
                end;
                return;
            end;
        end, function(_) --[[ Line: 444 ]]
            -- upvalues: v105 (copy), v103 (copy), v108 (copy), v111 (copy), v104 (copy), v99 (copy), v100 (copy), v101 (copy), v102 (copy), v107 (copy), v109 (copy), v110 (copy), v106 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v7 (ref), v11 (ref), v29 (ref), v30 (ref), v10 (ref), v9 (ref), v47 (ref)
            local l_v105_1 = v105;
            local l_v103_1 = v103;
            local l_v108_1 = v108;
            local l_v111_1 = v111;
            local l_v104_1 = v104;
            local l_v99_1 = v99;
            local l_v100_1 = v100;
            local l_v101_1 = v101;
            local l_v102_1 = v102;
            local l_v107_1 = v107;
            local l_v109_1 = v109;
            local l_v110_1 = v110;
            local l_v106_1 = v106;
            local l_spawn_1 = spawn;
            local v154 = true;
            l_spawn_1(function() --[[ Line: 212 ]]
                -- upvalues: l_v105_1 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), l_v103_1 (copy), l_v108_1 (copy), v7 (ref), v11 (ref), l_v111_1 (copy), v29 (ref), v30 (ref), v10 (ref), l_v104_1 (copy), v9 (ref), l_v99_1 (copy), l_v100_1 (copy), l_v101_1 (copy), l_v102_1 (copy), l_v107_1 (copy), l_v109_1 (copy), l_v110_1 (copy), v47 (ref), l_v106_1 (copy), v154 (copy)
                l_v105_1:dispatch(l_GetLocalUser_0());
                l_v105_1:dispatch(l_ReceivedUserCountryCode_0(l_v103_1.countryCode));
                if l_v108_1 and l_v103_1.isUnder13 then
                    l_v105_1:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif l_v111_1 == "auth" then
                    if v29() or v30() then
                        l_v105_1:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        l_v105_1:dispatch(v7({
                            {
                                name = l_v104_1
                            }
                        }));
                    end;
                else
                    l_v105_1:dispatch(v7({
                        {
                            name = l_v104_1
                        }
                    }));
                end;
                local function v155() --[[ Line: 230 ]]
                    -- upvalues: l_v105_1 (ref), v9 (ref), l_v99_1 (ref), l_v100_1 (ref), l_v101_1 (ref), l_v102_1 (ref), l_v107_1 (ref), l_v109_1 (ref), l_v110_1 (ref)
                    return l_v105_1:dispatch(v9(l_v99_1, l_v100_1, l_v101_1, l_v102_1, l_v107_1, l_v109_1, l_v110_1));
                end;
                local _ = l_v105_1:dispatch(v9(l_v99_1, l_v100_1, l_v101_1, l_v102_1, l_v107_1, l_v109_1, l_v110_1));
                v47(l_v99_1, l_v103_1, l_v106_1, v154, l_v105_1, l_v104_1, v155, l_v107_1, l_v108_1, true);
            end);
        end);
        return;
    end;
end;
local function v206(v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171) --[[ Line: 466 ]] --[[ Name: handleNoCachedUser ]]
    -- upvalues: v12 (copy), v9 (copy), v47 (copy), v10 (copy), v7 (copy), v11 (copy), v28 (copy), l_FFlagEnableNavigateToLoginAfterLogoutAll_0 (copy), l_AccountSwitcherConstants_0 (copy), l_CheckForAndFireValidCookieForNoCachedUserEvent_0 (copy), l_default_0 (copy), v23 (copy), v35 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v20 (copy), l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_KeystoreConstants_0 (copy), v55 (copy), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (copy), v61 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), v40 (copy), v37 (copy), v62 (copy)
    v171 = v171 or false;
    if v12.LuaAppLoginUIEnabled() and v162 then
        v47(v158, v163, v164, false, v165, v166, function() --[[ Line: 489 ]]
            -- upvalues: v165 (copy), v9 (ref), v158 (copy), v159 (copy), v160 (copy), v161 (copy), v167 (copy), v169 (copy), v170 (copy)
            return v165:dispatch(v9(v158, v159, v160, v161, v167, v169, v170));
        end, v167, v168, false);
    elseif v12.LuaAppLoginUIEnabled() then
        if (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "") == "auth" then
            v165:dispatch(v7({
                {
                    name = v11.AddAuthMethodPage
                }
            }));
            return;
        else
            if v28 and l_FFlagEnableNavigateToLoginAfterLogoutAll_0 then
                local v172 = v10.getAccountSwitchStatus();
                local v173 = v172 == l_AccountSwitcherConstants_0.AccountSwitcherPendingLoginAfterLogoutAll;
                local v174 = v172 == l_AccountSwitcherConstants_0.AccountSwitcherPendingLoginV2AfterLogoutAll;
                local v175 = v172 == l_AccountSwitcherConstants_0.AccountSwitcherPendingPasskeyLoginV1AfterLogoutAll;
                local v176 = v172 == l_AccountSwitcherConstants_0.AccountSwitcherPendingPasskeyLoginV2AfterLogoutAll;
                if v173 or v174 or v175 or v176 then
                    local v177 = v10.getAccountSwitchTargetUsername();
                    v10.setAccountSwitchStatus("");
                    v10.setAccountSwitchTargetUsername("");
                    v10.flush();
                    local v178 = {};
                    if v177 ~= "" then
                        v178.forcedUsernameOverride = v177;
                    end;
                    if v175 or v176 then
                        v178.retryPasskey = true;
                    end;
                    if v174 or v176 then
                        v165:dispatch(v7({
                            {
                                name = v11.LoginV2, 
                                extraProps = v178
                            }
                        }));
                    else
                        v165:dispatch(v7({
                            {
                                name = v11.Login, 
                                extraProps = v178
                            }
                        }));
                    end;
                    return;
                end;
            end;
            spawn(function() --[[ Line: 569 ]]
                -- upvalues: v165 (copy), l_CheckForAndFireValidCookieForNoCachedUserEvent_0 (ref), v158 (copy), l_default_0 (ref), v23 (ref)
                v165:dispatch(l_CheckForAndFireValidCookieForNoCachedUserEvent_0(v158, l_default_0, v23));
            end);
            if (v35 or l_GetFFlagKeystoreAutoLoginAvailable_0()) and not v171 then
                local function _(v179, v180, v181) --[[ Line: 590 ]] --[[ Name: handleResetOnNoAccountInfoFound ]]
                    -- upvalues: v20 (ref), v165 (copy), v158 (copy), v164 (copy)
                    v20(false, v165, v158, v164, nil, v179, v180, v181);
                end;
                local function v186() --[[ Line: 608 ]] --[[ Name: getIosKeychainCredentials ]]
                    -- upvalues: l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_KeystoreConstants_0 (ref), v55 (ref), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (ref), v61 (ref)
                    local v183 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v185 = l_default_1:isAvailable(l_default_1.CredentialsTypes.iosKeychainPassword, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v184) --[[ Line: 616 ]]
                        -- upvalues: l_default_1 (ref), v183 (copy), l_KeystoreConstants_0 (ref), v55 (ref)
                        if v184 and v184.isAvailable then
                            return l_default_1:getCredentials(l_default_1.CredentialsTypes.iosKeychainPassword, v183, l_KeystoreConstants_0.KeystoreTimeout);
                        else
                            return v55.resolve(nil);
                        end;
                    end);
                    if l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 then
                        if v61 then
                            return v185();
                        else
                            v185();
                            return v55.resolve(nil);
                        end;
                    else
                        return l_default_1:getCredentials(l_default_1.CredentialsTypes.iosKeychainPassword, v183, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end;
                local function v190() --[[ Line: 645 ]] --[[ Name: getKeystoreCredentials ]]
                    -- upvalues: l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_KeystoreConstants_0 (ref), v55 (ref), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
                    local v187 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v189 = l_default_1:isAvailable(l_default_1.CredentialsTypes.keystore, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v188) --[[ Line: 652 ]]
                        -- upvalues: l_default_1 (ref), v187 (copy), l_KeystoreConstants_0 (ref), v55 (ref)
                        if v188 and v188.keystore and v188.keystore.isAvailable then
                            return l_default_1:getCredentials(l_default_1.CredentialsTypes.keystore, v187, l_KeystoreConstants_0.KeystoreTimeout);
                        else
                            return v55.resolve(nil);
                        end;
                    end);
                    if l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 or l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return v189;
                    else
                        return l_default_1:getCredentials(l_default_1.CredentialsTypes.keystore, v187, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end;
                local function v194(v191, v192) --[[ Line: 682 ]] --[[ Name: loginCallback ]]
                    -- upvalues: v40 (ref)
                    return function(v193) --[[ Line: 683 ]]
                        -- upvalues: v40 (ref), v191 (copy), v192 (copy)
                        return v193:dispatch(v40(v191, v192.username, v192.password, nil, nil, nil, nil, nil, false));
                    end;
                end;
                local function _() --[[ Line: 700 ]]
                    -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v37 (ref), v158 (copy), v190 (copy), v194 (copy), v165 (copy), v186 (copy)
                    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        return v37(v158, v190, v194)(v165);
                    else
                        return v37(v158, v186, v194)(v165);
                    end;
                end;
                (if l_GetFFlagKeystoreAutoLoginAvailable_0() then v37(v158, v190, v194)(v165) else v37(v158, v186, v194)(v165)):andThen(function(v196) --[[ Line: 715 ]]
                    -- upvalues: v171 (ref), v10 (ref), v158 (copy), v159 (copy), v160 (copy), v161 (copy), v167 (copy), v169 (copy), v170 (copy), v165 (copy), v62 (ref), v20 (ref), v164 (copy)
                    if v196.loginResult then
                        v171 = true;
                        v10.setAccountBlob(v196.loginResult.accountBlob);
                        v10.flush();
                        launchApp(v158, v159, v160, v161, nil, v167, v169, v170, v171)(v165);
                        return;
                    elseif v62 then
                        local l_credentials_0 = v196.credentials;
                        local l_credentialsValidForLogin_0 = v196.credentialsValidForLogin;
                        local l_redirectToLoginPage_0 = v196.redirectToLoginPage;
                        v20(false, v165, v158, v164, nil, l_credentials_0, l_credentialsValidForLogin_0, l_redirectToLoginPage_0);
                        return;
                    else
                        local l_credentials_1 = v196.credentials;
                        local l_credentialsValidForLogin_1 = v196.credentialsValidForLogin;
                        v20(false, v165, v158, v164, nil, l_credentials_1, l_credentialsValidForLogin_1, false);
                        return;
                    end;
                end):catch(function(v202) --[[ Line: 749 ]]
                    -- upvalues: v20 (ref), v165 (copy), v158 (copy), v164 (copy)
                    local l_credentials_2 = v202.credentials;
                    local l_credentialsValidForLogin_2 = v202.credentialsValidForLogin;
                    local l_redirectToLoginPage_1 = v202.redirectToLoginPage;
                    v20(false, v165, v158, v164, nil, l_credentials_2, l_credentialsValidForLogin_2, l_redirectToLoginPage_1);
                end);
            else
                v20(false, v165, v158, v164, nil, nil, nil, false);
            end;
        end;
    else
        v47(v158, v163, v164, false, v165, v166, function() --[[ Line: 767 ]]
            -- upvalues: v165 (copy), v9 (ref), v158 (copy), v159 (copy), v160 (copy), v161 (copy), v167 (copy), v169 (copy), v170 (copy)
            return v165:dispatch(v9(v158, v159, v160, v161, v167, v169, v170));
        end, v167, v168, false);
    end;
end;
launchApp = function(v207, v208, v209, v210, v211, v212, v213, v214, v215) --[[ Line: 796 ]]
    -- upvalues: v8 (copy), v4 (copy), v11 (copy), l_SetLaunchContext_0 (copy), v59 (copy), l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetCredentialsAvailabilityStore_0 (copy), l_parseCredentialsProtocolIsAvailableResponse_0 (copy), l_Logger_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v28 (copy), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (copy), v10 (copy), l_authPageload_0 (copy), v14 (copy), v15 (copy), v206 (copy), l_PostSignUpAttribution_0 (copy), v48 (copy), v13 (copy), v157 (copy), v81 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (copy), l_AccountSwitcherConstants_0 (copy), v21 (copy)
    return function(v216) --[[ Line: 807 ]]
        -- upvalues: v215 (ref), v8 (ref), v207 (copy), v4 (ref), v11 (ref), l_SetLaunchContext_0 (ref), v211 (copy), v59 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_GetCredentialsAvailabilityStore_0 (ref), l_parseCredentialsProtocolIsAvailableResponse_0 (ref), l_Logger_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v28 (ref), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (ref), v10 (ref), l_authPageload_0 (ref), v14 (ref), v15 (ref), v206 (ref), v208 (copy), v209 (copy), v210 (copy), v212 (copy), v213 (copy), v214 (copy), l_PostSignUpAttribution_0 (ref), v48 (ref), v13 (ref), v157 (ref), v81 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (ref), l_AccountSwitcherConstants_0 (ref), v21 (ref)
        v215 = v215 or false;
        local v217 = v8(v207);
        local v218 = v4.fromLocalStorage();
        local l_Home_0 = v11.Home;
        v216:dispatch(l_SetLaunchContext_0(v211));
        if v59 then
            l_default_1:isAvailable(l_default_1.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v220) --[[ Line: 823 ]]
                -- upvalues: l_GetCredentialsAvailabilityStore_0 (ref), l_parseCredentialsProtocolIsAvailableResponse_0 (ref)
                local v221 = l_GetCredentialsAvailabilityStore_0(false);
                local v222 = l_parseCredentialsProtocolIsAvailableResponse_0(v220);
                v221.setFido2Available(v222.fido2Available);
                v221.setFido2SupportsDeviceBoundOnly(v222.fido2SupportsDeviceBoundOnly);
                v221.setPasswordsAvailable(v222.passwordsAvailable);
                v221.setV2InterfaceSupported(v222.v2InterfaceSupported);
            end):catch(function(_) --[[ Line: 834 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error prefetching CredentialsProtocol:isAvailable");
            end);
        end;
        pcall(function() --[[ Line: 839 ]]
            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v211 (ref), v218 (ref)
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LaunchAppThunkInitiatedConfig, 1, {
                launchContext = v211, 
                hasCachedUser = tostring(v218 and v218.userId and v218.userId ~= -1 or false)
            });
        end);
        if v28 and l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 then
            local v224 = v10.getAccountSwitcherAvailableByVariantId();
            l_authPageload_0("launchAppCachedAsValue", (tostring(v224)));
        end;
        if v14.getWebLogin() ~= v15.NotFromWeb then
            l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser(), WebLogin", tick()));
            v4.clearLocalStorage();
            v10.flush();
            v218 = v4.fromLocalStorage();
            local v225 = true;
            if v14.getWebLogin() ~= v15.FromWebBanner then
                v225 = true;
                if v14.getWebLogin() ~= v15.FromWebPlayGame then
                    v225 = v14.getWebLogin() == v15.FromCommandLine;
                end;
            end;
            v206(v207, v208, v209, v210, v225, v218, v217, v216, l_Home_0, v212, false, v213, v214, v215);
        else
            l_PostSignUpAttribution_0.attributeV2(v207, v211);
            if v218.userId ~= -1 then
                l_Logger_0:info(string.format("[%f] LaunchApp::initializeForCachedUser()", tick()));
                if v48() and v211 == v13.Startup then
                    v157(v207, v208, v209, v210, v218, l_Home_0, v216, v217, v212, false, v213, v214);
                else
                    v81(v207, v208, v209, v210, v218, l_Home_0, v216, v217, v212, false, v213, v214);
                end;
            else
                l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser()", tick()));
                local v226 = v211 ~= v13.Startup;
                local v227 = nil;
                if v28 then
                    v227 = v10.getAccountSwitchStatus();
                    if (not not l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 or l_FFlagApplyLaunchContextForNewAccountSwitches_0) and v227 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus or v227 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus or v227 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus then
                        v226 = true;
                        v10.setAccountSwitchStatus("");
                        v10.setAccountSwitchTargetUsername("");
                    elseif not l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 and v227 == v21.Auth.AccountSwitcherSwitchedStatus then
                        v226 = true;
                        v10.setAccountSwitchStatus("");
                        v10.setAccountSwitchTargetUsername("");
                    end;
                    if v10.getSignupActionRequired() == "auth" then
                        v226 = false;
                    end;
                end;
                v206(v207, v208, v209, v210, v226, v218, v217, v216, l_Home_0, v212, false, v213, v214, v215);
            end;
        end;
    end;
end;
return launchApp;
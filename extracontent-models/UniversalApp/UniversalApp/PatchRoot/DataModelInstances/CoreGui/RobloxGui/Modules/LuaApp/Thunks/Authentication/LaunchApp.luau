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
local function v80(v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) --[[ Line: 108 ]] --[[ Name: initializeForCachedUser ]]
    -- upvalues: v10 (copy), v29 (copy), v30 (copy), l_MemStorageService_0 (copy), v16 (copy), v19 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), v9 (copy), v47 (copy)
    v67:setToLocalPlayer();
    local v75 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "";
    local v76 = v10.getAuthenticatedTheme();
    local v77 = false;
    if v75 == "auth" then
        v77 = v29() or v30();
    end;
    if v76 ~= "" and not v77 then
        l_MemStorageService_0:Fire(v16.ThemeUpdate, v76);
    end;
    v19.initializeUserLayers(v67.userId);
    spawn(function() --[[ Line: 143 ]]
        -- upvalues: v69 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v67 (copy), v72 (copy), v7 (ref), v11 (ref), v75 (copy), v29 (ref), v30 (ref), v10 (ref), v68 (copy), v9 (ref), v63 (copy), v64 (copy), v65 (copy), v66 (copy), v71 (copy), v73 (copy), v74 (copy), v47 (ref), v70 (copy)
        v69:dispatch(l_GetLocalUser_0());
        v69:dispatch(l_ReceivedUserCountryCode_0(v67.countryCode));
        if v72 and v67.isUnder13 then
            v69:dispatch(v7({
                {
                    name = v11.UAppBlock
                }
            }));
        elseif v75 == "auth" then
            if v29() or v30() then
                v69:dispatch(v7({
                    {
                        name = v11.AddAuthMethodPage
                    }
                }));
            else
                v10.setSignupActionRequired("");
                v10.flush();
                v69:dispatch(v7({
                    {
                        name = v68
                    }
                }));
            end;
        else
            v69:dispatch(v7({
                {
                    name = v68
                }
            }));
        end;
        local function v78() --[[ Line: 161 ]]
            -- upvalues: v69 (ref), v9 (ref), v63 (ref), v64 (ref), v65 (ref), v66 (ref), v71 (ref), v73 (ref), v74 (ref)
            return v69:dispatch(v9(v63, v64, v65, v66, v71, v73, v74));
        end;
        local _ = v69:dispatch(v9(v63, v64, v65, v66, v71, v73, v74));
        v47(v63, v67, v70, true, v69, v68, v78, v71, v72, true);
    end);
end;
local _ = function(v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94) --[[ Line: 194 ]] --[[ Name: handleNavWithDataLoadAndSessionCheck ]]
    -- upvalues: l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), v29 (copy), v30 (copy), v10 (copy), v9 (copy), v47 (copy)
    spawn(function() --[[ Line: 211 ]]
        -- upvalues: v81 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v82 (copy), v83 (copy), v7 (ref), v11 (ref), v84 (copy), v29 (ref), v30 (ref), v10 (ref), v85 (copy), v9 (ref), v86 (copy), v87 (copy), v88 (copy), v89 (copy), v90 (copy), v91 (copy), v92 (copy), v47 (ref), v94 (copy), v93 (copy)
        v81:dispatch(l_GetLocalUser_0());
        v81:dispatch(l_ReceivedUserCountryCode_0(v82.countryCode));
        if v83 and v82.isUnder13 then
            v81:dispatch(v7({
                {
                    name = v11.UAppBlock
                }
            }));
        elseif v84 == "auth" then
            if v29() or v30() then
                v81:dispatch(v7({
                    {
                        name = v11.AddAuthMethodPage
                    }
                }));
            else
                v10.setSignupActionRequired("");
                v10.flush();
                v81:dispatch(v7({
                    {
                        name = v85
                    }
                }));
            end;
        else
            v81:dispatch(v7({
                {
                    name = v85
                }
            }));
        end;
        local function v95() --[[ Line: 229 ]]
            -- upvalues: v81 (ref), v9 (ref), v86 (ref), v87 (ref), v88 (ref), v89 (ref), v90 (ref), v91 (ref), v92 (ref)
            return v81:dispatch(v9(v86, v87, v88, v89, v90, v91, v92));
        end;
        local _ = v81:dispatch(v9(v86, v87, v88, v89, v90, v91, v92));
        v47(v86, v82, v94, v93, v81, v85, v95, v90, v83, true);
    end);
end;
local function v156(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109) --[[ Line: 262 ]] --[[ Name: initializeForCachedUserV2 ]]
    -- upvalues: v10 (copy), v29 (copy), v30 (copy), l_MemStorageService_0 (copy), v16 (copy), v19 (copy), v9 (copy), v49 (copy), v50 (copy), l_Status_0 (copy), l_GetLocalUser_0 (copy), l_ReceivedUserCountryCode_0 (copy), v7 (copy), v11 (copy), l_handleSessionCheckSuccess_0 (copy), l_handleSessionCheckFailure_0 (copy), v47 (copy)
    v102:setToLocalPlayer();
    local v110 = if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "";
    local v111 = v10.getAuthenticatedTheme();
    local v112 = false;
    if v110 == "auth" then
        v112 = v29() or v30();
    end;
    local v113 = "dark";
    if v111 == "light" or v111 == "dark" then
        v113 = v111;
    end;
    if v112 then
        v113 = "dark";
    end;
    l_MemStorageService_0:Fire(v16.ThemeUpdate, v113);
    v19.initializeUserLayers(v102.userId);
    local function v114() --[[ Line: 306 ]]
        -- upvalues: v104 (copy), v9 (ref), v98 (copy), v99 (copy), v100 (copy), v101 (copy), v106 (copy), v108 (copy), v109 (copy)
        return v104:dispatch(v9(v98, v99, v100, v101, v106, v108, v109));
    end;
    if v49 then
        v50:listenToSessionStatusChange(function(v115) --[[ Line: 321 ]]
            -- upvalues: l_Status_0 (ref), v104 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v102 (copy), v107 (copy), v7 (ref), v11 (ref), v110 (copy), v29 (ref), v30 (ref), v10 (ref), v103 (copy), v9 (ref), v98 (copy), v99 (copy), v100 (copy), v101 (copy), v106 (copy), v108 (copy), v109 (copy), l_handleSessionCheckSuccess_0 (ref), v105 (copy), v114 (copy), l_handleSessionCheckFailure_0 (ref), v47 (ref)
            local l_status_0 = v115.status;
            if l_status_0 == l_Status_0.Success then
                v104:dispatch(l_GetLocalUser_0());
                v104:dispatch(l_ReceivedUserCountryCode_0(v102.countryCode));
                if v107 and v102.isUnder13 then
                    v104:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif v110 == "auth" then
                    if v29() or v30() then
                        v104:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        v104:dispatch(v7({
                            {
                                name = v103
                            }
                        }));
                    end;
                else
                    v104:dispatch(v7({
                        {
                            name = v103
                        }
                    }));
                end;
                local _ = v104:dispatch(v9(v98, v99, v100, v101, v106, v108, v109));
                l_handleSessionCheckSuccess_0(v98, v102, v105, true, v104, v103, v114, v106, v107, true);
                return;
            elseif l_status_0 == l_Status_0.Failed then
                local v118 = v115.httpStatusCode or v115.errorStatus;
                l_handleSessionCheckFailure_0(v118, true, v104, v98, v105, v102, v103, v114);
                return;
            else
                local l_v104_0 = v104;
                local l_v102_0 = v102;
                local l_v107_0 = v107;
                local l_v110_0 = v110;
                local l_v103_0 = v103;
                local l_v98_0 = v98;
                local l_v99_0 = v99;
                local l_v100_0 = v100;
                local l_v101_0 = v101;
                local l_v106_0 = v106;
                local l_v108_0 = v108;
                local l_v109_0 = v109;
                local l_v105_0 = v105;
                local l_spawn_0 = spawn;
                local v133 = true;
                l_spawn_0(function() --[[ Line: 211 ]]
                    -- upvalues: l_v104_0 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), l_v102_0 (copy), l_v107_0 (copy), v7 (ref), v11 (ref), l_v110_0 (copy), v29 (ref), v30 (ref), v10 (ref), l_v103_0 (copy), v9 (ref), l_v98_0 (copy), l_v99_0 (copy), l_v100_0 (copy), l_v101_0 (copy), l_v106_0 (copy), l_v108_0 (copy), l_v109_0 (copy), v47 (ref), l_v105_0 (copy), v133 (copy)
                    l_v104_0:dispatch(l_GetLocalUser_0());
                    l_v104_0:dispatch(l_ReceivedUserCountryCode_0(l_v102_0.countryCode));
                    if l_v107_0 and l_v102_0.isUnder13 then
                        l_v104_0:dispatch(v7({
                            {
                                name = v11.UAppBlock
                            }
                        }));
                    elseif l_v110_0 == "auth" then
                        if v29() or v30() then
                            l_v104_0:dispatch(v7({
                                {
                                    name = v11.AddAuthMethodPage
                                }
                            }));
                        else
                            v10.setSignupActionRequired("");
                            v10.flush();
                            l_v104_0:dispatch(v7({
                                {
                                    name = l_v103_0
                                }
                            }));
                        end;
                    else
                        l_v104_0:dispatch(v7({
                            {
                                name = l_v103_0
                            }
                        }));
                    end;
                    local function v134() --[[ Line: 229 ]]
                        -- upvalues: l_v104_0 (ref), v9 (ref), l_v98_0 (ref), l_v99_0 (ref), l_v100_0 (ref), l_v101_0 (ref), l_v106_0 (ref), l_v108_0 (ref), l_v109_0 (ref)
                        return l_v104_0:dispatch(v9(l_v98_0, l_v99_0, l_v100_0, l_v101_0, l_v106_0, l_v108_0, l_v109_0));
                    end;
                    local _ = l_v104_0:dispatch(v9(l_v98_0, l_v99_0, l_v100_0, l_v101_0, l_v106_0, l_v108_0, l_v109_0));
                    v47(l_v98_0, l_v102_0, l_v105_0, v133, l_v104_0, l_v103_0, v134, l_v106_0, l_v107_0, true);
                end);
                return;
            end;
        end);
        return;
    else
        v50:registerSessionStatusChange();
        v50:waitForSessionCheckTerminalStatus():andThen(function(v136) --[[ Line: 393 ]]
            -- upvalues: l_Status_0 (ref), v104 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v102 (copy), v107 (copy), v7 (ref), v11 (ref), v110 (copy), v29 (ref), v30 (ref), v10 (ref), v103 (copy), v9 (ref), v98 (copy), v99 (copy), v100 (copy), v101 (copy), v106 (copy), v108 (copy), v109 (copy), l_handleSessionCheckSuccess_0 (ref), v105 (copy), v114 (copy), l_handleSessionCheckFailure_0 (ref)
            if v136 and v136.status == l_Status_0.Success then
                v104:dispatch(l_GetLocalUser_0());
                v104:dispatch(l_ReceivedUserCountryCode_0(v102.countryCode));
                if v107 and v102.isUnder13 then
                    v104:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif v110 == "auth" then
                    if v29() or v30() then
                        v104:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        v104:dispatch(v7({
                            {
                                name = v103
                            }
                        }));
                    end;
                else
                    v104:dispatch(v7({
                        {
                            name = v103
                        }
                    }));
                end;
                local _ = v104:dispatch(v9(v98, v99, v100, v101, v106, v108, v109));
                l_handleSessionCheckSuccess_0(v98, v102, v105, true, v104, v103, v114, v106, v107, true);
                return;
            else
                if v136 and v136.status == l_Status_0.Failed then
                    l_handleSessionCheckFailure_0(v136.errorStatus, true, v104, v98, v105, v102, v103, v114);
                end;
                return;
            end;
        end, function(_) --[[ Line: 443 ]]
            -- upvalues: v104 (copy), v102 (copy), v107 (copy), v110 (copy), v103 (copy), v98 (copy), v99 (copy), v100 (copy), v101 (copy), v106 (copy), v108 (copy), v109 (copy), v105 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), v7 (ref), v11 (ref), v29 (ref), v30 (ref), v10 (ref), v9 (ref), v47 (ref)
            local l_v104_1 = v104;
            local l_v102_1 = v102;
            local l_v107_1 = v107;
            local l_v110_1 = v110;
            local l_v103_1 = v103;
            local l_v98_1 = v98;
            local l_v99_1 = v99;
            local l_v100_1 = v100;
            local l_v101_1 = v101;
            local l_v106_1 = v106;
            local l_v108_1 = v108;
            local l_v109_1 = v109;
            local l_v105_1 = v105;
            local l_spawn_1 = spawn;
            local v153 = true;
            l_spawn_1(function() --[[ Line: 211 ]]
                -- upvalues: l_v104_1 (copy), l_GetLocalUser_0 (ref), l_ReceivedUserCountryCode_0 (ref), l_v102_1 (copy), l_v107_1 (copy), v7 (ref), v11 (ref), l_v110_1 (copy), v29 (ref), v30 (ref), v10 (ref), l_v103_1 (copy), v9 (ref), l_v98_1 (copy), l_v99_1 (copy), l_v100_1 (copy), l_v101_1 (copy), l_v106_1 (copy), l_v108_1 (copy), l_v109_1 (copy), v47 (ref), l_v105_1 (copy), v153 (copy)
                l_v104_1:dispatch(l_GetLocalUser_0());
                l_v104_1:dispatch(l_ReceivedUserCountryCode_0(l_v102_1.countryCode));
                if l_v107_1 and l_v102_1.isUnder13 then
                    l_v104_1:dispatch(v7({
                        {
                            name = v11.UAppBlock
                        }
                    }));
                elseif l_v110_1 == "auth" then
                    if v29() or v30() then
                        l_v104_1:dispatch(v7({
                            {
                                name = v11.AddAuthMethodPage
                            }
                        }));
                    else
                        v10.setSignupActionRequired("");
                        v10.flush();
                        l_v104_1:dispatch(v7({
                            {
                                name = l_v103_1
                            }
                        }));
                    end;
                else
                    l_v104_1:dispatch(v7({
                        {
                            name = l_v103_1
                        }
                    }));
                end;
                local function v154() --[[ Line: 229 ]]
                    -- upvalues: l_v104_1 (ref), v9 (ref), l_v98_1 (ref), l_v99_1 (ref), l_v100_1 (ref), l_v101_1 (ref), l_v106_1 (ref), l_v108_1 (ref), l_v109_1 (ref)
                    return l_v104_1:dispatch(v9(l_v98_1, l_v99_1, l_v100_1, l_v101_1, l_v106_1, l_v108_1, l_v109_1));
                end;
                local _ = l_v104_1:dispatch(v9(l_v98_1, l_v99_1, l_v100_1, l_v101_1, l_v106_1, l_v108_1, l_v109_1));
                v47(l_v98_1, l_v102_1, l_v105_1, v153, l_v104_1, l_v103_1, v154, l_v106_1, l_v107_1, true);
            end);
        end);
        return;
    end;
end;
local function v198(v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170) --[[ Line: 465 ]] --[[ Name: handleNoCachedUser ]]
    -- upvalues: v12 (copy), v9 (copy), v47 (copy), v10 (copy), v7 (copy), v11 (copy), l_CheckForAndFireValidCookieForNoCachedUserEvent_0 (copy), l_default_0 (copy), v23 (copy), v35 (copy), l_GetFFlagKeystoreAutoLoginAvailable_0 (copy), v20 (copy), l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_KeystoreConstants_0 (copy), v55 (copy), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (copy), v61 (copy), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), v40 (copy), v37 (copy), v62 (copy)
    v170 = v170 or false;
    if v12.LuaAppLoginUIEnabled() and v161 then
        v47(v157, v162, v163, false, v164, v165, function() --[[ Line: 488 ]]
            -- upvalues: v164 (copy), v9 (ref), v157 (copy), v158 (copy), v159 (copy), v160 (copy), v166 (copy), v168 (copy), v169 (copy)
            return v164:dispatch(v9(v157, v158, v159, v160, v166, v168, v169));
        end, v166, v167, false);
    elseif v12.LuaAppLoginUIEnabled() then
        if (if game:GetEngineFeature("SignupActionRequiredKeyAvailable") then v10.getSignupActionRequired() else "") == "auth" then
            v164:dispatch(v7({
                {
                    name = v11.AddAuthMethodPage
                }
            }));
            return;
        else
            spawn(function() --[[ Line: 531 ]]
                -- upvalues: v164 (copy), l_CheckForAndFireValidCookieForNoCachedUserEvent_0 (ref), v157 (copy), l_default_0 (ref), v23 (ref)
                v164:dispatch(l_CheckForAndFireValidCookieForNoCachedUserEvent_0(v157, l_default_0, v23));
            end);
            if (v35 or l_GetFFlagKeystoreAutoLoginAvailable_0()) and not v170 then
                local function _(v171, v172, v173) --[[ Line: 552 ]] --[[ Name: handleResetOnNoAccountInfoFound ]]
                    -- upvalues: v20 (ref), v164 (copy), v157 (copy), v163 (copy)
                    v20(false, v164, v157, v163, nil, v171, v172, v173);
                end;
                local function v178() --[[ Line: 570 ]] --[[ Name: getIosKeychainCredentials ]]
                    -- upvalues: l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_KeystoreConstants_0 (ref), v55 (ref), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (ref), v61 (ref)
                    local v175 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v177 = l_default_1:isAvailable(l_default_1.CredentialsTypes.iosKeychainPassword, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v176) --[[ Line: 578 ]]
                        -- upvalues: l_default_1 (ref), v175 (copy), l_KeystoreConstants_0 (ref), v55 (ref)
                        if v176 and v176.isAvailable then
                            return l_default_1:getCredentials(l_default_1.CredentialsTypes.iosKeychainPassword, v175, l_KeystoreConstants_0.KeystoreTimeout);
                        else
                            return v55.resolve(nil);
                        end;
                    end);
                    if l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 then
                        if v61 then
                            return v177();
                        else
                            v177();
                            return v55.resolve(nil);
                        end;
                    else
                        return l_default_1:getCredentials(l_default_1.CredentialsTypes.iosKeychainPassword, v175, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end;
                local function v182() --[[ Line: 607 ]] --[[ Name: getKeystoreCredentials ]]
                    -- upvalues: l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_KeystoreConstants_0 (ref), v55 (ref), l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 (ref), l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (ref)
                    local v179 = l_HttpService_0:JSONEncode({
                        server = l_ContentProvider_0.BaseUrl
                    });
                    local v181 = l_default_1:isAvailable(l_default_1.CredentialsTypes.keystore, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v180) --[[ Line: 614 ]]
                        -- upvalues: l_default_1 (ref), v179 (copy), l_KeystoreConstants_0 (ref), v55 (ref)
                        if v180 and v180.keystore and v180.keystore.isAvailable then
                            return l_default_1:getCredentials(l_default_1.CredentialsTypes.keystore, v179, l_KeystoreConstants_0.KeystoreTimeout);
                        else
                            return v55.resolve(nil);
                        end;
                    end);
                    if l_FFlagUseIsAvailableCheckForIOSKeychainFetch_0 or l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
                        return v181;
                    else
                        return l_default_1:getCredentials(l_default_1.CredentialsTypes.keystore, v179, l_KeystoreConstants_0.KeystoreTimeout);
                    end;
                end;
                local function v186(v183, v184) --[[ Line: 644 ]] --[[ Name: loginCallback ]]
                    -- upvalues: v40 (ref)
                    return function(v185) --[[ Line: 645 ]]
                        -- upvalues: v40 (ref), v183 (copy), v184 (copy)
                        return v185:dispatch(v40(v183, v184.username, v184.password, nil, nil, nil, nil, nil, false));
                    end;
                end;
                local function _() --[[ Line: 662 ]]
                    -- upvalues: l_GetFFlagKeystoreAutoLoginAvailable_0 (ref), v37 (ref), v157 (copy), v182 (copy), v186 (copy), v164 (copy), v178 (copy)
                    if l_GetFFlagKeystoreAutoLoginAvailable_0() then
                        return v37(v157, v182, v186)(v164);
                    else
                        return v37(v157, v178, v186)(v164);
                    end;
                end;
                (if l_GetFFlagKeystoreAutoLoginAvailable_0() then v37(v157, v182, v186)(v164) else v37(v157, v178, v186)(v164)):andThen(function(v188) --[[ Line: 677 ]]
                    -- upvalues: v170 (ref), v10 (ref), v157 (copy), v158 (copy), v159 (copy), v160 (copy), v166 (copy), v168 (copy), v169 (copy), v164 (copy), v62 (ref), v20 (ref), v163 (copy)
                    if v188.loginResult then
                        v170 = true;
                        v10.setAccountBlob(v188.loginResult.accountBlob);
                        v10.flush();
                        launchApp(v157, v158, v159, v160, nil, v166, v168, v169, v170)(v164);
                        return;
                    elseif v62 then
                        local l_credentials_0 = v188.credentials;
                        local l_credentialsValidForLogin_0 = v188.credentialsValidForLogin;
                        local l_redirectToLoginPage_0 = v188.redirectToLoginPage;
                        v20(false, v164, v157, v163, nil, l_credentials_0, l_credentialsValidForLogin_0, l_redirectToLoginPage_0);
                        return;
                    else
                        local l_credentials_1 = v188.credentials;
                        local l_credentialsValidForLogin_1 = v188.credentialsValidForLogin;
                        v20(false, v164, v157, v163, nil, l_credentials_1, l_credentialsValidForLogin_1, false);
                        return;
                    end;
                end):catch(function(v194) --[[ Line: 711 ]]
                    -- upvalues: v20 (ref), v164 (copy), v157 (copy), v163 (copy)
                    local l_credentials_2 = v194.credentials;
                    local l_credentialsValidForLogin_2 = v194.credentialsValidForLogin;
                    local l_redirectToLoginPage_1 = v194.redirectToLoginPage;
                    v20(false, v164, v157, v163, nil, l_credentials_2, l_credentialsValidForLogin_2, l_redirectToLoginPage_1);
                end);
            else
                v20(false, v164, v157, v163, nil, nil, nil, false);
            end;
        end;
    else
        v47(v157, v162, v163, false, v164, v165, function() --[[ Line: 729 ]]
            -- upvalues: v164 (copy), v9 (ref), v157 (copy), v158 (copy), v159 (copy), v160 (copy), v166 (copy), v168 (copy), v169 (copy)
            return v164:dispatch(v9(v157, v158, v159, v160, v166, v168, v169));
        end, v166, v167, false);
    end;
end;
launchApp = function(v199, v200, v201, v202, v203, v204, v205, v206, v207) --[[ Line: 758 ]]
    -- upvalues: v8 (copy), v4 (copy), v11 (copy), l_SetLaunchContext_0 (copy), v59 (copy), l_default_1 (copy), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (copy), l_GetCredentialsAvailabilityStore_0 (copy), l_parseCredentialsProtocolIsAvailableResponse_0 (copy), l_Logger_0 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v28 (copy), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (copy), v10 (copy), l_authPageload_0 (copy), v14 (copy), v15 (copy), v198 (copy), l_PostSignUpAttribution_0 (copy), v48 (copy), v13 (copy), v156 (copy), v80 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (copy), l_AccountSwitcherConstants_0 (copy), v21 (copy)
    return function(v208) --[[ Line: 769 ]]
        -- upvalues: v207 (ref), v8 (ref), v199 (copy), v4 (ref), v11 (ref), l_SetLaunchContext_0 (ref), v203 (copy), v59 (ref), l_default_1 (ref), l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0 (ref), l_GetCredentialsAvailabilityStore_0 (ref), l_parseCredentialsProtocolIsAvailableResponse_0 (ref), l_Logger_0 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v28 (ref), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (ref), v10 (ref), l_authPageload_0 (ref), v14 (ref), v15 (ref), v198 (ref), v200 (copy), v201 (copy), v202 (copy), v204 (copy), v205 (copy), v206 (copy), l_PostSignUpAttribution_0 (ref), v48 (ref), v13 (ref), v156 (ref), v80 (ref), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (ref), l_FFlagApplyLaunchContextForNewAccountSwitches_0 (ref), l_AccountSwitcherConstants_0 (ref), v21 (ref)
        v207 = v207 or false;
        local v209 = v8(v199);
        local v210 = v4.fromLocalStorage();
        local l_Home_0 = v11.Home;
        v208:dispatch(l_SetLaunchContext_0(v203));
        if v59 then
            l_default_1:isAvailable(l_default_1.CredentialsTypes.all, l_GetFIntLuaAppCredentialsProtocolAvailableTimeout_0()):andThen(function(v212) --[[ Line: 785 ]]
                -- upvalues: l_GetCredentialsAvailabilityStore_0 (ref), l_parseCredentialsProtocolIsAvailableResponse_0 (ref)
                local v213 = l_GetCredentialsAvailabilityStore_0(false);
                local v214 = l_parseCredentialsProtocolIsAvailableResponse_0(v212);
                v213.setFido2Available(v214.fido2Available);
                v213.setFido2SupportsDeviceBoundOnly(v214.fido2SupportsDeviceBoundOnly);
                v213.setPasswordsAvailable(v214.passwordsAvailable);
                v213.setV2InterfaceSupported(v214.v2InterfaceSupported);
            end):catch(function(_) --[[ Line: 796 ]]
                -- upvalues: l_Logger_0 (ref)
                l_Logger_0:warning("Error prefetching CredentialsProtocol:isAvailable");
            end);
        end;
        pcall(function() --[[ Line: 801 ]]
            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v203 (ref), v210 (ref)
            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LaunchAppThunkInitiatedConfig, 1, {
                launchContext = v203, 
                hasCachedUser = tostring(v210 and v210.userId and v210.userId ~= -1 or false)
            });
        end);
        if v28 and l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 then
            local v216 = v10.getAccountSwitcherAvailableByVariantId();
            l_authPageload_0("launchAppCachedAsValue", (tostring(v216)));
        end;
        if v14.getWebLogin() ~= v15.NotFromWeb then
            l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser(), WebLogin", tick()));
            v4.clearLocalStorage();
            v10.flush();
            v210 = v4.fromLocalStorage();
            local v217 = true;
            if v14.getWebLogin() ~= v15.FromWebBanner then
                v217 = true;
                if v14.getWebLogin() ~= v15.FromWebPlayGame then
                    v217 = v14.getWebLogin() == v15.FromCommandLine;
                end;
            end;
            v198(v199, v200, v201, v202, v217, v210, v209, v208, l_Home_0, v204, false, v205, v206, v207);
        else
            l_PostSignUpAttribution_0.attributeV2(v199, v203);
            if v210.userId ~= -1 then
                l_Logger_0:info(string.format("[%f] LaunchApp::initializeForCachedUser()", tick()));
                if v48() and v203 == v13.Startup then
                    v156(v199, v200, v201, v202, v210, l_Home_0, v208, v209, v204, false, v205, v206);
                else
                    v80(v199, v200, v201, v202, v210, l_Home_0, v208, v209, v204, false, v205, v206);
                end;
            else
                l_Logger_0:info(string.format("[%f] LaunchApp::handleNoCachedUser()", tick()));
                local v218 = v203 ~= v13.Startup;
                local v219 = nil;
                if v28 then
                    v219 = v10.getAccountSwitchStatus();
                    if (not not l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 or l_FFlagApplyLaunchContextForNewAccountSwitches_0) and v219 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus or v219 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus or v219 == l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus then
                        v218 = true;
                        v10.setAccountSwitchStatus("");
                        v10.setAccountSwitchTargetUsername("");
                    elseif not l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 and v219 == v21.Auth.AccountSwitcherSwitchedStatus then
                        v218 = true;
                        v10.setAccountSwitchStatus("");
                        v10.setAccountSwitchTargetUsername("");
                    end;
                    if v10.getSignupActionRequired() == "auth" then
                        v218 = false;
                    end;
                end;
                v198(v199, v200, v201, v202, v218, v210, v209, v208, l_Home_0, v204, false, v205, v206, v207);
            end;
        end;
    end;
end;
return launchApp;
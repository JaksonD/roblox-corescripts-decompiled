local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MessageBusService_0 = game:GetService("MessageBusService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingSpinner_0 = v4.App.Loading.LoadingSpinner;
local l_IconSize_0 = v4.App.Constant.IconSize;
local v7 = require(l_Modules_0.LuaApp.AppPage);
local v8 = require(l_Modules_0.LuaApp.Thunks.Authentication.LoginSingleSignOn);
local v9 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.reportEphemeralCounter);
local v11 = require(l_Modules_0.LuaApp.Analytics.Events.AppLoginCounterNames);
local v12 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v13 = require(l_Modules_0.LuaApp.Components.Authentication.Logger);
local v14 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v16 = require(l_Modules_0.LuaApp.Promise);
local v17 = require(l_Modules_0.LuaApp.Actions.Authentication.SetLoginResult);
local v18 = require(l_Modules_0.LuaApp.Enum.LoginErrorCodeSSO);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v21 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v22 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useEarlyIsFocused_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useEarlyIsFocused;
local v26 = require(script.Parent.Flags.FFlagSSOLoggingProtocolEnabled);
local v27 = game:DefineFastFlag("SingleSignOnError", false);
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_game_EngineFeature_0 = game:GetEngineFeature("PreauthPassToLuaFeature");
local function v35(v30, v31, v32, v33, v34) --[[ Line: 45 ]] --[[ Name: handleLoginResult ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v17 (copy), v10 (copy), v11 (copy), v26 (copy), v9 (copy), v12 (copy), v14 (copy)
    if l_game_EngineFeature_0 then
        if v30 then
            v32(v17(v30));
        end;
    else
        v32(v17(v30));
    end;
    v10(v11.Success, 1);
    if v26 then
        v32(v9(v31, nil, v33, v34, v12.Login, v14.default));
        return;
    else
        v32(v9(v31, nil, v33, v34));
        return;
    end;
end;
local function v49(v36, v37, v38, v39, v40, v41) --[[ Line: 61 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_MessageBusService_0 (copy), v13 (copy), v35 (copy), v16 (copy), v8 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v18 (copy)
    if l_game_EngineFeature_0 then
        l_MessageBusService_0:MakeRequest("Account", "consumePreauthStatus", {}, function(v42) --[[ Line: 63 ]]
            -- upvalues: v13 (ref), v35 (ref), v37 (copy), v36 (copy), v38 (copy), v39 (copy), v16 (ref), v8 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v18 (ref), v40 (copy), v41 (copy)
            if v42 and v42.success then
                v13:error("Detected preauth successful, skipping Lua SSO.");
                v35(nil, v37, v36, v38, v39);
                return v16.resolve();
            else
                return v36(v8(v37)):andThen(function(v43) --[[ Line: 70 ]]
                    -- upvalues: v35 (ref), v37 (ref), v36 (ref), v38 (ref), v39 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v16 (ref)
                    if v43 then
                        v35(v43, v37, v36, v38, v39);
                        spawn(function() --[[ Line: 74 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "success"
                            });
                        end);
                    end;
                    return v16.resolve();
                end, function(v44) --[[ Line: 85 ]]
                    -- upvalues: v13 (ref), v18 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v40 (ref), v16 (ref), v41 (ref)
                    local l_errorCode_0 = v44.errorCode;
                    v13:warning(string.format("Single sign on failed error: %s", (tostring(l_errorCode_0))));
                    if l_errorCode_0 and (l_errorCode_0 == v18.NoAccountConnected or l_errorCode_0 == v18.NoAccountConnectedXbox) then
                        pcall(function() --[[ Line: 96 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "noAccountFailure"
                            });
                        end);
                        v40();
                        return v16.resolve();
                    else
                        pcall(function() --[[ Line: 110 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "otherFailure"
                            });
                        end);
                        v41();
                        return v16.reject(v44);
                    end;
                end);
            end;
        end, {});
        return v16.resolve();
    else
        return v36(v8(v37)):andThen(function(v46) --[[ Line: 126 ]]
            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v35 (ref), v37 (copy), v36 (copy), v38 (copy), v39 (copy), v16 (ref)
            if v46 then
                pcall(function() --[[ Line: 128 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "success"
                    });
                end);
                v35(v46, v37, v36, v38, v39);
            end;
            return v16.resolve();
        end, function(v47) --[[ Line: 141 ]]
            -- upvalues: v13 (ref), v18 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v40 (copy), v16 (ref), v41 (copy)
            local l_errorCode_1 = v47.errorCode;
            v13:warning(string.format("Single sign on failed error: %s", (tostring(l_errorCode_1))));
            if l_errorCode_1 and (l_errorCode_1 == v18.NoAccountConnected or v18.NoAccountConnectedXbox) then
                pcall(function() --[[ Line: 149 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "noAccountFailure"
                    });
                end);
                v40();
                return v16.resolve();
            else
                pcall(function() --[[ Line: 163 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "otherFailure"
                    });
                end);
                v41();
                return v16.reject(v47);
            end;
        end);
    end;
end;
local function v51(v50) --[[ Line: 179 ]]
    return v50;
end;
return function(_) --[[ Line: 183 ]] --[[ Name: SingleSignOnContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v21 (copy), v19 (copy), v20 (copy), v22 (copy), v51 (copy), v3 (copy), v7 (copy), v27 (copy), l_useEarlyIsFocused_0 (copy), l_default_0 (copy), v49 (copy), v16 (copy), l_LoadingSpinner_0 (copy), l_IconSize_0 (copy)
    local v53 = l_useNavigation_0();
    local v54 = l_useDispatch_0();
    local v55 = v21(v19);
    local v56 = v21(v20);
    local v57 = v22(v51);
    local v58 = v3.useCallback(function() --[[ Line: 190 ]]
        -- upvalues: v53 (copy), v7 (ref)
        return v53.replace(v7.Landing);
    end, {
        v53
    });
    local v59 = v3.useCallback(function() --[[ Line: 194 ]]
        -- upvalues: v53 (copy), v27 (ref), v7 (ref)
        return v53.navigate(if v27 then v7.SingleSignOnError else v7.EngagementScreenContainer);
    end, {
        v53
    });
    local v60 = l_useEarlyIsFocused_0();
    v3.useEffect(function() --[[ Line: 202 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:logEventOnce("single_sign_on_container_page_did_mount");
    end, {});
    v3.useEffect(function() --[[ Line: 206 ]]
        -- upvalues: v60 (copy), v49 (ref), v54 (copy), v55 (copy), v56 (copy), v57 (copy), v58 (copy), v59 (copy), v16 (ref)
        if v60 then
            v49(v54, v55, v56, v57, v58, v59):andThen(function(_) --[[ Line: 208 ]]
                -- upvalues: v16 (ref)
                return v16.resolve();
            end, function(_) --[[ Line: 210 ]]
                -- upvalues: v16 (ref)
                return v16.resolve();
            end);
        end;
    end, {
        v60
    });
    return v3.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ZIndex = 1
    }, {
        LoadingBar = v3.createElement(l_LoadingSpinner_0, {
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5), 
            size = UDim2.fromOffset(l_IconSize_0.Large, l_IconSize_0.Large)
        })
    });
end;
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
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local l_game_EngineFeature_0 = game:GetEngineFeature("PreauthPassToLuaFeature");
local function v34(v29, v30, v31, v32, v33) --[[ Line: 44 ]] --[[ Name: handleLoginResult ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v17 (copy), v10 (copy), v11 (copy), v26 (copy), v9 (copy), v12 (copy), v14 (copy)
    if l_game_EngineFeature_0 then
        if v29 then
            v31(v17(v29));
        end;
    else
        v31(v17(v29));
    end;
    v10(v11.Success, 1);
    if v26 then
        v31(v9(v30, nil, v32, v33, v12.Login, v14.default));
        return;
    else
        v31(v9(v30, nil, v32, v33));
        return;
    end;
end;
local function v48(v35, v36, v37, v38, v39, v40) --[[ Line: 60 ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_MessageBusService_0 (copy), v13 (copy), v34 (copy), v16 (copy), v8 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v18 (copy)
    if l_game_EngineFeature_0 then
        l_MessageBusService_0:MakeRequest("Account", "consumePreauthStatus", {}, function(v41) --[[ Line: 62 ]]
            -- upvalues: v13 (ref), v34 (ref), v36 (copy), v35 (copy), v37 (copy), v38 (copy), v16 (ref), v8 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v18 (ref), v39 (copy), v40 (copy)
            if v41 and v41.success then
                v13:error("Detected preauth successful, skipping Lua SSO.");
                v34(nil, v36, v35, v37, v38);
                return v16.resolve();
            else
                return v35(v8(v36)):andThen(function(v42) --[[ Line: 69 ]]
                    -- upvalues: v34 (ref), v36 (ref), v35 (ref), v37 (ref), v38 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v16 (ref)
                    if v42 then
                        v34(v42, v36, v35, v37, v38);
                        spawn(function() --[[ Line: 73 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "success"
                            });
                        end);
                    end;
                    return v16.resolve();
                end, function(v43) --[[ Line: 84 ]]
                    -- upvalues: v13 (ref), v18 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v39 (ref), v16 (ref), v40 (ref)
                    local l_errorCode_0 = v43.errorCode;
                    v13:warning(string.format("Single sign on failed error: %s", (tostring(l_errorCode_0))));
                    if l_errorCode_0 and (l_errorCode_0 == v18.NoAccountConnected or l_errorCode_0 == v18.NoAccountConnectedXbox) then
                        pcall(function() --[[ Line: 95 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "noAccountFailure"
                            });
                        end);
                        v39();
                        return v16.resolve();
                    else
                        pcall(function() --[[ Line: 109 ]]
                            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                            l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                                status = "otherFailure"
                            });
                        end);
                        v40();
                        return v16.reject(v43);
                    end;
                end);
            end;
        end, {});
        return v16.resolve();
    else
        return v35(v8(v36)):andThen(function(v45) --[[ Line: 125 ]]
            -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v34 (ref), v36 (copy), v35 (copy), v37 (copy), v38 (copy), v16 (ref)
            if v45 then
                pcall(function() --[[ Line: 127 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "success"
                    });
                end);
                v34(v45, v36, v35, v37, v38);
            end;
            return v16.resolve();
        end, function(v46) --[[ Line: 140 ]]
            -- upvalues: v13 (ref), v18 (ref), l_default_0 (ref), l_TelemetryConfigs_0 (ref), v39 (copy), v16 (ref), v40 (copy)
            local l_errorCode_1 = v46.errorCode;
            v13:warning(string.format("Single sign on failed error: %s", (tostring(l_errorCode_1))));
            if l_errorCode_1 and (l_errorCode_1 == v18.NoAccountConnected or v18.NoAccountConnectedXbox) then
                pcall(function() --[[ Line: 148 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "noAccountFailure"
                    });
                end);
                v39();
                return v16.resolve();
            else
                pcall(function() --[[ Line: 162 ]]
                    -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref)
                    l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.ConsoleSSOAttemptedTelemetryConfig, 1, {
                        status = "otherFailure"
                    });
                end);
                v40();
                return v16.reject(v46);
            end;
        end);
    end;
end;
local function v50(v49) --[[ Line: 178 ]]
    return v49;
end;
return function(_) --[[ Line: 182 ]] --[[ Name: SingleSignOnContainer ]]
    -- upvalues: l_useNavigation_0 (copy), l_useDispatch_0 (copy), v21 (copy), v19 (copy), v20 (copy), v22 (copy), v50 (copy), v3 (copy), v7 (copy), l_useEarlyIsFocused_0 (copy), l_default_0 (copy), v48 (copy), v16 (copy), l_LoadingSpinner_0 (copy), l_IconSize_0 (copy)
    local v52 = l_useNavigation_0();
    local v53 = l_useDispatch_0();
    local v54 = v21(v19);
    local v55 = v21(v20);
    local v56 = v22(v50);
    local v57 = v3.useCallback(function() --[[ Line: 189 ]]
        -- upvalues: v52 (copy), v7 (ref)
        return v52.replace(v7.Landing);
    end, {
        v52
    });
    local v58 = v3.useCallback(function() --[[ Line: 193 ]]
        -- upvalues: v52 (copy), v7 (ref)
        return v52.navigate(v7.SingleSignOnError);
    end, {
        v52
    });
    local v59 = l_useEarlyIsFocused_0();
    v3.useEffect(function() --[[ Line: 199 ]]
        -- upvalues: l_default_0 (ref)
        l_default_0:logEventOnce("single_sign_on_container_page_did_mount");
    end, {});
    v3.useEffect(function() --[[ Line: 203 ]]
        -- upvalues: v59 (copy), v48 (ref), v53 (copy), v54 (copy), v55 (copy), v56 (copy), v57 (copy), v58 (copy), v16 (ref)
        if v59 then
            v48(v53, v54, v55, v56, v57, v58):andThen(function(_) --[[ Line: 205 ]]
                -- upvalues: v16 (ref)
                return v16.resolve();
            end, function(_) --[[ Line: 207 ]]
                -- upvalues: v16 (ref)
                return v16.resolve();
            end);
        end;
    end, {
        v59
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
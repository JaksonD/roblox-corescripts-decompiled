local l_IXPService_0 = game:GetService("IXPService");
local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v9 = require(l_Modules_0.LuaApp.Thunks.WaitUntilIXPUserInit);
local v10 = require(l_CorePackages_0.Workspace.Packages.NotificationsUpsell);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_CorePackages_0.Workspace.Packages.AppStartup);
local l_useLaunchContext_0 = v13.Hooks.useLaunchContext;
local l_LaunchContext_0 = v13.Enums.LaunchContext;
local l_GetFStringPushUpsellVariantName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringPushUpsellVariantName;
local l_GetFStringPushUpsellOnFirstTimeVariantName_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringPushUpsellOnFirstTimeVariantName;
local l_GetFFlagLuaAppPushSystemUpsellDevOverride_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppPushSystemUpsellDevOverride;
local l_GetFFlagLuaAppEnablePushUpsellOnFirstTime_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnablePushUpsellOnFirstTime;
local l_setupPushNotificationsUpsell_0 = v10.setupPushNotificationsUpsell;
local l_NotificationsUpsellConstants_0 = v10.NotificationsUpsellConstants;
local l_PushUpsellEventConfig_0 = v10.PushUpsellEventConfig;
local l_ModalEventConstants_0 = v10.ModalEventConstants;
return function(_) --[[ Line: 35 ]] --[[ Name: CheckForPushNotificationsUpsell ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLaunchContext_0 (copy), v4 (copy), l_LaunchContext_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_GetFStringPushUpsellVariantName_0 (copy), l_GetFStringPushUpsellOnFirstTimeVariantName_0 (copy), l_useSelector_0 (copy), v12 (copy), l_Players_0 (copy), v9 (copy), l_IXPService_0 (copy), l_GetFFlagLuaAppPushSystemUpsellDevOverride_0 (copy), l_GetFFlagLuaAppEnablePushUpsellOnFirstTime_0 (copy), l_setupPushNotificationsUpsell_0 (copy), l_NotificationsUpsellConstants_0 (copy), l_ModalEventConstants_0 (copy), l_default_0 (copy), l_PushUpsellEventConfig_0 (copy)
    local v25 = l_useDispatch_0();
    local v26 = l_useLaunchContext_0();
    local v27, v28 = v4.useState(false);
    local l_useRef_0 = v4.useRef;
    local v30 = false;
    if v26 ~= nil then
        v30 = true;
        if v26 ~= l_LaunchContext_0.SignUp then
            v30 = v26 == l_LaunchContext_0.Login;
        end;
    end;
    l_useRef_0 = l_useRef_0(v30);
    v30 = l_useUserExperiment_0({
        l_AppUserLayers_0.PushNotificationPrompt
    }, function(v31) --[[ Line: 45 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_GetFStringPushUpsellVariantName_0 (ref), l_GetFStringPushUpsellOnFirstTimeVariantName_0 (ref)
        local v32 = v31[l_AppUserLayers_0.PushNotificationPrompt] or {};
        local v33 = l_GetFStringPushUpsellVariantName_0();
        local v34 = l_GetFStringPushUpsellOnFirstTimeVariantName_0();
        return {
            pushUpsellVariant = v32[v33] or -1, 
            pushUpsellOnFirstTimeVariant = v32[v34] or -1
        };
    end);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 55 ]]
        -- upvalues: v12 (ref)
        return v35.Personalization.PageSessionTimestamp[v12.Home];
    end);
    v4.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v27 (copy), l_Players_0 (ref), v25 (copy), v9 (ref), l_IXPService_0 (ref), v28 (copy)
        if not v27 then
            local v37 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or 0;
            v25(v9(l_IXPService_0, v37)):andThen(function() --[[ Line: 62 ]]
                -- upvalues: v28 (ref)
                v28(true);
            end);
        end;
    end, {
        v27
    });
    v4.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v36 (copy), v27 (copy), v30 (copy), l_GetFFlagLuaAppPushSystemUpsellDevOverride_0 (ref), l_GetFFlagLuaAppEnablePushUpsellOnFirstTime_0 (ref), l_useRef_0 (copy), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), l_ModalEventConstants_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), v12 (ref)
        local v38 = true;
        if v36 == nil then
            return function() --[[ Line: 72 ]]

            end;
        else
            if v27 and v30.pushUpsellVariant ~= nil and v30.pushUpsellVariant > -1 or l_GetFFlagLuaAppPushSystemUpsellDevOverride_0() then
                if (not l_GetFFlagLuaAppEnablePushUpsellOnFirstTime_0() or v30.pushUpsellVariant ~= 1 or v30.pushUpsellOnFirstTimeVariant ~= 1) and l_useRef_0.current then
                    l_useRef_0.current = false;
                    return function() --[[ Line: 94 ]]

                    end;
                else
                    local v39 = not l_GetFFlagLuaAppPushSystemUpsellDevOverride_0() and v30.pushUpsellVariant == 2;
                    l_setupPushNotificationsUpsell_0.ShouldShowUpsell(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellHome, v39):andThen(function(v40) --[[ Line: 101 ]]
                        -- upvalues: v38 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v30 (ref), l_GetFFlagLuaAppPushSystemUpsellDevOverride_0 (ref), v39 (copy), l_ModalEventConstants_0 (ref), l_default_0 (ref), l_PushUpsellEventConfig_0 (ref), v12 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
                        if v38 and v40 then
                            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.PushNotificationPrompt);
                            if v30.pushUpsellVariant > 0 or l_GetFFlagLuaAppPushSystemUpsellDevOverride_0() then
                                local v41 = if v39 then l_ModalEventConstants_0.ModalContextPushEduUpsell else l_ModalEventConstants_0.ModalContextSysUpsell;
                                l_default_0:logRobloxTelemetryEvent(l_PushUpsellEventConfig_0, {}, {
                                    [l_ModalEventConstants_0.ActionType] = l_ModalEventConstants_0.ShouldRequest, 
                                    [l_ModalEventConstants_0.EntryPoint] = v12.Home
                                }, v41);
                                l_setupPushNotificationsUpsell_0.OpenModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellHome, v39, v12.Home);
                            end;
                        end;
                    end);
                end;
            end;
            return function() --[[ Line: 120 ]]
                -- upvalues: v38 (ref), l_setupPushNotificationsUpsell_0 (ref), l_NotificationsUpsellConstants_0 (ref)
                v38 = false;
                l_setupPushNotificationsUpsell_0.CloseModal(l_NotificationsUpsellConstants_0.ModalKey.PushUpsellHome);
            end;
        end;
    end, {
        v27, 
        v36
    });
    return nil;
end;
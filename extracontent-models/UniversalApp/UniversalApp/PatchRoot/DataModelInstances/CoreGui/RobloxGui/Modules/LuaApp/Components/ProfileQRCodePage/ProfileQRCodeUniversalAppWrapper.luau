local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_PermissionsProtocol_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol;
local v5 = require(l_CorePackages_0.Workspace.Packages.ProfileQRCode);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
local v9 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v10 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v11 = require(l_script_FirstAncestor_0.LuaApp.Enum.OverlayType);
local l_RobloxEventReceiver_0 = require(l_CorePackages_0.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver;
local v13 = require(l_script_FirstAncestor_0.LuaApp.Actions.SetCentralOverlay);
local l_SettingsRoute_0 = require(l_CorePackages_0.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute;
local l_SetTabBarVisible_0 = require(l_CorePackages_0.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v17 = require(l_script_FirstAncestor_0.LuaApp.Hooks.useRoactService);
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRCodeScannerDeeplinkEnabledForAll;
local l_FFlagQRInSearchScanner_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner;
local l_FFlagQRInSearchProfileQR_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR;
return function(v22) --[[ Line: 37 ]]
    -- upvalues: l_useDispatch_0 (copy), v17 (copy), l_AppNotificationService_0 (copy), v6 (copy), l_RobloxEventReceiver_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), l_SetTabBarVisible_0 (copy), v9 (copy), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_PermissionsProtocol_0 (copy), v10 (copy), v8 (copy), v13 (copy), v11 (copy), l_SettingsRoute_0 (copy), v7 (copy), v5 (copy)
    local v23 = l_useDispatch_0();
    local v24 = v17(l_AppNotificationService_0);
    local v25 = v6.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), v24 (copy)
        return l_RobloxEventReceiver_0.new(v24);
    end, {
        v24
    });
    if l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0 then
        v6.useEffect(function() --[[ Line: 45 ]]
            -- upvalues: v23 (copy), l_SetTabBarVisible_0 (ref)
            v23(l_SetTabBarVisible_0(false));
        end, {
            v23
        });
    end;
    local v26 = v6.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v23 (copy), v9 (ref)
        v23(v9(true));
    end, {});
    local v28 = if not l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 then l_useUserExperiment_0({
        l_AppUserLayers_0.ProfileQRCodeScannerLayer
    }, function(v27) --[[ Line: 56 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v27[l_AppUserLayers_0.ProfileQRCodeScannerLayer] or {}).systemSettingsDeeplinkEnabled;
    end, false) else nil;
    local v30 = v6.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v23 (copy), v10 (ref), v8 (ref), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (ref), v28 (copy), v13 (ref), v11 (ref), l_SettingsRoute_0 (ref)
        l_PermissionsProtocol_0.default:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS
        }):andThen(function(v29) --[[ Line: 67 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v23 (ref), v10 (ref), v8 (ref), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (ref), v28 (ref), v13 (ref), v11 (ref), l_SettingsRoute_0 (ref)
            if v29 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                v23(v10({
                    name = v8.ScanQrCode
                }));
                return;
            elseif l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 or v28 then
                v23(v13(v11.SettingsPermissionInteractiveAlert, {
                    settingsRoute = l_SettingsRoute_0.Camera
                }));
                return;
            else
                v23(v13(v11.CameraPermissionPrompt));
                return;
            end;
        end);
    end, {
        v28
    });
    return v7.createElement(v5.ProfileQRCodeEntryPoint, {
        robloxEventReceiver = v25, 
        source = v22.source, 
        onClose = v26, 
        openQrCodeScanner = v30
    });
end;
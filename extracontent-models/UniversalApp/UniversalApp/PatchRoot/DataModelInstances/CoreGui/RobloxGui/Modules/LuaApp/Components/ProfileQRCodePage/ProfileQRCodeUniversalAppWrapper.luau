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
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagSocialCarouselShareQREnabled;
return function(v23) --[[ Line: 40 ]]
    -- upvalues: l_useDispatch_0 (copy), v17 (copy), l_AppNotificationService_0 (copy), v6 (copy), l_RobloxEventReceiver_0 (copy), l_FFlagQRInSearchScanner_0 (copy), l_FFlagQRInSearchProfileQR_0 (copy), l_SetTabBarVisible_0 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), v9 (copy), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_PermissionsProtocol_0 (copy), v10 (copy), v8 (copy), v13 (copy), v11 (copy), l_SettingsRoute_0 (copy), v7 (copy), v5 (copy)
    local v24 = l_useDispatch_0();
    local v25 = v17(l_AppNotificationService_0);
    local v26 = v6.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: l_RobloxEventReceiver_0 (ref), v25 (copy)
        return l_RobloxEventReceiver_0.new(v25);
    end, {
        v25
    });
    if l_FFlagQRInSearchScanner_0 or l_FFlagQRInSearchProfileQR_0 then
        v6.useEffect(function() --[[ Line: 48 ]]
            -- upvalues: v24 (copy), l_SetTabBarVisible_0 (ref)
            v24(l_SetTabBarVisible_0(false));
        end, {
            v24
        });
    end;
    local v27 = v6.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: l_FFlagSocialCarouselShareQREnabled_0 (ref), v23 (copy), v24 (copy), v9 (ref)
        if l_FFlagSocialCarouselShareQREnabled_0 and v23.onClose then
            v23.onClose();
            return;
        else
            v24(v9(true));
            return;
        end;
    end, {
        if l_FFlagSocialCarouselShareQREnabled_0 then v23.onClose else nil, 
        if l_FFlagSocialCarouselShareQREnabled_0 then v24 else nil
    });
    local v29 = if not l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 then l_useUserExperiment_0({
        l_AppUserLayers_0.ProfileQRCodeScannerLayer
    }, function(v28) --[[ Line: 66 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v28[l_AppUserLayers_0.ProfileQRCodeScannerLayer] or {}).systemSettingsDeeplinkEnabled;
    end, false) else nil;
    local v31 = v6.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: l_PermissionsProtocol_0 (ref), v24 (copy), v10 (ref), v8 (ref), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (ref), v29 (copy), v13 (ref), v11 (ref), l_SettingsRoute_0 (ref)
        l_PermissionsProtocol_0.default:checkOrRequestPermissions({
            l_PermissionsProtocol_0.Permissions.CAMERA_ACCESS
        }):andThen(function(v30) --[[ Line: 77 ]]
            -- upvalues: l_PermissionsProtocol_0 (ref), v24 (ref), v10 (ref), v8 (ref), l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 (ref), v29 (ref), v13 (ref), v11 (ref), l_SettingsRoute_0 (ref)
            if v30 == l_PermissionsProtocol_0.Status.AUTHORIZED then
                v24(v10({
                    name = v8.ScanQrCode
                }));
                return;
            elseif l_FFlagQRCodeScannerDeeplinkEnabledForAll_0 or v29 then
                v24(v13(v11.SettingsPermissionInteractiveAlert, {
                    settingsRoute = l_SettingsRoute_0.Camera
                }));
                return;
            else
                v24(v13(v11.CameraPermissionPrompt));
                return;
            end;
        end);
    end, {
        v29
    });
    return v7.createElement(v5.ProfileQRCodeEntryPoint, {
        robloxEventReceiver = v26, 
        source = v23.source, 
        onClose = v27, 
        openQrCodeScanner = v31
    });
end;
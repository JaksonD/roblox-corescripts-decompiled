local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("VideoCaptureService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.Settings.cameraDevicesHelper).GetDevices();
local v8 = not v4.isEmpty(v7);
if v8 then
    v5(function(v9) --[[ Line: 14 ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy), v8 (copy)
        local l_hasCameraPermissions_0 = v9.hasCameraPermissions;
        l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
            hasAccessToCamera = l_hasCameraPermissions_0, 
            hasEligibleCamera = v8
        });
    end, {
        l_default_0.Permissions.CAMERA_ACCESS
    }, true);
    return;
else
    l_RbxAnalyticsService_0:SendEventDeferred("client", "avatarChat", "CameraDevicePermissionResponse", {
        hasAccessToCamera = false, 
        hasEligibleCamera = v8
    });
    return;
end;
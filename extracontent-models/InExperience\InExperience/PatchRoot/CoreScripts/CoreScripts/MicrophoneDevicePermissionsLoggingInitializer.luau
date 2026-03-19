local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.Settings.getCamMicPermissions);
local v3 = require(l_CoreGui_0.RobloxGui.Modules.Settings.Resources.MicrophoneDevicePermissionsLogging);
v2(function(v4) --[[ Line: 13 ]]
    -- upvalues: v3 (copy)
    v3:init(v4.hasMicPermissions);
end, {
    require(l_CorePackages_0.Workspace.Packages.PermissionsProtocol).PermissionsProtocol.default.Permissions.MICROPHONE_ACCESS
}, true);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ShareGame_0 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame;
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local v3 = require(l_ShareGame_0.Constants);
local v4 = require(l_ShareGame_0.Actions.SetDeviceLayout);
local l_SetDeviceOrientation_0 = require(l_CorePackages_0.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation;
local v6 = require(l_ShareGame_0.Actions.SetIsSmallTouchScreen);
return function(v7, v8) --[[ Line: 14 ]]
    -- upvalues: v3 (copy), l_SetDeviceOrientation_0 (copy), l_Immutable_0 (copy), v4 (copy), v6 (copy)
    v7 = v7 or {
        DeviceLayout = v3.DeviceLayout.DESKTOP, 
        DeviceOrientation = v3.DeviceOrientation.INVALID, 
        IsSmallTouchScreen = false
    };
    if v8.type == l_SetDeviceOrientation_0.name then
        return (l_Immutable_0.Set(v7, "DeviceOrientation", v8.deviceOrientation));
    elseif v8.type == v4.name then
        return (l_Immutable_0.Set(v7, "DeviceLayout", v8.deviceLayout));
    else
        if v8.type == v6.name then
            v7 = l_Immutable_0.Set(v7, "IsSmallTouchScreen", v8.isSmallTouchScreen);
        end;
        return v7;
    end;
end;
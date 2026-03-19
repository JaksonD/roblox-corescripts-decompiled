local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v3 = require(l_Modules_0.LuaApp.Actions.SetDeviceOrientation);
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v3 (copy)
    v4 = v4 or l_DeviceOrientationMode_0.Portrait;
    assert(v4, "");
    if v5.type == v3.name then
        return v5.deviceOrientation;
    else
        return v4;
    end;
end;
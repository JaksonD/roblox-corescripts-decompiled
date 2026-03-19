local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local v2 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_DeviceOrientationMode_0 = v1.DeviceOrientationMode;
return {
    getDeviceType = function() --[[ Line: 26 ]] --[[ Name: getDeviceType ]]
        -- upvalues: v2 (copy), l_DeviceOrientationMode_0 (copy)
        local l_getDeviceType_0 = v2.getDeviceType;
        local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
        return l_getDeviceType_0(if l_ViewportSize_0.X > l_ViewportSize_0.Y then l_DeviceOrientationMode_0.Landscape else l_DeviceOrientationMode_0.Portrait);
    end, 
    DeviceTypes = v1.DeviceType, 
    getDeviceOrientation = function() --[[ Line: 19 ]] --[[ Name: getDeviceOrientation ]]
        -- upvalues: l_DeviceOrientationMode_0 (copy)
        local l_ViewportSize_1 = workspace.CurrentCamera.ViewportSize;
        if l_ViewportSize_1.X > l_ViewportSize_1.Y then
            return l_DeviceOrientationMode_0.Landscape;
        else
            return l_DeviceOrientationMode_0.Portrait;
        end;
    end, 
    getViewportSize = function() --[[ Line: 14 ]] --[[ Name: getViewportSize ]]
        return workspace.CurrentCamera.ViewportSize;
    end
};
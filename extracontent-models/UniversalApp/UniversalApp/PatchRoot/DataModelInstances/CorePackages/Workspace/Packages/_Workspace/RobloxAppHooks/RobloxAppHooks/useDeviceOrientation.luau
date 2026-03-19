local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxAppHooks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.useCurrentCamera);
local l_useProperty_0 = require(l_Parent_0.GuiObjectUtils).useProperty;
local l_DeviceOrientationMode_0 = require(l_Parent_0.RobloxAppEnums).DeviceOrientationMode;
return function() --[[ Line: 10 ]] --[[ Name: useDeviceOrientation ]]
    -- upvalues: v2 (copy), l_useProperty_0 (copy), l_DeviceOrientationMode_0 (copy)
    local v5 = v2();
    local v6 = l_useProperty_0(v5, "ViewportSize");
    if v6.X > 1 and v6.Y > 1 then
        return v6.X > v6.Y and l_DeviceOrientationMode_0.Landscape or l_DeviceOrientationMode_0.Portrait;
    else
        return nil;
    end;
end;
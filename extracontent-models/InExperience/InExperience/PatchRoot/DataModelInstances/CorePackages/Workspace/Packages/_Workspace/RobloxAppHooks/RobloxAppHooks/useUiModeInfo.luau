local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local v1 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v3 = require(l_Parent_0.RobloxAppEnums);
local l_DeviceType_0 = v3.DeviceType;
local l_UiMode_0 = v3.UiMode;
local v6 = require(script.Parent.useDeviceType);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v8 = {
    [l_DeviceType_0.Desktop] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Tablet] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Phone] = l_UiMode_0.Unknown, 
    [l_DeviceType_0.Console] = l_UiMode_0.TenFoot, 
    [l_DeviceType_0.VR] = l_UiMode_0.VR
};
return function() --[[ Line: 39 ]] --[[ Name: useUiModeInfo ]]
    -- upvalues: v6 (copy), v8 (copy), l_UiMode_0 (copy), v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v9 = v6();
    local v10 = v8[v9] or l_UiMode_0.Unknown;
    return (v1.useMemo(function() --[[ Line: 44 ]]
        -- upvalues: v9 (copy), v10 (copy)
        return {
            deviceType = v9, 
            uiMode = v10
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v9, 
        v10
    } else l_dependencyArray_0(v9, v10)));
end;
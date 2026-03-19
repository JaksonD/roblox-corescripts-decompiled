local l_Parent_0 = script:FindFirstAncestor("RobloxAppHooks").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_Parent_0.RobloxAppEnums);
local l_getDeviceType_0 = require(l_Parent_0.AppCommonLib).getDeviceType;
return function() --[[ Line: 15 ]] --[[ Name: useDeviceType ]]
    -- upvalues: l_useSelector_0 (copy), l_getDeviceType_0 (copy)
    local v5 = l_useSelector_0(function(v4) --[[ Line: 16 ]]
        return v4.DeviceOrientation;
    end);
    return l_getDeviceType_0(v5);
end;
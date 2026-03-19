local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_useDeviceOrientation_0 = require(l_Parent_1.RobloxAppHooks).useDeviceOrientation;
local l_DeviceOrientationMode_0 = require(l_Parent_1.RobloxAppEnums).DeviceOrientationMode;
local l_UserInputService_0 = require(l_Parent_1.MockableProxyServices).UserInputService;
local v6 = require(l_Parent_0.Enum.Placement);
local v7 = require(l_Parent_0.Mocks);
return function() --[[ Line: 17 ]] --[[ Name: useNavBarPlacement ]]
    -- upvalues: l_useDeviceOrientation_0 (copy), l_DeviceOrientationMode_0 (copy), v2 (copy), l_UserInputService_0 (copy), v7 (copy), v6 (copy)
    local v8 = l_useDeviceOrientation_0() == l_DeviceOrientationMode_0.Portrait;
    local v9, v10 = v2.useState(l_UserInputService_0.TouchEnabled);
    v2.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v10 (copy), l_UserInputService_0 (ref)
        v10(l_UserInputService_0.TouchEnabled);
        local v11 = l_UserInputService_0:GetPropertyChangedSignal("TouchEnabled"):Connect(function() --[[ Line: 24 ]]
            -- upvalues: v10 (ref), l_UserInputService_0 (ref)
            v10(l_UserInputService_0.TouchEnabled);
        end);
        return function() --[[ Line: 27 ]]
            -- upvalues: v11 (copy)
            v11:Disconnect();
        end;
    end, {});
    if v7.navBarPlacement ~= nil then
        return v7.navBarPlacement;
    elseif v9 and v8 then
        return v6.Bottom;
    else
        return v6.Left;
    end;
end;
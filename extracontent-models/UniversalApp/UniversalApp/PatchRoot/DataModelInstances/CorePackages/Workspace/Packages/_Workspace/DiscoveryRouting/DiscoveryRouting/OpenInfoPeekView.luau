local l_Parent_0 = script:FindFirstAncestor("DiscoveryRouting").Parent;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local v2 = require(l_Parent_0.RobloxAppEnums);
local l_AppPage_0 = v2.AppPage;
local l_DeviceType_0 = v2.DeviceType;
local l_getDeviceType_0 = require(l_Parent_0.AppCommonLib).getDeviceType;
return function(v6, v7) --[[ Line: 9 ]]
    -- upvalues: l_getDeviceType_0 (copy), l_DeviceType_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return function(v8) --[[ Line: 10 ]]
        -- upvalues: l_getDeviceType_0 (ref), l_DeviceType_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v6 (copy), v7 (copy)
        local v9 = l_getDeviceType_0(v8:getState().DeviceOrientation);
        if v9 ~= l_DeviceType_0.Phone and v9 ~= l_DeviceType_0.Tablet then
            return;
        else
            v8:dispatch(l_NavigateDown_0({
                name = l_AppPage_0.InfoPeekView, 
                extraProps = {
                    title = v6, 
                    body = v7
                }
            }));
            return;
        end;
    end;
end;
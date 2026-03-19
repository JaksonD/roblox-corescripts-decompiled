local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local l_DeviceType_0 = require(l_Parent_0.RobloxAppEnums).DeviceType;
local v2 = {
    [l_DeviceType_0.Desktop] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.Tablet] = {
        startingOffsetPosition = 200, 
        thumbnailHeight = 150, 
        dualPanelBreakpoint = 1e999, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.Phone] = {
        startingOffsetPosition = 250, 
        thumbnailHeight = 100, 
        dualPanelBreakpoint = 1e999, 
        headerBarBackgroundHeight = 24, 
        sideMargin = 24
    }, 
    [l_DeviceType_0.Console] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }, 
    [l_DeviceType_0.VR] = {
        startingOffsetPosition = 500, 
        thumbnailHeight = 200, 
        dualPanelBreakpoint = 1280, 
        headerBarBackgroundHeight = 80, 
        sideMargin = 48
    }
};
return function(v3) --[[ Line: 60 ]] --[[ Name: getPlatformConfig ]]
    -- upvalues: v2 (copy), l_DeviceType_0 (copy)
    local v4 = v2[v3];
    if v4 == nil then
        return v2[l_DeviceType_0.Desktop];
    else
        return v4;
    end;
end;
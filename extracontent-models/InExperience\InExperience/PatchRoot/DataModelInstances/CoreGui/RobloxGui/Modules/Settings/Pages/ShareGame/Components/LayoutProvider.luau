local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_ShareGame_0 = l_Modules_0.Settings.Pages.ShareGame;
local v6 = require(l_ShareGame_0.Constants);
local l_SetDeviceOrientation_0 = require(l_CorePackages_0.Workspace.Packages.DeviceOrientationRodux).Actions.SetDeviceOrientation;
local v8 = require(l_ShareGame_0.Actions.SetIsSmallTouchScreen);
local v9 = require(l_ShareGame_0.Actions.SetDeviceLayout);
local v10 = v3.Component:extend("LayoutProvider");
v10.didMount = function(v11) --[[ Line: 22 ]] --[[ Name: didMount ]]
    if workspace.CurrentCamera then
        v11:setObservedCamera(workspace.CurrentCamera);
    end;
    v11.cameraChangedListener = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 27 ]]
        -- upvalues: v11 (copy)
        if workspace.CurrentCamera then
            v11:setObservedCamera(workspace.CurrentCamera);
        end;
    end);
end;
v10.willUnmount = function(v12) --[[ Line: 34 ]] --[[ Name: willUnmount ]]
    if v12.cameraChangedListener then
        v12.cameraChangedListener:Disconnect();
    end;
    if v12.viewportSizeListener then
        v12.viewportSizeListener:Disconnect();
    end;
end;
v10.setObservedCamera = function(v13, v14) --[[ Line: 44 ]] --[[ Name: setObservedCamera ]]
    if v13.viewportSizeListener then
        v13.viewportSizeListener:Disconnect();
    end;
    v13:checkAllDeviceInfo(v14.ViewportSize);
    v13.viewportSizeListener = v14:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 51 ]]
        -- upvalues: v14 (copy), v13 (copy)
        local l_ViewportSize_0 = v14.ViewportSize;
        if l_ViewportSize_0.X <= 1 or l_ViewportSize_0.Y <= 1 then
            return;
        else
            v13:checkAllDeviceInfo(l_ViewportSize_0);
            return;
        end;
    end);
end;
v10.checkDeviceOrientation = function(v16, v17) --[[ Line: 63 ]] --[[ Name: checkDeviceOrientation ]]
    -- upvalues: v6 (copy)
    local v18 = v17.X > v17.Y and v6.DeviceOrientation.LANDSCAPE or v6.DeviceOrientation.PORTRAIT;
    if v16._deviceOrientation ~= v18 then
        v16._deviceOrientation = v18;
        v16.props.setDeviceOrientation(v18);
    end;
end;
v10.checkDeviceIsSmallTouchScreen = function(v19, v20) --[[ Line: 73 ]] --[[ Name: checkDeviceIsSmallTouchScreen ]]
    -- upvalues: l_UserInputService_0 (copy)
    local v21 = l_UserInputService_0.TouchEnabled and (v20.X < 700 or v20.Y < 500);
    if v19._isSmallTouchScreen ~= v21 then
        v19._isSmallTouchScreen = v21;
        v19.props.setIsSmallTouchScreen(v19._isSmallTouchScreen);
    end;
end;
v10.checkDeviceLayout = function(v22) --[[ Line: 83 ]] --[[ Name: checkDeviceLayout ]]
    -- upvalues: v6 (copy), l_UserInputService_0 (copy)
    local v23 = nil;
    v23 = if v22._isSmallTouchScreen then if v22._deviceOrientation == v6.DeviceOrientation.LANDSCAPE then v6.DeviceLayout.PHONE_LANDSCAPE else v6.DeviceLayout.PHONE_PORTRAIT else if l_UserInputService_0.TouchEnabled then if v22._deviceOrientation == v6.DeviceOrientation.LANDSCAPE then v6.DeviceLayout.TABLET_LANDSCAPE else v6.DeviceLayout.TABLET_PORTRAIT else v6.DeviceLayout.DESKTOP;
    if v22._deviceLayout ~= v23 then
        v22._deviceLayout = v23;
        v22.props.setDeviceLayout(v22._deviceLayout);
    end;
end;
v10.checkAllDeviceInfo = function(v24, v25) --[[ Line: 108 ]] --[[ Name: checkAllDeviceInfo ]]
    v24:checkDeviceOrientation(v25);
    v24:checkDeviceIsSmallTouchScreen(v25);
    v24:checkDeviceLayout();
end;
v10.render = function(v26) --[[ Line: 114 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    return v3.oneChild(v26.props[v3.Children]);
end;
return v4.UNSTABLE_connect2(nil, function(v27) --[[ Line: 118 ]]
    -- upvalues: l_SetDeviceOrientation_0 (copy), v8 (copy), v9 (copy)
    return {
        setDeviceOrientation = function(v28) --[[ Line: 120 ]] --[[ Name: setDeviceOrientation ]]
            -- upvalues: v27 (copy), l_SetDeviceOrientation_0 (ref)
            return v27(l_SetDeviceOrientation_0(v28));
        end, 
        setIsSmallTouchScreen = function(v29) --[[ Line: 123 ]] --[[ Name: setIsSmallTouchScreen ]]
            -- upvalues: v27 (copy), v8 (ref)
            return v27(v8(v29));
        end, 
        setDeviceLayout = function(v30) --[[ Line: 126 ]] --[[ Name: setDeviceLayout ]]
            -- upvalues: v27 (copy), v9 (ref)
            return v27(v9(v30));
        end
    };
end)(v10);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SceneManagement);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_useFocusNavigableSurfaceRegistryConnection_0 = v4.useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local v7 = require(l_script_FirstAncestor_0.Hooks.useRootFocusNavigationBindings);
local v8 = require(l_script_FirstAncestor_0.ReactNavigationExtend.Views.Constants);
local l_SurfaceGuiWithAdornee_0 = v3.SurfaceGuiWithAdornee;
local l_useCameraFacingGeometry_0 = v3.useCameraFacingGeometry;
local function _(v11) --[[ Line: 14 ]] --[[ Name: getAdorneeSizeFromScreenSize ]]
    -- upvalues: v8 (copy)
    return function(v12) --[[ Line: 15 ]]
        -- upvalues: v11 (copy), v8 (ref)
        return (Vector3.new(v12.X, v12.Y * v11, v8.ADORNEE_DEPTH));
    end;
end;
local v14 = 1;
local l_v14_0 = v14 --[[ copy: 13 -> 20 ]];
local function v17(v16) --[[ Line: 15 ]]
    -- upvalues: l_v14_0 (copy), v8 (copy)
    return (Vector3.new(v16.X, v16.Y * l_v14_0, v8.ADORNEE_DEPTH));
end;
local l_TOP_BAR_HEIGHT_RATIO_0 = v8.TOP_BAR_HEIGHT_RATIO;
local l_l_TOP_BAR_HEIGHT_RATIO_0_0 = l_TOP_BAR_HEIGHT_RATIO_0 --[[ copy: 14 -> 21 ]];
v14 = function(v20) --[[ Line: 15 ]]
    -- upvalues: l_l_TOP_BAR_HEIGHT_RATIO_0_0 (copy), v8 (copy)
    return (Vector3.new(v20.X, v20.Y * l_l_TOP_BAR_HEIGHT_RATIO_0_0, v8.ADORNEE_DEPTH));
end;
local l_CONTROLLER_BAR_HEIGHT_RATIO_0 = v8.CONTROLLER_BAR_HEIGHT_RATIO;
local l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0 = l_CONTROLLER_BAR_HEIGHT_RATIO_0 --[[ copy: 15 -> 22 ]];
l_TOP_BAR_HEIGHT_RATIO_0 = function(v23) --[[ Line: 15 ]]
    -- upvalues: l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0 (copy), v8 (copy)
    return (Vector3.new(v23.X, v23.Y * l_l_CONTROLLER_BAR_HEIGHT_RATIO_0_0, v8.ADORNEE_DEPTH));
end;
l_CONTROLLER_BAR_HEIGHT_RATIO_0 = function(v24) --[[ Line: 30 ]] --[[ Name: getGlobalNavCFrame ]]
    -- upvalues: v8 (copy)
    local l_Y_0 = v24.viewportFillDimensions.Y;
    local l_cFrame_0 = v24.cFrame;
    local v27 = l_Y_0 * v8.TOP_BAR_HEIGHT_RATIO;
    return l_cFrame_0 * CFrame.new(0, l_Y_0 / 2 - v27 / 2, 0);
end;
local function v32(v28) --[[ Line: 38 ]] --[[ Name: getControllerBarCFrame ]]
    -- upvalues: v8 (copy)
    local l_Y_1 = v28.viewportFillDimensions.Y;
    local l_cFrame_1 = v28.cFrame;
    local v31 = l_Y_1 * v8.CONTROLLER_BAR_HEIGHT_RATIO;
    return l_cFrame_1 * CFrame.new(0, v31 / 2 - l_Y_1 / 2, 0);
end;
local function v35(v33) --[[ Line: 52 ]] --[[ Name: RootViewSurface ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v8 (copy), v2 (copy), l_SurfaceGuiWithAdornee_0 (copy), v17 (copy)
    local v34 = l_useCameraFacingGeometry_0(v8.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    return v2.createElement(l_SurfaceGuiWithAdornee_0, {
        name = "RootViewSurface", 
        adorneeSize = v34.viewportFillDimensions:map(v17), 
        adorneeCFrame = v34.cFrame, 
        adorneeParent = v33.adorneeParent, 
        isVisible = true, 
        canvasSize = v8.FULLSCREEN_CANVAS_SIZE, 
        surfaceGuiParent = v33.surfaceGuiParent
    }, v33.content);
end;
local function v44(v36) --[[ Line: 66 ]] --[[ Name: GlobalNavBarSurface ]]
    -- upvalues: v2 (copy), v7 (copy), l_useCameraFacingGeometry_0 (copy), v8 (copy), v14 (copy), l_CONTROLLER_BAR_HEIGHT_RATIO_0 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_SurfaceGuiWithAdornee_0 (copy)
    local v37, v38 = v2.useState(nil);
    local v39 = v7(v38);
    local v40 = l_useCameraFacingGeometry_0(v8.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v41 = v40.viewportFillDimensions:map(v14);
    local v42 = v2.joinBindings({
        viewportFillDimensions = v40.viewportFillDimensions, 
        cFrame = v40.cFrame
    }):map(l_CONTROLLER_BAR_HEIGHT_RATIO_0);
    l_useFocusNavigableSurfaceRegistryConnection_0(v37, l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v43 = v2.createElement("Frame", {
        ref = v39, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1
    }, v36.content);
    return v2.createElement(l_SurfaceGuiWithAdornee_0, {
        adorneeSize = v41, 
        adorneeCFrame = v42, 
        canvasSize = v8.TOP_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "GlobalNavBarSurface", 
        adorneeParent = v36.adorneeParent, 
        surfaceGuiParent = v36.surfaceGuiParent
    }, v43);
end;
local function v49(v45) --[[ Line: 96 ]] --[[ Name: ControllerBarSurface ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v8 (copy), l_TOP_BAR_HEIGHT_RATIO_0 (copy), v2 (copy), v32 (copy), l_SurfaceGuiWithAdornee_0 (copy)
    local v46 = l_useCameraFacingGeometry_0(v8.DEFAULT_SCREEN_DISTANCE_TO_CAMERA - 1);
    local v47 = v46.viewportFillDimensions:map(l_TOP_BAR_HEIGHT_RATIO_0);
    local v48 = v2.joinBindings({
        viewportFillDimensions = v46.viewportFillDimensions, 
        cFrame = v46.cFrame
    }):map(v32);
    return v2.createElement(l_SurfaceGuiWithAdornee_0, {
        adorneeSize = v47, 
        adorneeCFrame = v48, 
        canvasSize = v8.CONTROLLER_BAR_CANVAS_SIZE, 
        isVisible = true, 
        name = "ControllerBarSurface", 
        adorneeParent = v45.adorneeParent, 
        surfaceGuiParent = v45.surfaceGuiParent
    }, v45.content);
end;
return function(v50) --[[ Line: 123 ]] --[[ Name: TenFootUiLayout ]]
    -- upvalues: v2 (copy), v35 (copy), v44 (copy), v49 (copy)
    return v2.createElement(v2.Fragment, nil, {
        RootViewSlot = if v50.rootViewSlot then v2.createElement(v35, {
            adorneeParent = v50.adorneeParent, 
            surfaceGuiParent = v50.surfaceGuiParent, 
            content = v50.rootViewSlot
        }) else nil, 
        GlobalNavBarSlot = if v50.globalNavSlot then v2.createElement(v44, {
            adorneeParent = v50.adorneeParent, 
            surfaceGuiParent = v50.surfaceGuiParent, 
            content = v50.globalNavSlot
        }) else nil, 
        ControllerBarSlot = if v50.controllerBarSlot then v2.createElement(v49, {
            adorneeParent = v50.adorneeParent, 
            surfaceGuiParent = v50.surfaceGuiParent, 
            content = v50.controllerBarSlot
        }) else nil
    });
end;
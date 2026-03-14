local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiShell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReactNavigationExtend_0 = l_script_FirstAncestor_0.ReactNavigationExtend;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SceneManagement);
local l_SurfaceGuiWithAdornee_0 = v4.SurfaceGuiWithAdornee;
local l_useCameraFacingGeometry_0 = v4.useCameraFacingGeometry;
local v7 = require(l_ReactNavigationExtend_0.Views.Constants);
local l_ScreenKind_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiRNTypes.ScreenKind;
local v9 = require(script.Parent.SceneViewWithFocusRoot);
local v10 = require(l_script_FirstAncestor_0.Components.TenFootUiOverflowScreen);
local v11 = require(l_Parent_0.Navigation);
local l_getCurrentRouteKey_0 = v11.getCurrentRouteKey;
local l_getRouteKeyIsInNavigationState_0 = v11.getRouteKeyIsInNavigationState;
local l_getActiveChildNavigationOptionsRecursively_0 = v11.getActiveChildNavigationOptionsRecursively;
local l_useEarlyIsFocused_0 = v11.useEarlyIsFocused;
local v16 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v16.Array;
local l_Object_0 = v16.Object;
local function v20(v19) --[[ Line: 37 ]] --[[ Name: getAdorneeSizeFromScreenSize ]]
    -- upvalues: v7 (copy)
    return (Vector3.new(v19.X, v19.Y, v7.ADORNEE_DEPTH));
end;
local function _(v21) --[[ Line: 41 ]] --[[ Name: getCanvasSize ]]
    -- upvalues: l_ScreenKind_0 (copy), v7 (copy)
    if (v21.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then
        return v7.FULLSCREEN_CANVAS_SIZE;
    else
        return v7.DEFAULT_CANVAS_SIZE;
    end;
end;
local function v26(v23) --[[ Line: 50 ]] --[[ Name: combineTransparencies ]]
    -- upvalues: l_Array_0 (copy)
    return 1 - l_Array_0.reduce(v23, function(v24, v25) --[[ Line: 52 ]]
        return v24 * (1 - (v25 or 0));
    end, 1);
end;
local function v28(...) --[[ Line: 57 ]] --[[ Name: useCombinedTransparency ]]
    -- upvalues: v3 (copy), v26 (copy)
    local v27 = {
        ...
    };
    return v3.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: v3 (ref), v27 (copy), v26 (ref)
        return v3.joinBindings(v27):map(v26);
    end, v27);
end;
local function _(v29, v30) --[[ Line: 64 ]] --[[ Name: getIsSelectionFocusable ]]
    -- upvalues: l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy)
    local v31 = l_getCurrentRouteKey_0(v29);
    if v30.options.hasSubNavigation and v31 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v31, v30.state));
    else
        return v31 == v30.key;
    end;
end;
local function _(v33, v34) --[[ Line: 72 ]] --[[ Name: getScreenKind ]]
    -- upvalues: l_getActiveChildNavigationOptionsRecursively_0 (copy), l_ScreenKind_0 (copy)
    return (if v34.options.hasSubNavigation then l_getActiveChildNavigationOptionsRecursively_0(v33).screenKind else nil) or v34.options.screenKind or l_ScreenKind_0.Default;
end;
return function(v36) --[[ Line: 82 ]] --[[ Name: TenFootUiBaseViewCard ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v7 (copy), l_useEarlyIsFocused_0 (copy), l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy), l_getActiveChildNavigationOptionsRecursively_0 (copy), l_ScreenKind_0 (copy), v28 (copy), v3 (copy), l_Object_0 (copy), v10 (copy), v9 (copy), l_SurfaceGuiWithAdornee_0 (copy), v20 (copy)
    local l_descriptor_0 = v36.descriptor;
    local l_screenProps_0 = v36.screenProps;
    local l_navigation_0 = v36.navigation;
    local v40 = l_useCameraFacingGeometry_0(v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v41 = l_useEarlyIsFocused_0() and v36.isActiveCard;
    local v42 = l_getCurrentRouteKey_0(l_navigation_0);
    local v43 = if l_descriptor_0.options.hasSubNavigation and v42 ~= nil then l_getRouteKeyIsInNavigationState_0(v42, l_descriptor_0.state) else v42 == l_descriptor_0.key;
    v42 = (if l_descriptor_0.options.hasSubNavigation then l_getActiveChildNavigationOptionsRecursively_0(l_navigation_0).screenKind else nil) or l_descriptor_0.options.screenKind or l_ScreenKind_0.Default;
    local v44 = v36.isVisible and (l_screenProps_0.isVisible == nil or l_screenProps_0.isVisible);
    local v45 = v28(v36.groupTransparency, l_screenProps_0.groupTransparency);
    local v46 = v3.useMemo(function() --[[ Line: 95 ]]
        -- upvalues: l_Object_0 (ref), l_screenProps_0 (copy), v44 (copy), v45 (copy)
        return l_Object_0.assign({}, l_screenProps_0, {
            isVisible = v44, 
            groupTransparency = v45
        });
    end, {
        l_screenProps_0, 
        v44, 
        v45
    });
    local v47 = v3.createElement(v10, {
        screenKind = v42, 
        groupTransparency = v45
    }, {
        SceneView = v3.createElement(v9, {
            component = l_descriptor_0.getComponent(), 
            navigation = l_descriptor_0.navigation, 
            screenProps = v46, 
            isFocusable = v41 and v43, 
            shouldRestoreFocus = l_descriptor_0.options.enableFocusRestoration
        })
    });
    return v3.createElement(l_SurfaceGuiWithAdornee_0, {
        name = l_descriptor_0.key, 
        adorneeSize = v40.viewportFillDimensions:map(v20), 
        adorneeCFrame = v36.adorneeCFrame, 
        adorneeParent = l_screenProps_0.worldContainer, 
        canvasSize = if (l_descriptor_0.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then v7.FULLSCREEN_CANVAS_SIZE else v7.DEFAULT_CANVAS_SIZE, 
        isVisible = v44, 
        surfaceGuiParent = l_screenProps_0.surfaceGuiContainer
    }, v47);
end;
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
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local l_CompositionStyleSheet_0 = require(l_Parent_0.AppComposition).CompositionStyleSheet;
local function v22(v21) --[[ Line: 42 ]] --[[ Name: getAdorneeSizeFromScreenSize ]]
    -- upvalues: v7 (copy)
    return (Vector3.new(v21.X, v21.Y, v7.ADORNEE_DEPTH));
end;
local function _(v23) --[[ Line: 46 ]] --[[ Name: getCanvasSize ]]
    -- upvalues: l_ScreenKind_0 (copy), v7 (copy)
    if (v23.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then
        return v7.FULLSCREEN_CANVAS_SIZE;
    else
        return v7.DEFAULT_CANVAS_SIZE;
    end;
end;
local function v28(v25) --[[ Line: 55 ]] --[[ Name: combineTransparencies ]]
    -- upvalues: l_Array_0 (copy)
    return 1 - l_Array_0.reduce(v25, function(v26, v27) --[[ Line: 57 ]]
        return v26 * (1 - (v27 or 0));
    end, 1);
end;
local function v30(...) --[[ Line: 62 ]] --[[ Name: useCombinedTransparency ]]
    -- upvalues: v3 (copy), v28 (copy)
    local v29 = {
        ...
    };
    return v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v3 (ref), v29 (copy), v28 (ref)
        return v3.joinBindings(v29):map(v28);
    end, v29);
end;
local function _(v31, v32) --[[ Line: 69 ]] --[[ Name: getIsSelectionFocusable ]]
    -- upvalues: l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy)
    local v33 = l_getCurrentRouteKey_0(v31);
    if v32.options.hasSubNavigation and v33 ~= nil then
        return (l_getRouteKeyIsInNavigationState_0(v33, v32.state));
    else
        return v33 == v32.key;
    end;
end;
local function _(v35, v36) --[[ Line: 77 ]] --[[ Name: getScreenKind ]]
    -- upvalues: l_getActiveChildNavigationOptionsRecursively_0 (copy), l_ScreenKind_0 (copy)
    return (if v36.options.hasSubNavigation then l_getActiveChildNavigationOptionsRecursively_0(v35).screenKind else nil) or v36.options.screenKind or l_ScreenKind_0.Default;
end;
return function(v38) --[[ Line: 87 ]] --[[ Name: TenFootUiBaseViewCard ]]
    -- upvalues: l_useCameraFacingGeometry_0 (copy), v7 (copy), l_useEarlyIsFocused_0 (copy), l_getCurrentRouteKey_0 (copy), l_getRouteKeyIsInNavigationState_0 (copy), l_getActiveChildNavigationOptionsRecursively_0 (copy), l_ScreenKind_0 (copy), v30 (copy), v3 (copy), l_Object_0 (copy), v10 (copy), v9 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_CompositionStyleSheet_0 (copy), l_SurfaceGuiWithAdornee_0 (copy), v22 (copy)
    local l_descriptor_0 = v38.descriptor;
    local l_screenProps_0 = v38.screenProps;
    local l_navigation_0 = v38.navigation;
    local v42 = l_useCameraFacingGeometry_0(v7.DEFAULT_SCREEN_DISTANCE_TO_CAMERA);
    local v43 = l_useEarlyIsFocused_0() and v38.isActiveCard;
    local v44 = l_getCurrentRouteKey_0(l_navigation_0);
    local v45 = if l_descriptor_0.options.hasSubNavigation and v44 ~= nil then l_getRouteKeyIsInNavigationState_0(v44, l_descriptor_0.state) else v44 == l_descriptor_0.key;
    v44 = (if l_descriptor_0.options.hasSubNavigation then l_getActiveChildNavigationOptionsRecursively_0(l_navigation_0).screenKind else nil) or l_descriptor_0.options.screenKind or l_ScreenKind_0.Default;
    local v46 = v38.isVisible and (l_screenProps_0.isVisible == nil or l_screenProps_0.isVisible);
    local v47 = v30(v38.groupTransparency, l_screenProps_0.groupTransparency);
    local v48 = v3.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: l_Object_0 (ref), l_screenProps_0 (copy), v46 (copy), v47 (copy)
        return l_Object_0.assign({}, l_screenProps_0, {
            isVisible = v46, 
            groupTransparency = v47
        });
    end, {
        l_screenProps_0, 
        v46, 
        v47
    });
    local v49 = v3.createElement(v10, {
        screenKind = v44, 
        groupTransparency = v47
    }, {
        SceneView = v3.createElement(v9, {
            component = l_descriptor_0.getComponent(), 
            navigation = l_descriptor_0.navigation, 
            screenProps = v48, 
            isFocusable = v43 and v45, 
            shouldRestoreFocus = l_descriptor_0.options.enableFocusRestoration
        })
    });
    local v50 = if l_FFlagLuaAppCompositionSupport_0 then v3.createElement(v3.Fragment, nil, {
        CompositionStyleSheet = v3.createElement(l_CompositionStyleSheet_0), 
        Content = v49
    }) else v49;
    return v3.createElement(l_SurfaceGuiWithAdornee_0, {
        name = l_descriptor_0.key, 
        adorneeSize = v42.viewportFillDimensions:map(v22), 
        adorneeCFrame = v38.adorneeCFrame, 
        adorneeParent = l_screenProps_0.worldContainer, 
        canvasSize = if (l_descriptor_0.options.screenKind or l_ScreenKind_0.Default) == l_ScreenKind_0.FullScreen then v7.FULLSCREEN_CANVAS_SIZE else v7.DEFAULT_CANVAS_SIZE, 
        isVisible = v46, 
        surfaceGuiParent = l_screenProps_0.surfaceGuiContainer
    }, v50);
end;
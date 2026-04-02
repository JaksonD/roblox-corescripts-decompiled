local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = v4.Style.withStyle;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_0.LuaApp.Constants);
local v11 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v11.VRReadyWrapper;
local l_VRConstants_0 = v11.VRConstants;
local l_VRPanelWidthIXP_0 = v11.VRPanelWidthIXP;
local v15 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v16 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v16.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local v21 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v21.useNavBarPlacement;
local l_useNavBarSize_0 = v21.useNavBarSize;
local v24 = require(l_Modules_0.LuaApp.Util.SystemBarLabelTextSizeBinding);
local v25 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v28 = require(l_Modules_0.LuaApp.AppPage);
local v29 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_BumperHint_0 = require(l_CorePackages_0.Workspace.Packages.BumperNavigation).BumperHint;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v6.GetFFlagVRPanelWidthIXPEnabled;
local l_GetFFlagLuaAppEnableTopBanner_0 = v6.GetFFlagLuaAppEnableTopBanner;
local v34 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPS", false);
local v35 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPSForAll", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local v37 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v38 = v6.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v37();
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v6.FFlagLuaAppForceVrAppPanelWidthRollout;
local l_FFlagAddGamepadBumperNavigation_0 = v6.FFlagAddGamepadBumperNavigation;
local v41 = v1.PureComponent:extend("AppSystemBar");
local function _(v42) --[[ Line: 65 ]] --[[ Name: isTopPageWebView ]]
    -- upvalues: v29 (copy)
    local v43 = v42.Navigation.history[#v42.Navigation.history];
    local v44 = v29[v43[#v43].name];
    return v44 and v44.webView == true;
end;
v41.validateProps = v5.strictInterface({
    isVisible = v5.boolean, 
    displayOrder = v5.optional(v5.number), 
    layoutInfo = v5.optional(v5.table), 
    selectedIndex = v5.optional(v5.number), 
    items = v5.array(v5.any), 
    onActivated = v5.callback, 
    vrPanelWidthMultiplier = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    vrPanelCurvature = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    xOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    yOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    zOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    heightModifier = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v5.optional(v5.number), 
    globalGuiInset = v5.optional(v5.table), 
    isSpatial = v5.boolean, 
    navBarPlacement = v5.valueOf(v21.Placement), 
    navBarSize = v5.number, 
    showTooltip = if l_game_EngineFeature_0 then v5.optional(v5.boolean) else nil, 
    statusBarHeight = v5.number, 
    customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil
});
v41.defaultProps = {
    displayOrder = 0, 
    selectedIndex = 1
};
if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
    v41.init = function(v46) --[[ Line: 103 ]] --[[ Name: init ]]
        v46.alreadyTrackedPerformanceIntervals = {};
    end;
    v41.getPerformanceTrackerIntervalName = function(v47, v48) --[[ Line: 107 ]] --[[ Name: getPerformanceTrackerIntervalName ]]
        if v47.alreadyTrackedPerformanceIntervals[v48] ~= nil then
            return "go_to_" .. tostring(v48) .. "_" .. "warm";
        else
            v47.alreadyTrackedPerformanceIntervals[v48] = true;
            return "go_to_" .. tostring(v48) .. "_" .. "cold";
        end;
    end;
end;
v41.getAppNavBarProps = function(v49) --[[ Line: 117 ]] --[[ Name: getAppNavBarProps ]]
    -- upvalues: v21 (copy), v10 (copy), v38 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_memoize_0 (copy), v3 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), v34 (copy), v28 (copy), l_IntervalPerformanceTracker_0 (copy), v35 (copy), v24 (copy), v25 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy)
    local l_isSpatial_0 = v49.props.isSpatial;
    local l_navBarPlacement_0 = v49.props.navBarPlacement;
    local v52 = nil;
    local v53 = nil;
    local l_navBarSize_0 = v49.props.navBarSize;
    if l_isSpatial_0 then
        v52 = UDim2.fromOffset(0, 0);
        v53 = UDim2.new(0, l_navBarSize_0, 1, 0);
    elseif l_navBarPlacement_0 == v21.Placement.Bottom then
        v52 = UDim2.new(0, 0, 1, -v10.BOTTOM_BAR_SIZE);
        v53 = UDim2.new(1, 0, 0, v10.BOTTOM_BAR_SIZE);
    elseif l_navBarPlacement_0 == v21.Placement.Left then
        if v38 then
            v52 = UDim2.new(0, 0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v49.props.globalGuiInset.top else 0) + v49.props.statusBarHeight);
            v53 = UDim2.new(0, l_navBarSize_0, 1, if l_GetFFlagLuaAppEnableTopBanner_0() then v49.props.globalGuiInset.top else 0);
        else
            v52 = UDim2.new(0, -l_navBarSize_0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v49.props.globalGuiInset.top else 0) + v49.props.statusBarHeight);
            v53 = UDim2.new(0, l_navBarSize_0, 1, (if l_GetFFlagLuaAppEnableTopBanner_0() then v49.props.globalGuiInset.top else 0) - v49.props.statusBarHeight);
        end;
    else
        error((("unexpected navBarPlacement value: %*"):format(l_navBarPlacement_0)));
    end;
    v49.getAppNavBarItems = v49.getAppNavBarItems or l_memoize_0(function(v55) --[[ Line: 164 ]]
        -- upvalues: v3 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v34 (ref), v28 (ref), l_IntervalPerformanceTracker_0 (ref), v49 (copy), v35 (ref)
        return v3.List.map(v55, function(v56) --[[ Line: 166 ]]
            -- upvalues: v3 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v34 (ref), v28 (ref), l_IntervalPerformanceTracker_0 (ref), v49 (ref), v35 (ref)
            return v3.Dictionary.join(v56, {
                badgeValue = if v56.badgeCount ~= nil and v56.badgeCount ~= 0 then v56.badgeCount else nil, 
                onActivated = function() --[[ Line: 169 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v56 (copy), v34 (ref), v28 (ref), l_IntervalPerformanceTracker_0 (ref), v49 (ref), v35 (ref)
                    if l_GetFFlagEnableNavigationPerformanceIntervals_0() and v56.page ~= nil then
                        local v57 = v34 and v56.page == v28.AvatarExperienceRoot or nil;
                        l_IntervalPerformanceTracker_0:startTracking(v49:getPerformanceTrackerIntervalName(v56.page), 2, nil, v35 or v57, v35 or v57);
                    end;
                    return v49.props.onActivated(v56.page, v56.actionType);
                end
            });
        end);
    end);
    return {
        items = v49.getAppNavBarItems(v49.props.items), 
        placement = l_navBarPlacement_0, 
        position = v52, 
        size = v53, 
        systemBarLabelTextSizeBinding = v24, 
        buildCreatorWebNavUrl = v25, 
        selectedIndex = v49.props.selectedIndex, 
        isVisible = v49.props.isVisible, 
        clipsDescendants = not l_isSpatial_0 and nil, 
        showTooltip = v49.props.showTooltip, 
        leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v49.props.leadingComponent else nil, 
        trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v49.props.trailingComponent else nil
    };
end;
v41.render = function(v58) --[[ Line: 208 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), l_VRConstants_0 (copy), v1 (copy), l_VRReadyWrapper_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v21 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local l_layoutInfo_0 = v58.props.layoutInfo;
    local l_navBarSize_1 = v58.props.navBarSize;
    local v61 = l_layoutInfo_0 and l_layoutInfo_0.Background or {};
    return l_withStyle_0(function(v62) --[[ Line: 212 ]]
        -- upvalues: l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), v58 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (ref), l_VRConstants_0 (ref), v1 (ref), l_VRReadyWrapper_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagAddGamepadBumperNavigation_0 (ref), v21 (ref), v61 (copy), l_navBarSize_1 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (ref)
        local v63 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v58.props.xOffset then v58.props.xOffset else 0;
        local v64 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v58.props.yOffset then v58.props.yOffset else 0;
        local v65 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v58.props.zOffset then v58.props.zOffset else 0;
        local v66 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() and v58.props.vrPanelWidthMultiplier then Vector3.new(l_VRConstants_0.AppSystemBarPosition.X * v58.props.vrPanelWidthMultiplier + v63, l_VRConstants_0.AppSystemBarPosition.Y + v64, l_VRConstants_0.AppSystemBarPosition.Z + v65) else l_VRConstants_0.AppSystemBarPosition;
        local v67 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v58.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarResolution.X, l_VRConstants_0.AppSystemBarResolution.Y * v58.props.heightModifier) else l_VRConstants_0.AppSystemBarResolution;
        local v68 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v58.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarSize.X, l_VRConstants_0.AppSystemBarSize.Y * v58.props.heightModifier) else l_VRConstants_0.AppSystemBarSize;
        return v1.createElement(l_VRReadyWrapper_0, {
            component = "Frame", 
            props = {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, 
            vrProps = {
                partSize = v68, 
                offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v58.props.vrPanelCurvature == 0 then CFrame.new(v66) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(v66, l_VRConstants_0.DefaultCameraPosition, (Vector3.new(0, 1, 0, 0))), 
                virtualScreenSize = v67, 
                panelName = "AppSystemBar", 
                roundedCornersFrameColor = v62.Theme.NavigationBar.Color, 
                hidden = not v58.props.isVisible
            }
        }, v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, 
            customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v58.props.customEventMap else nil, 
            customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v58.props.customEventHandlers else nil
        }, {
            Background = if v58.props.navBarPlacement == v21.Placement.Bottom then v1.createElement("Frame", {
                AnchorPoint = v61.AnchorPoint, 
                Position = v61.Position, 
                Size = v61.Size, 
                BorderSizePixel = 0, 
                BackgroundTransparency = v62.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v62.Theme.NavigationBar.Color, 
                Active = true, 
                ZIndex = 0
            }) else nil, 
            StatusBarBackground = if v58.props.navBarPlacement == v21.Placement.Left then v1.createElement("Frame", {
                Position = UDim2.fromOffset(-l_navBarSize_1, if l_GetFFlagLuaAppEnableTopBanner_0() then -v58.props.globalGuiInset.top else 0), 
                Size = UDim2.fromOffset(l_navBarSize_1, v58.props.statusBarHeight), 
                BackgroundTransparency = v62.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v62.Theme.NavigationBar.Color, 
                BorderSizePixel = 0
            }) else nil, 
            RealSystemBar = v1.createElement(v21.AppNavBar, v58:getAppNavBarProps())
        }));
    end);
end;
if l_game_EngineFeature_0 then
    v41 = v7.connect(function(v69, _) --[[ Line: 306 ]]
        -- upvalues: v29 (copy)
        local v71 = {};
        local v72 = v69.Navigation.history[#v69.Navigation.history];
        local v73 = v29[v72[#v72].name];
        v71.showTooltip = not (v73 and v73.webView == true);
        return v71;
    end)(v41);
end;
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v41 = v15.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature, 
        xOffset = l_VRPanelWidthIXP_0.VrSystemBarXOffSet, 
        yOffset = l_VRPanelWidthIXP_0.VrSystemBarYOffSet, 
        zOffset = l_VRPanelWidthIXP_0.VrSystemBarZOffSet, 
        heightModifier = l_VRPanelWidthIXP_0.SystemBarHeightMultiplier
    })(v41);
end;
if l_GetFFlagLuaAppEnableTopBanner_0() then
    v41 = v7.connect(function(v74, _) --[[ Line: 325 ]]
        return {
            globalGuiInset = v74.GlobalGuiInset
        };
    end, function(_) --[[ Line: 329 ]]
        return {};
    end)(v41);
end;
return function(v77) --[[ Line: 334 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), l_useSelector_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v2 (copy), l_BumperHint_0 (copy), v3 (copy), v1 (copy), v41 (ref)
    local v78 = l_useIsSpatial_0();
    local v79 = l_useNavBarPlacement_0();
    local v80 = l_useNavBarSize_0();
    local v82 = l_useSelector_0(function(v81) --[[ Line: 338 ]]
        return v81.TopBar.statusBarHeight;
    end);
    local v83 = nil;
    local v84 = nil;
    if l_FFlagAddGamepadBumperNavigation_0 then
        v83 = v2.createElement(l_BumperHint_0, {
            isLeftBumper = true, 
            squareSize = v80
        });
        v84 = v2.createElement(l_BumperHint_0, {
            isRightBumper = true, 
            squareSize = v80
        });
    end;
    local v85 = v3.Dictionary.join(v77, {
        isSpatial = v78, 
        navBarPlacement = v79, 
        navBarSize = v80, 
        statusBarHeight = v82, 
        leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v83 else nil, 
        trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v84 else nil
    });
    return v1.createElement(v41, v85);
end;
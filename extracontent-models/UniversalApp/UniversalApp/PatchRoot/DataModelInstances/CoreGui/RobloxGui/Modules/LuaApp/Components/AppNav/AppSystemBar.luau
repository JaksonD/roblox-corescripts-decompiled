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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local v22 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v22.useNavBarPlacement;
local l_useNavBarSize_0 = v22.useNavBarSize;
local v25 = require(l_Modules_0.LuaApp.Util.SystemBarLabelTextSizeBinding);
local v26 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local v28 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useIsSpatial_0 = v28.useIsSpatial;
local v30 = require(l_Modules_0.LuaApp.AppPage);
local v31 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_BumperHint_0 = require(l_CorePackages_0.Workspace.Packages.BumperNavigation).BumperHint;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v6.GetFFlagVRPanelWidthIXPEnabled;
local l_GetFFlagLuaAppEnableTopBanner_0 = v6.GetFFlagLuaAppEnableTopBanner;
local v36 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPS", false);
local v37 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPSForAll", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v40 = v6.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v39();
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v6.FFlagLuaAppForceVrAppPanelWidthRollout;
local l_FFlagAddGamepadBumperNavigation_0 = v6.FFlagAddGamepadBumperNavigation;
local l_FFlagUseNavigationSelectors_0 = v6.FFlagUseNavigationSelectors;
local v44 = v1.PureComponent:extend("AppSystemBar");
local function _(v45) --[[ Line: 68 ]] --[[ Name: isTopPageWebView ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v31 (copy)
    local v46 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v45) else v45.Navigation.history[#v45.Navigation.history];
    local v47 = v31[v46[#v46].name];
    return v47 and v47.webView == true;
end;
v44.validateProps = v5.strictInterface({
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
    navBarPlacement = v5.valueOf(v22.Placement), 
    navBarSize = v5.number, 
    showTooltip = if l_game_EngineFeature_0 then v5.optional(v5.boolean) else nil, 
    statusBarHeight = v5.number, 
    customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    isBumperNavigationEnabled = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.boolean) else nil, 
    leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil, 
    trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v5.optional(v5.table) else nil
});
v44.defaultProps = {
    displayOrder = 0, 
    selectedIndex = 1
};
if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
    v44.init = function(v49) --[[ Line: 109 ]] --[[ Name: init ]]
        v49.alreadyTrackedPerformanceIntervals = {};
    end;
    v44.getPerformanceTrackerIntervalName = function(v50, v51) --[[ Line: 113 ]] --[[ Name: getPerformanceTrackerIntervalName ]]
        if v50.alreadyTrackedPerformanceIntervals[v51] ~= nil then
            return "go_to_" .. tostring(v51) .. "_" .. "warm";
        else
            v50.alreadyTrackedPerformanceIntervals[v51] = true;
            return "go_to_" .. tostring(v51) .. "_" .. "cold";
        end;
    end;
end;
v44.getAppNavBarProps = function(v52) --[[ Line: 123 ]] --[[ Name: getAppNavBarProps ]]
    -- upvalues: v22 (copy), v10 (copy), v40 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_memoize_0 (copy), v3 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), v36 (copy), v30 (copy), l_IntervalPerformanceTracker_0 (copy), v37 (copy), v25 (copy), v26 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy)
    local l_isSpatial_0 = v52.props.isSpatial;
    local l_navBarPlacement_0 = v52.props.navBarPlacement;
    local v55 = nil;
    local v56 = nil;
    local l_navBarSize_0 = v52.props.navBarSize;
    if l_isSpatial_0 then
        v55 = UDim2.fromOffset(0, 0);
        v56 = UDim2.new(0, l_navBarSize_0, 1, 0);
    elseif l_navBarPlacement_0 == v22.Placement.Bottom then
        v55 = UDim2.new(0, 0, 1, -v10.BOTTOM_BAR_SIZE);
        v56 = UDim2.new(1, 0, 0, v10.BOTTOM_BAR_SIZE);
    elseif l_navBarPlacement_0 == v22.Placement.Left then
        if v40 then
            v55 = UDim2.new(0, 0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v52.props.globalGuiInset.top else 0) + v52.props.statusBarHeight);
            v56 = UDim2.new(0, l_navBarSize_0, 1, if l_GetFFlagLuaAppEnableTopBanner_0() then v52.props.globalGuiInset.top else 0);
        else
            v55 = UDim2.new(0, -l_navBarSize_0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v52.props.globalGuiInset.top else 0) + v52.props.statusBarHeight);
            v56 = UDim2.new(0, l_navBarSize_0, 1, (if l_GetFFlagLuaAppEnableTopBanner_0() then v52.props.globalGuiInset.top else 0) - v52.props.statusBarHeight);
        end;
    else
        error((("unexpected navBarPlacement value: %*"):format(l_navBarPlacement_0)));
    end;
    v52.getAppNavBarItems = v52.getAppNavBarItems or l_memoize_0(function(v58) --[[ Line: 170 ]]
        -- upvalues: v3 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v36 (ref), v30 (ref), l_IntervalPerformanceTracker_0 (ref), v52 (copy), v37 (ref)
        return v3.List.map(v58, function(v59) --[[ Line: 172 ]]
            -- upvalues: v3 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v36 (ref), v30 (ref), l_IntervalPerformanceTracker_0 (ref), v52 (ref), v37 (ref)
            return v3.Dictionary.join(v59, {
                badgeValue = if v59.badgeCount ~= nil and v59.badgeCount ~= 0 then v59.badgeCount else nil, 
                onActivated = function() --[[ Line: 175 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v59 (copy), v36 (ref), v30 (ref), l_IntervalPerformanceTracker_0 (ref), v52 (ref), v37 (ref)
                    if l_GetFFlagEnableNavigationPerformanceIntervals_0() and v59.page ~= nil then
                        local v60 = v36 and v59.page == v30.AvatarExperienceRoot or nil;
                        l_IntervalPerformanceTracker_0:startTracking(v52:getPerformanceTrackerIntervalName(v59.page), 2, nil, v37 or v60, v37 or v60);
                    end;
                    return v52.props.onActivated(v59.page, v59.actionType);
                end
            });
        end);
    end);
    return {
        items = v52.getAppNavBarItems(v52.props.items), 
        placement = l_navBarPlacement_0, 
        position = v55, 
        size = v56, 
        systemBarLabelTextSizeBinding = v25, 
        buildCreatorWebNavUrl = v26, 
        selectedIndex = v52.props.selectedIndex, 
        isVisible = v52.props.isVisible, 
        clipsDescendants = not l_isSpatial_0 and nil, 
        showTooltip = v52.props.showTooltip, 
        leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v52.props.leadingComponent else nil, 
        trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v52.props.trailingComponent else nil
    };
end;
v44.render = function(v61) --[[ Line: 214 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), l_VRConstants_0 (copy), v1 (copy), l_VRReadyWrapper_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v22 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local l_layoutInfo_0 = v61.props.layoutInfo;
    local l_navBarSize_1 = v61.props.navBarSize;
    local v64 = l_layoutInfo_0 and l_layoutInfo_0.Background or {};
    return l_withStyle_0(function(v65) --[[ Line: 218 ]]
        -- upvalues: l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), v61 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (ref), l_VRConstants_0 (ref), v1 (ref), l_VRReadyWrapper_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), l_FFlagAddGamepadBumperNavigation_0 (ref), v22 (ref), v64 (copy), l_navBarSize_1 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (ref)
        local v66 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v61.props.xOffset then v61.props.xOffset else 0;
        local v67 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v61.props.yOffset then v61.props.yOffset else 0;
        local v68 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v61.props.zOffset then v61.props.zOffset else 0;
        local v69 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() and v61.props.vrPanelWidthMultiplier then Vector3.new(l_VRConstants_0.AppSystemBarPosition.X * v61.props.vrPanelWidthMultiplier + v66, l_VRConstants_0.AppSystemBarPosition.Y + v67, l_VRConstants_0.AppSystemBarPosition.Z + v68) else l_VRConstants_0.AppSystemBarPosition;
        local v70 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v61.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarResolution.X, l_VRConstants_0.AppSystemBarResolution.Y * v61.props.heightModifier) else l_VRConstants_0.AppSystemBarResolution;
        local v71 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v61.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarSize.X, l_VRConstants_0.AppSystemBarSize.Y * v61.props.heightModifier) else l_VRConstants_0.AppSystemBarSize;
        return v1.createElement(l_VRReadyWrapper_0, {
            component = "Frame", 
            props = {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, 
            vrProps = {
                partSize = v71, 
                offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v61.props.vrPanelCurvature == 0 then CFrame.new(v69) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(v69, l_VRConstants_0.DefaultCameraPosition, (Vector3.new(0, 1, 0, 0))), 
                virtualScreenSize = v70, 
                panelName = "AppSystemBar", 
                roundedCornersFrameColor = v65.Theme.NavigationBar.Color, 
                hidden = not v61.props.isVisible
            }
        }, v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.NavBar, 
            customEventMap = if l_FFlagAddGamepadBumperNavigation_0 then v61.props.customEventMap else nil, 
            customEventHandlers = if l_FFlagAddGamepadBumperNavigation_0 then v61.props.customEventHandlers else nil
        }, {
            Background = if v61.props.navBarPlacement == v22.Placement.Bottom then v1.createElement("Frame", {
                AnchorPoint = v64.AnchorPoint, 
                Position = v64.Position, 
                Size = v64.Size, 
                BorderSizePixel = 0, 
                BackgroundTransparency = v65.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v65.Theme.NavigationBar.Color, 
                Active = true, 
                ZIndex = 0
            }) else nil, 
            StatusBarBackground = if v61.props.navBarPlacement == v22.Placement.Left then v1.createElement("Frame", {
                Position = UDim2.fromOffset(-l_navBarSize_1, if l_GetFFlagLuaAppEnableTopBanner_0() then -v61.props.globalGuiInset.top else 0), 
                Size = UDim2.fromOffset(l_navBarSize_1, v61.props.statusBarHeight), 
                BackgroundTransparency = v65.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v65.Theme.NavigationBar.Color, 
                BorderSizePixel = 0
            }) else nil, 
            RealSystemBar = v1.createElement(v22.AppNavBar, v61:getAppNavBarProps())
        }));
    end);
end;
if l_game_EngineFeature_0 then
    v44 = v7.connect(function(v72, _) --[[ Line: 312 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v31 (copy)
        local v74 = {};
        local v75 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v72) else v72.Navigation.history[#v72.Navigation.history];
        local v76 = v31[v75[#v75].name];
        v74.showTooltip = not (v76 and v76.webView == true);
        return v74;
    end)(v44);
end;
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v44 = v15.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature, 
        xOffset = l_VRPanelWidthIXP_0.VrSystemBarXOffSet, 
        yOffset = l_VRPanelWidthIXP_0.VrSystemBarYOffSet, 
        zOffset = l_VRPanelWidthIXP_0.VrSystemBarZOffSet, 
        heightModifier = l_VRPanelWidthIXP_0.SystemBarHeightMultiplier
    })(v44);
end;
if l_GetFFlagLuaAppEnableTopBanner_0() then
    v44 = v7.connect(function(v77, _) --[[ Line: 331 ]]
        return {
            globalGuiInset = v77.GlobalGuiInset
        };
    end, function(_) --[[ Line: 335 ]]
        return {};
    end)(v44);
end;
return function(v80) --[[ Line: 340 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), l_useSelector_0 (copy), l_FFlagAddGamepadBumperNavigation_0 (copy), v28 (copy), v2 (copy), l_BumperHint_0 (copy), v3 (copy), v1 (copy), v44 (ref)
    local v81 = l_useIsSpatial_0();
    local v82 = l_useNavBarPlacement_0();
    local v83 = l_useNavBarSize_0();
    local v85 = l_useSelector_0(function(v84) --[[ Line: 344 ]]
        return v84.TopBar.statusBarHeight;
    end);
    local v86 = nil;
    local v87 = nil;
    if l_FFlagAddGamepadBumperNavigation_0 and v28.useBreakpointYOrLarger(v28.Keys.Medium) and v80.isBumperNavigationEnabled then
        v86 = v2.createElement(l_BumperHint_0, {
            isLeftBumper = true, 
            squareSize = v83
        });
        v87 = v2.createElement(l_BumperHint_0, {
            isRightBumper = true, 
            squareSize = v83
        });
    end;
    local v88 = v3.Dictionary.join(v80, {
        isSpatial = v81, 
        navBarPlacement = v82, 
        navBarSize = v83, 
        statusBarHeight = v85, 
        leadingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v86 else nil, 
        trailingComponent = if l_FFlagAddGamepadBumperNavigation_0 then v87 else nil
    });
    return v1.createElement(v44, v88);
end;
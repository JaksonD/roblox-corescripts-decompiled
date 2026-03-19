local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = v3.Style.withStyle;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v10.VRReadyWrapper;
local l_VRConstants_0 = v10.VRConstants;
local l_VRPanelWidthIXP_0 = v10.VRPanelWidthIXP;
local v14 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v15 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v15.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v15.FocusNavigableSurfaceIdentifierEnum;
local l_IntervalPerformanceTracker_0 = require(l_CorePackages_0.Workspace.Packages.IntervalPerformanceTracker).IntervalPerformanceTracker;
local l_GetFFlagEnableNavigationPerformanceIntervals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableNavigationPerformanceIntervals;
local v20 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v20.useNavBarPlacement;
local l_useNavBarSize_0 = v20.useNavBarSize;
local v23 = require(l_Modules_0.LuaApp.Util.SystemBarLabelTextSizeBinding);
local v24 = require(l_Modules_0.LuaApp.buildCreatorWebNavUrl);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v27 = require(l_Modules_0.LuaApp.AppPage);
local v28 = require(l_Modules_0.LuaApp.AppPageProperties);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v5.GetFFlagVRPanelWidthIXPEnabled;
local l_GetFFlagLuaAppEnableTopBanner_0 = v5.GetFFlagLuaAppEnableTopBanner;
local v32 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPS", false);
local v33 = game:DefineFastFlag("AXAppSystemBarEnableTelemtryForFPSForAll", false);
local l_game_EngineFeature_0 = game:GetEngineFeature("WebViewRedesignEnabled");
local v35 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v36 = v5.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v35();
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v5.FFlagLuaAppForceVrAppPanelWidthRollout;
local v38 = v1.PureComponent:extend("AppSystemBar");
local function _(v39) --[[ Line: 62 ]] --[[ Name: isTopPageWebView ]]
    -- upvalues: v28 (copy)
    local v40 = v39.Navigation.history[#v39.Navigation.history];
    local v41 = v28[v40[#v40].name];
    return v41 and v41.webView == true;
end;
v38.validateProps = v4.strictInterface({
    isVisible = v4.boolean, 
    displayOrder = v4.optional(v4.number), 
    layoutInfo = v4.optional(v4.table), 
    selectedIndex = v4.optional(v4.number), 
    items = v4.array(v4.any), 
    onActivated = v4.callback, 
    vrPanelWidthMultiplier = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    vrPanelCurvature = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    xOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    yOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    zOffset = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    heightModifier = if l_FFlagLuaAppForceVrAppPanelWidthRollout_0 then nil else v4.optional(v4.number), 
    globalGuiInset = v4.optional(v4.table), 
    isSpatial = v4.boolean, 
    navBarPlacement = v4.valueOf(v20.Placement), 
    navBarSize = v4.number, 
    showTooltip = if l_game_EngineFeature_0 then v4.optional(v4.boolean) else nil, 
    statusBarHeight = v4.number
});
v38.defaultProps = {
    displayOrder = 0, 
    selectedIndex = 1
};
if l_GetFFlagEnableNavigationPerformanceIntervals_0() then
    v38.init = function(v43) --[[ Line: 96 ]] --[[ Name: init ]]
        v43.alreadyTrackedPerformanceIntervals = {};
    end;
    v38.getPerformanceTrackerIntervalName = function(v44, v45) --[[ Line: 100 ]] --[[ Name: getPerformanceTrackerIntervalName ]]
        if v44.alreadyTrackedPerformanceIntervals[v45] ~= nil then
            return "go_to_" .. tostring(v45) .. "_" .. "warm";
        else
            v44.alreadyTrackedPerformanceIntervals[v45] = true;
            return "go_to_" .. tostring(v45) .. "_" .. "cold";
        end;
    end;
end;
v38.getAppNavBarProps = function(v46) --[[ Line: 110 ]] --[[ Name: getAppNavBarProps ]]
    -- upvalues: v20 (copy), v9 (copy), v36 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), l_memoize_0 (copy), v2 (copy), l_GetFFlagEnableNavigationPerformanceIntervals_0 (copy), v32 (copy), v27 (copy), l_IntervalPerformanceTracker_0 (copy), v33 (copy), v23 (copy), v24 (copy)
    local l_isSpatial_0 = v46.props.isSpatial;
    local l_navBarPlacement_0 = v46.props.navBarPlacement;
    local v49 = nil;
    local v50 = nil;
    local l_navBarSize_0 = v46.props.navBarSize;
    if l_isSpatial_0 then
        v49 = UDim2.fromOffset(0, 0);
        v50 = UDim2.new(0, l_navBarSize_0, 1, 0);
    elseif l_navBarPlacement_0 == v20.Placement.Bottom then
        v49 = UDim2.new(0, 0, 1, -v9.BOTTOM_BAR_SIZE);
        v50 = UDim2.new(1, 0, 0, v9.BOTTOM_BAR_SIZE);
    elseif l_navBarPlacement_0 == v20.Placement.Left then
        if v36 then
            v49 = UDim2.new(0, 0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v46.props.globalGuiInset.top else 0) + v46.props.statusBarHeight);
            v50 = UDim2.new(0, l_navBarSize_0, 1, if l_GetFFlagLuaAppEnableTopBanner_0() then v46.props.globalGuiInset.top else 0);
        else
            v49 = UDim2.new(0, -l_navBarSize_0, 0, (if l_GetFFlagLuaAppEnableTopBanner_0() then -v46.props.globalGuiInset.top else 0) + v46.props.statusBarHeight);
            v50 = UDim2.new(0, l_navBarSize_0, 1, (if l_GetFFlagLuaAppEnableTopBanner_0() then v46.props.globalGuiInset.top else 0) - v46.props.statusBarHeight);
        end;
    else
        error((("unexpected navBarPlacement value: %*"):format(l_navBarPlacement_0)));
    end;
    v46.getAppNavBarItems = v46.getAppNavBarItems or l_memoize_0(function(v52) --[[ Line: 157 ]]
        -- upvalues: v2 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v32 (ref), v27 (ref), l_IntervalPerformanceTracker_0 (ref), v46 (copy), v33 (ref)
        return v2.List.map(v52, function(v53) --[[ Line: 159 ]]
            -- upvalues: v2 (ref), l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v32 (ref), v27 (ref), l_IntervalPerformanceTracker_0 (ref), v46 (ref), v33 (ref)
            return v2.Dictionary.join(v53, {
                badgeValue = if v53.badgeCount ~= nil and v53.badgeCount ~= 0 then v53.badgeCount else nil, 
                onActivated = function() --[[ Line: 162 ]] --[[ Name: onActivated ]]
                    -- upvalues: l_GetFFlagEnableNavigationPerformanceIntervals_0 (ref), v53 (copy), v32 (ref), v27 (ref), l_IntervalPerformanceTracker_0 (ref), v46 (ref), v33 (ref)
                    if l_GetFFlagEnableNavigationPerformanceIntervals_0() and v53.page ~= nil then
                        local v54 = v32 and v53.page == v27.AvatarExperienceRoot or nil;
                        l_IntervalPerformanceTracker_0:startTracking(v46:getPerformanceTrackerIntervalName(v53.page), 2, nil, v33 or v54, v33 or v54);
                    end;
                    return v46.props.onActivated(v53.page, v53.actionType);
                end
            });
        end);
    end);
    return {
        items = v46.getAppNavBarItems(v46.props.items), 
        placement = l_navBarPlacement_0, 
        position = v49, 
        size = v50, 
        systemBarLabelTextSizeBinding = v23, 
        buildCreatorWebNavUrl = v24, 
        selectedIndex = v46.props.selectedIndex, 
        isVisible = v46.props.isVisible, 
        clipsDescendants = not l_isSpatial_0 and nil, 
        showTooltip = v46.props.showTooltip
    };
end;
v38.render = function(v55) --[[ Line: 199 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), l_VRConstants_0 (copy), v1 (copy), l_VRReadyWrapper_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v20 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    local l_layoutInfo_0 = v55.props.layoutInfo;
    local l_navBarSize_1 = v55.props.navBarSize;
    local v58 = l_layoutInfo_0 and l_layoutInfo_0.Background or {};
    return l_withStyle_0(function(v59) --[[ Line: 203 ]]
        -- upvalues: l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), v55 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (ref), l_VRConstants_0 (ref), v1 (ref), l_VRReadyWrapper_0 (ref), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v20 (ref), v58 (copy), l_navBarSize_1 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (ref)
        local v60 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v55.props.xOffset then v55.props.xOffset else 0;
        local v61 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v55.props.yOffset then v55.props.yOffset else 0;
        local v62 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v55.props.zOffset then v55.props.zOffset else 0;
        local v63 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() and v55.props.vrPanelWidthMultiplier then Vector3.new(l_VRConstants_0.AppSystemBarPosition.X * v55.props.vrPanelWidthMultiplier + v60, l_VRConstants_0.AppSystemBarPosition.Y + v61, l_VRConstants_0.AppSystemBarPosition.Z + v62) else l_VRConstants_0.AppSystemBarPosition;
        local v64 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v55.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarResolution.X, l_VRConstants_0.AppSystemBarResolution.Y * v55.props.heightModifier) else l_VRConstants_0.AppSystemBarResolution;
        local v65 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v55.props.heightModifier then Vector2.new(l_VRConstants_0.AppSystemBarSize.X, l_VRConstants_0.AppSystemBarSize.Y * v55.props.heightModifier) else l_VRConstants_0.AppSystemBarSize;
        return v1.createElement(l_VRReadyWrapper_0, {
            component = "Frame", 
            props = {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                ZIndex = 2
            }, 
            vrProps = {
                partSize = v65, 
                offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v55.props.vrPanelCurvature == 0 then CFrame.new(v63) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(v63, l_VRConstants_0.DefaultCameraPosition, (Vector3.new(0, 1, 0, 0))), 
                virtualScreenSize = v64, 
                panelName = "AppSystemBar", 
                roundedCornersFrameColor = v59.Theme.NavigationBar.Color, 
                hidden = not v55.props.isVisible
            }
        }, v1.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.NavBar
        }, {
            Background = if v55.props.navBarPlacement == v20.Placement.Bottom then v1.createElement("Frame", {
                AnchorPoint = v58.AnchorPoint, 
                Position = v58.Position, 
                Size = v58.Size, 
                BorderSizePixel = 0, 
                BackgroundTransparency = v59.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v59.Theme.NavigationBar.Color, 
                Active = true, 
                ZIndex = 0
            }) else nil, 
            StatusBarBackground = if v55.props.navBarPlacement == v20.Placement.Left then v1.createElement("Frame", {
                Position = UDim2.fromOffset(-l_navBarSize_1, if l_GetFFlagLuaAppEnableTopBanner_0() then -v55.props.globalGuiInset.top else 0), 
                Size = UDim2.fromOffset(l_navBarSize_1, v55.props.statusBarHeight), 
                BackgroundTransparency = v59.Theme.NavigationBar.Transparency, 
                BackgroundColor3 = v59.Theme.NavigationBar.Color, 
                BorderSizePixel = 0
            }) else nil, 
            RealSystemBar = v1.createElement(v20.AppNavBar, v55:getAppNavBarProps())
        }));
    end);
end;
if l_game_EngineFeature_0 then
    v38 = v6.connect(function(v66, _) --[[ Line: 295 ]]
        -- upvalues: v28 (copy)
        local v68 = {};
        local v69 = v66.Navigation.history[#v66.Navigation.history];
        local v70 = v28[v69[#v69].name];
        v68.showTooltip = not (v70 and v70.webView == true);
        return v68;
    end)(v38);
end;
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v38 = v14.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature, 
        xOffset = l_VRPanelWidthIXP_0.VrSystemBarXOffSet, 
        yOffset = l_VRPanelWidthIXP_0.VrSystemBarYOffSet, 
        zOffset = l_VRPanelWidthIXP_0.VrSystemBarZOffSet, 
        heightModifier = l_VRPanelWidthIXP_0.SystemBarHeightMultiplier
    })(v38);
end;
if l_GetFFlagLuaAppEnableTopBanner_0() then
    v38 = v6.connect(function(v71, _) --[[ Line: 314 ]]
        return {
            globalGuiInset = v71.GlobalGuiInset
        };
    end, function(_) --[[ Line: 318 ]]
        return {};
    end)(v38);
end;
return function(v74) --[[ Line: 323 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), l_useSelector_0 (copy), v2 (copy), v1 (copy), v38 (ref)
    local v75 = l_useIsSpatial_0();
    local v76 = l_useNavBarPlacement_0();
    local v77 = l_useNavBarSize_0();
    local v79 = l_useSelector_0(function(v78) --[[ Line: 327 ]]
        return v78.TopBar.statusBarHeight;
    end);
    local v80 = v2.Dictionary.join(v74, {
        isSpatial = v75, 
        navBarPlacement = v76, 
        navBarSize = v77, 
        statusBarHeight = v79
    });
    return v1.createElement(v38, v80);
end;
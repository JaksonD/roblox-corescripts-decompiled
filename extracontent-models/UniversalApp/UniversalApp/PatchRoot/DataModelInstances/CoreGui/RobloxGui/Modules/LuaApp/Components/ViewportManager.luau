local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Workspace_0 = game:GetService("Workspace");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v11 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_MainScreenResolution_0 = v11.VRConstants.MainScreenResolution;
local l_VRPanelWidthIXP_0 = v11.VRPanelWidthIXP;
local v14 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v16 = require(l_Modules_0.LuaApp.getScreenBottomInset);
local v17 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v18 = require(l_Modules_0.LuaApp.Actions.SetScreenSize);
local v19 = require(l_Modules_0.LuaApp.Actions.SetDeviceOrientation);
local l_SetFormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Actions.SetFormFactor;
local v21 = require(l_Modules_0.LuaApp.Actions.SetStatusBarHeight);
local v22 = require(l_Modules_0.LuaApp.Actions.SetGlobalGuiInset);
local v23 = require(l_Modules_0.LuaApp.Actions.SetGlobalContextMenuInset);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v27 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_getVirtualResolutionScale_0 = v27.getVirtualResolutionScale;
local l_HardwareSafeAreaInsets_0 = v27.HardwareSafeAreaInsets;
local l_useIsSpatial_0 = v27.useIsSpatial;
local v31 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_useNavBarPlacement_0 = v31.useNavBarPlacement;
local l_useNavBarSize_0 = v31.useNavBarSize;
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagSetOrientationWhenRequested);
local v35 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v35.GetFFlagVRPanelWidthIXPEnabled;
local l_GetFFlagApplyResolutionScale_0 = v35.GetFFlagApplyResolutionScale;
local l_GetFFlagLuaAppEnableTopBanner_0 = v35.GetFFlagLuaAppEnableTopBanner;
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixStudioNotchSupport);
local v40 = v35.FFlagLuaAppUseDeviceSafeInsetsForAppContainer and v39();
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v35.FFlagLuaAppForceVrAppPanelWidthRollout;
local v42 = v5.Component:extend("ViewportManager");
v42.init = function(v43) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v34 (copy), l_FormFactor_0 (copy), v39 (copy), l_HardwareSafeAreaInsets_0 (copy), l_Workspace_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_MainScreenResolution_0 (copy), l_GetFFlagApplyResolutionScale_0 (copy), l_getVirtualResolutionScale_0 (copy), v40 (copy), l_UserInputService_0 (copy), v16 (copy), l_GetFFlagLuaAppEnableTopBanner_0 (copy), v31 (copy), v8 (copy)
    v43.updateDeviceOrientation = function(v44) --[[ Line: 60 ]]
        -- upvalues: l_DeviceOrientationMode_0 (ref), v34 (ref), v43 (copy)
        local v45 = v44.x > v44.y and l_DeviceOrientationMode_0.Landscape or l_DeviceOrientationMode_0.Portrait;
        if v34() or v43.props.deviceOrientation ~= v45 then
            v43.props.setDeviceOrientation(v45);
        end;
    end;
    v43.updateDeviceFormFactor = function(v46) --[[ Line: 69 ]]
        -- upvalues: v43 (copy), l_FormFactor_0 (ref)
        local l_useWidthBasedRule_0 = v43.props.useWidthBasedRule;
        local l_WIDE_0 = l_FormFactor_0.WIDE;
        if l_useWidthBasedRule_0 then
            if v46.X < 600 then
                l_WIDE_0 = l_FormFactor_0.COMPACT;
            end;
        elseif v46.Y > v46.X then
            l_WIDE_0 = l_FormFactor_0.COMPACT;
        end;
        v43.props.setFormFactor(l_WIDE_0);
    end;
    v43.updateViewport = function() --[[ Line: 86 ]]
        -- upvalues: v39 (ref), l_HardwareSafeAreaInsets_0 (ref), l_Workspace_0 (ref), v43 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), l_MainScreenResolution_0 (ref), l_GetFFlagApplyResolutionScale_0 (ref), l_getVirtualResolutionScale_0 (ref)
        local v49 = nil;
        v49 = if v39() then l_HardwareSafeAreaInsets_0.fullscreenGui().AbsoluteSize else l_Workspace_0.CurrentCamera.ViewportSize;
        if v43.props.use3DPanels then
            v49 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v43.props.vrPanelWidthMultiplier then Vector2.new(l_MainScreenResolution_0.X * v43.props.vrPanelWidthMultiplier, l_MainScreenResolution_0.Y) else l_MainScreenResolution_0;
        end;
        if l_GetFFlagApplyResolutionScale_0() then
            local v50 = l_getVirtualResolutionScale_0();
            local v51 = Vector2.new(v49.X / v50, v49.Y / v50);
            v43.props.setScreenSize(v51);
            v43.updateDeviceOrientation(v51);
            v43.updateDeviceFormFactor(v51);
            return;
        else
            if v49.X > 1 and v49.Y > 1 then
                v43.props.setScreenSize(v49);
                v43.updateDeviceOrientation(v49);
                v43.updateDeviceFormFactor(v49);
            end;
            return;
        end;
    end;
    v43.pointCameraTo3DPanels = function() --[[ Line: 121 ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if l_CurrentCamera_0 then
            l_CurrentCamera_0.CFrame = CFrame.new(0, 5, 0);
        end;
    end;
    v43.updateStatusBarHeight = function() --[[ Line: 128 ]]
        -- upvalues: v40 (ref), v43 (copy), l_UserInputService_0 (ref)
        if v40 then
            v43.props.setStatusBarHeight(0);
            return;
        else
            v43.props.setStatusBarHeight(l_UserInputService_0.StatusBarSize.Y);
            return;
        end;
    end;
    v43.updateGlobalGuiInset = function() --[[ Line: 143 ]]
        -- upvalues: v43 (copy), v16 (ref), l_UserInputService_0 (ref), l_GetFFlagLuaAppEnableTopBanner_0 (ref), v31 (ref), v8 (ref)
        local l_bottomBarVisible_0 = v43.props.bottomBarVisible;
        local l_appTopBannerContentHeight_0 = v43.props.appTopBannerContentHeight;
        local l_appTopBannerVisible_0 = v43.props.appTopBannerVisible;
        local v56 = v16();
        local v57 = 0;
        local l_X_0 = l_UserInputService_0.RightBarSize.X;
        local v59 = if l_GetFFlagLuaAppEnableTopBanner_0() and l_appTopBannerVisible_0 then l_appTopBannerContentHeight_0 else 0;
        if l_bottomBarVisible_0 and not v43.props.use3DPanels and v43.props.navBarPlacement == v31.Placement.Left then
            v57 = v57 + v43.props.navBarSize;
        end;
        v8.GetDisplayStore().setGuiInset({
            left = v57, 
            top = v59, 
            right = l_X_0, 
            bottom = v56
        });
        v43.props.setGlobalContextMenuInset(0, 0, l_X_0, v56);
        v43.props.setGlobalGuiInset(v57, v59, l_X_0, v56);
    end;
    if v39() then
        v43.viewportSizeChangedConnnection = l_HardwareSafeAreaInsets_0.fullscreenGui():GetPropertyChangedSignal("AbsoluteSize"):Connect(v43.updateViewport);
    else
        v43.viewportSizeChangedConnnection = l_Workspace_0.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v43.updateViewport);
    end;
    v43.updateViewport();
end;
v42.render = function(v60) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v17 (copy), l_UserInputService_0 (copy)
    local l_guiService_0 = v60.props.guiService;
    return v5.createElement("Folder", {}, {
        statusBarSizeListener = v5.createElement(v17, {
            event = l_UserInputService_0:GetPropertyChangedSignal("StatusBarSize"), 
            callback = v60.updateStatusBarHeight
        }), 
        bottomBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and v5.createElement(v17, {
            event = l_UserInputService_0:GetPropertyChangedSignal("BottomBarSize"), 
            callback = v60.updateGlobalGuiInset
        }), 
        rightBarSizeListener = not _G.__TESTEZ_RUNNING_TEST__ and v5.createElement(v17, {
            event = l_UserInputService_0:GetPropertyChangedSignal("RightBarSize"), 
            callback = v60.updateGlobalGuiInset
        }), 
        safeZoneOffsetsListener = not _G.__TESTEZ_RUNNING_TEST__ and v5.createElement(v17, {
            event = l_guiService_0.SafeZoneOffsetsChanged, 
            callback = v60.updateGlobalGuiInset
        })
    });
end;
v42.didMount = function(v62) --[[ Line: 206 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy)
    l_UserInputService_0.LegacyInputEventsEnabled = false;
    v62.updateStatusBarHeight();
    v62.updateGlobalGuiInset();
    if v62.props.use3DPanels then
        v62.pointCameraTo3DPanels();
    end;
end;
v42.willUnmount = function(v63) --[[ Line: 217 ]] --[[ Name: willUnmount ]]
    if v63.viewportSizeChangedConnnection then
        v63.viewportSizeChangedConnnection:Disconnect();
        v63.viewportSizeChangedConnnection = nil;
    end;
end;
v42.didUpdate = function(v64, v65) --[[ Line: 224 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GetFFlagLuaAppEnableTopBanner_0 (copy), v39 (copy)
    if v64.props.use3DPanels and (v65.vrPanelWidthMultiplier ~= v64.props.vrPanelWidthMultiplier or v65.use3DPanels ~= v64.props.use3DPanels) then
        v64.updateViewport();
    end;
    if v64.props.bottomBarVisible ~= v65.bottomBarVisible then
        v64.updateGlobalGuiInset();
    end;
    if l_GetFFlagLuaAppEnableTopBanner_0() and (v64.props.appTopBannerVisible ~= v65.appTopBannerVisible or v64.props.appTopBannerContentHeight ~= v65.appTopBannerContentHeight) then
        v64.updateGlobalGuiInset();
    end;
    if v64.props.use3DPanels ~= v65.use3DPanels or v64.props.navBarPlacement ~= v65.navBarPlacement or v64.props.navBarSize ~= v65.navBarSize then
        v64.updateGlobalGuiInset();
    end;
    if not v39() then
        local l_globalGuiInset_0 = v64.props.globalGuiInset;
        if l_globalGuiInset_0 ~= v65.globalGuiInset then
            v64.props.guiService:SetGlobalGuiInset(l_globalGuiInset_0.left, l_globalGuiInset_0.top, l_globalGuiInset_0.right, l_globalGuiInset_0.bottom);
        end;
    end;
    local l_hasScreenGuiBlur_0 = v64.props.hasScreenGuiBlur;
    if l_hasScreenGuiBlur_0 ~= v65.hasScreenGuiBlur then
        v64.props.runService:SetRobloxGuiFocused(l_hasScreenGuiBlur_0);
    end;
    if v64.props.use3DPanels and not v65.use3DPanels then
        v64.pointCameraTo3DPanels();
    end;
end;
v42 = v6.connect(function(v68) --[[ Line: 279 ]]
    -- upvalues: l_GetFFlagLuaAppEnableTopBanner_0 (copy)
    return {
        statusBarHeight = v68.TopBar.statusBarHeight, 
        deviceOrientation = v68.DeviceOrientation, 
        globalGuiInset = v68.GlobalGuiInset, 
        globalContextMenuInset = v68.GlobalContextMenuInset, 
        bottomBarVisible = v68.TabBarVisible, 
        hasScreenGuiBlur = v68.ScreenGuiBlur.hasBlur, 
        appTopBannerContentHeight = if l_GetFFlagLuaAppEnableTopBanner_0() then v68.AppTopBanner.appTopBannerContentHeight else 0, 
        appTopBannerVisible = if l_GetFFlagLuaAppEnableTopBanner_0() then v68.AppTopBanner.expanded and not v68.AppTopBanner.isDisabled else false
    };
end, function(v69) --[[ Line: 294 ]]
    -- upvalues: v18 (copy), v19 (copy), l_SetFormFactor_0 (copy), v21 (copy), v22 (copy), v23 (copy)
    return {
        setScreenSize = function(v70) --[[ Line: 296 ]] --[[ Name: setScreenSize ]]
            -- upvalues: v69 (copy), v18 (ref)
            v69(v18(v70));
        end, 
        setDeviceOrientation = function(v71) --[[ Line: 299 ]] --[[ Name: setDeviceOrientation ]]
            -- upvalues: v69 (copy), v19 (ref)
            v69(v19(v71));
        end, 
        setFormFactor = function(v72) --[[ Line: 302 ]] --[[ Name: setFormFactor ]]
            -- upvalues: v69 (copy), l_SetFormFactor_0 (ref)
            v69(l_SetFormFactor_0(v72));
        end, 
        setStatusBarHeight = function(v73) --[[ Line: 305 ]] --[[ Name: setStatusBarHeight ]]
            -- upvalues: v69 (copy), v21 (ref)
            v69(v21(v73));
        end, 
        setGlobalGuiInset = function(v74, v75, v76, v77) --[[ Line: 308 ]] --[[ Name: setGlobalGuiInset ]]
            -- upvalues: v69 (copy), v22 (ref)
            return v69(v22(v74, v75, v76, v77));
        end, 
        setGlobalContextMenuInset = function(v78, v79, v80, v81) --[[ Line: 311 ]] --[[ Name: setGlobalContextMenuInset ]]
            -- upvalues: v69 (copy), v23 (ref)
            return v69(v23(v78, v79, v80, v81));
        end
    };
end)(v42);
v42 = l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    runService = l_AppRunService_0
})(v42);
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v42 = v14.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v42);
end;
v42 = l_RoactAppPolicy_0.connect(function(v82, _) --[[ Line: 329 ]]
    return {
        useWidthBasedRule = v82.getUseWidthBasedFormFactorRule()
    };
end)(v42);
return function(v84) --[[ Line: 335 ]]
    -- upvalues: l_useIsSpatial_0 (copy), l_useNavBarPlacement_0 (copy), l_useNavBarSize_0 (copy), v7 (copy), v5 (copy), v42 (ref)
    local v85 = l_useIsSpatial_0();
    local v86 = l_useNavBarPlacement_0();
    local v87 = l_useNavBarSize_0();
    local v88 = v7.Dictionary.join(v84, {
        use3DPanels = v85, 
        navBarPlacement = v86, 
        navBarSize = v87
    });
    return v5.createElement(v42, v88);
end;
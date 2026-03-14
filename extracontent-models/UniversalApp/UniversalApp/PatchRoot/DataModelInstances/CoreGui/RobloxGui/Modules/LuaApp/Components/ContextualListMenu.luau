local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_LuaApp_0 = l_Modules_0.LuaApp;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRReadyWrapper_0 = v6.VRReadyWrapper;
local l_VRConstants_0 = v6.VRConstants;
local l_VRPanelWidthIXP_0 = v6.VRPanelWidthIXP;
local v10 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v11 = require(l_Modules_0.Common.Roact);
local v12 = require(l_Modules_0.Common.RoactRodux);
local v13 = require(l_LuaApp_0.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v16 = require(l_LuaApp_0.Components.FramePopOut);
local v17 = require(l_LuaApp_0.Components.FramePopup);
local v18 = require(l_CorePackages_0.Packages.InputHandlers);
local v19 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v19.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v19.FocusNavigableSurfaceIdentifierEnum;
local l_FocusNavigationEventNameEnum_0 = v19.FocusNavigationEventNameEnum;
local v23 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local v24 = if v23 then require(l_CorePackages_0.Workspace.Packages.FlyoutSidePanel).FlyoutScrollAwayControl else nil;
local v25 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v25.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v25.FFlagLuaAppForceVrAppPanelWidthRollout;
local v28 = v11.PureComponent:extend("ContextualListMenu");
v28.defaultProps = {
    menuWidth = v5.DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH
};
v28.init = function(v29) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_FocusNavigationEventNameEnum_0 (copy), v18 (copy)
    v29.focusEventHandlers = {
        [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
            handler = v18.onRelease(function(v30) --[[ Line: 60 ]]
                -- upvalues: v29 (copy)
                local l_callbackCancel_0 = v29.props.callbackCancel;
                if l_callbackCancel_0 ~= nil then
                    l_callbackCancel_0();
                    v30:cancel();
                end;
            end)
        }
    };
end;
v28.render = function(v32) --[[ Line: 71 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_FormFactor_0 (copy), v13 (copy), v16 (copy), v17 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_getSafeAreaSize_0 (copy), l_withStyle_0 (copy), l_CoreGui_0 (copy), l_VRReadyWrapper_0 (copy), v5 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_VRConstants_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy)
    local v33 = v32.props[v11.Children] or {};
    local l_callbackCancel_1 = v32.props.callbackCancel;
    local l_formFactor_0 = v32.props.formFactor;
    local l_screenSize_0 = v32.props.screenSize;
    local l_globalContextMenuInset_0 = v32.props.globalContextMenuInset;
    local l_menuWidth_0 = v32.props.menuWidth;
    local l_screenShape_0 = v32.props.screenShape;
    local v40 = l_formFactor_0 == l_FormFactor_0.WIDE;
    if l_screenSize_0.X <= 0 or l_screenSize_0.Y <= 0 then
        return nil;
    else
        v33.Layout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        });
        local v41 = v11.createElement(v13.FitFrame, {
            BackgroundTransparency = 1, 
            fitAxis = v13.FitAxis.Height, 
            Size = UDim2.new(1, 0, 0, 0)
        }, v33);
        local v42 = nil;
        v42 = if v40 then v11.createElement(v16, {
            itemWidth = l_menuWidth_0, 
            onCancel = l_callbackCancel_1, 
            parentShape = l_screenShape_0
        }, {
            Content = v41
        }) else v11.createElement(v17, {
            onCancel = l_callbackCancel_1
        }, {
            Content = v41
        });
        v42 = v11.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.ContextualMenu, 
            isIsolated = true, 
            customEventHandlers = v32.focusEventHandlers
        }, {
            MenuContents = v42
        });
        local v43 = l_getSafeAreaSize_0(l_screenSize_0, l_globalContextMenuInset_0);
        return l_withStyle_0(function(v44) --[[ Line: 124 ]]
            -- upvalues: v11 (ref), l_CoreGui_0 (ref), l_VRReadyWrapper_0 (ref), v5 (ref), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), v32 (copy), l_VRConstants_0 (ref), l_GetFFlagVRPanelWidthIXPEnabled_0 (ref), l_globalContextMenuInset_0 (copy), l_screenSize_0 (copy), v43 (copy), v42 (ref)
            return v11.createElement(v11.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUI = v11.createElement(l_VRReadyWrapper_0, {
                    component = "ScreenGui", 
                    props = {
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        DisplayOrder = v5.DisplayOrder.ContextualListMenu
                    }, 
                    vrProps = {
                        partSize = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v32.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenSize.X * v32.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize, 
                        offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v32.props.vrPanelCurvature == 0 then CFrame.new(l_VRConstants_0.MainScreenPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.MainScreenPosition, l_VRConstants_0.DefaultCameraPosition), 
                        virtualScreenSize = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v32.props.vrPanelWidthMultiplier then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v32.props.vrPanelWidthMultiplier, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution, 
                        panelName = "ContextualListMenu", 
                        curvature = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v32.props.vrPanelCurvature then v32.props.vrPanelCurvature else l_VRConstants_0.MainScreenCurvature
                    }
                }, {
                    Content = v11.createElement("Frame", {
                        Position = UDim2.new(0, -l_globalContextMenuInset_0.left, 0, -l_globalContextMenuInset_0.top), 
                        Size = UDim2.new(0, l_screenSize_0.X, 0, l_screenSize_0.Y), 
                        BackgroundColor3 = v44.Theme.Overlay.Color, 
                        BackgroundTransparency = v44.Theme.Overlay.Transparency, 
                        BorderSizePixel = 0, 
                        Active = true
                    }, {
                        SafeAreaFrame = v11.createElement("Frame", {
                            Position = UDim2.new(0, l_globalContextMenuInset_0.left, 0, l_globalContextMenuInset_0.top), 
                            Size = v43, 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            Content = v42
                        })
                    })
                })
            });
        end);
    end;
end;
if v23 then
    v28.didMount = function(_) --[[ Line: 186 ]] --[[ Name: didMount ]]
        -- upvalues: v24 (copy)
        v24.setContextualMenuVisible(true);
    end;
    v28.willUnmount = function(_) --[[ Line: 190 ]] --[[ Name: willUnmount ]]
        -- upvalues: v24 (copy)
        v24.setContextualMenuVisible(false);
    end;
end;
v28 = v12.connect(function(v47, _) --[[ Line: 195 ]]
    return {
        formFactor = v47.FormFactor, 
        screenSize = v47.ScreenSize, 
        globalGuiInset = v47.GlobalGuiInset, 
        globalContextMenuInset = v47.GlobalContextMenuInset
    };
end)(v28);
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v28 = v10.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier, 
        vrPanelCurvature = l_VRPanelWidthIXP_0.VrAppPanelCurvature
    })(v28);
end;
return v28;
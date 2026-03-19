local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Panel3D_0 = v4.Core.VR.Panel3D;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v11 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRConstants_0 = v11.VRConstants;
local l_VRPanelWidthIXP_0 = v11.VRPanelWidthIXP;
local v14 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_OverlayComponent_0 = require(l_Modules_0.LuaApp.Components.CentralOverlayUtils).OverlayComponent;
local v16 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v10.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v10.FFlagLuaAppForceVrAppPanelWidthRollout;
local v19 = {
    hideCentralOverlay = false
};
local function v21(v20) --[[ Line: 41 ]]
    return v20.CentralOverlay.OverlayType;
end;
local function v23(v22) --[[ Line: 44 ]]
    return v22.CentralOverlay.Arguments;
end;
local function v25(v24) --[[ Line: 47 ]]
    return v24.ScreenSize;
end;
return function(v26) --[[ Line: 51 ]]
    -- upvalues: l_Object_0 (copy), v19 (copy), l_useSelector_0 (copy), v21 (copy), l_OverlayComponent_0 (copy), v23 (copy), v25 (copy), l_useDispatch_0 (copy), v2 (copy), v16 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v14 (copy), l_VRPanelWidthIXP_0 (copy), v3 (copy), l_CoreGui_0 (copy), l_Panel3D_0 (copy), l_VRConstants_0 (copy)
    local v27 = l_Object_0.assign({}, v19, v26);
    local v28 = l_useSelector_0(v21);
    local v29 = l_OverlayComponent_0[v28];
    local v30 = l_useSelector_0(v23);
    local v31 = l_useSelector_0(v25);
    local v32 = l_useDispatch_0();
    local v33 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v32 (copy), v16 (ref)
        v32(v16());
    end);
    local v34 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v14.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
    local v35 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v14.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelCurvature) else nil;
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v28 (copy), v33 (copy)
        if not v28 then
            v33();
        end;
    end, {
        v28 or false
    });
    local v36 = v2.createElement(v29, l_Object_0.assign({}, v30, {
        containerWidth = v31.X, 
        closeCentralOverlayThunk = v16
    }));
    if not v27.hideCentralOverlay and v29 then
        local v37 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v34 then 1.2 * v34 else 1.2;
        return v2.createElement(v3.Portal, {
            target = l_CoreGui_0
        }, {
            VRCentralOverlay = v2.createElement(l_Panel3D_0, {
                partSize = Vector2.new(l_VRConstants_0.MainScreenSize.X * v37, l_VRConstants_0.MainScreenSize.Y), 
                offset = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v35 == 0 then CFrame.new(l_VRConstants_0.CentralOverlayPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.CentralOverlayPosition, l_VRConstants_0.DefaultCameraPosition), 
                virtualScreenSize = Vector2.new(v31.X, v31.Y), 
                panelName = "CentralOverlay", 
                curvature = not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v35 or l_VRConstants_0.MainScreenCurvature
            }, {
                TextButtonWrapper = v2.createElement("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Text = "", 
                    Selectable = false
                }, {
                    OverlayComponent = v36
                })
            })
        });
    else
        return nil;
    end;
end;
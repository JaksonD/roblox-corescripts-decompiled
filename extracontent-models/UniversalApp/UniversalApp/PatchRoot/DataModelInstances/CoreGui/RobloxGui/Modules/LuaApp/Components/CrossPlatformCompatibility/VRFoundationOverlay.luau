local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_Panel3D_0 = require(l_CorePackages_0.Packages.UIBlox).Core.VR.Panel3D;
local v5 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRConstants_0 = v6.VRConstants;
local l_VRPanelWidthIXP_0 = v6.VRPanelWidthIXP;
local v9 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v5.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v5.FFlagLuaAppForceVrAppPanelWidthRollout;
return v2.forwardRef(function(_, v13) --[[ Line: 15 ]]
    -- upvalues: l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_GetFFlagVRPanelWidthIXPEnabled_0 (copy), v9 (copy), l_VRPanelWidthIXP_0 (copy), l_VRConstants_0 (copy), v2 (copy), v3 (copy), l_CoreGui_0 (copy), l_Panel3D_0 (copy)
    local v14 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v9.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier) else nil;
    local v15 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then v9.useTestVariables(l_VRPanelWidthIXP_0.VrAppPanelCurvature) else nil;
    local v16 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v14 then Vector2.new(l_VRConstants_0.MainScreenSize.X * v14, l_VRConstants_0.MainScreenSize.Y) else l_VRConstants_0.MainScreenSize;
    local v17 = if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v14 then Vector2.new(l_VRConstants_0.MainScreenResolution.X * v14, l_VRConstants_0.MainScreenResolution.Y) else l_VRConstants_0.MainScreenResolution;
    local v18 = if not not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 or l_GetFFlagVRPanelWidthIXPEnabled_0() and v15 == 0 then CFrame.new(l_VRConstants_0.FoundationOverlayPosition) * CFrame.fromEulerAnglesXYZ(0, -3.141592653589793, 0) else CFrame.lookAt(l_VRConstants_0.FoundationOverlayPosition, l_VRConstants_0.DefaultCameraPosition);
    return v2.createElement(v3.Portal, {
        target = l_CoreGui_0
    }, {
        VRFoundationGui = v2.createElement(l_Panel3D_0, {
            partSize = v16, 
            offset = v18, 
            virtualScreenSize = v17, 
            panelName = "VRFoundationOverlay", 
            curvature = not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v15 or l_VRConstants_0.MainScreenCurvature, 
            surfaceGuiRef = v13
        })
    });
end);
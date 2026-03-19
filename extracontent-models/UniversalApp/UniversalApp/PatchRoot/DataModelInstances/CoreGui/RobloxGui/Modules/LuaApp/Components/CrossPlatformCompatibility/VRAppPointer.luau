local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_Modules_0.Common.Roact);
local l_PointerOverlay_0 = v2.Core.VR.PointerOverlay;
local l_VRControllerModel_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRControllerModel;
local l_LaserPointer_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).LaserPointer;
local l_useIsFPSAtTarget_0 = require(l_CorePackages_0.Workspace.Packages.SplashScreenManager).useIsFPSAtTarget;
return function() --[[ Line: 14 ]] --[[ Name: AppVRPointer ]]
    -- upvalues: l_useIsFPSAtTarget_0 (copy), v3 (copy), l_PointerOverlay_0 (copy), l_LaserPointer_0 (copy), l_VRControllerModel_0 (copy)
    if l_useIsFPSAtTarget_0() then
        return (v3.createElement(l_PointerOverlay_0, {
            LaserPointer = l_LaserPointer_0, 
            VRControllerModel = l_VRControllerModel_0
        }));
    else
        return nil;
    end;
end;
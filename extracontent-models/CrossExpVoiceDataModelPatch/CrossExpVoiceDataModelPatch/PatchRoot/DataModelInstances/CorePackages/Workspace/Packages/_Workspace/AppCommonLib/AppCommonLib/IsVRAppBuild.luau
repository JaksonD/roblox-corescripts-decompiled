local l_VRService_0 = game:GetService("VRService");
local v1 = require(script.Parent.isVRModeInStudio);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy), l_VRService_0 (copy)
    if v1() then
        return true;
    elseif game:GetEngineFeature("MaquettesBuildFlagsEnabled") then
        return l_VRService_0:IsVRAppBuild();
    else
        return l_VRService_0.VREnabled;
    end;
end;
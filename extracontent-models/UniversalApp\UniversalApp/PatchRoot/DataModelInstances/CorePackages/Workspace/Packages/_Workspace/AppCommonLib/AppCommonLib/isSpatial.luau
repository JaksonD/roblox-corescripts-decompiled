local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local v2 = require(script.Parent.isVRModeInStudio);
return function() --[[ Line: 7 ]] --[[ Name: isSpatial ]]
    -- upvalues: v2 (copy), l_VRService_0 (copy)
    if v2() then
        return true;
    else
        return l_VRService_0.VREnabled;
    end;
end;
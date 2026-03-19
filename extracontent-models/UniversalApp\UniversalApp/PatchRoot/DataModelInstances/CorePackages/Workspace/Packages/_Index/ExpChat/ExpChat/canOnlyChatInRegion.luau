local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 = require(l_Parent_0.SharedFlags).FFlagAEGIS2UseGuacToShowEnabledMessage;
local v2 = nil;
if l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
    v2 = require(l_Parent_0.UniversalAppPolicy);
end;
return function() --[[ Line: 12 ]]
    -- upvalues: l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 (copy), v2 (ref)
    if not l_FFlagAEGIS2UseGuacToShowEnabledMessage_0 then
        return false;
    else
        return v2.getAppFeaturePolicies().getInCommsRegionBubble();
    end;
end;
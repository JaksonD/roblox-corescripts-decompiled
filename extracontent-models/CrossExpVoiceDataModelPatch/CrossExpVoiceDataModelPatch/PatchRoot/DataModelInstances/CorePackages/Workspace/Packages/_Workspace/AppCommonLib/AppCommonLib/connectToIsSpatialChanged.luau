local l_Parent_0 = script:FindFirstAncestor("AppCommonLib").Parent;
local l_VRService_0 = require(l_Parent_0.MockableProxyServices).VRService;
local v2 = require(script.Parent.isSpatial);
return function(v3, v4) --[[ Line: 8 ]] --[[ Name: connectToIsSpatialChanged ]]
    -- upvalues: v2 (copy), l_VRService_0 (copy)
    local v5 = v2();
    local v7 = l_VRService_0:GetPropertyChangedSignal("VREnabled"):Connect(function() --[[ Line: 14 ]]
        -- upvalues: v2 (ref), v5 (ref), v3 (copy)
        local v6 = v2();
        if v6 == v5 then
            return;
        else
            v5 = v6;
            v3(v6);
            return;
        end;
    end);
    if v4 then
        v3(v5);
    end;
    return v7;
end;
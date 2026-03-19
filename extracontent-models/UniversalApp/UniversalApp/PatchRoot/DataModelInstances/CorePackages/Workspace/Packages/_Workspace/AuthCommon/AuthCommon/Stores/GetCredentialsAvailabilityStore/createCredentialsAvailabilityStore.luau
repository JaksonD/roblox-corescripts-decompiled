local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.Signals);
return function() --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.createSignal(false);
    local v4, v5 = v1.createSignal(false);
    local v6, v7 = v1.createSignal(false);
    local v8, v9 = v1.createSignal(false);
    return {
        getFido2Available = v2, 
        setFido2Available = v3, 
        getFido2SupportsDeviceBoundOnly = v4, 
        setFido2SupportsDeviceBoundOnly = v5, 
        getPasswordsAvailable = v6, 
        setPasswordsAvailable = v7, 
        getV2InterfaceSupported = v8, 
        setV2InterfaceSupported = v9
    };
end;
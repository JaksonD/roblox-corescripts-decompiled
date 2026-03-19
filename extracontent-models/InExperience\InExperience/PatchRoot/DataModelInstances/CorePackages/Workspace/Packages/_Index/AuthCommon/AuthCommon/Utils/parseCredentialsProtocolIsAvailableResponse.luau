return function(v0) --[[ Line: 1 ]]
    local v1 = false;
    local v2 = false;
    local v3 = false;
    local v4 = false;
    if v0.FIDO2 ~= nil then
        v1 = v0.FIDO2.isAvailable;
        v2 = v0.FIDO2.supportsDeviceBoundOnly;
        v4 = true;
    else
        v1 = v0.isAvailable or false;
        v2 = v0.supportsDeviceBoundOnly or false;
    end;
    if v0.password ~= nil then
        v3 = v0.password.isAvailable;
    end;
    return {
        fido2Available = v1, 
        fido2SupportsDeviceBoundOnly = v2, 
        passwordsAvailable = v3, 
        v2InterfaceSupported = v4
    };
end;
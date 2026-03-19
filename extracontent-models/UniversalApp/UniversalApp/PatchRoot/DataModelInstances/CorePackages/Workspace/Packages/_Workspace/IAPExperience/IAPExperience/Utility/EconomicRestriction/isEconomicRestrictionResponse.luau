return function(v0) --[[ Line: 8 ]]
    local v1 = false;
    if v0 ~= nil then
        v1 = false;
        if type(v0) == "table" then
            v1 = v0.failureReason ~= nil and v0.expirationTimeInMinutes ~= nil or v0.FailureReason ~= nil and v0.ExpirationTimeInMinutes ~= nil;
        end;
    end;
    return v1;
end;
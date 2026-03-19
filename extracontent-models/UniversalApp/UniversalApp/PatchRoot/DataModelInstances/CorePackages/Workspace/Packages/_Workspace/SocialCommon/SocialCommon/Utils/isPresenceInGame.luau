return function(v0) --[[ Line: 8 ]]
    if not v0 then
        return false;
    else
        local v1 = false;
        if v0.userPresenceType == "InGame" then
            v1 = false;
            if v0.universeId ~= nil then
                v1 = v0.universeId ~= "";
            end;
        end;
        return v1;
    end;
end;
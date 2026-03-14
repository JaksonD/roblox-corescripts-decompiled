local l_Parent_0 = script:FindFirstAncestor("NextDataExpirationTimeRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    assert(type(v1) == "string", "SetNextDataExpirationTime: key must be a string!");
    local v4 = false;
    if type(v2) == "number" then
        v4 = v2 > 0;
    end;
    assert(v4, "SetNextDataExpirationTime: nextDataExpirationTime must be a positive number!");
    return {
        key = v1, 
        nextDataExpirationTime = v2, 
        namespace = v3
    };
end);
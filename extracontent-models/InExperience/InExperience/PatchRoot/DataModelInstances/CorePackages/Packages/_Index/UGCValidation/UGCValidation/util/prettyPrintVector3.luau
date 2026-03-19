local v0 = {};
return function(v1, v2) --[[ Line: 7 ]] --[[ Name: prettyPrintVector3 ]]
    -- upvalues: v0 (copy)
    local v3 = v2 or 2;
    if not v0[v3] then
        local v4 = string.format("%%.%df", v3);
        v0[v3] = string.format("%s, %s, %s", v4, v4, v4);
    end;
    return string.format(v0[v3], v1.X, v1.Y, v1.Z);
end;
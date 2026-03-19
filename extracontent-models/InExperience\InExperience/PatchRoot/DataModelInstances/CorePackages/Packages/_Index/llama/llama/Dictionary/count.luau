local function v0() --[[ Line: 2 ]] --[[ Name: alwaysTrue ]]
    return true;
end;
return function(v1, v2) --[[ Line: 6 ]] --[[ Name: count ]]
    -- upvalues: v0 (copy)
    local v3 = type(v1);
    assert(v3 == "table", "expected a table for first argument, got " .. v3);
    local v4 = 0;
    v2 = v2 or v0;
    for v5, v6 in pairs(v1) do
        if v2(v6, v5) then
            v4 = v4 + 1;
        end;
    end;
    return v4;
end;
local function v0() --[[ Line: 3 ]]
    return true;
end;
return function(v1, v2) --[[ Line: 39 ]] --[[ Name: count ]]
    -- upvalues: v0 (copy)
    local v3 = 0;
    local v4 = v2 or v0;
    for v5, v6 in v1 do
        if v4(v6, v5) then
            v3 = v3 + 1;
        end;
    end;
    return v3;
end;
return function(v0, v1, v2, v3, v4, v5, v6) --[[ Line: 16 ]]
    local v7 = v1 - v3;
    local v8 = v2 + (-v4 * v7 + -v5 * v2) * v0;
    local v9 = v1 + v2 * v0;
    if math.abs(v8) < v6 and math.abs(v3 - v9) < v6 then
        return v3, 0;
    else
        return v9, v8;
    end;
end;
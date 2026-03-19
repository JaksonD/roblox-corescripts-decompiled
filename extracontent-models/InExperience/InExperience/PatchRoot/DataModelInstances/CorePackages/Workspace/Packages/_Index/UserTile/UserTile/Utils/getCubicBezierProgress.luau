return function(v0, v1) --[[ Line: 1 ]]
    local v2 = math.max(0, (math.min(v0, v1))) / v1;
    return (v2 ^ 2 * 3 - v2 ^ 3 * 2) * 100;
end;
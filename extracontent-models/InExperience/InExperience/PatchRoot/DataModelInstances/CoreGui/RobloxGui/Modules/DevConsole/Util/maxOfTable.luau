return function(v0, v1) --[[ Line: 2 ]]
    local v2 = {};
    for v3, v4 in pairs(v0) do
        if v1[v3] then
            v2[v3] = v4 < v1[v3] and v1[v3] or v4;
        else
            error("tables did not have matching indices");
            return;
        end;
    end;
    return v2;
end;
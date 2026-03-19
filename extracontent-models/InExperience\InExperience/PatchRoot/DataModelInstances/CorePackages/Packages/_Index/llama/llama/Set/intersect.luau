return function(...) --[[ Line: 2 ]] --[[ Name: intersect ]]
    local v0 = {};
    local v1 = select("#", ...);
    local v2 = select(1, ...);
    for v3, _ in pairs(v2) do
        local v5 = true;
        for v6 = 2, v1 do
            if select(v6, ...)[v3] == nil then
                v5 = false;
                break;
            end;
        end;
        if v5 then
            v0[v3] = true;
        end;
    end;
    return v0;
end;
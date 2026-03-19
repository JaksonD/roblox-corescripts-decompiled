return function(v0, ...) --[[ Line: 1 ]] --[[ Name: assign ]]
    for v1 = 1, select("#", ...) do
        local v2 = select(v1, ...);
        for v3, v4 in pairs(v2) do
            v0[v3] = v4;
        end;
    end;
    return v0;
end;
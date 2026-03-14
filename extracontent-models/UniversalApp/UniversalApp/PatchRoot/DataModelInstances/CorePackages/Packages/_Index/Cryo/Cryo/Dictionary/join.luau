local v0 = require(script.Parent.Parent.None);
return function(...) --[[ Line: 12 ]] --[[ Name: join ]]
    -- upvalues: v0 (copy)
    local v1 = select("#", ...);
    if v1 == 0 then
        return {};
    elseif v1 == 1 then
        local v2 = table.clone(...);
        setmetatable(v2, nil);
        return v2;
    else
        local v3 = table.clone(select(1, ...));
        setmetatable(v3, nil);
        for v4 = 2, v1 do
            local v5 = select(v4, ...);
            for v6, v7 in pairs(v5) do
                if v7 == v0 then
                    v3[v6] = nil;
                else
                    v3[v6] = v7;
                end;
            end;
        end;
        return v3;
    end;
end;
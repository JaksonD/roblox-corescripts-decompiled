local v0 = require(script.Parent.Parent.equalObjects);
return function(...) --[[ Line: 4 ]] --[[ Name: equals ]]
    -- upvalues: v0 (copy)
    if v0(...) then
        return true;
    else
        local v1 = select("#", ...);
        for v2 = 1, v1 do
            local v3 = select(v2, ...);
            for v4 = 1, v1 do
                if v4 ~= v2 then
                    local v5 = select(v4, ...);
                    for v6, v7 in pairs(v3) do
                        if v7 ~= v5[v6] then
                            return false;
                        end;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;
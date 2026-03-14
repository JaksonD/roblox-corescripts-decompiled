return function(v0, ...) --[[ Line: 22 ]] --[[ Name: pipe ]]
    local v1 = select("#", ...);
    if v1 == 0 then
        return v0;
    else
        local v2 = {
            ...
        };
        return function(...) --[[ Line: 28 ]]
            -- upvalues: v0 (copy), v1 (copy), v2 (copy)
            local v3 = {
                v0(...)
            };
            for v4 = 1, v1 do
                v3 = {
                    v2[v4](unpack(v3))
                };
            end;
            return unpack(v3);
        end;
    end;
end;
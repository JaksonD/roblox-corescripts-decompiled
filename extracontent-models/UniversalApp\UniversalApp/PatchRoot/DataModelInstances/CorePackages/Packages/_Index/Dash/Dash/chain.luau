return function(...) --[[ Line: 14 ]] --[[ Name: chain ]]
    local v0 = {
        ...
    };
    local v1 = #v0;
    local v2 = 1;
    return function() --[[ Line: 18 ]]
        -- upvalues: v2 (ref), v1 (copy), v0 (copy)
        while true do
            if v2 <= v1 then
                local v3 = {
                    v0[v2]()
                };
                if v3[1] ~= nil then
                    return table.unpack(v3);
                else
                    v2 = v2 + 1;
                end;
            else
                return nil;
            end;
        end;
    end;
end;
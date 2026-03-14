return function(v0, v1) --[[ Line: 2 ]]
    local v2 = 0;
    return function(...) --[[ Line: 4 ]]
        -- upvalues: v2 (ref), v1 (copy), v0 (copy)
        local v3 = {
            ...
        };
        local v4 = time();
        v2 = v4;
        delay(v1, function() --[[ Line: 8 ]]
            -- upvalues: v2 (ref), v4 (copy), v0 (ref), v3 (copy)
            if v2 == v4 then
                v0(unpack(v3));
            end;
        end);
    end;
end;
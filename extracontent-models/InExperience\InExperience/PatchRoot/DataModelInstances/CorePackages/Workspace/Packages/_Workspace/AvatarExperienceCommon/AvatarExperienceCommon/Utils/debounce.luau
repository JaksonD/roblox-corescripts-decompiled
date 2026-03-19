return function(v0, v1) --[[ Line: 1 ]]
    local v2 = nil;
    local v3 = v1 or 0.5;
    return function(...) --[[ Line: 5 ]]
        -- upvalues: v2 (ref), v3 (copy), v0 (copy)
        local v4 = {
            ...
        };
        if v2 then
            task.cancel(v2);
        end;
        v2 = task.delay(v3, function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref), v4 (copy), v2 (ref)
            v0(unpack(v4));
            v2 = nil;
        end);
    end;
end;
return function(v0, v1) --[[ Line: 1 ]]
    local v2 = false;
    local v3 = v1 or 1;
    return function(...) --[[ Line: 4 ]]
        -- upvalues: v2 (ref), v0 (copy), v3 (copy)
        if v2 then
            return;
        else
            v2 = true;
            v0(...);
            task.delay(v3, function() --[[ Line: 10 ]]
                -- upvalues: v2 (ref)
                v2 = false;
            end);
            return;
        end;
    end;
end;
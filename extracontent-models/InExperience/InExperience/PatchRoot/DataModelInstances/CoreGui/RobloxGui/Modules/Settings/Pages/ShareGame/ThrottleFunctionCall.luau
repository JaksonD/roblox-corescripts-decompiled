return function(v0, v1) --[[ Line: 1 ]]
    local v2 = false;
    return function(...) --[[ Line: 3 ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        if v2 then
            return;
        else
            v2 = true;
            task.delay(v0, function() --[[ Line: 8 ]]
                -- upvalues: v2 (ref)
                v2 = false;
            end);
            return v1(...);
        end;
    end;
end;
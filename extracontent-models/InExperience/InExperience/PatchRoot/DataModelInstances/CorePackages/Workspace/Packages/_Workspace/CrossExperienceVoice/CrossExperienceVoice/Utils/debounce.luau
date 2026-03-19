return function(v0, v1) --[[ Line: 1 ]]
    local v2 = nil;
    local v3 = v1 / 1000;
    return {
        cancel = function() --[[ Line: 5 ]] --[[ Name: cancel ]]
            -- upvalues: v2 (ref)
            if v2 then
                task.cancel(v2);
                v2 = nil;
            end;
        end, 
        call = function(...) --[[ Line: 11 ]] --[[ Name: call ]]
            -- upvalues: v2 (ref), v3 (copy), v0 (copy)
            local v4 = {
                ...
            };
            v2 = task.delay(v3, function() --[[ Line: 13 ]]
                -- upvalues: v0 (ref), v4 (copy)
                v0(unpack(v4));
            end);
        end
    };
end;
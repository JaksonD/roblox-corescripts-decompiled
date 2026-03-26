return function() --[[ Line: 7 ]] --[[ Name: createEvent ]]
    local v0 = {};
    return function(v1) --[[ Line: 10 ]] --[[ Name: connect ]]
        -- upvalues: v0 (copy)
        v0[v1] = true;
        return function() --[[ Line: 12 ]]
            -- upvalues: v0 (ref), v1 (copy)
            v0[v1] = nil;
        end;
    end, function(...) --[[ Line: 17 ]] --[[ Name: fire ]]
        -- upvalues: v0 (copy)
        for v2 in (table.clone(v0)) do
            v2(...);
        end;
    end;
end;
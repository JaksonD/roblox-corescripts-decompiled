return function() --[[ Line: 36 ]] --[[ Name: createSignal ]]
    local v0 = {};
    local v1 = {};
    local v2 = false;
    return function(v3) --[[ Line: 41 ]] --[[ Name: subscribe ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        assert(typeof(v3) == "function", "Can only subscribe to signals with a function.");
        local v4 = {
            callback = v3, 
            disconnected = false
        };
        if v2 and not v0[v3] then
            v1[v3] = v4;
        end;
        v0[v3] = v4;
        return function() --[[ Line: 60 ]] --[[ Name: disconnect ]]
            -- upvalues: v4 (copy), v0 (ref), v3 (copy), v1 (ref)
            assert(not v4.disconnected, "Listeners can only be disconnected once.");
            v4.disconnected = true;
            v0[v3] = nil;
            v1[v3] = nil;
        end;
    end, function(...) --[[ Line: 74 ]] --[[ Name: fire ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        v2 = true;
        for v5, v6 in v0 do
            if not v6.disconnected and not v1[v5] then
                v5(...);
            end;
        end;
        v2 = false;
        table.clear(v1);
    end;
end;
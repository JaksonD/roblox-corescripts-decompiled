return function() --[[ Line: 11 ]] --[[ Name: createSignal ]]
    local v0 = {};
    local v1 = {};
    local v2 = false;
    local function v6(_, v4) --[[ Line: 16 ]] --[[ Name: subscribe ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        assert(typeof(v4) == "function", "Can only subscribe to signals with a function.");
        local v5 = {
            callback = v4, 
            disconnected = false
        };
        if v2 and not v0[v4] then
            v1[v4] = v5;
        end;
        v0[v4] = v5;
        return function() --[[ Line: 32 ]] --[[ Name: disconnect ]]
            -- upvalues: v5 (copy), v0 (ref), v4 (copy), v1 (ref)
            assert(not v5.disconnected, "Listeners can only be disconnected once.");
            v5.disconnected = true;
            v0[v4] = nil;
            v1[v4] = nil;
        end;
    end;
    local function v12(_, ...) --[[ Line: 43 ]] --[[ Name: fire ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        v2 = true;
        for v8, v9 in pairs(v0) do
            if not v9.disconnected and not v1[v8] then
                v8(...);
            end;
        end;
        v2 = false;
        for v10, _ in pairs(v1) do
            v1[v10] = nil;
        end;
    end;
    return {
        subscribe = v6, 
        fire = v12
    };
end;
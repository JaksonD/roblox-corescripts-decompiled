local function _(v0, v1, v2) --[[ Line: 15 ]] --[[ Name: addToMap ]]
    local v3 = {};
    for v4, v5 in pairs(v0) do
        v3[v4] = v5;
    end;
    v3[v1] = v2;
    return v3;
end;
local function _(v7, v8) --[[ Line: 27 ]] --[[ Name: removeFromMap ]]
    local v9 = {};
    for v10, v11 in pairs(v7) do
        if v10 ~= v8 then
            v9[v10] = v11;
        end;
    end;
    return v9;
end;
return function() --[[ Line: 39 ]] --[[ Name: createSignal ]]
    local v13 = {};
    local function v26(_, v15) --[[ Line: 42 ]] --[[ Name: subscribe ]]
        -- upvalues: v13 (ref)
        assert(typeof(v15) == "function", "Can only subscribe to signals with a function.");
        local v16 = {
            callback = v15, 
            disconnected = false
        };
        local l_v13_0 = v13;
        local v18 = {};
        for v19, v20 in pairs(l_v13_0) do
            v18[v19] = v20;
        end;
        v18[v15] = v16;
        v13 = v18;
        return function() --[[ Line: 52 ]] --[[ Name: disconnect ]]
            -- upvalues: v16 (copy), v13 (ref), v15 (copy)
            assert(not v16.disconnected, "Listeners can only be disconnected once.");
            v16.disconnected = true;
            local l_v13_1 = v13;
            local l_v15_0 = v15;
            local v23 = {};
            for v24, v25 in pairs(l_v13_1) do
                if v24 ~= l_v15_0 then
                    v23[v24] = v25;
                end;
            end;
            v13 = v23;
        end;
    end;
    local function v30(_, ...) --[[ Line: 62 ]] --[[ Name: fire ]]
        -- upvalues: v13 (ref)
        for v28, v29 in pairs(v13) do
            if not v29.disconnected then
                v28(...);
            end;
        end;
    end;
    return {
        subscribe = v26, 
        fire = v30
    };
end;
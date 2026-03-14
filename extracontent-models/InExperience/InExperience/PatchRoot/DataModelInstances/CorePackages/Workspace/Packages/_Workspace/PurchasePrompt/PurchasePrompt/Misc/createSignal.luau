local _ = function(v0, v1, v2) --[[ Line: 16 ]] --[[ Name: addToMap ]]
    local _ = {};
    local v4 = table.clone(v0);
    v4[v1] = v2;
    return v4;
end;
local function _(v6, v7) --[[ Line: 26 ]] --[[ Name: removeFromMap ]]
    local v8 = {};
    for v9, v10 in pairs(v6) do
        if v9 ~= v7 then
            v8[v9] = v10;
        end;
    end;
    return v8;
end;
return function() --[[ Line: 38 ]] --[[ Name: createSignal ]]
    local v12 = {};
    local function v24(_, v14) --[[ Line: 41 ]] --[[ Name: subscribe ]]
        -- upvalues: v12 (ref)
        assert(typeof(v14) == "function", "Can only subscribe to signals with a function.");
        local v15 = {
            callback = v14, 
            disconnected = false
        };
        local l_v12_0 = v12;
        local _ = {};
        local v18 = table.clone(l_v12_0);
        v18[v14] = v15;
        v12 = v18;
        return function() --[[ Line: 51 ]] --[[ Name: disconnect ]]
            -- upvalues: v15 (copy), v12 (ref), v14 (copy)
            assert(not v15.disconnected, "Listeners can only be disconnected once.");
            v15.disconnected = true;
            local l_v12_1 = v12;
            local l_v14_0 = v14;
            local v21 = {};
            for v22, v23 in pairs(l_v12_1) do
                if v22 ~= l_v14_0 then
                    v21[v22] = v23;
                end;
            end;
            v12 = v21;
        end;
    end;
    local function v28(_, ...) --[[ Line: 61 ]] --[[ Name: fire ]]
        -- upvalues: v12 (ref)
        for v26, v27 in pairs(v12) do
            if not v27.disconnected then
                v26(...);
            end;
        end;
    end;
    return {
        subscribe = v24, 
        fire = v28
    };
end;
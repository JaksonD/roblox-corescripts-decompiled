local v0 = require(script.Parent.createSignal);
return function(v1) --[[ Line: 30 ]] --[[ Name: createReadableSignal ]]
    -- upvalues: v0 (copy)
    local v2, v3 = v0();
    local l_v1_0 = v1;
    local function v7(_, v6) --[[ Line: 35 ]] --[[ Name: subscribe ]]
        -- upvalues: v2 (copy)
        return v2:subscribe(v6);
    end;
    local function v9(_) --[[ Line: 39 ]] --[[ Name: getValue ]]
        -- upvalues: l_v1_0 (ref)
        return l_v1_0;
    end;
    local function v11(v10) --[[ Line: 43 ]] --[[ Name: fire ]]
        -- upvalues: l_v1_0 (ref), v3 (copy)
        l_v1_0 = v10;
        v3(v10);
    end;
    return {
        subscribe = v7, 
        getValue = v9
    }, v11;
end;
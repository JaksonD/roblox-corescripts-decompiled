local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.Cryo);
return function(v3) --[[ Line: 22 ]] --[[ Name: createSignalMap ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    local v5 = 0;
    if v3 then
        for v6, v7 in pairs(v3) do
            v4[v6] = v7;
            v5 = v5 + 1;
        end;
    end;
    local v8, v9 = v1.createSignal(v4);
    local v10, v11 = v1.createSignal(v5);
    local function v14(v12, v13) --[[ Line: 35 ]] --[[ Name: getData ]]
        -- upvalues: v8 (copy)
        return v8(v13)[v12];
    end;
    local function v21(v15, v16, v17) --[[ Line: 39 ]] --[[ Name: setData ]]
        -- upvalues: v8 (copy), v2 (ref), v11 (copy), v10 (copy), v9 (copy)
        local v18 = v8(v17);
        local v19 = v18[v15];
        local v20 = v2.Dictionary.join(v18, {
            [v15] = v16
        });
        if not v19 then
            v11(v10(v17) + 1);
        end;
        v9(v20);
    end;
    local function v26(v22, v23) --[[ Line: 49 ]] --[[ Name: removeData ]]
        -- upvalues: v8 (copy), v2 (ref), v11 (copy), v10 (copy), v9 (copy)
        local v24 = v8(v23);
        if v24[v22] then
            local v25 = v2.Dictionary.join(v24, {
                [v22] = v2.None
            });
            v11(v10(v23) - 1);
            v9(v25);
        end;
    end;
    local v28 = v1.createComputed(function(v27) --[[ Line: 60 ]]
        -- upvalues: v8 (copy)
        return v8(v27);
    end);
    local function v34(v29, v30) --[[ Line: 64 ]] --[[ Name: iterateData ]]
        -- upvalues: v1 (ref), v8 (copy)
        return v1.createEffect(function() --[[ Line: 65 ]]
            -- upvalues: v8 (ref), v30 (copy), v29 (copy)
            local v31 = v8(v30);
            for v32, v33 in pairs(v31) do
                v29(v32, v33);
            end;
        end);
    end;
    return {
        getData = v14, 
        setData = v21, 
        removeData = v26, 
        getCount = v10, 
        iterateData = v34, 
        getAllData = v28
    };
end;
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Signals);
local _ = require(l_Parent_0.HttpStoreTypes);
return function() --[[ Line: 20 ]] --[[ Name: createMockHttpStore ]]
    -- upvalues: v2 (copy)
    local v4 = {};
    local function v9(v5, v6) --[[ Line: 29 ]] --[[ Name: getOrCreateResponse ]]
        -- upvalues: v4 (ref), v2 (ref)
        if not v4[v5] then
            local v7, v8 = v2.createSignal({
                status = "NotStarted", 
                config = v6
            });
            v4[v5] = {
                get = v7, 
                set = v8
            };
        end;
        return v4[v5];
    end;
    local function v13(v10, v11) --[[ Line: 40 ]] --[[ Name: fetch ]]
        -- upvalues: v9 (copy)
        local v12 = v10 or v11.Url;
        return v9(v12, v11).get, function() --[[ Line: 43 ]]

        end;
    end;
    local function v14() --[[ Line: 46 ]] --[[ Name: cancelAll ]]

    end;
    local function v19(v15, v16) --[[ Line: 53 ]] --[[ Name: setResponse ]]
        -- upvalues: v4 (ref), v2 (ref)
        if v4[v15] then
            v4[v15].set(v16);
            return;
        else
            local v17, v18 = v2.createSignal(v16);
            v4[v15] = {
                get = v17, 
                set = v18
            };
            return;
        end;
    end;
    local function v20() --[[ Line: 63 ]] --[[ Name: reset ]]
        -- upvalues: v4 (ref)
        v4 = {};
    end;
    return {
        fetch = v13, 
        cancelAll = v14, 
        setResponse = v19, 
        reset = v20
    };
end;
local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.FocusNavigationUtils);
return function() --[[ Line: 21 ]] --[[ Name: createButtonHoldStore ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    local v5, v6 = v2.createSignal({});
    local function v11(v7, v8) --[[ Line: 24 ]] --[[ Name: updateButtonHoldState ]]
        -- upvalues: v6 (copy)
        v6(function(v9) --[[ Line: 25 ]]
            -- upvalues: v7 (copy), v8 (copy)
            if v9[v7] ~= v8 then
                local v10 = table.clone(v9);
                v10[v7] = v8;
                return v10;
            else
                return v9;
            end;
        end);
    end;
    local function v16() --[[ Line: 35 ]] --[[ Name: useDispatchButtonHoldStarted ]]
        -- upvalues: v1 (ref), v6 (copy), v11 (copy)
        return (v1.useCallback(function(v12, v13) --[[ Line: 37 ]]
            -- upvalues: v6 (ref)
            v6(function(v14) --[[ Line: 25 ]]
                -- upvalues: v12 (copy), v13 (copy)
                if v14[v12] ~= v13 then
                    local v15 = table.clone(v14);
                    v15[v12] = v13;
                    return v15;
                else
                    return v14;
                end;
            end);
        end, {
            v11
        }));
    end;
    local function v22() --[[ Line: 45 ]] --[[ Name: useDispatchButtonHoldEnded ]]
        -- upvalues: v1 (ref), v6 (copy), v11 (copy)
        return (v1.useCallback(function(v17) --[[ Line: 46 ]]
            -- upvalues: v6 (ref)
            local l_v6_0 = v6;
            local v19 = nil;
            l_v6_0(function(v20) --[[ Line: 25 ]]
                -- upvalues: v17 (copy), v19 (copy)
                if v20[v17] ~= v19 then
                    local v21 = table.clone(v20);
                    v21[v17] = v19;
                    return v21;
                else
                    return v20;
                end;
            end);
        end, {
            v11
        }));
    end;
    local function v23() --[[ Line: 52 ]] --[[ Name: useHeldProgressByEvent ]]
        -- upvalues: v3 (ref), v5 (copy)
        return v3.useSignalState(v5);
    end;
    return {
        getButtonHoldState = v5, 
        setButtonHoldState = v6, 
        useDispatchButtonHoldStarted = v16, 
        useDispatchButtonHoldEnded = v22, 
        useHeldProgressByEvent = v23
    };
end;
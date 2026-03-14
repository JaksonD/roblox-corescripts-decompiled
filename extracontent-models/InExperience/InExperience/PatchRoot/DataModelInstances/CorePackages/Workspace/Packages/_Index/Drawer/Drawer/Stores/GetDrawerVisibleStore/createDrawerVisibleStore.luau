local l_Parent_0 = script:FindFirstAncestor("Drawer").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(l_Parent_0.SignalsReact);
return function() --[[ Line: 14 ]] --[[ Name: createDrawerVisibleStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.createSignal(false);
    local v5, v6 = v1.createSignal(false);
    local function v7() --[[ Line: 18 ]] --[[ Name: useDrawerVisible ]]
        -- upvalues: v2 (ref), v3 (copy)
        return v2.useSignalState(v3);
    end;
    local function v8() --[[ Line: 22 ]] --[[ Name: useDrawerShouldMount ]]
        -- upvalues: v2 (ref), v5 (copy)
        return v2.useSignalState(v5);
    end;
    return {
        getDrawerVisible = v3, 
        setDrawerVisible = function(v9) --[[ Line: 26 ]]
            -- upvalues: v4 (copy), v6 (copy)
            v4(v9);
            if v9 then
                v6(true);
            end;
        end, 
        setDrawerShouldMount = v6, 
        useDrawerVisible = v7, 
        useDrawerShouldMount = v8
    };
end;
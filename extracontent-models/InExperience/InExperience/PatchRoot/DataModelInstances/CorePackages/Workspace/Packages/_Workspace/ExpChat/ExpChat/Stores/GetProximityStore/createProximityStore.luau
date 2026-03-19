local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 28 ]] --[[ Name: createProximityStore ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2 = {};
    local v3 = {
        isInsideRenderDistance = false, 
        isInsideMaximizeDistance = false, 
        isInsideLikelySpeakingDistance = false
    };
    local function _(v4) --[[ Line: 41 ]] --[[ Name: getKey ]]
        return (tostring(v4));
    end;
    local function v10(v6) --[[ Line: 45 ]] --[[ Name: getUserProximityState ]]
        -- upvalues: v2 (copy), l_createSignal_0 (ref), v3 (copy)
        local v7 = tostring(v6);
        if not v2[v7] then
            local v8, v9 = l_createSignal_0(v3);
            v2[v7] = {
                getter = v8, 
                setter = v9
            };
        end;
        return v2[v7].getter;
    end;
    local function v20(v11, v12, v13, v14) --[[ Line: 54 ]] --[[ Name: updateProximity ]]
        -- upvalues: v2 (copy), l_createSignal_0 (ref), v3 (copy)
        local v15 = tostring(v11);
        if not v2[v15] then
            local v16 = tostring(v11);
            if not v2[v16] then
                local v17, v18 = l_createSignal_0(v3);
                v2[v16] = {
                    getter = v17, 
                    setter = v18
                };
            end;
            local _ = v2[v16].getter;
        end;
        v2[v15].setter({
            isInsideRenderDistance = v12, 
            isInsideMaximizeDistance = v13, 
            isInsideLikelySpeakingDistance = v14
        });
    end;
    return {
        getUserProximityState = v10, 
        updateProximity = v20, 
        removeUser = function(v21) --[[ Line: 72 ]] --[[ Name: removeUser ]]
            -- upvalues: v2 (copy), v3 (copy)
            local v22 = tostring(v21);
            if v2[v22] then
                v2[v22].setter(v3);
                v2[v22] = nil;
            end;
        end
    };
end;
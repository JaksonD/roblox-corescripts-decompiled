local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_createSignal_0 = require(l_Parent_0.Signals).createSignal;
return function() --[[ Line: 19 ]] --[[ Name: createCharacterStore ]]
    -- upvalues: l_createSignal_0 (copy)
    local v2, v3 = l_createSignal_0({});
    local function _(v4) --[[ Line: 23 ]] --[[ Name: getKey ]]
        return (tostring(v4));
    end;
    return {
        getCharacters = v2, 
        handleCharacterAdded = function(v6, v7) --[[ Line: 27 ]] --[[ Name: handleCharacterAdded ]]
            -- upvalues: v3 (copy)
            local v8 = tostring(v6);
            v3(function(v9) --[[ Line: 30 ]]
                -- upvalues: v8 (copy), v7 (copy)
                local v10 = table.clone(v9);
                v10[v8] = v7;
                return v10;
            end);
        end, 
        handlePlayerRemoved = function(v11) --[[ Line: 37 ]] --[[ Name: handlePlayerRemoved ]]
            -- upvalues: v3 (copy)
            local v12 = tostring(v11);
            v3(function(v13) --[[ Line: 40 ]]
                -- upvalues: v12 (copy)
                local v14 = table.clone(v13);
                v14[v12] = nil;
                return v14;
            end);
        end
    };
end;
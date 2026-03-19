local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.Signals);
return function() --[[ Line: 16 ]] --[[ Name: createTopBarStore ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3, v4 = v2.createSignal({});
    local v5 = {};
    local function v8(v6) --[[ Line: 21 ]] --[[ Name: getScreenTopBar ]]
        -- upvalues: v5 (copy), v2 (ref), v3 (copy)
        if v5[v6] == nil then
            v5[v6] = v2.createComputed(function(v7) --[[ Line: 23 ]]
                -- upvalues: v3 (ref), v6 (copy)
                return v3(v7)[v6] or {};
            end);
        end;
        return v5[v6];
    end;
    local function v13(v9, v10) --[[ Line: 31 ]] --[[ Name: setScreenTopBar ]]
        -- upvalues: v4 (copy), v1 (ref)
        v4(function(v11) --[[ Line: 32 ]]
            -- upvalues: v1 (ref), v9 (copy), v10 (copy)
            local v12 = v1.Dictionary.union(v11[v9] or {}, v10);
            return v1.Dictionary.union(v11, {
                [v9] = v12
            });
        end);
    end;
    local function v16(v14) --[[ Line: 40 ]] --[[ Name: clearScreenTopBar ]]
        -- upvalues: v4 (copy), v1 (ref)
        v4(function(v15) --[[ Line: 41 ]]
            -- upvalues: v1 (ref), v14 (copy)
            return v1.Dictionary.union(v15, {
                [v14] = {}
            });
        end);
    end;
    return {
        getScreenTopBar = v8, 
        setScreenTopBar = v13, 
        clearScreenTopBar = v16, 
        resetStore = function() --[[ Line: 48 ]] --[[ Name: resetStore ]]
            -- upvalues: v4 (copy)
            v4({});
        end
    };
end;
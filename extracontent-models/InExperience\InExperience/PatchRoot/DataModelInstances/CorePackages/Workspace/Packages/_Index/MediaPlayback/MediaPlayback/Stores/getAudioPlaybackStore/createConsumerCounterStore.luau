local l_script_FirstAncestor_0 = script:FindFirstAncestor("MediaPlayback");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Signals);
return function() --[[ Line: 19 ]] --[[ Name: createConsumerCounterStore ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v3, v4 = v2.createSignal({});
    local function v8(v5) --[[ Line: 22 ]] --[[ Name: subscribe ]]
        -- upvalues: v4 (copy), v1 (ref)
        v4(function(v6) --[[ Line: 23 ]]
            -- upvalues: v5 (copy), v1 (ref)
            local v7 = v6[v5] or 0;
            return v1.Dictionary.join(v6, {
                [v5] = v7 + 1
            });
        end);
    end;
    local function v12(v9) --[[ Line: 31 ]] --[[ Name: unsubscribe ]]
        -- upvalues: v4 (copy), v1 (ref)
        local v10 = nil;
        v4(function(v11) --[[ Line: 34 ]]
            -- upvalues: v9 (copy), v10 (ref), v1 (ref)
            v10 = math.max(0, (v11[v9] or 0) - 1);
            return v1.Dictionary.join(v11, {
                [v9] = if v10 > 0 then v10 else v1.None
            });
        end);
        return v10;
    end;
    return {
        subscribe = v8, 
        unsubscribe = v12, 
        getConsumerCounts = v3
    };
end;
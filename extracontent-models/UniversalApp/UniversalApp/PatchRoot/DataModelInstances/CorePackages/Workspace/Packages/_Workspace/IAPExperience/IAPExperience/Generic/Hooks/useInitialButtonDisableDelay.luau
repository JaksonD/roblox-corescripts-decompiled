local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: useInitialButtonDisableDelay ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy)
    local v5 = l_useTokens_0();
    local v6 = v4 or v5.Time.Time_300;
    local v7, v8 = v1.useState(true);
    v1.useEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v8 (copy)
        local v9 = false;
        task.delay(v6, function() --[[ Line: 16 ]]
            -- upvalues: v9 (ref), v8 (ref)
            if not v9 then
                v8(false);
            end;
        end);
        return function() --[[ Line: 22 ]]
            -- upvalues: v9 (ref)
            v9 = true;
        end;
    end, {
        v6
    });
    return v3 or v7;
end;
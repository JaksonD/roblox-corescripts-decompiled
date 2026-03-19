local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
return function(v3) --[[ Line: 9 ]] --[[ Name: useSignalBinding ]]
    -- upvalues: v1 (copy), l_createEffect_0 (copy)
    local v4, v5 = v1.useBinding(v3(false));
    v1.useLayoutEffect(function() --[[ Line: 12 ]]
        -- upvalues: v5 (copy), v3 (copy), l_createEffect_0 (ref)
        v5(v3(false));
        return l_createEffect_0(function(v6) --[[ Line: 14 ]]
            -- upvalues: v5 (ref), v3 (ref)
            v5(v3(v6));
        end);
    end, {
        v3
    });
    return v4;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local _ = require(l_Parent_0.CoreScriptsRoactCommon);
return function(v4) --[[ Line: 10 ]] --[[ Name: useSignalMapState ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5, v6 = v1.useState(v4);
    v1.useLayoutEffect(function() --[[ Line: 13 ]]
        -- upvalues: v6 (copy), v4 (copy), v2 (ref)
        v6(v4);
        return v2.createEffect(function(v7) --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v6 (ref)
            v4.getCount(v7);
            v6(v4);
        end);
    end, {
        v4
    });
    return v5;
end;
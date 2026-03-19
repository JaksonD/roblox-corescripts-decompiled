local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Resources);
return function(v3) --[[ Line: 6 ]] --[[ Name: useResource ]]
    -- upvalues: v1 (copy)
    local v4, v5 = v1.useState(function() --[[ Line: 7 ]]
        return nil;
    end);
    v1.useLayoutEffect(function() --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v5 (copy)
        local v6, v7 = v3();
        v5(v7);
        return function() --[[ Line: 14 ]]
            -- upvalues: v5 (ref), v6 (copy)
            v5(nil);
            v6();
        end;
    end, {
        v3
    });
    return v4;
end;
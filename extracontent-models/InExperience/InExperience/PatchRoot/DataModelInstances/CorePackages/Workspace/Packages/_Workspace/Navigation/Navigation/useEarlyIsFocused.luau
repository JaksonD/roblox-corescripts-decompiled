local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(script.Parent.useNavigation);
return function() --[[ Line: 15 ]] --[[ Name: useEarlyIsFocused ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v4 = v3();
    local v5, v6 = v1.useState(v4.isFocused());
    v1.useEffect(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), v4 (copy), v2 (ref)
        v6(v4.isFocused());
        local v7 = v4.addListener(v2.Events.WillFocus, function() --[[ Line: 24 ]]
            -- upvalues: v6 (ref)
            v6(true);
        end);
        local v8 = v4.addListener(v2.Events.WillBlur, function() --[[ Line: 28 ]]
            -- upvalues: v6 (ref)
            v6(false);
        end);
        return function() --[[ Line: 32 ]]
            -- upvalues: v7 (copy), v8 (copy)
            v7.remove();
            v8.remove();
        end;
    end, {
        v4
    });
    return v5;
end;
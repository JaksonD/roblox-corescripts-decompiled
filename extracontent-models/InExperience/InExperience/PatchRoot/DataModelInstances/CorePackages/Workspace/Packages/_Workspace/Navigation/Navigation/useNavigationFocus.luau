local l_Parent_0 = script:FindFirstAncestor("Navigation").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RoactNavigation);
local v3 = require(script.Parent.useNavigation);
return function() --[[ Line: 13 ]] --[[ Name: useNavigationFocus ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    local v4 = v3();
    local v5, v6 = v1.useState(v4.isFocused());
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy), v2 (ref), v6 (copy)
        local v7 = v4.addListener(v2.Events.WillFocus, function() --[[ Line: 19 ]]
            -- upvalues: v6 (ref)
            v6(true);
        end);
        local v8 = v4.addListener(v2.Events.WillBlur, function() --[[ Line: 22 ]]
            -- upvalues: v6 (ref)
            v6(false);
        end);
        v6(v4.isFocused());
        return function() --[[ Line: 27 ]]
            -- upvalues: v7 (copy), v8 (copy)
            v7.remove();
            v8.remove();
        end;
    end, {});
    return v5;
end;
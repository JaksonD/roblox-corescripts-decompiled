local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigation);
local v3 = require(script.Parent.FocusNavigationContext);
return function() --[[ Line: 13 ]] --[[ Name: useActiveEventMap ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v4 = v1.useContext(v3);
    local v5 = if v4 then v4.activeEventMap:getValue() else {};
    local v6, v7 = v1.useState(v5);
    v1.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v6 (copy), v5 (copy), v7 (copy), v4 (copy)
        if v6 ~= v5 then
            v7(v5);
        end;
        if v4 then
            local v8 = v4.activeEventMap:subscribe(v7);
            return function() --[[ Line: 27 ]]
                -- upvalues: v8 (copy)
                v8:unsubscribe();
            end;
        else
            return nil;
        end;
    end, {
        v4
    });
    return v6;
end;
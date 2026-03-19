local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.FocusNavigationContext);
return function() --[[ Line: 11 ]] --[[ Name: useCurrentFocus ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = v1.useContext(v2);
    local v4 = if v3 then v3.focusedGuiObject:getValue() else nil;
    local v5, v6 = v1.useState(v4);
    v1.useEffect(function() --[[ Line: 16 ]]
        -- upvalues: v5 (copy), v4 (copy), v6 (copy), v3 (copy)
        if v5 ~= v4 then
            v6(v4);
        end;
        if v3 then
            local v7 = v3.focusedGuiObject:subscribe(v6);
            return function() --[[ Line: 25 ]]
                -- upvalues: v7 (copy)
                v7:unsubscribe();
            end;
        else
            return nil;
        end;
    end, {
        v3
    });
    return v5;
end;
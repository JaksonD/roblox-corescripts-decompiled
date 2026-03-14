local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.ResponsiveLayoutContext);
local v4 = require(l_Parent_0.ResponsiveLayoutConfigReader);
return function(v5) --[[ Line: 18 ]] --[[ Name: ResponsiveLayoutProvider ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local v6 = v5.width or 1;
    local v7 = v5.config or {};
    local v8, v9 = v2.useState(function() --[[ Line: 22 ]]
        -- upvalues: v4 (ref), v7 (copy), v6 (copy)
        return v4.findBreakpoint(v7, v6);
    end);
    v2.useLayoutEffect(function() --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v4 (ref), v7 (copy), v6 (copy)
        v9(v4.findBreakpoint(v7, v6));
    end, {
        v7
    });
    v2.useLayoutEffect(function() --[[ Line: 30 ]]
        -- upvalues: v8 (copy), v6 (copy), v9 (copy), v4 (ref), v7 (copy)
        if v8.min > v6 or v6 > v8.max then
            v9(v4.findBreakpoint(v7, v6));
        end;
    end, {
        v6, 
        v8.min, 
        v8.max
    });
    return v2.createElement(v3.Provider, {
        value = {
            config = v7, 
            breakpoint = v8.name
        }
    }, v5.children);
end;
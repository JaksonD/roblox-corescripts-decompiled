local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.ResponsiveLayoutContext);
local v4 = require(l_Parent_0.ResponsiveLayoutConfigReader);
return function(v5, v6) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v7 = v2.useContext(v3);
    return v4.getValue({
        config = v7.config, 
        breakpoint = v7.breakpoint, 
        kind = v6 or v7.kind
    }, v5);
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
return function(v3, v4) --[[ Line: 22 ]] --[[ Name: warnOnce ]]
    -- upvalues: v2 (copy), l_console_0 (copy)
    if not v2[v3] then
        l_console_0.warn("The legacy Roact API '%s' is deprecated, and will be removed in a future release.\n\n%s", v3, v4);
    end;
    v2[v3] = true;
end;
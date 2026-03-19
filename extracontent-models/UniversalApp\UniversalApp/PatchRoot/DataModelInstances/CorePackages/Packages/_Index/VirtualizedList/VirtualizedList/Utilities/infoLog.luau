local l_Parent_0 = script.Parent.Parent.Parent;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
return function(...) --[[ Line: 18 ]] --[[ Name: infoLog ]]
    -- upvalues: l_console_0 (copy)
    return l_console_0.log(...);
end;
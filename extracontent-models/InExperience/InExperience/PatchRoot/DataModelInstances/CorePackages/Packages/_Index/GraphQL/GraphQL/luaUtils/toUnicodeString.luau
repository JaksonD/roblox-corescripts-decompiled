local l_Parent_0 = script.Parent.Parent.Parent;
local l_String_0 = require(l_Parent_0.LuauPolyfill).String;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_String_0 (copy)
    local v3 = "0000" .. string.format("%x", v2);
    return "\"\\u" .. l_String_0.slice(v3, -4):upper() .. "\"";
end;
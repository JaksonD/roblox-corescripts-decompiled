local l_Parent_0 = script.Parent.Parent.Parent;
local l_String_0 = require(l_Parent_0.LuauPolyfill).String;
local _ = require(script.Parent.source);
return {
    getLocation = function(v3, v4) --[[ Line: 27 ]] --[[ Name: getLocation ]]
        -- upvalues: l_String_0 (copy)
        local v5 = {
            "\r\n", 
            "\r", 
            "\n"
        };
        local v6 = 1;
        local l_v4_0 = v4;
        local v8 = l_String_0.findOr(v3.body, v5);
        while v8 ~= nil and v8.index < v4 do
            local v9 = v8.index + string.len(v8.match);
            v6 = v6 + 1;
            l_v4_0 = v4 + 1 - v9;
            v8 = l_String_0.findOr(v3.body, v5, v9);
        end;
        return {
            line = v6, 
            column = l_v4_0
        };
    end
};
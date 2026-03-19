local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.utils.invariant);
local v6 = require(l_Parent_0.utils.isValidScreenComponent);
return function(v7, v8) --[[ Line: 12 ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v5 (copy), v6 (copy)
    local v9 = v7[v8];
    if v9 == nil then
        local v11 = l_Array_0.map(l_Object_0.keys(v7), function(v10) --[[ Line: 16 ]]
            return ("'%s'"):format(v10);
        end);
        local v12 = ("There is no route defined for key %s.\nMust be one of: %s"):format(v8, table.concat(v11, ","));
        error(v12, 2);
    end;
    if type(v9) == "table" then
        if v9.screen ~= nil then
            v5(v6(v9.screen), "screen for key '%s' must be a valid Roact component.", v8);
            return v9.screen;
        elseif type(v9.getScreen) == "function" then
            local v13 = v9.getScreen();
            v5(v6(v13), "The getScreen defined for route '%s' didn't return a valid screen or navigator.\n\nPlease pass it like this:\n%s = {\n    getScreen: function() return MyScreen end\n}", v8, v8);
            return v13;
        end;
    end;
    v5(v6(v9), "Value for key '%s' must be a route config table or a valid Roact component.", v8);
    return v9;
end;
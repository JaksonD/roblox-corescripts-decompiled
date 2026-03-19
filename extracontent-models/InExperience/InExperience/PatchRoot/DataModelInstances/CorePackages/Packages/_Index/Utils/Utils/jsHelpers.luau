local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
return {
    isSymbol = function(v4) --[[ Line: 9 ]] --[[ Name: isSymbol ]]
        local v5 = false;
        if typeof(v4) == "userdata" then
            v5 = string.sub(tostring(v4), 1, 7) == "Symbol(";
        end;
        return v5;
    end, 
    getOwnPropertySymbols = function(v6) --[[ Line: 14 ]] --[[ Name: getOwnPropertySymbols ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
        return l_Array_0.filter(l_Object_0.keys(v6), function(v7) --[[ Line: 15 ]]
            local v8 = false;
            if typeof(v7) == "userdata" then
                v8 = string.sub(tostring(v7), 1, 7) == "Symbol(";
            end;
            return v8;
        end);
    end, 
    getOwnPropertyNames = function(v9) --[[ Line: 21 ]] --[[ Name: getOwnPropertyNames ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
        l_Array_0.filter(l_Object_0.keys(v9), function(v10) --[[ Line: 22 ]]
            local v11 = false;
            if typeof(v10) == "userdata" then
                v11 = string.sub(tostring(v10), 1, 7) == "Symbol(";
            end;
            return not v11;
        end);
    end, 
    create = function(v12) --[[ Line: 28 ]] --[[ Name: create ]]
        if not v12 then
            return {};
        else
            return (setmetatable({}, v12));
        end;
    end
};
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_instanceof_0 = v1.instanceof;
local v6 = require(l_Parent_0.LuauRegExp);
local v7 = {};
local function v8(v9, v10) --[[ Line: 16 ]] --[[ Name: valueMatchesCriteria ]]
    -- upvalues: l_Array_0 (copy), v8 (copy), l_Boolean_0 (copy), l_Object_0 (copy), l_instanceof_0 (copy), v6 (copy)
    if v9 == nil then
        return v9 == v10;
    elseif l_Array_0.isArray(v9) then
        return l_Array_0.isArray(v10) and l_Array_0.every(v9, function(v11, v12) --[[ Line: 31 ]]
            -- upvalues: v8 (ref), v10 (copy)
            return v8(v11, v10[v12]);
        end);
    elseif typeof(v9) == "table" then
        local v13 = false;
        if typeof(v10) == "table" then
            v13 = l_Boolean_0.toJSBoolean(v10) and l_Array_0.every(l_Object_0.keys(v10), function(v14) --[[ Line: 45 ]]
                -- upvalues: v8 (ref), v9 (copy), v10 (copy)
                return v8(v9[v14], v10[v14]);
            end);
        end;
        return v13;
    elseif l_instanceof_0(v10, v6) then
        return v10:test(v9);
    else
        return v9 == v10;
    end;
end;
v7.valueMatchesCriteria = v8;
return v7;
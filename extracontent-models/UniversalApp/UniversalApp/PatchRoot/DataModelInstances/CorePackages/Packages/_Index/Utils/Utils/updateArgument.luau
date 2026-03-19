local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local v4 = {};
local l_Kind_0 = require(l_Parent_0.GraphQL).Kind;
local l_astFromType_0 = require(script.Parent.astFromType).astFromType;
v4.updateArgument = function(v7, v8, v9, v10, v11, v12, v13) --[[ Line: 22 ]] --[[ Name: updateArgument ]]
    -- upvalues: l_Kind_0 (copy), l_astFromType_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    v7[tostring(v10)] = {
        kind = l_Kind_0.ARGUMENT, 
        name = {
            kind = l_Kind_0.NAME, 
            value = v10
        }, 
        value = {
            kind = l_Kind_0.VARIABLE, 
            name = {
                kind = l_Kind_0.NAME, 
                value = v11
            }
        }
    };
    v8[tostring(v11)] = {
        kind = l_Kind_0.VARIABLE_DEFINITION, 
        variable = {
            kind = l_Kind_0.VARIABLE, 
            name = {
                kind = l_Kind_0.NAME, 
                value = v11
            }
        }, 
        type = l_astFromType_0(v12)
    };
    if v13 ~= nil then
        v9[tostring(v11)] = v13;
        return;
    else
        if l_Array_0.indexOf(l_Object_0.keys(v9), (tostring(v11))) ~= -1 then
            v9[tostring(v11)] = nil;
        end;
        return;
    end;
end;
v4.createVariableNameGenerator = function(v14) --[[ Line: 55 ]] --[[ Name: createVariableNameGenerator ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v15 = 0;
    return function(v16) --[[ Line: 59 ]]
        -- upvalues: v15 (ref), l_Array_0 (ref), l_Object_0 (ref), v14 (copy)
        local v17 = nil;
        repeat
            v17 = ("_v%s_%s"):format(tostring(v15), v16);
            v15 = v15 + 1;
        until l_Array_0.indexOf(l_Object_0.keys(v14), (tostring(v17))) == -1;
        return v17;
    end;
end;
return v4;
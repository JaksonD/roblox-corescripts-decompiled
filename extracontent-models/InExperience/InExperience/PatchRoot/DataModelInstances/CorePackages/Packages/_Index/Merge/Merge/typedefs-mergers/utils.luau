local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_instanceof_0 = v1.instanceof;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_Source_0 = v5.Source;
local l_Kind_0 = v5.Kind;
v4.isStringTypes = function(v8) --[[ Line: 20 ]] --[[ Name: isStringTypes ]]
    return typeof(v8) == "string";
end;
v4.isSourceTypes = function(v9) --[[ Line: 26 ]] --[[ Name: isSourceTypes ]]
    -- upvalues: l_instanceof_0 (copy), l_Source_0 (copy)
    return l_instanceof_0(v9, l_Source_0);
end;
v4.extractType = function(v10) --[[ Line: 34 ]] --[[ Name: extractType ]]
    -- upvalues: l_Kind_0 (copy)
    local l_v10_0 = v10;
    while l_v10_0.kind == l_Kind_0.LIST_TYPE or l_v10_0.kind == "NonNullType" do
        l_v10_0 = l_v10_0.type;
    end;
    return l_v10_0;
end;
v4.isWrappingTypeNode = function(v12) --[[ Line: 47 ]] --[[ Name: isWrappingTypeNode ]]
    -- upvalues: l_Kind_0 (copy)
    return v12.kind ~= l_Kind_0.NAMED_TYPE;
end;
v4.isListTypeNode = function(v13) --[[ Line: 56 ]] --[[ Name: isListTypeNode ]]
    -- upvalues: l_Kind_0 (copy)
    return v13.kind == l_Kind_0.LIST_TYPE;
end;
v4.isNonNullTypeNode = function(v14) --[[ Line: 65 ]] --[[ Name: isNonNullTypeNode ]]
    -- upvalues: l_Kind_0 (copy)
    return v14.kind == l_Kind_0.NON_NULL_TYPE;
end;
local function v15(v16) --[[ Line: 74 ]] --[[ Name: printTypeNode ]]
    -- upvalues: l_Boolean_0 (copy), l_Kind_0 (copy), v15 (copy)
    if l_Boolean_0.toJSBoolean(v16.kind == l_Kind_0.LIST_TYPE) then
        return ("[%s]"):format(v15(v16.type));
    elseif l_Boolean_0.toJSBoolean(v16.kind == l_Kind_0.NON_NULL_TYPE) then
        return ("%s!"):format(v15(v16.type));
    else
        return v16.name.value;
    end;
end;
v4.printTypeNode = v15;
local v17 = {
    A_SMALLER_THAN_B = -1, 
    A_EQUALS_B = 0, 
    A_GREATER_THAN_B = 1
};
v4.CompareVal = v17;
v4.defaultStringComparator = function(v18, v19) --[[ Line: 100 ]] --[[ Name: defaultStringComparator ]]
    -- upvalues: v17 (copy)
    if v18 == nil and v19 == nil then
        return v17.A_EQUALS_B;
    elseif v18 == nil then
        return v17.A_SMALLER_THAN_B;
    elseif v19 == nil then
        return v17.A_GREATER_THAN_B;
    elseif v18 < v19 then
        return v17.A_SMALLER_THAN_B;
    elseif v19 < v18 then
        return v17.A_GREATER_THAN_B;
    else
        return v17.A_EQUALS_B;
    end;
end;
return v4;
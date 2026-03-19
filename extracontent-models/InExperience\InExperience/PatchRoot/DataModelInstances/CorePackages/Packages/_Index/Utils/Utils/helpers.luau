local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = {};
local l_parse_0 = require(l_Parent_0.GraphQL).parse;
local v8 = require(l_Parent_0.LuauRegExp);
v6.asArray = function(v9) --[[ Line: 23 ]] --[[ Name: asArray ]]
    -- upvalues: l_Boolean_0 (copy), l_Array_0 (copy)
    if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v9)) then
        return v9;
    elseif l_Boolean_0.toJSBoolean(v9) then
        return {
            v9
        };
    else
        return {};
    end;
end;
local v10 = v8("\\.[a-zA-Z0-9]+$");
v6.isDocumentString = function(v11) --[[ Line: 31 ]] --[[ Name: isDocumentString ]]
    -- upvalues: l_Boolean_0 (copy), v10 (copy), l_parse_0 (copy)
    if typeof(v11) ~= "string" then
        return false;
    elseif l_Boolean_0.toJSBoolean(v10:test(v11)) then
        return false;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
            -- upvalues: l_parse_0 (ref), v11 (copy)
            l_parse_0(v11);
            return true;
        end);
        if not l_status_0 then
            return false;
        else
            return l_result_0;
        end;
    end;
end;
local v14 = v8("[\226\128\152\226\128\156!%^<=>`]");
v6.isValidPath = function(v15) --[[ Line: 68 ]] --[[ Name: isValidPath ]]
    -- upvalues: l_Boolean_0 (copy), v14 (copy)
    local v16 = false;
    if typeof(v15) == "string" then
        v16 = not l_Boolean_0.toJSBoolean(v14:test(v15));
    end;
    return v16;
end;
v6.compareStrings = function(v17, v18) --[[ Line: 72 ]] --[[ Name: compareStrings ]]
    if tostring(v17) < tostring(v18) then
        return -1;
    elseif tostring(v17) > tostring(v18) then
        return 1;
    else
        return 0;
    end;
end;
local function v21(v19) --[[ Line: 96 ]] --[[ Name: nodeToString ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v20 = nil;
    if l_Array_0.indexOf(l_Object_0.keys(v19), "alias") ~= -1 then
        v20 = if typeof(v19.alias) == "table" then v19.alias.value else nil;
    end;
    if v20 == nil and l_Array_0.indexOf(l_Object_0.keys(v19), "name") ~= -1 then
        v20 = if typeof(v19.name) == "table" then v19.name.value else nil;
    end;
    if v20 == nil then
        v20 = v19.kind;
    end;
    return v20;
end;
v6.nodeToString = v21;
v6.compareNodes = function(v22, v23, v24) --[[ Line: 122 ]] --[[ Name: compareNodes ]]
    -- upvalues: v21 (copy)
    local v25 = v21(v22);
    local v26 = v21(v23);
    if typeof(v24) == "function" then
        return v24(v25, v26);
    elseif tostring(v25) < tostring(v26) then
        return -1;
    elseif tostring(v25) > tostring(v26) then
        return 1;
    else
        return 0;
    end;
end;
v6.isSome = function(v27) --[[ Line: 131 ]] --[[ Name: isSome ]]
    -- upvalues: l_Object_0 (copy)
    local v28 = false;
    if v27 ~= nil then
        v28 = v27 ~= l_Object_0.None;
    end;
    return v28;
end;
v6.assertSome = function(v29, v30) --[[ Line: 140 ]] --[[ Name: assertSome ]]
    -- upvalues: l_Error_0 (copy)
    local v31 = if v30 ~= nil then v30 else "Value should be something";
    if v29 == nil then
        error(l_Error_0.new(v31));
    end;
    return true;
end;
return v6;
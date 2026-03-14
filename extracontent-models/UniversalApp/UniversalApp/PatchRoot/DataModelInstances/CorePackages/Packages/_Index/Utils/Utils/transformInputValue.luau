local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local v5 = require(l_Parent_0.GraphQL);
local l_getNullableType_0 = v5.getNullableType;
local l_isLeafType_0 = v5.isLeafType;
local l_isListType_0 = v5.isListType;
local l_isInputObjectType_0 = v5.isInputObjectType;
local _ = require(script.Parent.types);
local function v11(v12, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: transformInputValue ]]
    -- upvalues: l_getNullableType_0 (copy), l_Boolean_0 (copy), l_isLeafType_0 (copy), l_isListType_0 (copy), l_Array_0 (copy), v11 (copy), l_isInputObjectType_0 (copy)
    local v16 = if v14 ~= nil then v14 else nil;
    local v17 = if v15 ~= nil then v15 else nil;
    if v13 == nil then
        return v13;
    else
        local v18 = l_getNullableType_0(v12);
        if l_Boolean_0.toJSBoolean(l_isLeafType_0(v18)) then
            if v16 ~= nil then
                return (v16(v18, v13));
            else
                return v13;
            end;
        elseif l_Boolean_0.toJSBoolean(l_isListType_0(v18)) then
            return l_Array_0.map(v13, function(v19) --[[ Line: 61 ]]
                -- upvalues: v11 (ref), v18 (copy), v16 (copy), v17 (copy)
                return v11(v18.ofType, v19, v16, v17);
            end);
        elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v18)) then
            local v20 = v18:getFields();
            local v21 = {};
            for v22 in v13 do
                local v23 = v20[tostring(v22)];
                if v23 ~= nil then
                    v21[tostring(v22)] = v11(v23.type, v13[tostring(v22)], v16, v17);
                end;
            end;
            if v17 ~= nil then
                return (v17(v18, v21));
            else
                return v21;
            end;
        else
            return nil;
        end;
    end;
end;
v4.transformInputValue = v11;
v4.serializeInputValue = function(v24, v25) --[[ Line: 95 ]] --[[ Name: serializeInputValue ]]
    -- upvalues: v11 (copy)
    return v11(v24, v25, function(v26, v27) --[[ Line: 96 ]]
        local l_status_0, l_result_0 = pcall(v26.serialize, v26, v27);
        if not l_status_0 then
            return v27;
        else
            return l_result_0;
        end;
    end);
end;
v4.parseInputValue = function(v30, v31) --[[ Line: 117 ]] --[[ Name: parseInputValue ]]
    -- upvalues: v11 (copy)
    return v11(v30, v31, function(v32, v33) --[[ Line: 118 ]]
        local l_status_1, l_result_1 = pcall(v32.parseValue, v32, v33);
        if not l_status_1 then
            return v33;
        else
            return l_result_1;
        end;
    end);
end;
v4.parseInputValueLiteral = function(v36, v37) --[[ Line: 139 ]] --[[ Name: parseInputValueLiteral ]]
    -- upvalues: v11 (copy)
    return v11(v36, v37, function(v38, v39) --[[ Line: 140 ]]
        return v38:parseLiteral(v39, {});
    end);
end;
return v4;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local v3 = {};
local v4 = require(l_Parent_0.GraphQL);
local l_GraphQLScalarType_0 = v4.GraphQLScalarType;
local l_isScalarType_0 = v4.isScalarType;
local l_isEnumType_0 = v4.isEnumType;
local l_isInterfaceType_0 = v4.isInterfaceType;
local l_isUnionType_0 = v4.isUnionType;
local l_isObjectType_0 = v4.isObjectType;
local l_isSpecifiedScalarType_0 = v4.isSpecifiedScalarType;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
v3.getResolversFromSchema = function(v14, v15) --[[ Line: 37 ]] --[[ Name: getResolversFromSchema ]]
    -- upvalues: l_String_0 (copy), l_Boolean_0 (copy), l_isScalarType_0 (copy), l_isSpecifiedScalarType_0 (copy), l_GraphQLScalarType_0 (copy), l_isEnumType_0 (copy), l_isInterfaceType_0 (copy), l_isUnionType_0 (copy), l_isObjectType_0 (copy)
    local v16 = {};
    local v17 = v14:getTypeMap();
    for _, v19 in v17 do
        local v20 = v19[1];
        if not l_String_0.startsWith(v20, "__") then
            local v21 = v17:get(v20);
            if l_Boolean_0.toJSBoolean(l_isScalarType_0(v21)) then
                if not l_Boolean_0.toJSBoolean(l_isSpecifiedScalarType_0(v21)) then
                    local v22 = v21:toConfig();
                    v22.astNode = nil;
                    local l_serialize_0 = v22.serialize;
                    local l_parseValue_0 = v22.parseValue;
                    local l_parseLiteral_0 = v22.parseLiteral;
                    if l_serialize_0 then
                        v22.serialize = function(...) --[[ Line: 73 ]]
                            -- upvalues: l_serialize_0 (copy), v22 (copy)
                            return l_serialize_0(v22, ...);
                        end;
                    end;
                    if l_parseValue_0 then
                        v22.parseValue = function(...) --[[ Line: 79 ]]
                            -- upvalues: l_parseValue_0 (copy), v22 (copy)
                            return l_parseValue_0(v22, ...);
                        end;
                    end;
                    if l_parseLiteral_0 then
                        v22.parseLiteral = function(...) --[[ Line: 85 ]]
                            -- upvalues: l_parseLiteral_0 (copy), v22 (copy)
                            return l_parseLiteral_0(v22, ...);
                        end;
                    end;
                    v16[tostring(v20)] = l_GraphQLScalarType_0.new(v22);
                end;
            elseif l_Boolean_0.toJSBoolean(l_isEnumType_0(v21)) then
                v16[tostring(v20)] = {};
                for _, v27 in (v21:getValues()) do
                    v16[tostring(v20)][tostring(v27.name)] = v27.value;
                end;
            elseif l_Boolean_0.toJSBoolean(l_isInterfaceType_0(v21)) then
                if v21.resolveType ~= nil then
                    v16[v20] = {
                        __resolveType = v21.resolveType
                    };
                end;
            elseif l_Boolean_0.toJSBoolean(l_isUnionType_0(v21)) then
                if v21.resolveType ~= nil then
                    v16[v20] = {
                        __resolveType = v21.resolveType
                    };
                end;
            elseif l_Boolean_0.toJSBoolean(l_isObjectType_0(v21)) then
                v16[tostring(v20)] = {};
                if v21.isTypeOf ~= nil then
                    v16[v20].__isTypeOf = v21.isTypeOf;
                end;
                local v28 = v21:getFields();
                for _, v30 in v28 do
                    local v31 = v30[1];
                    local v32 = v28:get(v31);
                    if v32.subscribe ~= nil then
                        v16[tostring(v20)][tostring(v31)] = l_Boolean_0.toJSBoolean(v16[tostring(v20)][tostring(v31)]) and v16[tostring(v20)][tostring(v31)] or {};
                        v16[tostring(v20)][tostring(v31)].subscribe = v32.subscribe;
                    end;
                    if v32.resolve ~= nil and (if typeof(v32.resolve) == "table" then v32.resolve.name else nil) ~= "defaultFieldResolver" then
                        local v33 = if typeof(v32.resolve) == "table" then v32.resolve.name else nil;
                        if v33 == "defaultMergedResolver" then
                            if not l_Boolean_0.toJSBoolean(v15) then
                                continue;
                            end;
                        elseif v33 == "defaultFieldResolver" then
                            continue;
                        end;
                        v16[tostring(v20)][tostring(v31)] = l_Boolean_0.toJSBoolean(v16[tostring(v20)][tostring(v31)]) and v16[tostring(v20)][tostring(v31)] or {};
                        v16[tostring(v20)][tostring(v31)].resolve = v32.resolve;
                    end;
                end;
            end;
        end;
    end;
    return v16;
end;
return v3;
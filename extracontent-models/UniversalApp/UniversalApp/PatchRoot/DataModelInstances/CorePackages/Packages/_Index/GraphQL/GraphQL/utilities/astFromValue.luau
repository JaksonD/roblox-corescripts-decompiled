local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Error_0 = v3.Error;
local l_Number_0 = v3.Number;
local v6 = require(l_Parent_1.RegExp);
local l_inspect_0 = require(l_Parent_0.jsutils.inspect).inspect;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local l_isIteratableObject_0 = require(l_Parent_0.jsutils.isIteratableObject).isIteratableObject;
local _ = require(l_Parent_0.language.ast);
local l_Kind_0 = require(l_Parent_0.language.kinds).Kind;
local l_GraphQLID_0 = require(l_Parent_0.type.scalars).GraphQLID;
local v14 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v14.isLeafType;
local l_isEnumType_0 = v14.isEnumType;
local l_isInputObjectType_0 = v14.isInputObjectType;
local l_isListType_0 = v14.isListType;
local l_isNonNullType_0 = v14.isNonNullType;
local v20 = require(l_luaUtils_0.null);
local v21 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v21.isNillish;
local l_isNotNillish_0 = v21.isNotNillish;
local v24 = nil;
local function v25(v26, v27) --[[ Line: 70 ]] --[[ Name: astFromValue ]]
    -- upvalues: l_isNonNullType_0 (copy), v25 (copy), v20 (copy), l_Kind_0 (copy), l_isListType_0 (copy), l_isIteratableObject_0 (copy), l_isNotNillish_0 (copy), l_isInputObjectType_0 (copy), l_isObjectLike_0 (copy), l_isLeafType_0 (copy), l_isNillish_0 (copy), l_Number_0 (copy), v24 (ref), l_isEnumType_0 (copy), l_GraphQLID_0 (copy), l_Error_0 (copy), l_inspect_0 (copy), l_invariant_0 (copy)
    if l_isNonNullType_0(v27) then
        local v28 = v25(v26, v27.ofType);
        local v29 = false;
        if v28 ~= nil then
            v29 = false;
            if v28 ~= v20 then
                v29 = v28.kind;
            end;
        end;
        if v29 == l_Kind_0.NULL then
            return v20;
        else
            return v28;
        end;
    elseif v26 == v20 then
        return {
            kind = l_Kind_0.NULL
        };
    elseif v26 == nil then
        return v20;
    elseif l_isListType_0(v27) then
        local l_ofType_0 = v27.ofType;
        if l_isIteratableObject_0(v26) then
            local v31 = {};
            for _, v33 in pairs(v26) do
                local v34 = v25(v33, l_ofType_0);
                if l_isNotNillish_0(v34) then
                    table.insert(v31, v34);
                end;
            end;
            return {
                kind = l_Kind_0.LIST, 
                values = v31
            };
        else
            return v25(v26, l_ofType_0);
        end;
    elseif l_isInputObjectType_0(v27) then
        if not l_isObjectLike_0(v26) then
            return v20;
        else
            local v35 = {};
            for _, v37 in ipairs(v27:getFields():values()) do
                local v38 = v25(v26[v37.name], v37.type);
                if l_isNotNillish_0(v38) then
                    table.insert(v35, {
                        kind = l_Kind_0.OBJECT_FIELD, 
                        name = {
                            kind = l_Kind_0.NAME, 
                            value = v37.name
                        }, 
                        value = v38
                    });
                end;
            end;
            return {
                kind = l_Kind_0.OBJECT, 
                fields = v35
            };
        end;
    else
        if l_isLeafType_0(v27) then
            local v39 = v27:serialize(v26);
            if l_isNillish_0(v39) then
                return v20;
            elseif typeof(v39) == "boolean" then
                return {
                    kind = l_Kind_0.BOOLEAN, 
                    value = v39
                };
            elseif typeof(v39) == "number" and l_Number_0.isFinite(v39) then
                local v40 = tostring(v39);
                if v24:test(v40) then
                    return {
                        kind = l_Kind_0.INT, 
                        value = v40
                    };
                else
                    return {
                        kind = l_Kind_0.FLOAT, 
                        value = v40
                    };
                end;
            elseif typeof(v39) == "string" then
                if l_isEnumType_0(v27) then
                    return {
                        kind = l_Kind_0.ENUM, 
                        value = v39
                    };
                elseif v27 == l_GraphQLID_0 and v24:test(v39) then
                    return {
                        kind = l_Kind_0.INT, 
                        value = v39
                    };
                else
                    return {
                        kind = l_Kind_0.STRING, 
                        value = v39
                    };
                end;
            else
                error(l_Error_0.new(("Cannot convert value to AST: %s."):format(l_inspect_0(v39))));
            end;
        end;
        l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v27));
        return;
    end;
end;
v24 = v6("^-?(?:0|[1-9][0-9]*)$");
return {
    astFromValue = v25, 
    NULL = v20
};
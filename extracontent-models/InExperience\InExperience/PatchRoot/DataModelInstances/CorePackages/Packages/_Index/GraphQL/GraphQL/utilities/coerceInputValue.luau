local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_luaUtils_0 = l_Parent_0.luaUtils;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_inspect_0 = require(l_jsutils_0.inspect).inspect;
local l_invariant_0 = require(l_jsutils_0.invariant).invariant;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_isObjectLike_0 = require(l_jsutils_0.isObjectLike).isObjectLike;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_printPathArray_0 = require(l_jsutils_0.printPathArray).printPathArray;
local l_addPath_0 = require(l_jsutils_0.Path).addPath;
local v14 = require(l_jsutils_0.instanceOf);
local v15 = require(l_luaUtils_0.null);
local v16 = require(l_luaUtils_0.isNillish);
local l_isNillish_0 = v16.isNillish;
local l_isNotNillish_0 = v16.isNotNillish;
local l_pathToArray_0 = require(l_jsutils_0.Path).pathToArray;
local l_isIteratableObject_0 = require(l_jsutils_0.isIteratableObject).isIteratableObject;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v22 = require(l_Parent_0.type.definition);
local l_isLeafType_0 = v22.isLeafType;
local l_isInputObjectType_0 = v22.isInputObjectType;
local l_isListType_0 = v22.isListType;
local l_isNonNullType_0 = v22.isNonNullType;
local v27 = nil;
local v28 = nil;
local function v33(v29, v30, v31) --[[ Line: 55 ]] --[[ Name: coerceInputValue ]]
    -- upvalues: v28 (ref), v27 (ref)
    local v32 = v31 or v28;
    return v27(v29, v30, v32);
end;
v28 = function(v34, v35, v36) --[[ Line: 60 ]] --[[ Name: defaultOnError ]]
    -- upvalues: l_inspect_0 (copy), l_printPathArray_0 (copy)
    local v37 = "Invalid value " .. l_inspect_0(v35);
    if #v34 > 0 then
        v37 = v37 .. " at \"value" .. l_printPathArray_0(v34) .. "\"";
    end;
    v36.message = v37 .. ": " .. v36.message;
    error(v36);
end;
v27 = function(v38, v39, v40, v41) --[[ Line: 69 ]] --[[ Name: coerceInputValueImpl ]]
    -- upvalues: l_isNonNullType_0 (copy), l_isNotNillish_0 (copy), v27 (ref), l_pathToArray_0 (copy), l_GraphQLError_0 (copy), l_inspect_0 (copy), l_isNillish_0 (copy), v15 (copy), l_isListType_0 (copy), l_isIteratableObject_0 (copy), l_Array_0 (copy), l_addPath_0 (copy), l_isInputObjectType_0 (copy), l_isObjectLike_0 (copy), l_Object_0 (copy), l_suggestionList_0 (copy), l_didYouMean_0 (copy), l_isLeafType_0 (copy), v14 (copy), l_invariant_0 (copy)
    if l_isNonNullType_0(v39) then
        if l_isNotNillish_0(v38) then
            return v27(v38, v39.ofType, v40, v41);
        else
            v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new("Expected non-nullable type \"" .. l_inspect_0(v39) .. "\" not to be null."));
            return;
        end;
    elseif l_isNillish_0(v38) then
        return v15;
    elseif l_isListType_0(v39) then
        local l_ofType_0 = v39.ofType;
        if l_isIteratableObject_0(v38) then
            return l_Array_0.from(v38, function(v43, v44) --[[ Line: 97 ]]
                -- upvalues: l_addPath_0 (ref), v41 (copy), v27 (ref), l_ofType_0 (copy), v40 (copy)
                local v45 = l_addPath_0(v41, v44, nil);
                return v27(v43, l_ofType_0, v40, v45);
            end);
        else
            return {
                v27(v38, l_ofType_0, v40, v41)
            };
        end;
    elseif l_isInputObjectType_0(v39) then
        if not l_isObjectLike_0(v38) then
            v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new("Expected type \"" .. v39.name .. "\" to be an object."));
            return;
        else
            local v46 = {};
            local v47 = v39:getFields();
            for _, v49 in ipairs(v47:values()) do
                local v50 = v38[v49.name];
                if v50 == nil then
                    if v49.defaultValue ~= nil then
                        v46[v49.name] = v49.defaultValue;
                    elseif l_isNonNullType_0(v49.type) then
                        local v51 = l_inspect_0(v49.type);
                        v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new("Field \"" .. v49.name .. "\" of required type \"" .. v51 .. "\" was not provided."));
                    end;
                else
                    v46[v49.name] = v27(v50, v49.type, v40, l_addPath_0(v41, v49.name, v39.name));
                end;
            end;
            for _, v53 in ipairs(l_Object_0.keys(v38)) do
                if not v47:get(v53) then
                    local v54 = l_suggestionList_0(v53, v39:getFields():keys());
                    v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(v53, v39.name, l_didYouMean_0(v54))));
                end;
            end;
            return v46;
        end;
    elseif l_isLeafType_0(v39) then
        local v55 = nil;
        local l_status_0, l_result_0 = pcall(v39.parseValue, v39, v38);
        if not l_status_0 then
            if v14(l_result_0, l_GraphQLError_0) then
                v40(l_pathToArray_0(v41), v38, l_result_0);
                return;
            else
                v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new("Expected type \"" .. v39.name .. "\". " .. l_result_0.message, nil, nil, nil, nil, l_result_0));
                return;
            end;
        else
            v55 = l_result_0;
            if v55 == nil then
                v40(l_pathToArray_0(v41), v38, l_GraphQLError_0.new(("Expected type \"%s\"."):format(v39.name)));
            end;
            return v55;
        end;
    else
        l_invariant_0(false, "Unexpected input type: " .. l_inspect_0(v39));
        return;
    end;
end;
return {
    coerceInputValue = v33
};
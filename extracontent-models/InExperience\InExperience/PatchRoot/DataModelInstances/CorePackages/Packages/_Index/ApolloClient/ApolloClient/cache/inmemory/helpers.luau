local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_1.LuauRegExp);
local _ = require(l_Parent_1.GraphQL);
local _ = require(script.Parent.types);
local v6 = require(l_Parent_0.utilities);
local l_isReference_0 = v6.isReference;
local l_isField_0 = v6.isField;
local l_DeepMerger_0 = v6.DeepMerger;
local l_resultKeyNameFromFieldf_0 = v6.resultKeyNameFromFieldf;
local l_shouldInclude_0 = v6.shouldInclude;
local l_isNonNullObject_0 = v6.isNonNullObject;
local v13 = {};
local v14 = require(l_Parent_0.luaUtils.hasOwnProperty);
v13.hasOwn = v14;
v13.getTypenameFromStoreObject = function(v15, v16) --[[ Line: 41 ]] --[[ Name: getTypenameFromStoreObject ]]
    -- upvalues: l_isReference_0 (copy)
    if l_isReference_0(v16) then
        return (v15:get(v16.__ref, "__typename"));
    elseif v16 then
        return v16.__typename;
    else
        return nil;
    end;
end;
v13.TypeOrFieldNameRegExp = v3("^[_a-zA-Z][_0-9a-zA-Z]*", "i");
local v17 = {};
v13.fieldNameFromStoreName = function(v18) --[[ Line: 64 ]] --[[ Name: fieldNameFromStoreName ]]
    -- upvalues: v17 (copy)
    if v17[v18] then
        return v17[v18];
    else
        local v19 = string.match(v18, "^[_a-zA-Z][_0-9a-zA-Z]*") or v18;
        v17[v18] = v19;
        return v19;
    end;
end;
local function v20(v21, v22, v23) --[[ Line: 76 ]] --[[ Name: selectionSetMatchesResult ]]
    -- upvalues: l_isNonNullObject_0 (copy), l_Array_0 (copy), v20 (copy), l_isField_0 (copy), l_shouldInclude_0 (copy), l_resultKeyNameFromFieldf_0 (copy), v14 (copy)
    if l_isNonNullObject_0(v22) then
        if l_Array_0.isArray(v22) then
            return l_Array_0.every(v22, function(v24) --[[ Line: 84 ]]
                -- upvalues: v20 (ref), v21 (copy), v23 (copy)
                return v20(v21, v24, v23);
            end);
        else
            return l_Array_0.every(v21.selections, function(v25) --[[ Line: 88 ]]
                -- upvalues: l_isField_0 (ref), l_shouldInclude_0 (ref), v23 (copy), l_resultKeyNameFromFieldf_0 (ref), v14 (ref), v22 (copy), v20 (ref)
                if l_isField_0(v25) and l_shouldInclude_0(v25, v23) then
                    local v26 = l_resultKeyNameFromFieldf_0(v25);
                    return v14(v22, v26) and (not v25.selectionSet or v20(v25.selectionSet, v22[v26], v23));
                else
                    return true;
                end;
            end);
        end;
    else
        return false;
    end;
end;
v13.selectionSetMatchesResult = v20;
v13.storeValueIsStoreObject = function(v27) --[[ Line: 116 ]] --[[ Name: storeValueIsStoreObject ]]
    -- upvalues: l_isNonNullObject_0 (copy), l_isReference_0 (copy), l_Array_0 (copy)
    return l_isNonNullObject_0(v27) and not l_isReference_0(v27) and not l_Array_0.isArray(v27);
end;
v13.makeProcessedFieldsMerger = function() --[[ Line: 121 ]] --[[ Name: makeProcessedFieldsMerger ]]
    -- upvalues: l_DeepMerger_0 (copy)
    return l_DeepMerger_0.new();
end;
return v13;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_jsutils_0 = l_Parent_0.jsutils;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local l_didYouMean_0 = require(l_jsutils_0.didYouMean).didYouMean;
local l_suggestionList_0 = require(l_jsutils_0.suggestionList).suggestionList;
local l_naturalCompare_0 = require(l_jsutils_0.naturalCompare).naturalCompare;
local l_GraphQLError_0 = require(l_Parent_0.error.GraphQLError).GraphQLError;
local v8 = require(l_Parent_0.type.definition);
local l_isObjectType_0 = v8.isObjectType;
local l_isInterfaceType_0 = v8.isInterfaceType;
local l_isAbstractType_0 = v8.isAbstractType;
local v12 = nil;
local v13 = nil;
local v21 = {
    FieldsOnCorrectTypeRule = function(v14) --[[ Line: 36 ]]
        -- upvalues: l_didYouMean_0 (copy), v13 (ref), v12 (ref), l_GraphQLError_0 (copy)
        return {
            Field = function(_, v16) --[[ Line: 38 ]] --[[ Name: Field ]]
                -- upvalues: v14 (copy), l_didYouMean_0 (ref), v13 (ref), v12 (ref), l_GraphQLError_0 (ref)
                local v17 = v14:getParentType();
                if v17 and not v14:getFieldDef() then
                    local v18 = v14:getSchema();
                    local l_value_0 = v16.name.value;
                    local v20 = l_didYouMean_0("to use an inline fragment on", v13(v18, v17, l_value_0));
                    if v20 == "" then
                        v20 = l_didYouMean_0(v12(v17, l_value_0));
                    end;
                    v14:reportError(l_GraphQLError_0.new(("Cannot query field \"%s\" on type \"%s\"."):format(l_value_0, v17.name) .. v20, v16));
                end;
            end
        };
    end
};
v13 = function(v22, v23, v24) --[[ Line: 77 ]] --[[ Name: getSuggestedTypeNames ]]
    -- upvalues: l_isAbstractType_0 (copy), l_Array_0 (copy), l_isInterfaceType_0 (copy), l_naturalCompare_0 (copy)
    if not l_isAbstractType_0(v23) then
        return {};
    else
        local v25 = {};
        local v26 = {};
        for _, v28 in ipairs(v22:getPossibleTypes(v23)) do
            if v28:getFields():get(v24) then
                v25[v28] = true;
                v26[v28.name] = 1;
                for _, v30 in ipairs(v28:getInterfaces()) do
                    if v30:getFields():get(v24) then
                        v25[v30] = true;
                        v26[v30.name] = (v26[v30.name] or 0) + 1;
                    end;
                end;
            end;
        end;
        local v31 = {};
        for v32, _ in pairs(v25) do
            table.insert(v31, v32);
        end;
        l_Array_0.sort(v31, function(v34, v35) --[[ Line: 114 ]]
            -- upvalues: v26 (copy), l_isInterfaceType_0 (ref), v22 (copy), l_naturalCompare_0 (ref)
            local v36 = v26[v35.name] - v26[v34.name];
            if v36 ~= 0 then
                return v36;
            elseif l_isInterfaceType_0(v34) and v22:isSubType(v34, v35) then
                return -1;
            elseif l_isInterfaceType_0(v35) and v22:isSubType(v35, v34) then
                return 1;
            else
                return l_naturalCompare_0(v34.name, v35.name);
            end;
        end);
        return l_Array_0.map(v31, function(v37) --[[ Line: 131 ]]
            return v37.name;
        end);
    end;
end;
v12 = function(v38, v39) --[[ Line: 140 ]] --[[ Name: getSuggestedFieldNames ]]
    -- upvalues: l_isObjectType_0 (copy), l_isInterfaceType_0 (copy), l_suggestionList_0 (copy)
    if l_isObjectType_0(v38) or l_isInterfaceType_0(v38) then
        local v40 = v38:getFields():keys();
        return l_suggestionList_0(v39, v40);
    else
        return {};
    end;
end;
return v21;
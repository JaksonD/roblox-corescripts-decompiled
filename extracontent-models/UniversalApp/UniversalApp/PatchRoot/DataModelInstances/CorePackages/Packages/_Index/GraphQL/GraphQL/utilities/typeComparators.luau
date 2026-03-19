local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.type.definition);
local l_isInterfaceType_0 = v3.isInterfaceType;
local l_isObjectType_0 = v3.isObjectType;
local l_isListType_0 = v3.isListType;
local l_isNonNullType_0 = v3.isNonNullType;
local l_isAbstractType_0 = v3.isAbstractType;
local function v9(v10, v11) --[[ Line: 24 ]] --[[ Name: isEqualType ]]
    -- upvalues: l_isNonNullType_0 (copy), v9 (copy), l_isListType_0 (copy)
    if v10 == v11 then
        return true;
    elseif l_isNonNullType_0(v10) and l_isNonNullType_0(v11) then
        return v9(v10.ofType, v11.ofType);
    elseif l_isListType_0(v10) and l_isListType_0(v11) then
        return v9(v10.ofType, v11.ofType);
    else
        return false;
    end;
end;
local function v12(v13, v14, v15) --[[ Line: 48 ]] --[[ Name: isTypeSubTypeOf ]]
    -- upvalues: l_isNonNullType_0 (copy), v12 (copy), l_isListType_0 (copy), l_isAbstractType_0 (copy), l_isInterfaceType_0 (copy), l_isObjectType_0 (copy)
    if v14 == v15 then
        return true;
    elseif l_isNonNullType_0(v15) then
        if l_isNonNullType_0(v14) then
            return v12(v13, v14.ofType, v15.ofType);
        else
            return false;
        end;
    elseif l_isNonNullType_0(v14) then
        return v12(v13, v14.ofType, v15);
    elseif l_isListType_0(v15) then
        if l_isListType_0(v14) then
            return v12(v13, v14.ofType, v15.ofType);
        else
            return false;
        end;
    elseif l_isListType_0(v14) then
        return false;
    else
        return l_isAbstractType_0(v15) and (l_isInterfaceType_0(v14) or l_isObjectType_0(v14)) and v13:isSubType(v15, v14);
    end;
end;
return {
    isEqualType = v9, 
    isTypeSubTypeOf = v12, 
    doTypesOverlap = function(v16, v17, v18) --[[ Line: 97 ]] --[[ Name: doTypesOverlap ]]
        -- upvalues: l_isAbstractType_0 (copy), l_Array_0 (copy)
        if v17 == v18 then
            return true;
        elseif l_isAbstractType_0(v17) then
            if l_isAbstractType_0(v18) then
                return l_Array_0.some(v16:getPossibleTypes(v17), function(v19) --[[ Line: 106 ]]
                    -- upvalues: v16 (copy), v18 (copy)
                    return v16:isSubType(v18, v19);
                end);
            else
                return v16:isSubType(v17, v18);
            end;
        elseif l_isAbstractType_0(v18) then
            return v16:isSubType(v18, v17);
        else
            return false;
        end;
    end
};
local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = {};
local v3 = require(l_Parent_0.GraphQL);
local l_doTypesOverlap_0 = v3.doTypesOverlap;
local l_isCompositeType_0 = v3.isCompositeType;
local _ = require(script.Parent.types);
v2.implementsAbstractType = function(v7, v8, v9) --[[ Line: 20 ]] --[[ Name: implementsAbstractType ]]
    -- upvalues: l_Boolean_0 (copy), l_isCompositeType_0 (copy), l_doTypesOverlap_0 (copy)
    if v9 == nil or v8 == nil then
        return false;
    elseif v8 == v9 then
        return true;
    else
        local l_toJSBoolean_0 = l_Boolean_0.toJSBoolean;
        local v11 = l_isCompositeType_0(v8);
        if l_toJSBoolean_0(if l_Boolean_0.toJSBoolean(v11) then l_isCompositeType_0(v9) else v11) then
            return l_doTypesOverlap_0(v7, v8, v9);
        else
            return false;
        end;
    end;
end;
return v2;
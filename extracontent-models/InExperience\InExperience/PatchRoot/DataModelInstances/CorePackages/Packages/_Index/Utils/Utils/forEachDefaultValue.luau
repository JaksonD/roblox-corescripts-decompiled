local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local v3 = {};
local v4 = require(l_Parent_0.GraphQL);
local l_getNamedType_0 = v4.getNamedType;
local l_isObjectType_0 = v4.isObjectType;
local l_isInputObjectType_0 = v4.isInputObjectType;
local _ = require(script.Parent.Interfaces);
local l_String_0 = v1.String;
v3.forEachDefaultValue = function(v10, v11) --[[ Line: 26 ]] --[[ Name: forEachDefaultValue ]]
    -- upvalues: l_String_0 (copy), l_getNamedType_0 (copy), l_Boolean_0 (copy), l_isObjectType_0 (copy), l_isInputObjectType_0 (copy)
    local v12 = v10:getTypeMap();
    for _, v14 in v12 do
        local v15 = v12:get(v14[1]);
        if not l_String_0.startsWith(l_getNamedType_0(v15).name, "__") then
            if l_Boolean_0.toJSBoolean(l_isObjectType_0(v15)) then
                local v16 = v15:getFields();
                for _, v18 in v16 do
                    for _, v20 in v16:get(v18[1]).args do
                        v20.defaultValue = v11(v20.type, v20.defaultValue);
                    end;
                end;
            elseif l_Boolean_0.toJSBoolean(l_isInputObjectType_0(v15)) then
                local v21 = v15:getFields();
                for _, v23 in v21 do
                    local v24 = v21:get(v23[1]);
                    v24.defaultValue = v11(v24.type, v24.defaultValue);
                end;
            end;
        end;
    end;
end;
return v3;
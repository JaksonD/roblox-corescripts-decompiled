local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local v4 = {};
local l_isObjectType_0 = require(l_Parent_0.GraphQL).isObjectType;
v4.getImplementingTypes = function(v6, v7) --[[ Line: 17 ]] --[[ Name: getImplementingTypes ]]
    -- upvalues: l_Boolean_0 (copy), l_isObjectType_0 (copy), l_Array_0 (copy)
    local v8 = v7:getTypeMap();
    local v9 = {};
    for _, v11 in v8 do
        local v12 = v8:get((table.unpack(v11)));
        if l_Boolean_0.toJSBoolean(l_isObjectType_0(v12)) then
            local v13 = v12:getInterfaces();
            if l_Boolean_0.toJSBoolean(l_Array_0.find(v13, function(v14) --[[ Line: 36 ]]
                -- upvalues: v6 (copy)
                return v14.name == v6;
            end)) then
                table.insert(v9, v12.name);
            end;
        end;
    end;
    return v9;
end;
return v4;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local function v8(v4, v5) --[[ Line: 13 ]] --[[ Name: hasOnlyAllowedAttribute ]]
    -- upvalues: v2 (copy)
    for v6, v7 in v4 do
        if not v5 or v6 ~= v2.AlternateMeshIdAttributeName then
            if v6 ~= v2.GUIDAttributeName then
                return false;
            elseif typeof(v7) ~= "string" then
                return false;
            elseif string.len(v7) > v2.GUIDAttributeMaxLength then
                return false;
            end;
        end;
    end;
    return true;
end;
return function(v9, v10) --[[ Line: 35 ]] --[[ Name: validateAttributes ]]
    -- upvalues: v8 (copy), v2 (copy), v1 (copy)
    local l_allowEditableInstances_0 = v10.allowEditableInstances;
    local v12 = {};
    if not v8(v9:GetAttributes(), l_allowEditableInstances_0) then
        table.insert(v12, v9:GetFullName());
    end;
    for _, v14 in ipairs(v9:GetDescendants()) do
        if (not l_allowEditableInstances_0 or not v14:GetAttribute(v2.AlternateMeshIdAttributeName)) and next(v14:GetAttributes()) ~= nil then
            table.insert(v12, v14:GetFullName());
        end;
    end;
    if #v12 > 0 then
        local v15 = {};
        table.insert(v15, string.format("'%s' (or its descendants) contain Attributes. You need to remove Attributes from the following: ", v9.Name));
        for _, v17 in pairs(v12) do
            table.insert(v15, v17);
        end;
        v1.reportFailure(v1.ErrorType.validateAttributes, nil, v10);
        return false, v15;
    else
        return true;
    end;
end;
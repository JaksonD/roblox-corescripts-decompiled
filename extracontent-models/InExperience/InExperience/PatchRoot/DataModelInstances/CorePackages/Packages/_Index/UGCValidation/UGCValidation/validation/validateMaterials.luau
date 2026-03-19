local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: validateMaterials ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v6 = {};
    local l_v4_Descendants_0 = v4:GetDescendants();
    table.insert(l_v4_Descendants_0, v4);
    for _, v9 in l_v4_Descendants_0 do
        if v9:IsA("BasePart") and not v3.MATERIAL_WHITELIST[v9.Material] then
            table.insert(v6, v9:GetFullName());
        end;
    end;
    if #v6 > 0 then
        local v10 = {};
        local v11 = {};
        for v12 in pairs(v3.MATERIAL_WHITELIST) do
            table.insert(v11, v12.Name);
        end;
        table.insert(v10, "Invalid material setup for");
        for _, v14 in pairs(v6) do
            table.insert(v10, v14);
        end;
        table.insert(v10, "Accepted values are: " .. table.concat(v11, ", "));
        v2.reportFailure(v2.ErrorType.validateMaterials, nil, v5);
        return false, v10;
    else
        return true;
    end;
end;
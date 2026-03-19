local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validation.validateLayeredClothingAccessory);
local v3 = require(l_Parent_0.validation.validateLayeredClothingAccessoryMeshPartAssetFormatMatch);
return function(v4, v5) --[[ Line: 9 ]] --[[ Name: validateLayeredClothingAccessoryMeshPartAssetFormat ]]
    -- upvalues: v2 (copy), v3 (copy)
    assert(v5.instances ~= nil, "instances required in validationContext for validateLayeredClothingAccessoryMeshPartAssetFormat");
    local l_instances_0 = v5.instances;
    local v7 = nil;
    local v8 = nil;
    local v9, v10 = v2(v5);
    v7 = v9;
    v8 = v10;
    if not v7 then
        return false, v8;
    else
        v9 = l_instances_0[1];
        local v11;
        v10, v11 = v3(v9, v4, v5);
        v7 = v10;
        v8 = v11;
        if not v7 then
            return false, v8;
        else
            return true;
        end;
    end;
end;
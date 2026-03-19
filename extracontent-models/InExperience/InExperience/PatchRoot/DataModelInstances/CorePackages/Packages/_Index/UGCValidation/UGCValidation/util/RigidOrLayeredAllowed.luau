local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.flags.getFStringUGCLCAllowedAssetTypeIds);
return {
    isRigidAccessoryAllowed = function(v3) --[[ Line: 9 ]] --[[ Name: isRigidAccessoryAllowed ]]
        -- upvalues: v1 (copy)
        local v4 = v1.ASSET_TYPE_INFO[v3];
        if v4 == nil then
            return false;
        else
            return v4.rigidAllowed == true;
        end;
    end, 
    isLayeredClothingAllowed = function(v5) --[[ Line: 18 ]] --[[ Name: isLayeredClothingAllowed ]]
        -- upvalues: v2 (copy)
        return table.find(string.split(v2(), ","), (tostring(v5.Value))) ~= nil;
    end
};
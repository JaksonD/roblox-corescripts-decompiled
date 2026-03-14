local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Utils.isCreatorStoreAssetType);
local _ = require(l_Parent_0.Promise);
return {
    isAssetValid = function(v3) --[[ Line: 17 ]] --[[ Name: isAssetValid ]]
        -- upvalues: v1 (copy)
        if v1(v3.type) and (not v3.id or not v3.type or not v3.typeId or not v3.creator) then
            return false;
        else
            return true;
        end;
    end, 
    fromAsset = function(v4) --[[ Line: 29 ]] --[[ Name: fromAsset ]]
        return {
            id = v4.id, 
            type = v4.type, 
            typeId = v4.typeId, 
            creator = v4.creator, 
            description = v4.description, 
            isPublicDomainEnabled = v4.isPublicDomainEnabled, 
            name = v4.name
        };
    end
};
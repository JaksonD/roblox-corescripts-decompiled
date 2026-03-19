local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
local v1 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v1.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v1.Utils.Constants;
local function _(v4) --[[ Line: 9 ]] --[[ Name: getRbxThumbType ]]
    -- upvalues: l_Constants_0 (copy)
    if v4 == "AvatarBundle" then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    else
        return l_Constants_0.RbxthumbTypes.Asset;
    end;
end;
return function(v6, v7) --[[ Line: 16 ]] --[[ Name: getThumbnailUrl ]]
    -- upvalues: l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy)
    return l_getRbxthumbWithTypeSizeAndOptions_0(v6, if v7 == "AvatarBundle" then l_Constants_0.RbxthumbTypes.BundleThumbnail else l_Constants_0.RbxthumbTypes.Asset, 150);
end;
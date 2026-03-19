local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_Constants_0 = require(l_Parent_0.UserLib).Utils.Constants;
return function(v2) --[[ Line: 7 ]] --[[ Name: getRbxThumbType ]]
    -- upvalues: l_Constants_0 (copy)
    if v2 == "Bundle" then
        return l_Constants_0.RbxthumbTypes.BundleThumbnail;
    elseif v2 == "Asset" then
        return l_Constants_0.RbxthumbTypes.Asset;
    else
        return nil;
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceHeadRefinement").Parent;
local v1 = require(l_Parent_0.Http);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: requestUserOwnedClassicHeads ]]
    -- upvalues: v1 (copy)
    return v2(string.format("%sv2/users/%s/inventory?limit=100&sortOrder=Desc&assetTypes=Head&cursor=%s", v1.Url.INVENTORY_URL, v3, v4 or ""), "GET");
end;
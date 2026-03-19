local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.AvatarExperienceCommon).Enums.CatalogCategories.Recommended:rawValue();
return function(v2, v3, v4) --[[ Line: 25 ]] --[[ Name: getShouldPageUseWidgetOnlyFetcher ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return false;
    elseif v4 then
        return false;
    elseif v2.Id ~= v1 then
        return false;
    elseif v3 and v3 > 0 then
        return false;
    else
        return true;
    end;
end;
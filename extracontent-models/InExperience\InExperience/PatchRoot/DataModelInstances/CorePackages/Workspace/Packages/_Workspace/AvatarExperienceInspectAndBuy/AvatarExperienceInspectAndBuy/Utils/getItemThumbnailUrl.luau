local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AXCommon);
local _ = require(l_script_FirstAncestor_0.Types);
local l_ItemTypeEnum_0 = v2.Enums.ItemTypeEnum;
return function(v5) --[[ Line: 12 ]] --[[ Name: getItemThumbnailUrl ]]
    -- upvalues: l_ItemTypeEnum_0 (copy)
    if v5.itemType == l_ItemTypeEnum_0.Bundle then
        return "rbxthumb://type=BundleThumbnail&id=" .. v5.id .. "&w=420&h=420";
    elseif v5.itemType == l_ItemTypeEnum_0.Asset then
        return "rbxthumb://type=Asset&id=" .. v5.id .. "&w=420&h=420";
    else
        return nil;
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.AXCommon);
local _ = require(l_script_FirstAncestor_0.Types);
local v5 = require(l_script_FirstAncestor_0.Components.useItemCardRowProps);
local _ = require(l_script_FirstAncestor_0.Enums.ViewType);
local l_CatalogRowItemCard_0 = v3.Components.CatalogItemCard.CatalogRowItemCard;
return function(v8) --[[ Line: 19 ]]
    -- upvalues: v5 (copy), v2 (copy), l_CatalogRowItemCard_0 (copy)
    local v9 = v5(v8.item, v8.LayoutOrder, v8.view, v8.onItemCardActivated, v8.itemCardWidth);
    return v2.createElement(l_CatalogRowItemCard_0, v9);
end;
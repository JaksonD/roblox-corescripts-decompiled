local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.InventoryItemsList);
local v3 = require(script.Parent.useInventoryItemsListProps);
local l_FFlagAXAddInventoryItemsListProps_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddInventoryItemsListProps;
return v1.memo(function(v5) --[[ Line: 15 ]] --[[ Name: InventoryItemsListContainer ]]
    -- upvalues: l_FFlagAXAddInventoryItemsListProps_0 (copy), v3 (copy), v1 (copy), v2 (copy)
    local v6 = nil;
    v6 = if l_FFlagAXAddInventoryItemsListProps_0 then v3(v5) else v3();
    return v1.createElement(v2, v6);
end);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.Style);
local l_ItemCardThumbnail_0 = require(l_Parent_0.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local _ = require(l_Parent_0.AvatarExperienceCommon);
local v6 = require(l_script_FirstAncestor_0.Enums.ItemStatusToItemStatusKey);
local _ = require(script.Parent.BulkPurchaseRequestItem);
local _ = require(script.Parent.BulkPurchaseRequestOwnedItem);
local _ = require(script.Parent.BulkPurchaseRequestUnpurchasableItem);
local function _(v10, v11) --[[ Line: 24 ]] --[[ Name: toCardPropsWithId ]]
    local v12 = table.clone(v10);
    v12.id = v11;
    return v12;
end;
return {
    mapItemsToRowPresentation = function(v14) --[[ Line: 32 ]] --[[ Name: mapItemsToRowPresentation ]]
        -- upvalues: v2 (copy), l_ItemCardThumbnail_0 (copy)
        local v15 = {};
        for _, v17 in v14 do
            local v18 = {
                type = "price", 
                price = v17.cost
            };
            local v19 = {
                presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                    url = v17.image
                }), 
                title = v17.name, 
                priceLineContent = {
                    v18
                }
            };
            local l_id_0 = v17.id;
            local v21 = table.clone(v19);
            v21.id = l_id_0;
            table.insert(v15, v21);
        end;
        return v15;
    end, 
    mapOwnedItemsToRowPresentation = function(v22, v23, v24) --[[ Line: 48 ]] --[[ Name: mapOwnedItemsToRowPresentation ]]
        -- upvalues: v2 (copy), l_ItemCardThumbnail_0 (copy)
        local v25 = {};
        for _, v27 in v22 do
            local v28 = {
                type = "text", 
                text = v24.itemOwned:gsub("{.*}", (tostring(v27.ownedCount))), 
                colorStyle = v23
            };
            local v29 = {
                presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                    url = v27.image
                }), 
                title = v27.name, 
                priceLineContent = {
                    v28
                }
            };
            local l_id_1 = v27.id;
            local v31 = table.clone(v29);
            v31.id = l_id_1;
            table.insert(v25, v31);
        end;
        return v25;
    end, 
    mapUnpurchasableItemsToRowPresentation = function(v32, v33, v34, v35) --[[ Line: 70 ]] --[[ Name: mapUnpurchasableItemsToRowPresentation ]]
        -- upvalues: v6 (copy), v2 (copy), l_ItemCardThumbnail_0 (copy)
        local v36 = {};
        for _, v38 in v32 do
            local v39 = v33[v6[v38.status]];
            local v40 = if v38.status == Enum.MarketplaceItemPurchaseStatus.Success then v34 else v35;
            local v41 = {
                type = "text", 
                text = v39, 
                colorStyle = v40
            };
            local v42 = {
                presentationSlot = v2.createElement(l_ItemCardThumbnail_0, {
                    url = v38.image
                }), 
                title = v38.name, 
                priceLineContent = {
                    v41
                }
            };
            local l_id_2 = v38.id;
            local v44 = table.clone(v42);
            v44.id = l_id_2;
            table.insert(v36, v44);
        end;
        return v36;
    end
};
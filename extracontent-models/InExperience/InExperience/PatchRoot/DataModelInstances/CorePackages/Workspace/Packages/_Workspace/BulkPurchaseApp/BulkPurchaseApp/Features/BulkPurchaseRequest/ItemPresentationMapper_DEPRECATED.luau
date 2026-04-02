local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v4 = require(l_script_FirstAncestor_0.Components.Price);
local v5 = require(l_script_FirstAncestor_0.Components.ItemStatus);
return {
    mapItemsToPresentation_DEPRECATED = function(v6, v7, v8) --[[ Line: 10 ]] --[[ Name: mapItemsToPresentation_DEPRECATED ]]
        -- upvalues: v2 (copy), v4 (copy)
        local v9 = {};
        for _, v11 in v6 do
            table.insert(v9, {
                id = v11.id, 
                name = v11.name, 
                image = v11.image, 
                endSlot = v2.createElement(v4, {
                    amount = v11.cost, 
                    fontStyle = v7, 
                    colorStyle = v8
                })
            });
        end;
        return v9;
    end, 
    mapOwnedItemsToPresentation_DEPRECATED = function(v12, v13, v14, v15) --[[ Line: 26 ]] --[[ Name: mapOwnedItemsToPresentation_DEPRECATED ]]
        -- upvalues: v2 (copy), l_StyledTextLabel_0 (copy)
        local v16 = {};
        for _, v18 in v12 do
            table.insert(v16, {
                id = v18.id, 
                name = v18.name, 
                image = v18.image, 
                endSlot = v2.createElement(l_StyledTextLabel_0, {
                    fontStyle = v13, 
                    colorStyle = v14, 
                    textXAlignment = Enum.TextXAlignment.Right, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    lineHeight = v13.LineHeight, 
                    size = UDim2.fromScale(1, 1), 
                    text = v15.itemOwned:gsub("{.*}", (tostring(v18.ownedCount)))
                })
            });
        end;
        return v16;
    end, 
    mapUnpurchasableItemsToPresentation_DEPRECATED = function(v19) --[[ Line: 47 ]] --[[ Name: mapUnpurchasableItemsToPresentation_DEPRECATED ]]
        -- upvalues: v2 (copy), v5 (copy)
        local v20 = {};
        for _, v22 in v19 do
            table.insert(v20, {
                id = v22.id, 
                name = v22.name, 
                image = v22.image, 
                endSlot = v2.createElement(v5, {
                    status = v22.status
                })
            });
        end;
        return v20;
    end
};
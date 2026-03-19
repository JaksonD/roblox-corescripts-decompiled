local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local _ = require(l_script_FirstAncestor_0.Store.Types);
return function(v2) --[[ Line: 7 ]] --[[ Name: selectRobuxSpent ]]
    local v3 = 0;
    if v2.itemData and v2.itemStatuses then
        for _, v5 in v2.itemData do
            if v2.itemStatuses[v5.id] == Enum.MarketplaceItemPurchaseStatus.Success then
                v3 = v3 + v5.priceRobux;
            end;
        end;
    end;
    return v3;
end;
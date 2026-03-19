local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AXCommon);
local _ = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Enums.PriceStatus);
local v5 = require(l_script_FirstAncestor_0.Utils.getPriceStatus);
local _ = require(l_script_FirstAncestor_0.Types);
return function(v7, v8, v9) --[[ Line: 17 ]] --[[ Name: getPriceLineContent ]]
    -- upvalues: v5 (copy), v4 (copy)
    local v10 = {};
    local v11 = v5(v7, true);
    local v12 = {
        [v4.Owned] = {
            {
                type = "text", 
                text = v9[v4.Owned]
            }
        }, 
        [v4.Free] = {
            {
                type = "text", 
                text = v9[v4.Free]
            }
        }, 
        [v4.QuantityLimitReached] = {
            {
                type = "text", 
                colorStyle = v8.Color.System.Warning, 
                text = v9[v4.QuantityLimitReached]
            }
        }, 
        [v4.InExperienceOnly] = {
            {
                type = "text", 
                text = v9[v4.InExperienceOnly], 
                colorStyle = v8.Color.System.Warning
            }
        }, 
        [v4.PurchaseFromRoblox] = {
            {
                type = "price", 
                price = v7.priceInRobux
            }
        }, 
        [v4.PurchaseFromResale] = if v7.isOffSale then {
            {
                type = "price", 
                price = if v7.collectibleItemDetails then v7.collectibleItemDetails.lowestResalePrice else 0
            }
        } else {
            {
                type = "price", 
                price = v7.priceInRobux, 
                strikethrough = true
            }, 
            {
                type = "price", 
                price = if v7.collectibleItemDetails then v7.collectibleItemDetails.lowestResalePrice else 0, 
                colorStyle = v8.Color.System.Warning
            }
        }, 
        [v4.SoldOut] = {
            {
                type = "text", 
                text = v9[v4.SoldOut], 
                colorStyle = v8.Color.System.Warning
            }
        }, 
        [v4.OffSale] = {
            {
                type = "text", 
                text = v9[v4.OffSale], 
                colorStyle = v8.Color.System.Warning
            }
        }, 
        [v4.Unavailable] = {
            {
                type = "text", 
                text = v9[v4.Unavailable], 
                colorStyle = v8.Color.System.Warning
            }
        }
    };
    if v12[v11] then
        v10 = v12[v11];
    end;
    return v10;
end;
local _ = script.Parent.Parent;
return {
    new = function(v1, v2, v3, v4, v5) --[[ Line: 23 ]] --[[ Name: new ]]
        return {
            id = v1, 
            providerId = v2, 
            productName = v3, 
            robuxAmount = v4, 
            price = v5
        };
    end, 
    fromJson = function(v6) --[[ Line: 39 ]] --[[ Name: fromJson ]]
        return {
            id = v6.roblox_product_id, 
            providerId = v6.provider_product_id, 
            productName = v6.roblox_product_name, 
            robuxAmount = v6.robux_amount, 
            robuxAmountBeforeBonus = v6.robux_amount_before_bonus, 
            price = v6.price
        };
    end
};
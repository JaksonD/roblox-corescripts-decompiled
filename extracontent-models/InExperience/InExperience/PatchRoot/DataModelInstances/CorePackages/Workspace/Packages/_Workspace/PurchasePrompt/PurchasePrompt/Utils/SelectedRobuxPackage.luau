local function _(v0) --[[ Line: 3 ]] --[[ Name: getSelectedRobuxPackage ]]
    if not v0.robuxUpsellSuggestions or not v0.robuxUpsellSuggestions.products or not v0.robuxUpsellSuggestions.selection then
        return nil;
    else
        return v0.robuxUpsellSuggestions.products[v0.robuxUpsellSuggestions.selection];
    end;
end;
return {
    getRobuxProductId = function(v2) --[[ Line: 14 ]] --[[ Name: getRobuxProductId ]]
        local v3 = if v2.robuxUpsellSuggestions and v2.robuxUpsellSuggestions.products and v2.robuxUpsellSuggestions.selection then v2.robuxUpsellSuggestions.products[v2.robuxUpsellSuggestions.selection] else nil;
        if not v3 then
            return nil;
        else
            return v3.providerId;
        end;
    end, 
    getProductId = function(v4) --[[ Line: 23 ]] --[[ Name: getProductId ]]
        local v5 = if v4.robuxUpsellSuggestions and v4.robuxUpsellSuggestions.products and v4.robuxUpsellSuggestions.selection then v4.robuxUpsellSuggestions.products[v4.robuxUpsellSuggestions.selection] else nil;
        if not v5 then
            return nil;
        else
            return v5.productId;
        end;
    end, 
    getProductName = function(v6) --[[ Line: 32 ]] --[[ Name: getProductName ]]
        local v7 = if v6.robuxUpsellSuggestions and v6.robuxUpsellSuggestions.products and v6.robuxUpsellSuggestions.selection then v6.robuxUpsellSuggestions.products[v6.robuxUpsellSuggestions.selection] else nil;
        if not v7 then
            return nil;
        else
            return v7.productName;
        end;
    end, 
    getRobuxPurchaseAmount = function(v8) --[[ Line: 41 ]] --[[ Name: getRobuxPurchaseAmount ]]
        local v9 = if v8.robuxUpsellSuggestions and v8.robuxUpsellSuggestions.products and v8.robuxUpsellSuggestions.selection then v8.robuxUpsellSuggestions.products[v8.robuxUpsellSuggestions.selection] else nil;
        if not v9 then
            return nil;
        else
            return v9.robuxAmount;
        end;
    end, 
    getRobuxAmountBeforeBonus = function(v10) --[[ Line: 59 ]] --[[ Name: getRobuxAmountBeforeBonus ]]
        local v11 = if v10.robuxUpsellSuggestions and v10.robuxUpsellSuggestions.products and v10.robuxUpsellSuggestions.selection then v10.robuxUpsellSuggestions.products[v10.robuxUpsellSuggestions.selection] else nil;
        if not v11 then
            return nil;
        else
            return v11.robuxAmountBeforeBonus;
        end;
    end, 
    getPrice = function(v12) --[[ Line: 50 ]] --[[ Name: getPrice ]]
        local v13 = if v12.robuxUpsellSuggestions and v12.robuxUpsellSuggestions.products and v12.robuxUpsellSuggestions.selection then v12.robuxUpsellSuggestions.products[v12.robuxUpsellSuggestions.selection] else nil;
        if not v13 then
            return nil;
        else
            return v13.price;
        end;
    end
};
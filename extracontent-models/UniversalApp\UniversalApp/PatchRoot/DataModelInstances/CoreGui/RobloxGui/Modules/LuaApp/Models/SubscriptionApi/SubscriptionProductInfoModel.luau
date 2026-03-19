local v0 = {
    new = function() --[[ Line: 17 ]] --[[ Name: new ]]
        return {
            name = "", 
            description = "", 
            iconImageAssetId = 0, 
            subscriptionPeriod = "", 
            priceTier = 0, 
            displayPrice = "", 
            subscriptionProviderName = "", 
            subscriptionProviderId = "", 
            isForSale = false, 
            subscriptionTargetKey = "", 
            priceInRobux = nil
        };
    end
};
v0.mock = function(v1, v2) --[[ Line: 35 ]] --[[ Name: mock ]]
    -- upvalues: v0 (copy)
    local v3 = v0.new();
    v3.name = v2;
    v3.description = "This is MeepCity";
    v3.iconImageAssetId = 123456;
    v3.subscriptionPeriod = "Month";
    v3.priceTier = 299;
    v3.displayPrice = "$2.99";
    v3.subscriptionProviderName = "RobloxTest";
    v3.subscriptionProviderId = v1;
    v3.isForSale = true;
    v3.subscriptionTargetKey = "EXP-123456";
    return v3;
end;
v0.fromJsonData = function(v4) --[[ Line: 51 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v0 (copy)
    local v5 = v0.new();
    v5.name = v4.name;
    v5.description = v4.description;
    v5.iconImageAssetId = v4.iconImageAssetId;
    v5.subscriptionPeriod = v4.subscriptionPeriod;
    v5.priceTier = v4.priceTier;
    v5.displayPrice = v4.displayPrice;
    v5.subscriptionProviderName = v4.subscriptionProviderName;
    v5.subscriptionProviderId = v4.subscriptionProviderId;
    v5.isForSale = v4.isForSale;
    v5.subscriptionTargetKey = v4.subscriptionTargetKey;
    v5.priceInRobux = v4.priceInRobux;
    return v5;
end;
return v0;
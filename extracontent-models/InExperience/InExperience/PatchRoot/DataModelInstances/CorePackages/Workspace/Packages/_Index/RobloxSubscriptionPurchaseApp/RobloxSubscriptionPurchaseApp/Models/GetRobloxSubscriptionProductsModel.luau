local function v4(v0) --[[ Line: 51 ]] --[[ Name: parseEligibleOffers ]]
    assert(type(v0) == "table", "Expected EligibleOffers to be a table");
    local v1 = {};
    for _, v3 in ipairs(v0) do
        assert(type(v3) == "table", "Expected each EligibleOffer to be a table");
        table.insert(v1, {
            Duration = tonumber(v3.Duration) or 0, 
            OfferType = tostring(v3.OfferType or ""), 
            PeriodType = tostring(v3.PeriodType or "")
        });
    end;
    return v1;
end;
local function v9(v5) --[[ Line: 65 ]] --[[ Name: parseRobloxSubscriptionDiscounts ]]
    if type(v5) ~= "table" then
        return nil;
    else
        local v6 = {};
        for _, v8 in ipairs(v5) do
            if type(v8) == "table" then
                table.insert(v6, {
                    DiscountPercent = tonumber(v8.DiscountPercent) or 0, 
                    PeriodIndex = tonumber(v8.PeriodIndex) or 0, 
                    TierId = tostring(v8.TierId or "")
                });
            end;
        end;
        return v6;
    end;
end;
local function v11(v10) --[[ Line: 82 ]] --[[ Name: parseFeatureConfig ]]
    -- upvalues: v9 (copy)
    assert(type(v10) == "table", "Expected FeatureConfig to be a table");
    return {
        IsRobuxTransferEnabled = v10.IsRobuxTransferEnabled == true, 
        IsTradingEnabled = v10.IsTradingEnabled == true, 
        IsUgcPublishingEnabled = v10.IsUgcPublishingEnabled == true, 
        VirtualTransactionDiscounts = v9(v10.VirtualTransactionDiscounts), 
        PrivateServerDiscounts = v9(v10.PrivateServerDiscounts)
    };
end;
local function _(v12) --[[ Line: 94 ]] --[[ Name: parseRobloxSubscriptionProductDetails ]]
    -- upvalues: v11 (copy)
    assert(type(v12) == "table", "Expected RobloxSubscriptionProductDetails to be a table");
    return {
        FeatureConfig = v11(v12.FeatureConfig)
    };
end;
local function _(v14) --[[ Line: 101 ]] --[[ Name: parseProductTypeDetails ]]
    -- upvalues: v11 (copy)
    assert(type(v14) == "table", "Expected ProductTypeDetails to be a table");
    local v15 = {};
    local l_RobloxSubscriptionProductDetails_0 = v14.RobloxSubscriptionProductDetails;
    assert(type(l_RobloxSubscriptionProductDetails_0) == "table", "Expected RobloxSubscriptionProductDetails to be a table");
    v15.RobloxSubscriptionProductDetails = {
        FeatureConfig = v11(l_RobloxSubscriptionProductDetails_0.FeatureConfig)
    };
    return v15;
end;
local function v19(v18) --[[ Line: 108 ]] --[[ Name: parseLocalizedPrice ]]
    assert(type(v18) == "table", "Expected LocalizedPrice to be a table");
    return {
        CurrencyCode = tostring(v18.CurrencyCode or ""), 
        Nanos = tonumber(v18.Nanos) or 0, 
        Units = tonumber(v18.Units) or 0
    };
end;
local function v21(v20) --[[ Line: 117 ]] --[[ Name: parseProductKey ]]
    if type(v20) ~= "table" then
        return {
            Id = "", 
            Type = ""
        };
    else
        return {
            Id = tostring(v20.Id or ""), 
            Type = tostring(v20.Type or "")
        };
    end;
end;
local v23 = {
    new = function(v22) --[[ Line: 129 ]] --[[ Name: new ]]
        return v22;
    end
};
v23.format = function(v24) --[[ Line: 134 ]] --[[ Name: format ]]
    -- upvalues: v4 (copy), v19 (copy), v21 (copy), v11 (copy), v23 (copy)
    assert(type(v24) == "table", "Expected products response to be a table");
    local v25 = {};
    for _, v27 in ipairs(v24) do
        if type(v27) == "table" then
            local v28 = false;
            if type(v27.PeriodType) == "string" then
                v28 = v27.PeriodType ~= "";
            end;
            assert(v28, "Missing or invalid PeriodType");
            local v29 = {
                EligibleOffers = v4(v27.EligibleOffers), 
                LocalizedPrice = v19(v27.LocalizedPrice), 
                LocalizedPriceDisplayString = type(v27.LocalizedPriceDisplayString) == "string" and v27.LocalizedPriceDisplayString or nil, 
                PeriodType = tostring(v27.PeriodType), 
                ProductKey = v21(v27.ProductKey)
            };
            local l_ProductTypeDetails_0 = v27.ProductTypeDetails;
            assert(type(l_ProductTypeDetails_0) == "table", "Expected ProductTypeDetails to be a table");
            v28 = {};
            local l_RobloxSubscriptionProductDetails_1 = l_ProductTypeDetails_0.RobloxSubscriptionProductDetails;
            assert(type(l_RobloxSubscriptionProductDetails_1) == "table", "Expected RobloxSubscriptionProductDetails to be a table");
            v28.RobloxSubscriptionProductDetails = {
                FeatureConfig = v11(l_RobloxSubscriptionProductDetails_1.FeatureConfig)
            };
            v29.ProductTypeDetails = v28;
            table.insert(v25, v23.new(v29));
        else
            error("Expected each product to be a table");
        end;
    end;
    return v25;
end;
v23.mock = function(v32) --[[ Line: 158 ]] --[[ Name: mock ]]
    -- upvalues: v23 (copy)
    local v33 = {
        EligibleOffers = {
            {
                Duration = 1, 
                OfferType = "FreeTrial", 
                PeriodType = "Month"
            }
        }, 
        LocalizedPrice = {
            CurrencyCode = "USD", 
            Nanos = 990000000, 
            Units = 12
        }, 
        LocalizedPriceDisplayString = "$12.99", 
        PeriodType = "Month", 
        ProductKey = {
            Id = "8429606799668938154", 
            Type = "Blackbird"
        }, 
        ProductTypeDetails = {
            RobloxSubscriptionProductDetails = {
                FeatureConfig = {
                    IsRobuxTransferEnabled = true, 
                    IsTradingEnabled = true, 
                    IsUgcPublishingEnabled = true, 
                    VirtualTransactionDiscounts = {
                        {
                            DiscountPercent = 1, 
                            PeriodIndex = 0, 
                            TierId = "percent_1"
                        }, 
                        {
                            DiscountPercent = 50, 
                            PeriodIndex = 2, 
                            TierId = "percent_50"
                        }
                    }, 
                    PrivateServerDiscounts = {
                        {
                            DiscountPercent = 100, 
                            PeriodIndex = 0, 
                            TierId = "free"
                        }
                    }
                }
            }
        }
    };
    if type(v32) == "table" then
        for v34, v35 in pairs(v32) do
            v33[v34] = v35;
        end;
    end;
    return v23.new(v33);
end;
return v23;
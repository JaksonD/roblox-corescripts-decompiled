local l_Parent_0 = script:FindFirstAncestor("GameProductInfoRodux").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = {
    new = function() --[[ Line: 18 ]] --[[ Name: new ]]
        return {};
    end
};
v2.mock = function(v3) --[[ Line: 23 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v4 = v2.new();
    v4.universeId = v3;
    v4.isForSale = true;
    v4.productId = 12345;
    v4.price = 5;
    v4.sellerId = 6789;
    return v4;
end;
v2.fromJsonData = function(v5) --[[ Line: 33 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v1 (copy), v2 (copy)
    if type(v5.universeId) ~= "number" or type(v5.isForSale) ~= "boolean" or type(v5.productId) ~= "number" or type(v5.price) ~= "number" or type(v5.sellerId) ~= "number" then
        return v1.error("invalid data type");
    else
        local v6 = v2.new();
        v6.universeId = tostring(v5.universeId);
        v6.isForSale = v5.isForSale;
        v6.productId = v5.productId;
        v6.price = v5.price;
        v6.sellerId = v5.sellerId;
        if v5.fiatPurchaseData then
            v6.localizedFiatPrice = v5.fiatPurchaseData.localizedFiatPrice;
            v6.fiatBasePriceId = v5.fiatPurchaseData.basePriceId;
        end;
        return v1.success(v6);
    end;
end;
return v2;
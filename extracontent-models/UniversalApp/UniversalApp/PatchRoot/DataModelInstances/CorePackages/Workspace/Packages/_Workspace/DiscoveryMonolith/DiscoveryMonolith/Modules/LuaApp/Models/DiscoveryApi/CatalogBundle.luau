local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = {
    new = function() --[[ Line: 26 ]] --[[ Name: new ]]
        return {};
    end
};
v2.mock = function() --[[ Line: 32 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v3 = v2.new();
    v3.creatorId = 1;
    v3.creatorName = "Roblox";
    v3.creatorType = "User";
    v3.itemRestrictions = {};
    v3.itemStatus = {};
    v3.lowestPrice = 1;
    v3.name = "Serena";
    v3.noPriceStatus = "Free";
    v3.numberRemaining = 10;
    v3.premiumPricing = {
        premiumPriceInRobux = 0
    };
    v3.priceInRobux = 0;
    return v3;
end;
v2.fromJsonData = function(v4) --[[ Line: 52 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v5 = v2.new();
    v5.creatorId = v4.creatorId;
    v5.creatorName = v4.creatorName;
    v5.creatorType = v4.creatorType;
    v5.itemRestrictions = v4.itemRestrictions;
    v5.itemStatus = v4.itemStatus;
    v5.lowestPrice = v4.lowestPrice;
    v5.name = v4.name;
    v5.noPriceStatus = v4.noPriceStatus;
    v5.numberRemaining = v4.numberRemaining;
    v5.premiumPricing = v4.premiumPrice and {
        premiumPriceInRobux = v4.premiumPrice
    } or nil;
    v5.priceInRobux = v4.price;
    return v1.success(v5);
end;
return v2;
local l_Parent_0 = script:FindFirstAncestor("RoduxGames").Parent;
local v1 = require(l_Parent_0.t);
local v2 = {};
v2.new = function(v3) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    assert(v2.isValid(v3));
    v2.__index = v2;
    setmetatable(v3, v2);
    return v3;
end;
v2.mock = function(v4) --[[ Line: 25 ]] --[[ Name: mock ]]
    -- upvalues: v2 (copy)
    local v5 = v4 or {};
    return (v2.new({
        productId = v5.productId or "productId", 
        sellerId = v5.sellerId or "sellerId", 
        price = v5.price or 666, 
        isForSale = v5.isForSale or true
    }));
end;
v2.format = function(v6) --[[ Line: 38 ]] --[[ Name: format ]]
    -- upvalues: v2 (copy)
    return (v2.new({
        productId = tostring(v6.productId), 
        sellerId = tostring(v6.sellerId), 
        isForSale = v6.isForSale or false, 
        price = v6.price or 0
    }));
end;
v2.isValid = v1.strictInterface({
    productId = v1.string, 
    sellerId = v1.string, 
    price = v1.number, 
    isForSale = v1.boolean
});
return v2;
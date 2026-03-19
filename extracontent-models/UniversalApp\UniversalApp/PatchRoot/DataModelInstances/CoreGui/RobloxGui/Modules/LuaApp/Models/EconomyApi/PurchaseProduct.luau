local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
local v2 = {
    new = function() --[[ Line: 12 ]] --[[ Name: new ]]
        return {};
    end
};
v2.fromJsonData = function(v3) --[[ Line: 16 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.new();
    v1.isType(v3, "table", "PurchaseProduct.fromJsonData's jsonData");
    v1.isType(v3.purchased, "boolean", "PurchaseProduct.fromJsonData's jsonData.purchased");
    v1.isType(v3.productId, "number", "PurchaseProduct.fromJsonData's jsonData.productId");
    v1.isTypeOrNil(v3.title, "string", "PurchaseProduct.fromJsonData's jsonData.title");
    v1.isTypeOrNil(v3.showDivId, "string", "PurchaseProduct.fromJsonData's jsonData.showDivId");
    v1.isTypeOrNil(v3.shortfallPrice, "number", "PurchaseProduct.fromJsonData's jsonData.shortfallPrice");
    v1.isTypeOrNil(v3.statusCode, "number", "PurchaseProduct.fromJsonData's jsonData.statusCode");
    if type(v3) == "table" then
        v4.purchased = v3.purchased == true;
        v4.productId = tonumber(v3.productId);
        v4.title = v3.title;
        v4.showDivId = v3.showDivId;
        v4.shortfallPrice = v3.shortfallPrice;
        v4.statusCode = v3.statusCode;
    end;
    return v4;
end;
return v2;
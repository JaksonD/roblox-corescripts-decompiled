local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.ArgCheck);
local v2 = {
    new = function() --[[ Line: 15 ]] --[[ Name: new ]]
        return {
            price = 0, 
            productId = 0, 
            purchased = false, 
            receipt = "", 
            success = false, 
            transactionStatus = ""
        };
    end
};
v2.fromJsonData = function(v3) --[[ Line: 26 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = v2.new();
    v1.isType(v3, "table", "PurchaseDeveloperProductModel.fromJsonData's jsonData");
    v1.isType(v3.price, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.price");
    v1.isType(v3.productId, "number", "PurchaseDeveloperProductModel.fromJsonData's jsonData.productId");
    v1.isType(v3.purchased, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.purchased");
    v1.isTypeOrNil(v3.receipt, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.receipt");
    v1.isTypeOrNil(v3.success, "boolean", "PurchaseDeveloperProductModel.fromJsonData's jsonData.success");
    v1.isTypeOrNil(v3.transactionStatus, "string", "PurchaseDeveloperProductModel.fromJsonData's jsonData.transactionStatus");
    if type(v3) == "table" then
        v4.price = v3.price;
        v4.productId = v3.productId;
        v4.purchased = v3.purchased == true;
        v4.receipt = v3.receipt;
        v4.success = v3.success == true;
        v4.transactionStatus = v3.transactionStatus;
    end;
    return v4;
end;
return v2;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
return {
    [v1.NotEnoughRobux] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotEnoughRobux", 
    [v1.PurchaseDisabled] = "CoreScripts.PurchasePrompt.PurchaseFailed.PurchaseDisabled", 
    [v1.UnknownFailure] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
    [v1.NotForSale] = "CoreScripts.PurchasePrompt.PurchaseFailed.NotForSale", 
    [v1.Under13] = "CoreScripts.PurchasePrompt.PurchaseFailed.Under13", 
    [v1.AlreadyOwn] = "CoreScripts.PurchasePrompt.PurchaseFailed.AlreadyOwn", 
    [v1.TooManyPurchases] = "Feature.Toast.NetworkingError.TooManyRequests", 
    [v1.InvalidRequest] = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName", 
    [v1.Unauthorized] = "Feature.Toast.NetworkingError.Unauthorized"
};
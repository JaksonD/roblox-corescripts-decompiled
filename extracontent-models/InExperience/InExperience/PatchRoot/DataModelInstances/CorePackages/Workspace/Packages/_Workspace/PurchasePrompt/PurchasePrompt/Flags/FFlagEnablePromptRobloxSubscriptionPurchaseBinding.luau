local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local l_FFlagBlackbirdUpsellVersion_0 = require(l_Parent_0.SharedFlags).FFlagBlackbirdUpsellVersion;
return game:DefineFastFlag("EnablePromptRobloxSubscriptionPurchaseBinding", false) and l_FFlagBlackbirdUpsellVersion_0 and game:GetEngineFeature("EnablePromptRobloxSubscriptionPurchase");
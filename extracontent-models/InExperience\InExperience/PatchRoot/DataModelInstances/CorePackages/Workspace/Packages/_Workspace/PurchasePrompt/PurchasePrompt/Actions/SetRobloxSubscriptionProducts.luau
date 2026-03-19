local l_Parent_0 = script:FindFirstAncestor("PurchasePrompt").Parent;
local _ = require(l_Parent_0.RobloxSubscriptionPurchaseApp);
return require(script.Parent.makeActionCreator)(script.Name, "robloxSubscriptionProducts");
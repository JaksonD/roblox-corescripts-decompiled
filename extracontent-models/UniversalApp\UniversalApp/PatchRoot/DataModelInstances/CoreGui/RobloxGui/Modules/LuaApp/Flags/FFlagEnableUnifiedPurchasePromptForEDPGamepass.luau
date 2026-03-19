local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v2 = game:DefineFastFlag("EnableUnifiedPurchasePromptForEDPGamepass", false);
return l_FFlagEnableUnifiedProductPurchaseFlow_0 and v2;
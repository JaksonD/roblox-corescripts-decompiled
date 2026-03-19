local v0 = require(script.Parent.FFlagAXRootRFYMigration);
local v1 = require(script.Parent.FFlagAXUnifiedMarketplaceResultsFetcher);
local v2 = require(script.Parent.FFlagAXResetFetchMarketplaceLogic);
return v0 and v1 and v2 and game:DefineFastFlag("AXPassScreenSizeToWidgetApi5", false);
local v0 = require(script.Parent.FFlagAXEnableModeratedItemsFlowForDurables);
local v1 = require(script.Parent.FFlagAXInventoryDurablesSupport);
return game:DefineFastFlag("AXEnableExpiredUserLookCheckout", false) and v0 and v1;
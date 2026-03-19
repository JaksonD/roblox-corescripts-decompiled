local v0 = require(script.Parent.FFlagAXDurablesSupport);
local v1 = require(script.Parent.FFlagAXRootSlotBasedEditorFlag);
local v2 = require(script.Parent.FFlagAXModeratedItemsFlow);
local v3 = require(script.Parent.FFlagAXEnableModeratedItemsFlowForDurables);
local v4 = require(script.Parent.FFlagAXEditorSubcategoryFilters);
local v5 = game:DefineFastFlag("AXInventoryDurablesSupport5", false) and v0 and v1 and (v3 or v2) and v4;
local v6 = game:DefineFastFlag("AXStandaloneInventoryDurablesSupport", false) and v1 and (v3 or v2) and v4;
return v5 or v6;
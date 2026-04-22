local v0 = require(script.Parent.FFlagAXRootSlotBasedEditorFlag);
local v1 = require(script.Parent.FFlagAXModeratedItemsFlow);
local v2 = require(script.Parent.FFlagAXEnableModeratedItemsFlowForDurables);
local v3 = require(script.Parent.FFlagAXEditorSubcategoryFilters);
local v4 = game:DefineFastFlag("AXInventoryDurablesSupport5", false) and v0 and (v2 or v1) and v3;
local v5 = game:DefineFastFlag("AXStandaloneInventoryDurablesSupport", false) and v0 and (v2 or v1) and v3;
return v4 or v5;
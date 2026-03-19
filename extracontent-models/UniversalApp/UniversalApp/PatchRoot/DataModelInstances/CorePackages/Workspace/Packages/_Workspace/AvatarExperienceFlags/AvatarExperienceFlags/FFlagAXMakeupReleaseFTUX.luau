local v0 = require(script.Parent.FFlagAXCustomizeMakeupSupport);
local v1 = require(script.Parent.FFlagAXCatalogMakeupSupport);
local v2 = require(script.Parent.FFlagAXMakeupEquipping);
local v3 = require(script.Parent.FFlagAXCatalogCategoriesStore);
return game:DefineFastFlag("AXMakeupReleaseFTUX", false) and v0 and v1 and v2 and v3;
local v0 = require(script.Parent.FFlagAXRemoveCatalogCategoryNavKey);
local v1 = require(script.Parent.FFlagAXCatalogCategoriesStore);
local v2 = require(script.Parent.FFlagAXCatalogSupportDisableFilters);
local v3 = require(script.Parent.FFlagAXMigrateCategoryTooltip);
local v4 = require(script.Parent.FFlagAXFixHydratedWidgetsParams);
local v5 = require(script.Parent.FFlagAXSubNavigationRefsById);
local v6 = require(script.Parent.FFlagAXUnifiedMarketplaceResultsFetcher);
local v7 = require(script.Parent.FFlagAXScrollingListAutomaticCanvasSize);
return v0 and v1 and v2 and v3 and v4 and v5 and v6 and v7 and game:DefineFastFlag("AXCatalogCategoriesSDUI14", false);
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createAXMarketplaceWidgetStore);
return v1.createComputed(v2);
local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.createLocalizationServiceStore);
return v1.createComputed(v2);
local l_Parent_0 = script:FindFirstAncestor("CollectionViews").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.createMainCollectionLayoutStore);
return v1.createComputed(v2);
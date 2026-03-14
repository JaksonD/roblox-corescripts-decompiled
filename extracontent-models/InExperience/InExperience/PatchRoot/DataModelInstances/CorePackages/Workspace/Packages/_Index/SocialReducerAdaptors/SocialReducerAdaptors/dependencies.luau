local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuaSocialLibrariesDeps);
return {
    Players = game:GetService("Players"), 
    llama = v1.llama, 
    Rodux = require(l_Parent_0.Rodux)
};
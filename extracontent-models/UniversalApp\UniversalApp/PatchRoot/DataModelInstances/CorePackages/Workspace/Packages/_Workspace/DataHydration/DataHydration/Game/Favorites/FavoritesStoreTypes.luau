local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local _ = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.t);
return {
    favoriteResponseValidator = v4.interface({
        isFavorited = v4.optional(v4.boolean)
    })
};
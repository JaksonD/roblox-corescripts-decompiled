local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local l_Assets_0 = require(l_Parent_0.FoundationCloudAssets).Assets;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_Assets_0 (copy)
    return l_Assets_0[v2] ~= nil;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_t_0 = require(l_script_FirstAncestor_0.dependencies).t;
local v2 = l_t_0.interface({
    width = l_t_0.number, 
    itemSize = l_t_0.number, 
    minimumItemsPerRow = l_t_0.optional(l_t_0.number)
});
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v2 (copy)
    assert(v2(v3));
    return (math.max(math.floor(v3.width / v3.itemSize), v3.minimumItemsPerRow or 2));
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_llama_0 = v1.llama;
local v4 = require(script.Parent.friendsPerLoadGroup);
local v5 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    filter = l_t_0.string
});
local v6 = l_t_0.interface({
    width = l_t_0.number, 
    filterFriendCounts = l_t_0.table
});
return function(v7, v8) --[[ Line: 19 ]]
    -- upvalues: v6 (copy), v5 (copy), v4 (copy), l_llama_0 (copy)
    assert(v6(v7));
    assert(v5(v8));
    local v9 = v4(v7, v8);
    local v10 = v7.filterFriendCounts[v8.filter] + v9;
    return {
        filterFriendCounts = l_llama_0.Dictionary.join(v7.filterFriendCounts, {
            [v8.filter] = v10
        })
    };
end;
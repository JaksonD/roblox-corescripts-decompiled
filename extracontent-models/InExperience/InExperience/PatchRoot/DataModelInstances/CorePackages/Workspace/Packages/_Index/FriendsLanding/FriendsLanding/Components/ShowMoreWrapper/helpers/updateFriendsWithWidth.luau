local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_t_0 = v1.t;
local l_Dictionary_0 = v1.llama.Dictionary;
local v4 = require(script.Parent.friendsPerLoadGroup);
local v5 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    filter = l_t_0.string
});
local v6 = l_t_0.interface({
    filterFriendCounts = l_t_0.table
});
return function(v7) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), l_Dictionary_0 (copy)
    return function(v8, v9) --[[ Line: 21 ]]
        -- upvalues: v5 (ref), v6 (ref), v4 (ref), v7 (copy), l_Dictionary_0 (ref)
        assert(v5(v9));
        assert(v6(v8));
        local v10 = v4({
            width = v7
        }, v9);
        return {
            width = v7, 
            filterFriendCounts = l_Dictionary_0.join(v8.filterFriendCounts, l_Dictionary_0.map(v8.filterFriendCounts, function(v11) --[[ Line: 31 ]]
                -- upvalues: v10 (copy)
                return (math.max(v10, v11));
            end))
        };
    end;
end;
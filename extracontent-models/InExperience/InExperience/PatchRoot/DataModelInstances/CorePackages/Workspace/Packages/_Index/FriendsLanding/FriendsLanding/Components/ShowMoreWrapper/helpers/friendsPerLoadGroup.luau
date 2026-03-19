local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
local v4 = require(script.Parent.friendsPerRow);
local v5 = l_t_0.interface({
    width = l_t_0.number
});
local v6 = l_t_0.interface({
    visibleRows = l_t_0.number, 
    itemSize = l_t_0.number, 
    minimumItemsPerRow = l_t_0.optional(l_t_0.number)
});
return function(v7, v8) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), l_llama_0 (copy)
    assert(v5(v7));
    assert(v6(v8));
    return v8.visibleRows * v4(l_llama_0.Dictionary.join({
        width = v7.width
    }, v8));
end;
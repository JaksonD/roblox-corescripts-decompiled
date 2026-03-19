local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_llama_0 = v1.llama;
local l_t_0 = v1.t;
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_t_0 (copy), l_llama_0 (copy)
    assert(l_t_0.table(v5));
    assert(l_t_0.number(v4));
    return l_llama_0.List.filter(v5, function(_, v7) --[[ Line: 10 ]]
        -- upvalues: v4 (copy)
        return v7 <= v4;
    end);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
return function(...) --[[ Line: 5 ]]
    -- upvalues: l_llama_0 (copy)
    local v2 = {
        ...
    };
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: l_llama_0 (ref), v2 (copy)
        return l_llama_0.List.reduceRight(v2, function(v4, v5) --[[ Line: 8 ]]
            return v5(v4);
        end, v3);
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialReducerAdaptors");
local l_llama_0 = require(l_script_FirstAncestor_0.dependencies).llama;
return function(v2, v3, v4) --[[ Line: 14 ]]
    -- upvalues: l_llama_0 (copy)
    return function(v5, v6) --[[ Line: 15 ]]
        -- upvalues: v4 (copy), v3 (copy), l_llama_0 (ref), v2 (copy)
        v5 = v5 or v4;
        local v7 = {
            v6
        };
        local v8 = v3[v6.type];
        if v8 then
            v7 = v8(v6);
        end;
        return l_llama_0.List.reduce(v7, v2, v5);
    end;
end;
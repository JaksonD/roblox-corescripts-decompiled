local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_llama_0 (copy)
    if #v2.existing ~= #v2.new then
        return false;
    else
        local v3 = l_llama_0.List.sort(v2.existing);
        local v4 = l_llama_0.List.sort(v2.new);
        return l_llama_0.List.equals(v3, v4);
    end;
end;
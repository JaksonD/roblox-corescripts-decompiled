local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_tutils_0 = v1.tutils;
local l_llama_0 = v1.llama;
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_llama_0 (copy), l_tutils_0 (copy)
    if l_llama_0.isEmpty(v4) then
        return "{}";
    else
        local v5, _ = string.gsub(" args: " .. l_tutils_0.toString(v4), "%s+", " ");
        return v5;
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_llama_0 = v1.llama;
local v4 = l_RoduxContacts_0.installReducer();
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_llama_0 (copy), v4 (copy)
    return l_llama_0.List.reduce({
        v6
    }, v4, v5);
end;
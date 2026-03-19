local l_script_FirstAncestor_0 = script:FindFirstAncestor("Autocomplete");
local v1 = require(l_script_FirstAncestor_0.Trie.Trie);
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v4 = {};
    setmetatable(v4, v2);
    v4.trie = v1.new();
    v4.trie = v3(v4);
    return v4;
end;
v2.getResults = function(v5, v6, v7) --[[ Line: 22 ]] --[[ Name: getResults ]]
    local v8 = v5.trie:autocomplete(v6);
    if v7 then
        return v7(v8);
    else
        return v8;
    end;
end;
return v2;
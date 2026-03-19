local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v3 = require(l_Parent_0.EmojiList);
local v4 = l_Dictionary_0.keys(v3);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: l_List_0 (copy), v4 (copy)
    l_List_0.map(v4, function(v6) --[[ Line: 10 ]]
        -- upvalues: v5 (copy)
        v5.trie:insert(v6);
    end);
    return v5.trie;
end;
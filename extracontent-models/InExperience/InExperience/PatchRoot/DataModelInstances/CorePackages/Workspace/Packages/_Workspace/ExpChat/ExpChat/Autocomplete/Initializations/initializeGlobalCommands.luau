local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.ExpChatShared);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    for _, v4 in v1.GlobalCommands.getGlobalEnabledCommands() do
        for _, v6 in v4.alias do
            v2.trie:insert(v6);
        end;
    end;
    return v2.trie;
end;
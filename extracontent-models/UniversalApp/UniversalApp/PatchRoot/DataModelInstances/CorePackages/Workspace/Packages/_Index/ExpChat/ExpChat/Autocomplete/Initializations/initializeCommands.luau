local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_List_0 = require(l_Parent_0.llama).List;
local v4 = require(script.Parent.initialCommands);
local v5 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatConnectInitCommands);
local v6 = {};
local function v11() --[[ Line: 11 ]] --[[ Name: getCommandKeys ]]
    -- upvalues: l_TextChatService_0 (copy), v5 (copy), v6 (copy)
    local v7 = {};
    local l_l_TextChatService_0_Descendants_0 = l_TextChatService_0:GetDescendants();
    for _, v10 in ipairs(l_l_TextChatService_0_Descendants_0) do
        if v10.ClassName == "TextChatCommand" and string.sub(v10.PrimaryAlias, 1, 1) == "/" then
            if v10.AutocompleteVisible then
                table.insert(v7, v10.PrimaryAlias);
            end;
            if v5() then
                table.insert(v6, v10);
            end;
        end;
    end;
    return v7;
end;
return function(v12) --[[ Line: 29 ]]
    -- upvalues: v11 (copy), l_List_0 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v13 = v11();
    l_List_0.map(v13, function(v14) --[[ Line: 31 ]]
        -- upvalues: v12 (copy)
        v12.trie:insert(v14);
    end);
    if v5() then
        v4(v6);
    end;
    return v12.trie;
end;
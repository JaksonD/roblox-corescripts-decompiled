local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
local l_List_0 = require(l_Parent_0.llama).List;
return function(v2) --[[ Line: 5 ]] --[[ Name: getNumberOfParticipants ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.count(v2:GetChildren(), function(v3) --[[ Line: 6 ]]
        return v3:IsA("TextSource");
    end);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.Conversations.Selectors.selectUsersTyping);
return function(v4) --[[ Line: 7 ]]
    -- upvalues: l_useSelector_0 (copy), v3 (copy)
    return l_useSelector_0(function(v5) --[[ Line: 8 ]]
        -- upvalues: v3 (ref), v4 (copy)
        return v3(v5, v4);
    end);
end;
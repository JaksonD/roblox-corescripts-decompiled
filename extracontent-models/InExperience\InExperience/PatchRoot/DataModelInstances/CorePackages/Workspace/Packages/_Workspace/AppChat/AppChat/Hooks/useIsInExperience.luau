local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext);
local l_useChatPlacementContext_0 = v1.useChatPlacementContext;
local l_isPlacementInExperience_0 = v1.isPlacementInExperience;
return function() --[[ Line: 7 ]]
    -- upvalues: l_useChatPlacementContext_0 (copy), l_isPlacementInExperience_0 (copy)
    local l_chatPlacement_0 = l_useChatPlacementContext_0().chatPlacement;
    return l_isPlacementInExperience_0(l_chatPlacement_0);
end;
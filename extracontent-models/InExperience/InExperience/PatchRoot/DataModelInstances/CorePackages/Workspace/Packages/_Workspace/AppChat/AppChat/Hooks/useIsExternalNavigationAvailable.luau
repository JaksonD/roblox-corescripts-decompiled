local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Utils.isPageAvailable);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
return function(v3) --[[ Line: 16 ]]
    -- upvalues: l_useChatPlacementContext_0 (copy), v1 (copy)
    local l_chatPlacement_0 = l_useChatPlacementContext_0().chatPlacement;
    local v5 = {};
    for _, v7 in v3 do
        v5[v7] = v1(v7, l_chatPlacement_0);
    end;
    return v5;
end;
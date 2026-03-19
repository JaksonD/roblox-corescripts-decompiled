local l_Parent_0 = script:FindFirstAncestor("AppShortcutBar").Parent;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function() --[[ Line: 5 ]] --[[ Name: useAppShortcutBarHeight ]]
    -- upvalues: l_useTokens_0 (copy)
    return l_useTokens_0().Size.Size_1200;
end;
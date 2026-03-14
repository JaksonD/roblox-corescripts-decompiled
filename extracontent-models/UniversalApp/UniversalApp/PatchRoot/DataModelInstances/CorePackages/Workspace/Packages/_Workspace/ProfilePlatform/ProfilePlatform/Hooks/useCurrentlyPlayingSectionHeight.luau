local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
return function(v2) --[[ Line: 6 ]]
    -- upvalues: l_useTokens_0 (copy)
    local v3 = l_useTokens_0();
    if v2 == nil or v2.universeId == nil then
        return 0;
    else
        return v3.Size.Size_1000 + 2 * v3.Padding.Large;
    end;
end;
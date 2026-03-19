local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_useAbbreviatedNumberLocalization_0 = require(l_Parent_0.Localization).Hooks.useAbbreviatedNumberLocalization;
return function(v2) --[[ Line: 5 ]] --[[ Name: usePlayerCountText ]]
    -- upvalues: l_useAbbreviatedNumberLocalization_0 (copy)
    local v3 = l_useAbbreviatedNumberLocalization_0(v2);
    if v3 == nil or v2 == -1 then
        return "--";
    else
        return v3;
    end;
end;
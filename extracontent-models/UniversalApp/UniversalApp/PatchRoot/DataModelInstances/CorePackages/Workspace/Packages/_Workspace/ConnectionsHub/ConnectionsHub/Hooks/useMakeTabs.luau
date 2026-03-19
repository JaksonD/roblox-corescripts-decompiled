local l_Parent_0 = script:FindFirstAncestor("ConnectionsHub").Parent;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v2) --[[ Line: 6 ]] --[[ Name: useMakeTabs ]]
    -- upvalues: l_useLocalization_0 (copy)
    local v3 = {};
    for _, v5 in v2 do
        v3[v5.id] = v5.textKey;
    end;
    local v6 = l_useLocalization_0(v3);
    local v7 = {};
    for _, v9 in v2 do
        table.insert(v7, {
            id = v9.id, 
            text = v6[v9.id]
        });
    end;
    return v7;
end;
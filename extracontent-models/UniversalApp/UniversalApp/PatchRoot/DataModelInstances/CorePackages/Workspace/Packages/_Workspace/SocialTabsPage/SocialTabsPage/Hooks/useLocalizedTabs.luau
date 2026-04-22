local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTabsPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(l_script_FirstAncestor_0.Common.Types);
return function(v6) --[[ Line: 11 ]] --[[ Name: useLocalizedTabs ]]
    -- upvalues: v3 (copy), l_useLocalization_0 (copy), v2 (copy)
    local v10 = v3.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v6 (copy)
        local v7 = {};
        for _, v9 in v6 do
            v7[v9.id] = v9.tabLabelKey;
        end;
        return v7;
    end, {
        v6
    });
    local v11 = l_useLocalization_0(v10);
    return v3.useMemo(function() --[[ Line: 22 ]]
        -- upvalues: v2 (ref), v6 (copy), v11 (copy)
        return v2.List.map(v6, function(v12) --[[ Line: 23 ]]
            -- upvalues: v11 (ref)
            return {
                id = v12.id, 
                text = v11[v12.id]
            };
        end);
    end, {
        v6, 
        v11
    });
end;
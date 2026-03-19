local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameFilters");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_script_FirstAncestor_0.DataStore.GameFiltersReducer);
return function(v5) --[[ Line: 9 ]] --[[ Name: useGameFiltersSelector ]]
    -- upvalues: l_useSelector_0 (copy), v4 (copy)
    return (l_useSelector_0(function(v6) --[[ Line: 10 ]]
        -- upvalues: v4 (ref), v5 (copy)
        return v6.Personalization[v4.key][v5];
    end));
end;
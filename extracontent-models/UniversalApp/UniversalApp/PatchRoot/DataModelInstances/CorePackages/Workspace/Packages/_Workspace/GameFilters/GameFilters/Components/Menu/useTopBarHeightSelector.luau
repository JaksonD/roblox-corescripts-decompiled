local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function() --[[ Line: 7 ]] --[[ Name: useTopBarHeightSelector ]]
    -- upvalues: l_useSelector_0 (copy)
    return l_useSelector_0(function(v2) --[[ Line: 8 ]]
        return v2.TopBar.topBarHeight;
    end);
end;
local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
return function(v2) --[[ Line: 6 ]] --[[ Name: getSelectedGameFilterOptions ]]
    local v3 = {};
    for _, v5 in v2 do
        if v5.selectedOptionId ~= v5.defaultOptionId then
            v3[v5.filterType] = v5.selectedOptionId;
        end;
    end;
    return v3;
end;
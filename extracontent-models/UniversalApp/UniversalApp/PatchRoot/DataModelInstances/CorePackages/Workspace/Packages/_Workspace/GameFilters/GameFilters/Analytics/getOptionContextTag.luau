local l_Parent_0 = script:FindFirstAncestor("GameFilters").Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
return function(v2, v3) --[[ Line: 6 ]]
    if v3 == nil then
        return nil;
    else
        for _, v5 in v2.filterOptions do
            if v5.optionId == v3 then
                if not v5.optionContextTag or v5.optionContextTag == "" then
                    return nil;
                else
                    return v5.optionContextTag;
                end;
            end;
        end;
        return nil;
    end;
end;
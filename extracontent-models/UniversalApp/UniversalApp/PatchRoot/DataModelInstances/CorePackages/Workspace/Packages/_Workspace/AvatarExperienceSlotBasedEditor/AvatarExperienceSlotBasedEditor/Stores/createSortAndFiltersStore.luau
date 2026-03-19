local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.Signals);
local v2 = require(script.Parent.Parent.Enums.InventorySorts);
return function() --[[ Line: 29 ]] --[[ Name: createSortAndFiltersStore ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3, v4 = v1.createSignal({
        sort = v2.Newest
    });
    local v6 = v1.createComputed(function(v5) --[[ Line: 32 ]]
        -- upvalues: v3 (copy), v2 (ref)
        if v3(v5).sort == v2.Newest then
            return 0;
        else
            return 1;
        end;
    end);
    return {
        getSortAndFilters = v3, 
        getFiltersCount = v6, 
        applySortAndFilters = function(v7) --[[ Line: 36 ]] --[[ Name: applySortAndFilters ]]
            -- upvalues: v4 (copy)
            v4(v7);
        end
    };
end;
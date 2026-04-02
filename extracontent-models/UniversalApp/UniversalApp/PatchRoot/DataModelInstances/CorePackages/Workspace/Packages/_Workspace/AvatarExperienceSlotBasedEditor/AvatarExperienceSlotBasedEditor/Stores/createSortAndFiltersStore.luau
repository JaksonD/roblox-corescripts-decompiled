local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent;
local v1 = require(l_Parent_0.AvatarExperienceFlags);
local v2 = require(l_Parent_0.Signals);
local v3 = require(script.Parent.Parent.Enums.InventoryFilters);
local v4 = require(script.Parent.Parent.Enums.InventorySorts);
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v1.FFlagAXInventoryDurablesExpiredFilter;
return function() --[[ Line: 36 ]] --[[ Name: createSortAndFiltersStore ]]
    -- upvalues: v2 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v3 (copy), v4 (copy)
    local v6, v7 = v2.createSignal(if l_FFlagAXInventoryDurablesExpiredFilter_0 then {
        filter = v3.Active, 
        sort = v4.Newest
    } else {
        sort = v4.Newest
    });
    local v11 = v2.createComputed(function(v8) --[[ Line: 42 ]]
        -- upvalues: l_FFlagAXInventoryDurablesExpiredFilter_0 (ref), v6 (copy), v4 (ref), v3 (ref)
        if l_FFlagAXInventoryDurablesExpiredFilter_0 then
            local v9 = v6(v8);
            local v10 = 0;
            if v9.sort ~= v4.Newest then
                v10 = v10 + 1;
            end;
            if v9.filter ~= v3.Active then
                v10 = v10 + 1;
            end;
            return v10;
        elseif v6(v8).sort == v4.Newest then
            return 0;
        else
            return 1;
        end;
    end);
    return {
        getSortAndFilters = v6, 
        getFiltersCount = v11, 
        applySortAndFilters = function(v12) --[[ Line: 58 ]] --[[ Name: applySortAndFilters ]]
            -- upvalues: v7 (copy)
            v7(v12);
        end
    };
end;
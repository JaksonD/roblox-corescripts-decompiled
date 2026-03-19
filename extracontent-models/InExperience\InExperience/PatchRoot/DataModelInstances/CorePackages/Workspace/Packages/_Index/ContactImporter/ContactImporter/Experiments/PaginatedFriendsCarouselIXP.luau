local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.RoactAppExperiment);
local v2 = require(l_Parent_0.SharedFlags);
local l_useUserExperiment_0 = v1.useUserExperiment;
local l_FStringPaginatedCarouselExperimentLayer_0 = v2.FStringPaginatedCarouselExperimentLayer;
return {
    usePaginatedFriendsCarouselExperiment = function() --[[ Line: 11 ]] --[[ Name: usePaginatedFriendsCarouselExperiment ]]
        -- upvalues: l_useUserExperiment_0 (copy), l_FStringPaginatedCarouselExperimentLayer_0 (copy)
        return true, (l_useUserExperiment_0({
            l_FStringPaginatedCarouselExperimentLayer_0
        }, function(v5) --[[ Line: 14 ]]
            -- upvalues: l_FStringPaginatedCarouselExperimentLayer_0 (ref)
            return (v5[l_FStringPaginatedCarouselExperimentLayer_0] or {}).friendsSortVariant;
        end));
    end
};
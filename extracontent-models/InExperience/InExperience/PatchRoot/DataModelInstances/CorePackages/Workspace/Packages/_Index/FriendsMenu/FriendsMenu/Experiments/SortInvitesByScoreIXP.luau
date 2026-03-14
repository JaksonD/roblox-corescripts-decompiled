local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local v2 = game:DefineFastString("SortInvitesByScoreExperimentLayer", "Social.Friends");
local v3 = game:DefineFastFlag("EnableSortInvitesByScoreExperiment", false);
local v4 = game:DefineFastFlag("SortInvitesByScoreEnabledForAll", false);
return {
    FFlagEnableSortInvitesByScoreExperiment = v3, 
    FFlagSortInvitesByScoreEnabledForAll = v4, 
    useSortInvitesByScoreExperiment = function() --[[ Line: 16 ]] --[[ Name: useSortInvitesByScoreExperiment ]]
        -- upvalues: l_useUserExperiment_0 (copy), v2 (copy)
        return (l_useUserExperiment_0({
            v2
        }, function(v5) --[[ Line: 19 ]]
            -- upvalues: v2 (ref)
            return (v5[v2] or {}).sortInvitesByScore;
        end));
    end
};
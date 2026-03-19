local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Utils.useMatchSearchPagination);
local v5 = require(script.Parent.Parent.ProfileInsightsContextFetchWrapper.usePaginatedProfileInsightsFetch);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v7 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local v9 = require(l_script_FirstAncestor_0.Thunks.HydrateFriendStatuses);
local v10 = require(l_script_FirstAncestor_0.Thunks.HydrateFollowingStatuses);
local l_FFlagPlayerSearchEnableOnlineFrequents_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents;
local l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 = require(l_Parent_0.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll;
local _ = require(l_Parent_0.GraphQLServer);
return function(v14) --[[ Line: 39 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v5 (copy), l_FFlagPlayerSearchEnableOnlineFrequents_0 (copy), l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0 (copy), v2 (copy), v3 (copy), v7 (copy), v10 (copy), v9 (copy)
    local v15 = l_useDispatch_0();
    local v16 = v4({
        users = v14.users
    });
    local v17 = v5({
        users = v14.users or {}, 
        searchKeyword = v14.searchParameters.searchKeyword, 
        rankingStrategy = (l_FFlagPlayerSearchEnableOnlineFrequents_0 and v14.enableOnlineFrequents or l_FFlagPlayerSearchEnableOnlineFrequentsForAll_0) and "profile_info_boost" or nil
    }) or {};
    local v19 = v2.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v3 (ref), v16 (copy)
        return v3.List.map(v16, function(v18) --[[ Line: 52 ]]
            return v18.id;
        end);
    end, {
        v14.users
    });
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v15 (copy), v7 (ref), v19 (copy), v10 (ref), v9 (ref)
        v15(v7.GetPresencesFromUserIds.API(v19));
        v15(v10(v19));
        v15(v9(v19));
    end, {
        v19
    });
    return v14.renderComponent({
        mappedProfilesInsights = v17
    });
end;
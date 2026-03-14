local l_CorePackages_0 = game:GetService("CorePackages");
local l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence;
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0 (copy), l_ApiFetchGamesDataByPlaceIds_0 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0 (ref), v4 (copy), l_ApiFetchGamesDataByPlaceIds_0 (ref), v3 (copy)
        local v6 = l_getFriendsActiveGamesPlaceIdsFromUsersPresence_0(v4, v5);
        v5:dispatch(l_ApiFetchGamesDataByPlaceIds_0(v3, v6));
    end;
end;
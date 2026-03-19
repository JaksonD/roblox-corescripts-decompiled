local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.getFriendsActiveGamesPlaceIdsFromUsersPresence);
local v3 = require(l_script_FirstAncestor_0.Utils.receiveUsersPresence);
local l_ApiFetchGamesDataByPlaceIds_0 = require(l_Parent_0.GameDetailRodux).GamesByPlaceId.ApiFetchGamesDataByPlaceIds;
local v5 = require(l_script_FirstAncestor_0.Requests.UsersGetPresence);
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v5 (copy), v3 (copy), v2 (copy), l_ApiFetchGamesDataByPlaceIds_0 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v5 (ref), v6 (copy), v7 (copy), v3 (ref), v2 (ref), l_ApiFetchGamesDataByPlaceIds_0 (ref)
        return v5(v6, v7):andThen(function(v9) --[[ Line: 14 ]]
            -- upvalues: v3 (ref), v8 (copy), v2 (ref), l_ApiFetchGamesDataByPlaceIds_0 (ref), v6 (ref)
            local l_userPresences_0 = v9.responseBody.userPresences;
            v3(l_userPresences_0, v8);
            local v11 = v2(l_userPresences_0, v8);
            v8:dispatch(l_ApiFetchGamesDataByPlaceIds_0(v6, v11));
        end);
    end;
end;
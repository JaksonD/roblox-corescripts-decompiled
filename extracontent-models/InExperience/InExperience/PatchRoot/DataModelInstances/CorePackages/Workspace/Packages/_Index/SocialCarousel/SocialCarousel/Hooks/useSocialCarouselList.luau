local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_ThirdPartyUserService_0 = game:GetService("ThirdPartyUserService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.FriendsCommon);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.RoactUtils);
local v8 = require(l_Parent_0.Responsive);
local l_useFriendsListOrderedByPresence_0 = v3.Hooks.useFriendsListOrderedByPresence;
local v10 = require(l_script_FirstAncestor_0.Hooks.useGetRecommendations);
local v11 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v12 = require(l_script_FirstAncestor_0.Common.Enums);
local v13 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useSelector_0 = v7.Hooks.RoactRodux.useSelector;
local l_usePreferredInput_0 = v8.usePreferredInput;
local l_FIntSocialCarouselShowRecsLimit_0 = require(l_script_FirstAncestor_0.Flags).FIntSocialCarouselShowRecsLimit;
local l_FIntFriendsCarouselInitialFetchSize_0 = require(l_Parent_0.SharedFlags).FIntFriendsCarouselInitialFetchSize;
local l_FFlagEnableRecommendationsForPCGDK_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecommendationsForPCGDK;
local l_FFlagFixIsConsoleCheckForSocialCarousel_0 = require(l_Parent_0.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel;
local l_Tile_0 = v12.Tile;
local l_TileGroup_0 = v12.TileGroup;
local v22 = {
    {
        tileGroup = l_TileGroup_0.AddFriends
    }, 
    {
        tileGroup = l_TileGroup_0.FriendsListWithRecommendations
    }
};
return function(v23, v24) --[[ Line: 39 ]]
    -- upvalues: v22 (copy), l_useLocalUserId_0 (copy), v10 (copy), l_useFriendsListOrderedByPresence_0 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), l_FFlagFixIsConsoleCheckForSocialCarousel_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), l_FFlagEnableRecommendationsForPCGDK_0 (copy), l_ThirdPartyUserService_0 (copy), l_useSelector_0 (copy), v11 (copy), v13 (copy), l_FIntSocialCarouselShowRecsLimit_0 (copy), v6 (copy), l_TileGroup_0 (copy), l_Tile_0 (copy), v5 (copy)
    local v25 = v24 or v22;
    local v26 = l_useLocalUserId_0();
    local v27 = v10(v26);
    local v28 = l_useFriendsListOrderedByPresence_0({
        userId = v26, 
        pageSize = l_FIntFriendsCarouselInitialFetchSize_0
    });
    local v29 = if l_FFlagFixIsConsoleCheckForSocialCarousel_0 then l_usePreferredInput_0() == v8.Input.Directional else if l_FFlagEnableRecommendationsForPCGDK_0 and l_ThirdPartyUserService_0 then l_ThirdPartyUserService_0:HaveActiveUser() else l_usePreferredInput_0() == v8.Input.Directional;
    local v31 = l_useSelector_0(function(v30) --[[ Line: 52 ]]
        -- upvalues: v11 (ref), v23 (copy), v13 (ref), v26 (copy)
        return {
            friendCount = v11(v30, string.format("%s.Friends.countsByUserId.%s", v23 or v13.RODUX_KEY, v26 or "")) or 0, 
            friendRequestCount = v11(v30, string.format("%s.Friends.requests.receivedCount", v23 or v13.RODUX_KEY)) or 0
        };
    end);
    local v32 = v29 and v31.friendCount <= l_FIntSocialCarouselShowRecsLimit_0;
    local v33 = false;
    if v31.friendCount == 0 then
        v33 = not v29;
    end;
    local v34 = v6.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: l_TileGroup_0 (ref), v28 (copy), l_Tile_0 (ref), v32 (copy), v27 (copy), v33 (copy)
        return {
            [l_TileGroup_0.FriendsList] = {
                {
                    tiles = v28.onlineFriends, 
                    tileType = l_Tile_0.Friend
                }, 
                {
                    tiles = v28.offlineFriends, 
                    tileType = l_Tile_0.Friend
                }
            }, 
            [l_TileGroup_0.FriendsListWithRecommendations] = {
                {
                    tiles = v28.onlineFriends, 
                    tileType = l_Tile_0.Friend
                }, 
                if v32 then {
                    tiles = v27, 
                    tileType = l_Tile_0.Recommendation
                } else nil, 
                {
                    tiles = v28.offlineFriends, 
                    tileType = l_Tile_0.Friend
                }
            }, 
            [l_TileGroup_0.AddFriends] = {
                {
                    tileType = l_Tile_0.AddFriends
                }, 
                if v33 then {
                    tileType = l_Tile_0.FriendsHint
                } else nil
            }, 
            [l_TileGroup_0.StartSquad] = {
                {
                    tileType = l_Tile_0.StartSquad
                }
            }
        };
    end, {
        v28.onlineFriends, 
        v28.offlineFriends, 
        v27, 
        v32, 
        v33
    });
    return {
        tiles = v6.useMemo(function() --[[ Line: 101 ]]
            -- upvalues: v25 (copy), v34 (copy), v5 (ref)
            local v35 = {};
            for _, v37 in v25 do
                for _, v39 in v34[v37.tileGroup] do
                    if v39 then
                        if v39.tiles then
                            for _, v41 in v39.tiles do
                                table.insert(v35, v5.Dictionary.join(v41, {
                                    tileType = v39.tileType, 
                                    onActivated = v37.onActivated
                                }));
                            end;
                        else
                            table.insert(v35, {
                                tileType = v39.tileType, 
                                onActivated = v37.onActivated
                            });
                        end;
                    end;
                end;
            end;
            return v35;
        end, {
            v34, 
            v25
        }), 
        friendCount = v31.friendCount, 
        friendRequestCount = v31.friendRequestCount, 
        recommendationCount = #v27, 
        refreshFriendsList = v28.refreshFriendsData
    };
end;
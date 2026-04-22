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
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
local l_FIntFriendsCarouselInitialFetchSize_0 = require(l_Parent_0.SharedFlags).FIntFriendsCarouselInitialFetchSize;
local l_FFlagEnableRecommendationsForPCGDK_0 = require(l_Parent_0.SharedFlags).FFlagEnableRecommendationsForPCGDK;
local l_FFlagFixIsConsoleCheckForSocialCarousel_0 = require(l_Parent_0.SharedFlags).FFlagFixIsConsoleCheckForSocialCarousel;
local l_Tile_0 = v12.Tile;
local l_TileGroup_0 = v12.TileGroup;
local v23 = {
    {
        tileGroup = l_TileGroup_0.AddFriends
    }, 
    {
        tileGroup = l_TileGroup_0.FriendsListWithRecommendations
    }
};
return function(v24, v25) --[[ Line: 41 ]]
    -- upvalues: v23 (copy), l_useLocalUserId_0 (copy), v10 (copy), l_useFriendsListOrderedByPresence_0 (copy), l_FIntFriendsCarouselInitialFetchSize_0 (copy), l_FFlagFixIsConsoleCheckForSocialCarousel_0 (copy), l_usePreferredInput_0 (copy), v8 (copy), l_FFlagEnableRecommendationsForPCGDK_0 (copy), l_ThirdPartyUserService_0 (copy), l_useSelector_0 (copy), v11 (copy), v13 (copy), l_FIntSocialCarouselShowRecsLimit_0 (copy), l_FFlagSocialCarouselShareQREnabled_0 (copy), v6 (copy), l_TileGroup_0 (copy), l_Tile_0 (copy), v5 (copy)
    local v26 = v25 or v23;
    local v27 = l_useLocalUserId_0();
    local v28 = v10(v27);
    local v29 = l_useFriendsListOrderedByPresence_0({
        userId = v27, 
        pageSize = l_FIntFriendsCarouselInitialFetchSize_0
    });
    local v30 = if l_FFlagFixIsConsoleCheckForSocialCarousel_0 then l_usePreferredInput_0() == v8.Input.Directional else if l_FFlagEnableRecommendationsForPCGDK_0 and l_ThirdPartyUserService_0 then l_ThirdPartyUserService_0:HaveActiveUser() else l_usePreferredInput_0() == v8.Input.Directional;
    local v32 = l_useSelector_0(function(v31) --[[ Line: 54 ]]
        -- upvalues: v11 (ref), v24 (copy), v13 (ref), v27 (copy)
        return {
            friendCount = v11(v31, string.format("%s.Friends.countsByUserId.%s", v24 or v13.RODUX_KEY, v27 or "")) or 0, 
            friendRequestCount = v11(v31, string.format("%s.Friends.requests.receivedCount", v24 or v13.RODUX_KEY)) or 0
        };
    end);
    local v33 = v30 and v32.friendCount <= l_FIntSocialCarouselShowRecsLimit_0;
    local v34 = false;
    if v32.friendCount == 0 then
        v34 = not v30;
    end;
    local v35 = l_FFlagSocialCarouselShareQREnabled_0 and v32.friendCount == 0;
    local v36 = v6.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: l_TileGroup_0 (ref), v29 (copy), l_Tile_0 (ref), v33 (copy), v28 (copy), v35 (copy), v34 (copy)
        return {
            [l_TileGroup_0.FriendsList] = {
                {
                    tiles = v29.onlineFriends, 
                    tileType = l_Tile_0.Friend
                }, 
                {
                    tiles = v29.offlineFriends, 
                    tileType = l_Tile_0.Friend
                }
            }, 
            [l_TileGroup_0.FriendsListWithRecommendations] = {
                {
                    tiles = v29.onlineFriends, 
                    tileType = l_Tile_0.Friend
                }, 
                if v33 then {
                    tiles = v28, 
                    tileType = l_Tile_0.Recommendation
                } else nil, 
                {
                    tiles = v29.offlineFriends, 
                    tileType = l_Tile_0.Friend
                }
            }, 
            [l_TileGroup_0.AddFriends] = {
                {
                    tileType = l_Tile_0.AddFriends
                }, 
                if v35 then {
                    tileType = l_Tile_0.ShareQR
                } else nil, 
                if v34 then {
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
        v29.onlineFriends, 
        v29.offlineFriends, 
        v28, 
        v33, 
        v34, 
        if l_FFlagSocialCarouselShareQREnabled_0 then v35 else nil
    });
    return {
        tiles = v6.useMemo(function() --[[ Line: 106 ]]
            -- upvalues: v26 (copy), v36 (copy), v5 (ref)
            local v37 = {};
            for _, v39 in v26 do
                for _, v41 in v36[v39.tileGroup] do
                    if v41 then
                        if v41.tiles then
                            for _, v43 in v41.tiles do
                                table.insert(v37, v5.Dictionary.join(v43, {
                                    tileType = v41.tileType, 
                                    onActivated = v39.onActivated
                                }));
                            end;
                        else
                            table.insert(v37, {
                                tileType = v41.tileType, 
                                onActivated = v39.onActivated
                            });
                        end;
                    end;
                end;
            end;
            return v37;
        end, {
            v36, 
            v26
        }), 
        friendCount = v32.friendCount, 
        friendRequestCount = v32.friendRequestCount, 
        recommendationCount = #v28, 
        refreshFriendsList = v29.refreshFriendsData
    };
end;
local l_Parent_0 = script:FindFirstAncestor("FriendsCarousel").Parent;
local l_DiagEventTypes_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes;
local v2 = require(script.Parent.EventNames);
local v3 = require(script.Parent.FetchNames);
local v4 = {
    Done = game:DefineFastString("AllFriendsCarouselLoadingTimeDoneStats", "AllFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("AllFriendsCarouselLoadingTimeFailedStats", "AllFriendsCarouselLoadingTimeFailed")
};
local v5 = {
    Done = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeDoneStats", "AllFriendsNextPageCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("AllFriendsNextPageCarouselLoadingTimeFailedStats", "AllFriendsNextPageCarouselLoadingTimeFailed")
};
local v6 = {
    Done = game:DefineFastString("OnlineFriendsCarouselLoadingTimeDoneStats", "OnlineFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("OnlineFriendsCarouselLoadingTimeFailedStats", "OnlineFriendsCarouselLoadingTimeFailed")
};
local v7 = {
    Done = game:DefineFastString("OldAllFriendsCarouselLoadingTimeDoneStats", "OldAllFriendsCarouselLoadingTimeDone"), 
    Failed = game:DefineFastString("OldAllFriendsCarouselLoadingTimeFailedStats", "OldAllFriendsCarouselLoadingTimeFailed")
};
local v8 = game:DefineFastString("FriendsCarouselUILoadingTimeStats", "FriendsCarouselUILoadingTime");
local v9 = game:DefineFastString("OnlineFriendsRefetchOnPresenceUpdateCounter", "OnlineFriendsRefetchOnPresenceUpdate");
local v10 = game:DefineFastString("OnlineFriendsRefetchOnFriendshipUpdateCounter", "OnlineFriendsRefetchOnFriendshipUpdate");
return {
    [v2.CarouselLoadedWithUsers] = {
        name = game:DefineFastString("FriendsCarouselLoadedWithUsers", "FriendsCarouselLoadedWithUsers")
    }, 
    [v2.UserPressed] = {
        name = game:DefineFastString("FriendsCarouselUserPressed", "FriendsCarouselUserPressed")
    }, 
    [v2.RequestFriendship] = {
        name = game:DefineFastString("FriendsCarouselRequestFriendship", "FriendsCarouselRequestFriendship")
    }, 
    [v2.RevokeFriendRequest] = {
        name = game:DefineFastString("FriendsCarouselRevokeFriendRequest", "FriendsCarouselRevokeFriendRequest")
    }, 
    [v2.ViewAllFriends] = {
        name = game:DefineFastString("HomePageNavigationViewAllFriends", "HomePageNavigationFriendsLanding")
    }, 
    [v2.ViewAddFriends] = {
        name = game:DefineFastString("HomePageNavigationViewAddFriends", "AddFriendsHomeEntry")
    }, 
    [v2.PaginatedFriendsCarouselLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v11) --[[ Line: 71 ]] --[[ Name: name ]]
            -- upvalues: v3 (copy), v5 (copy), v4 (copy), v6 (copy)
            if v11.fetch == v3.AllFriends then
                if v11.nextPage then
                    return v5[v11.status];
                else
                    return v4[v11.status];
                end;
            else
                return v6[v11.status];
            end;
        end, 
        stats = function(v12) --[[ Line: 78 ]] --[[ Name: stats ]]
            return v12.loadingTime or 0;
        end
    }, 
    [v2.FriendsEndpointLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v13) --[[ Line: 84 ]] --[[ Name: name ]]
            -- upvalues: v7 (copy)
            return v7[v13.status];
        end, 
        stats = function(v14) --[[ Line: 87 ]] --[[ Name: stats ]]
            return v14.loadingTime or 0;
        end
    }, 
    [v2.FriendsCarouselUILoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v15) --[[ Line: 93 ]] --[[ Name: name ]]
            -- upvalues: v8 (copy)
            return (("%*_%*"):format(v8, v15.fetch));
        end, 
        stats = function(v16) --[[ Line: 96 ]] --[[ Name: stats ]]
            return v16.loadingTime or 0;
        end
    }, 
    [v2.OnlineFriendsRefetchOnPresenceUpdate] = {
        type = l_DiagEventTypes_0.Counter, 
        name = v9
    }, 
    [v2.OnlineFriendsRefetchOnFriendshipUpdate] = {
        type = l_DiagEventTypes_0.Counter, 
        name = v10
    }
};
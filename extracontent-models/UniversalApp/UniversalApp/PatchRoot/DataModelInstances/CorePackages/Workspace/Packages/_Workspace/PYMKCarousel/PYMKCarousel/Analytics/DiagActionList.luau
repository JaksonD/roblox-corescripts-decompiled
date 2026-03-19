local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(script.Parent.EventNames);
local v4 = require(l_Parent_1.SocialLuaAnalytics);
local l_DiagEventTypes_0 = v4.Analytics.Enums.DiagEventTypes;
local l_getFFlagPYMKAddFriendsEntry_0 = v2.getFFlagPYMKAddFriendsEntry;
local v8 = {
    [v3.CarouselLoadedWithUsers] = {
        name = game:DefineFastString("PYMKCarouselLoadedWithUsers", "PYMKCarouselLoadedWithUsers")
    }, 
    [v3.UserPressed] = {
        name = game:DefineFastString("PYMKCarouselUserPressed", "PYMKCarouselUserPressed")
    }, 
    [v3.RequestFriendship] = {
        name = game:DefineFastString("PYMKCarouselRequestFriendship", "PYMKCarouselRequestFriendship")
    }, 
    [v3.PYMKCarouselLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = v3.PYMKCarouselLoadingTime.rawValue(), 
        stats = function(v7) --[[ Line: 24 ]] --[[ Name: stats ]]
            return v7.loadingTime or 0;
        end, 
        platformSpecificity = v4.Analytics.Enums.PlatformSpecificity.BucketsOnly
    }
};
if l_getFFlagPYMKAddFriendsEntry_0() then
    v8[v3.CarouselGenericTileClicked] = {
        name = game:DefineFastString("PYMKCarouselGenericTileClicked", "PYMKCarouselGenericTileClicked")
    };
end;
return v8;
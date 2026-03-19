local l_Parent_0 = script:FindFirstAncestor("UserSearch").Parent;
local v1 = require(l_Parent_0.SocialLuaAnalytics);
local l_DiagEventTypes_0 = v1.Analytics.Enums.DiagEventTypes;
local v3 = require(script.Parent.EventNames);
local v4 = {
    Done = game:DefineFastString("UserSearchLoadingTimeDoneStats", "UserSearchLoadingTimeDone"), 
    Failed = game:DefineFastString("UserSearchLoadingTimeFailedStats", "UserSearchLoadingTimeFailed")
};
local v5 = {
    Done = game:DefineFastString("UserSearchLoadingTimeNextPageDoneStats", "UserSearchLoadingTimeNextPageDone"), 
    Failed = game:DefineFastString("UserSearchLoadingTimeNextPageFailedStats", "UserSearchLoadingTimeNextPageFailed")
};
local v6 = {
    Done = "UserSearchLoadedDone", 
    Failed = "UserSearchLoadedFailed"
};
local v7 = {
    Done = "UserSearchLoadedNextPageDone", 
    Failed = "UserSearchLoadedNextPageFailed"
};
return {
    [v3.PlayerFriendRequest] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerFriendRequestCounter", "UserSearchPlayerFriendRequest")
    }, 
    [v3.PlayerFriendAccept] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerFriendAcceptCounter", "UserSearchPlayerFriendAccept")
    }, 
    [v3.PlayerTileClick] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerTileClickCounter", "UserSearchPlayerTileClick")
    }, 
    [v3.PlayerTileImpressions] = {
        type = l_DiagEventTypes_0.Counter, 
        name = game:DefineFastString("UserSearchPlayerTileImpressionsCounter", "UserSearchPlayerTileImpressions"), 
        count = function(v8) --[[ Line: 45 ]] --[[ Name: count ]]
            if v8 and v8.playerId then
                return #v8.playerId;
            else
                return 0;
            end;
        end
    }, 
    [v3.UserSearchLoadingTime] = {
        type = l_DiagEventTypes_0.Stats, 
        name = function(v9) --[[ Line: 51 ]] --[[ Name: name ]]
            -- upvalues: v5 (copy), v4 (copy)
            if v9.nextPage then
                return v5[v9.status];
            else
                return v4[v9.status];
            end;
        end, 
        stats = function(v10) --[[ Line: 56 ]] --[[ Name: stats ]]
            return v10.loadingTime or 0;
        end
    }, 
    [v3.UserSearchLoaded] = {
        type = l_DiagEventTypes_0.Counter, 
        name = function(v11) --[[ Line: 62 ]] --[[ Name: name ]]
            -- upvalues: v7 (copy), v6 (copy)
            if v11.nextPage then
                return v7[v11.status];
            else
                return v6[v11.status];
            end;
        end, 
        platformSpecificity = v1.Analytics.Enums.PlatformSpecificity.BucketsOnly
    }
};
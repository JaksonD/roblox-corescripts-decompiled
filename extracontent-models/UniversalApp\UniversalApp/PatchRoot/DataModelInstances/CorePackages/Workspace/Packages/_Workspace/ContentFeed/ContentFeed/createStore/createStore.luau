local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Constants);
local l_FetchingStatus_0 = require(l_Parent_1.Http).Reducers.FetchingStatus;
local l_GameDetailReducer_0 = require(l_Parent_1.GameDetailRodux).GameDetails.GameDetailReducer;
local l_GamesProductInfoReducer_0 = require(l_Parent_1.GameProductInfoRodux).GamesProductInfoReducer;
local v7 = require(l_Parent_1.GameVotesRodux);
local v8 = require(l_Parent_0.installReducer);
local v9 = require(l_Parent_0.App.Networking);
local l_NextDataExpirationTimeReducer_0 = require(l_Parent_1.NextDataExpirationTimeRodux).NextDataExpirationTimeReducer;
local l_PlayabilityStatusReducer_0 = require(l_Parent_1.PlayabilityRodux).PlayabilityStatus.PlayabilityStatusReducer;
local v12 = require(l_Parent_0.installReducer.ScreenSize);
local l_ShowAgeVerificationOverlay_0 = require(l_Parent_1.VoiceChat).AgeVerificationOverlay.ShowAgeVerificationOverlay;
local l_UserGameVotes_0 = require(l_Parent_1.GameVotesRodux).UserGameVotes.UserGameVotes;
local v15 = v2.combineReducers({
    [v3.RoduxKey] = v8(), 
    [l_GamesProductInfoReducer_0.key] = l_GamesProductInfoReducer_0.reducer, 
    ContentSharing = v9.ContentSharingRodux.installReducer(), 
    FetchingStatus = l_FetchingStatus_0, 
    GameDetails = l_GameDetailReducer_0, 
    GameVotes = v7.GameVotes.GameVotes, 
    Games = v9.RoduxGames.installReducer(), 
    NetworkStatus = v9.RoduxNetworking.installReducer(), 
    Personalization = v2.combineReducers({
        [l_NextDataExpirationTimeReducer_0.key] = l_NextDataExpirationTimeReducer_0.reducer
    }), 
    PlayabilityStatus = l_PlayabilityStatusReducer_0, 
    ScreenSize = v12, 
    ShowAgeVerificationOverlay = l_ShowAgeVerificationOverlay_0, 
    UserGameVotes = l_UserGameVotes_0, 
    Users = v9.RoduxUsers.installReducer()
});
return function() --[[ Line: 38 ]]
    -- upvalues: v2 (copy), v15 (copy)
    return v2.Store.new(v15, {}, {
        v2.thunkMiddleware
    });
end;
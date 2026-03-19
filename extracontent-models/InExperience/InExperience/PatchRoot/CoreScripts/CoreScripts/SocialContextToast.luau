local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_SocialContextToastContainer_0 = require(l_CorePackages_0.Workspace.Packages.SocialContextToasts).SocialContextToastContainer;
local l_GetFFlagSocialContextToastEventStream_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSocialContextToastEventStream;
local l_FFlagEnablePartyNudgeAfterJoin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin;
local l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableReferredPlayerJoinRemoteEvent;
local l_GetFIntReferredPlayerJoinRemoteEventTimeout_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFIntReferredPlayerJoinRemoteEventTimeout;
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v11 = require(l_CorePackages_0.Packages.HttpRequest);
local v15 = v11.config({
    requestFunction = function(v12, v13, v14) --[[ Line: 19 ]] --[[ Name: requestFunction ]]
        -- upvalues: v11 (copy)
        return v11.requestFunctions.HttpRbxApi(v12, v13, v14);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("SocialContextToastHttpRetryCount", 4) else nil
});
local v16 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local l_Analytics_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Analytics;
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local v20 = nil;
if l_GetFFlagEnableReferredPlayerJoinRemoteEvent_0() then
    v20 = l_RobloxReplicatedStorage_0:WaitForChild("ReferredPlayerJoin", l_GetFIntReferredPlayerJoinRemoteEventTimeout_0());
end;
local v21 = nil;
local v22 = nil;
local v23 = game:DefineFastInt("FriendPlayerJoinedRemoteEventTimeout", 5);
if l_FFlagEnablePartyNudgeAfterJoin_0 then
    v21 = l_RobloxReplicatedStorage_0:WaitForChild("ShowFriendJoinedPlayerToast", v23);
    v22 = l_RobloxReplicatedStorage_0:WaitForChild("ShowPlayerJoinedFriendsToast", v23);
end;
l_SocialContextToastContainer_0({
    networking = v15, 
    playersService = l_Players_0, 
    apolloClient = v16, 
    analytics = l_Analytics_0.new(), 
    ixpService = l_IXPServiceWrapper_0, 
    eventIngest = l_EventIngest_0.new(l_EventIngestService_0), 
    referredPlayerJoinRemoteEvent = v20, 
    showFriendJoinedPlayerToastRemoteEvent = v21, 
    showPlayerJoinedFriendsToastRemoteEvent = v22
}, if l_GetFFlagSocialContextToastEventStream_0() then tostring(game.GameId) else game.GameId, if l_GetFFlagSocialContextToastEventStream_0() then tostring(game.PlaceId) else game.PlaceId);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GamePlayButton");
local _ = require(l_script_FirstAncestor_0.PlayButtonTypes);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v5 = require(l_Parent_0.RoactServiceTags);
local l_RoactAnalytics_0 = v5.RoactAnalytics;
local l_AppEventIngestService_0 = v5.AppEventIngestService;
local l_AppGame_0 = v5.AppGame;
local v9 = require(l_Parent_0.RoactUtils);
local l_useSelector_0 = v9.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v9.Hooks.RoactRodux.useDispatch;
local v12 = require(l_Parent_0.DiscoveryAnalytics);
local l_gamePlayIntent_0 = v12.Events.gamePlayIntent;
local l_joinGamePlayButton_0 = v12.Points.joinGamePlayButton;
local v15 = require(l_Parent_0.GameVotesRodux);
local l_ReasonForNotVoteable_0 = v15.Enums.ReasonForNotVoteable;
local l_ClearUserGameVotes_0 = v15.UserGameVotes.ClearUserGameVotes;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_SplashScreenManager_0 = require(l_Parent_0.SplashScreenManager).SplashScreenManager;
local l_LaunchGame_0 = require(l_Parent_0.GameLaunch).LaunchGame;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_FFlagLuaAppEnableStratusStreamingTestOnly_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableStratusStreamingTestOnly;
local l_NavigateToRoute_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateToRoute;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagLuaAppEnablePlayButtonThrottle_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle;
local l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 = require(l_Parent_0.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_FFlagLuaAppTwoByOneTileTelemetryFix_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppTwoByOneTileTelemetryFix;
return function(v29, v30, v31, v32, v33, v34, v35) --[[ Line: 36 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_AppGame_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_FFlagLuaAppEnablePlayButtonThrottle_0 (copy), v3 (copy), l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_gamePlayIntent_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (copy), l_joinGamePlayButton_0 (copy), l_FFlagLuaAppEnableStratusStreamingTestOnly_0 (copy), l_NavigateToRoute_0 (copy), l_AppPage_0 (copy), l_IsVRAppBuild_0 (copy), l_SplashScreenManager_0 (copy), l_LaunchGame_0 (copy), l_ReasonForNotVoteable_0 (copy), l_ClearUserGameVotes_0 (copy)
    local v36 = l_useRoactService_0(l_RoactAnalytics_0);
    local v37 = l_useRoactService_0(l_AppEventIngestService_0);
    local v38 = l_useRoactService_0(l_AppGame_0);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 49 ]]
        -- upvalues: v29 (copy)
        return v39.UserGameVotes[v29];
    end);
    local v41 = l_useDispatch_0();
    local v42 = if l_FFlagLuaAppEnablePlayButtonThrottle_0 then v3.useRef(0) else nil;
    return (v3.useCallback(function(v43) --[[ Line: 56 ]]
        -- upvalues: l_FFlagLuaAppEnablePlayButtonThrottle_0 (ref), v42 (copy), l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v30 (copy), v31 (copy), l_gamePlayIntent_0 (ref), v37 (copy), v32 (copy), v29 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v35 (copy), l_FFlagLuaAppTwoByOneTileTelemetryFix_0 (ref), l_joinGamePlayButton_0 (ref), v36 (copy), v33 (copy), l_FFlagLuaAppEnableStratusStreamingTestOnly_0 (ref), v41 (copy), l_NavigateToRoute_0 (ref), l_AppPage_0 (ref), v34 (copy), l_IsVRAppBuild_0 (ref), l_SplashScreenManager_0 (ref), l_LaunchGame_0 (ref), v38 (copy), v40 (copy), l_ReasonForNotVoteable_0 (ref), l_ClearUserGameVotes_0 (ref)
        if l_FFlagLuaAppEnablePlayButtonThrottle_0 then
            local v44 = tick();
            if v44 - v42.current < l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 then
                return;
            else
                v42.current = v44;
            end;
        end;
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and (not v30 or not v31) or not l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and not v31 then
            return;
        else
            if v43 ~= nil then
                v43();
            else
                l_gamePlayIntent_0(v37, "PlayButton", {
                    placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v30 else v31, 
                    rootPlaceId = tonumber(v31), 
                    referralSource = v32, 
                    universeId = v29, 
                    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v35 and v35.launchData then v35.launchData else nil, 
                    tileType = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v35 then v35.tileType else nil, 
                    nativeAdData = if l_FFlagLuaAppTwoByOneTileTelemetryFix_0 and v35 then v35.nativeAdData else nil
                });
            end;
            l_joinGamePlayButton_0(v36.InfluxDb, "gamePlayIntent", {
                isUniversalApp = true, 
                referralSource = v32, 
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v30 else v31, 
                ctx = v33
            });
            if l_FFlagLuaAppEnableStratusStreamingTestOnly_0 then
                v41(l_NavigateToRoute_0({
                    {
                        name = l_AppPage_0.VideoServer, 
                        placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v30 else v31, 
                        launchSource = v34, 
                        extraParams = v35
                    }
                }));
                return;
            else
                if l_IsVRAppBuild_0() then
                    l_SplashScreenManager_0.initialize(36);
                    wait(0.3);
                end;
                l_LaunchGame_0(if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v30 else v31, v34, v35, v38);
                if v40 and v40.reasonForNotVoteable == l_ReasonForNotVoteable_0.PlayGame then
                    v41(l_ClearUserGameVotes_0(v29));
                end;
                return;
            end;
        end;
    end, {
        v37, 
        v36, 
        v38, 
        v40, 
        v29, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v30 else nil, 
        v31, 
        v32, 
        v33, 
        if not not l_FFlagLuaAppEnableCustomSpawnSponsored_0 or l_FFlagLuaAppTwoByOneTileTelemetryFix_0 then v35 else nil
    }));
end;
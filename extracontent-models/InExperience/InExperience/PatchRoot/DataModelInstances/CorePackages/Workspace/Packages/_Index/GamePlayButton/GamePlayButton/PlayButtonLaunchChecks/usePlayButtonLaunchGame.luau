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
local l_FFlagLuaAppEnablePlayButtonThrottle_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnablePlayButtonThrottle;
local l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 = require(l_Parent_0.SharedFlags).FIntLuaAppPlayButtonThrottleTimeSeconds;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
return function(v25, v26, v27, v28, v29, v30, v31) --[[ Line: 30 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_AppGame_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_FFlagLuaAppEnablePlayButtonThrottle_0 (copy), v3 (copy), l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 (copy), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy), l_gamePlayIntent_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_joinGamePlayButton_0 (copy), l_IsVRAppBuild_0 (copy), l_SplashScreenManager_0 (copy), l_LaunchGame_0 (copy), l_ReasonForNotVoteable_0 (copy), l_ClearUserGameVotes_0 (copy)
    local v32 = l_useRoactService_0(l_RoactAnalytics_0);
    local v33 = l_useRoactService_0(l_AppEventIngestService_0);
    local v34 = l_useRoactService_0(l_AppGame_0);
    local v36 = l_useSelector_0(function(v35) --[[ Line: 43 ]]
        -- upvalues: v25 (copy)
        return v35.UserGameVotes[v25];
    end);
    local v37 = l_useDispatch_0();
    local v38 = if l_FFlagLuaAppEnablePlayButtonThrottle_0 then v3.useRef(0) else nil;
    return (v3.useCallback(function(v39) --[[ Line: 50 ]]
        -- upvalues: l_FFlagLuaAppEnablePlayButtonThrottle_0 (ref), v38 (copy), l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 (ref), l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (ref), v26 (copy), v27 (copy), l_gamePlayIntent_0 (ref), v33 (copy), v28 (copy), v25 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), v31 (copy), l_joinGamePlayButton_0 (ref), v32 (copy), v29 (copy), l_IsVRAppBuild_0 (ref), l_SplashScreenManager_0 (ref), l_LaunchGame_0 (ref), v30 (copy), v34 (copy), v36 (copy), l_ReasonForNotVoteable_0 (ref), v37 (copy), l_ClearUserGameVotes_0 (ref)
        if l_FFlagLuaAppEnablePlayButtonThrottle_0 then
            local v40 = tick();
            if v40 - v38.current < l_FIntLuaAppPlayButtonThrottleTimeSeconds_0 then
                return;
            else
                v38.current = v40;
            end;
        end;
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and (not v26 or not v27) or not l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() and not v27 then
            return;
        else
            if v39 ~= nil then
                v39();
            else
                l_gamePlayIntent_0(v33, "PlayButton", {
                    placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v26 else v27, 
                    rootPlaceId = tonumber(v27), 
                    referralSource = v28, 
                    universeId = v25, 
                    launchData = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 and v31 and v31.launchData then v31.launchData else nil
                });
            end;
            l_joinGamePlayButton_0(v32.InfluxDb, "gamePlayIntent", {
                isUniversalApp = true, 
                referralSource = v28, 
                placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v26 else v27, 
                ctx = v29
            });
            if l_IsVRAppBuild_0() then
                l_SplashScreenManager_0.initialize(36);
                wait(0.3);
            end;
            l_LaunchGame_0(if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v26 else v27, v30, v31, v34);
            if v36 and v36.reasonForNotVoteable == l_ReasonForNotVoteable_0.PlayGame then
                v37(l_ClearUserGameVotes_0(v25));
            end;
            return;
        end;
    end, {
        v33, 
        v32, 
        v34, 
        v36, 
        v25, 
        if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v26 else nil, 
        v27, 
        v28, 
        v29, 
        if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v31 else nil
    }));
end;
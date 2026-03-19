local l_Parent_0 = script:FindFirstAncestor("HoldToPlay").Parent;
local v1 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v3 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v3.RoactNetworking;
local l_AppSessionService_0 = v3.AppSessionService;
local v6 = require(l_Parent_0.GamePlayButton);
local l_useOnPlayButtonCallback_0 = v6.useOnPlayButtonCallback;
local l_usePlayButtonState_0 = v6.usePlayButtonState;
local l_PlayButtonStates_0 = v6.PlayButtonStates;
local v10 = require(l_Parent_0.RobloxAppSessionization);
local l_SetGamePlaySession_0 = v10.SetGamePlaySession;
local l_SessionType_0 = v10.SessionType;
local l_HoldToPlayLauncher_0 = require(l_Parent_0.ExperienceAnalytics).Constants.Context.HoldToPlayLauncher;
return function(v14) --[[ Line: 33 ]] --[[ Name: HoldToPlayLoader ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppSessionService_0 (copy), l_usePlayButtonState_0 (copy), l_useOnPlayButtonCallback_0 (copy), l_HoldToPlayLauncher_0 (copy), v1 (copy), l_SetGamePlaySession_0 (copy), l_SessionType_0 (copy), l_PlayButtonStates_0 (copy)
    local v15 = l_useRoactService_0(l_RoactNetworking_0);
    local v16 = l_useRoactService_0(l_AppSessionService_0);
    local v17 = l_usePlayButtonState_0(v15, v14.universeId);
    local v18 = l_useOnPlayButtonCallback_0(v14.universeId, nil, l_HoldToPlayLauncher_0, nil, nil);
    v1.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v17 (copy), v14 (copy), l_SetGamePlaySession_0 (ref), v16 (copy), l_SessionType_0 (ref), v18 (copy), l_PlayButtonStates_0 (ref)
        local l_playButtonState_0 = v17.playButtonState;
        if v14.shouldAttemptLaunch then
            l_SetGamePlaySession_0(v16, l_SessionType_0.StructuralIdentifier.GamePlayFromHoldToPlay, true);
            v18(l_playButtonState_0, v14.reportExperienceLaunched);
            if v14.onLaunched and l_playButtonState_0 == l_PlayButtonStates_0.Playable then
                v14.onLaunched();
            end;
        end;
    end, {
        v14.shouldAttemptLaunch, 
        v14.onLaunched, 
        v17.playButtonState, 
        v16, 
        v14.reportExperienceLaunched, 
        v18
    });
    return nil;
end;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Common.Experience.Connectors.LaunchExperienceConnector);
local l_PlayButtonStates_0 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton).PlayButtonStates;
local l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId;
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
return v3.connect(function(v7) --[[ Line: 64 ]]
    -- upvalues: l_GetFFlagLuaAppEnableVirtualEventPlaceId_0 (copy)
    return {
        universeId = v7.universeId, 
        placeId = if l_GetFFlagLuaAppEnableVirtualEventPlaceId_0() then v7.placeId else nil, 
        launchSource = v7.launchSource, 
        referralSource = v7.referralSource, 
        extraParams = if v7.experienceJoinData then v7.experienceJoinData else nil
    };
end, function(v8) --[[ Line: 72 ]]
    return {
        playabilityStatus = v8.playabilityStatus, 
        playButtonState = v8.playButtonState, 
        onPlayButtonActivated = v8.onPlayButtonActivated
    };
end)(function(v9) --[[ Line: 34 ]] --[[ Name: LaunchGameOnMount ]]
    -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), v2 (copy), l_PlayButtonStates_0 (copy)
    local v10 = nil;
    v10 = if l_GetFFlagIsSquadEnabled_0() then v9 else v9;
    v2.useEffect(function() --[[ Line: 42 ]]
        -- upvalues: v10 (ref), l_PlayButtonStates_0 (ref), l_GetFFlagIsSquadEnabled_0 (ref)
        if v10.playButtonState == l_PlayButtonStates_0.Playable or l_GetFFlagIsSquadEnabled_0() and v10.playButtonState == l_PlayButtonStates_0.PlayableWithParty then
            if v10.onGameLaunching then
                v10.onGameLaunching();
            end;
            if v10.playButtonState == l_PlayButtonStates_0.PlayableWithParty then
                v10.onPlayButtonActivated(l_PlayButtonStates_0.Playable);
                return;
            else
                v10.onPlayButtonActivated();
            end;
        end;
    end, {
        v10.playButtonState
    });
    return nil;
end);
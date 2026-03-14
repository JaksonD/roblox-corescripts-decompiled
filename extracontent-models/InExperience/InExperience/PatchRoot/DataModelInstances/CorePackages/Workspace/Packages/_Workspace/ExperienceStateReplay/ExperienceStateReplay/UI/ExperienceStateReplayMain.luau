local v0 = {};
if not game:GetEngineFeature("RecordingServicePlaybackApiLua") then
    return v0;
elseif game.PlaceId ~= 123012592984338 then
    return v0;
else
    local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
    local l_Parent_0 = script.Parent;
    v0.state = require(l_Parent_0.PlaybackState).new(false, false, false);
    v0.screenGui = Instance.new("ScreenGui");
    v0.screenGui.Parent = l_RobloxGui_0;
    require(l_Parent_0.CreateControlBar).createControlBar(v0);
    require(l_Parent_0.CreateLoadingOverlay).createLoadingOverlay(v0);
    require(l_Parent_0.CreateButtonsTime).createButtonsTime(v0);
    require(l_Parent_0.CreateScrubber).createScrubber(v0);
    require(l_Parent_0.CreateHelpText).createHelpText(v0);
    require(l_Parent_0.ControlButtonsTime).setupControl(v0);
    require(l_Parent_0.ControlVisibility).setupControl(v0);
    require(l_Parent_0.LoadSlices).loadSlices(v0);
    require(l_Parent_0.ControlScrubber).setupControl(v0);
    require(l_Parent_0.ListenPlaybackStatusUpdated).setupListener(v0);
    require(l_Parent_0.CreateSpectatorCamera).createSpectatorCamera(v0);
    return v0;
end;
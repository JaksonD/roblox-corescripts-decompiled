local l_CorePackages_0 = game:GetService("CorePackages");
local l_isInExperienceUIVREnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_isSpatial_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).isSpatial;
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableInExperienceAvatarSwitcher_0 = v3.FFlagEnableInExperienceAvatarSwitcher;
local l_FFlagAddIGMToSideSheet_0 = v3.FFlagAddIGMToSideSheet;
return {
    OverflowMenu = require(script.OverflowMenu), 
    Chat = require(script.ExpChat.ChatChromeIntegration), 
    ConnectUnibar = require(script.Connect.ConnectIconUnibar), 
    ConnectDropdown = require(script.Connect.ConnectIconDropdown), 
    TrustAndSafety = require(script.TrustAndSafety), 
    DummyWindow = require(script.DummyWindow), 
    DummyWindow2 = require(script.DummyWindow2), 
    ToggleMic = require(script.ToggleMic), 
    JoinVoice = require(script.JoinVoice), 
    SelfieView = require(script.SelfieView), 
    CapturesEntrypoint = require(script.Captures.CapturesEntrypoint), 
    AvatarSwitcherEntryPoint = if l_FFlagEnableInExperienceAvatarSwitcher_0 then require(script.AvatarSwitcher.AvatarSwitcherEntrypoint) else nil, 
    MusicEntrypoint = require(script.MusicUtility.MusicEntrypoint), 
    PartyMic = require(script.Party.PartyMic), 
    VRToggleButton = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then require(script.VRToggleButton) else nil, 
    VRSafeBubble = if l_isInExperienceUIVREnabled_0 and l_isSpatial_0() then require(script.VRSafeBubble) else nil, 
    People = if l_FFlagAddIGMToSideSheet_0 then require(script.Pages.People) else nil
};
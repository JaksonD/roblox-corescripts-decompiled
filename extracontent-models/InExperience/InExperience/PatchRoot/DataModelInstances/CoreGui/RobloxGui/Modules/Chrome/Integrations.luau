local CorePackages = game:GetService("CorePackages")
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableInExperienceAvatarSwitcher = SharedFlags.FFlagEnableInExperienceAvatarSwitcher
local FFlagAddIGMToSideSheet = SharedFlags.FFlagAddIGMToSideSheet

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
	AvatarSwitcherEntryPoint = if not FFlagEnableInExperienceAvatarSwitcher then nil else require(script.AvatarSwitcher.AvatarSwitcherEntrypoint),
	MusicEntrypoint = require(script.MusicUtility.MusicEntrypoint),
	PartyMic = require(script.Party.PartyMic),
	VRToggleButton = if not isInExperienceUIVREnabled or not isSpatial() then nil else require(script.VRToggleButton),
	VRSafeBubble = if not isInExperienceUIVREnabled or not isSpatial() then nil else require(script.VRSafeBubble),
	People = if not FFlagAddIGMToSideSheet then nil else require(script.Pages.People),
	Settings = if not FFlagAddIGMToSideSheet then nil else require(script.Pages.Settings),
	Gallery = if not FFlagAddIGMToSideSheet then nil else require(script.Pages.Gallery),
	Help = if not FFlagAddIGMToSideSheet then nil else require(script.Pages.Help)
}

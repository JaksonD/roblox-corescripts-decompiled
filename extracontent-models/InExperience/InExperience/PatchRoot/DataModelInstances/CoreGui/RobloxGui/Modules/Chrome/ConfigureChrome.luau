local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")

if not require(CorePackages.Workspace.Packages.Chrome).Enabled() then
	return nil
end

local Service = require(Chrome.Service)
local Constants = require(Chrome.Integrations.Party.Constants)
local isConnectUnibarEnabled = require(Chrome.Integrations.Connect.isConnectUnibarEnabled)
local isConnectDropdownEnabled = require(Chrome.Integrations.Connect.isConnectDropdownEnabled)
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local ConfigureShortcuts = require(Chrome.ChromeShared.Shortcuts.ConfigureShortcuts)
local Constants2 = require(Chrome.ChromeShared.Unibar.Constants)
local SharedFlags = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagDebugEnableUnibarDummyIntegrations = SharedFlags.GetFFlagDebugEnableUnibarDummyIntegrations
local FFlagEnableConsoleExpControls = SharedFlags.FFlagEnableConsoleExpControls
local FFlagEnableInExperienceAvatarSwitcher = SharedFlags.FFlagEnableInExperienceAvatarSwitcher
local FFlagEnableSideSheet = SharedFlags.FFlagEnableSideSheet
local FFlagAddIGMToSideSheet = SharedFlags.FFlagAddIGMToSideSheet
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial

require(Chrome.Integrations)

if FFlagEnableConsoleExpControls then
	ConfigureShortcuts()
end;

(function() --[[ configureUnibar ]] -- line: 37
	-- upvalues: isConnectDropdownEnabled (copy), GetFFlagDebugEnableUnibarDummyIntegrations (copy), isConnectUnibarEnabled (copy), Constants (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), Service (copy), FFlagEnableInExperienceAvatarSwitcher (copy), Constants2 (copy), GuiService (copy), FFlagEnableSideSheet (copy), FFlagAddIGMToSideSheet (copy)
	local t1 = {
		"leaderboard",
		"emotes",
		"backpack"
	}

	table.insert(t1, "respawn")
	table.insert(t1, 1, "trust_and_safety")

	if isConnectDropdownEnabled() then
		table.insert(t1, 1, "connect_dropdown")
	end

	local t2 = {
		"toggle_mic_mute",
		"chat",
		"nine_dot"
	}

	table.insert(t2, 2, "join_voice")

	if GetFFlagDebugEnableUnibarDummyIntegrations() then
		table.insert(t2, 1, "dummy_window")
		table.insert(t2, 1, "dummy_window_2")
	end

	if isConnectUnibarEnabled() then
		table.insert(t2, 1, "connect_unibar")
	end

	local v20 = table.find(t2, "toggle_mic_mute")

	if v20 then
		table.insert(t2, v20 + 1, Constants.TOGGLE_MIC_INTEGRATION_ID)
	end

	if isInExperienceUIVREnabled and isSpatial() then
		Service:configureMenu({
			{
				"vr_toggle_button",
				"vr_safety_bubble"
			},
			t2
		})
	else
		Service:configureMenu({ t2 })
	end

	if isInExperienceUIVREnabled then
		if not isSpatial() then
			table.insert(t1, 2, "camera_entrypoint")
			table.insert(t1, 2, "selfie_view")
		end
	else
		table.insert(t1, 2, "camera_entrypoint")
		table.insert(t1, 2, "selfie_view")
	end

	if FFlagEnableInExperienceAvatarSwitcher then
		table.insert(t1, 3, Constants2.AVATAR_SWITCHER_ID)
	end

	if not isSpatial() and not GuiService:IsTenFootInterface() then
		table.insert(t1, 4, "music_entrypoint")
	end

	if FFlagEnableSideSheet and FFlagAddIGMToSideSheet then
		table.insert(t1, "people")
		table.insert(t1, "settings")
		table.insert(t1, "gallery")
		table.insert(t1, "help")
	end

	Service:configureSubMenu("nine_dot", t1)
end)()

return nil

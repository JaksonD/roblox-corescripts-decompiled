local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local Service = require(Chrome.Service)
local ChromeUtils = require(Chrome.ChromeShared.Service.ChromeUtils)
local ChromeIntegrationUtils = require(Chrome.Integrations.ChromeIntegrationUtils)
local RespawnUtils = require(Chrome.Integrations.RespawnUtils)
local MappedSignal = ChromeUtils.MappedSignal
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local CommonIcon = require(Chrome.Integrations.CommonIcon)
local CommonFtuxTooltip = require(Chrome.Integrations.CommonFtuxTooltip)
local AvatarSwitcherFtuxTooltip = require(Chrome.Integrations.AvatarSwitcher.AvatarSwitcherFtuxTooltip)
local VRService = game:GetService("VRService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local PlayerListManager = require(RobloxGui.Modules.PlayerList.PlayerListManager)
local EmotesMenuMaster = require(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v19 = if not FFlagEnableNewBackpack then nil else require(CorePackages.Workspace.Packages.System).Features
local v20 = if FFlagEnableNewBackpack then nil else require(RobloxGui.Modules.BackpackScript)
local useMappedSignal = require(Chrome.ChromeShared.Hooks.useMappedSignal)
local GetFFlagIsSquadEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local UIBlox = require(CorePackages.Packages.UIBlox)
local Images = UIBlox.App.ImageSet.Images
local useStyle = UIBlox.Core.Style.useStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Constants = require(Chrome.ChromeShared.Unibar.Constants)
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local SelfieView = require(RobloxGui.Modules.SelfieView)
local GetFStringConnectTooltipLocalStorageKey = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local GetFIntRobloxConnectFtuxShowDelayMs = require(Chrome.Flags.GetFIntRobloxConnectFtuxShowDelayMs)
local GetFIntRobloxConnectFtuxDismissDelayMs = require(Chrome.Flags.GetFIntRobloxConnectFtuxDismissDelayMs)
local GetFFlagEnableAppChatInExperience = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local GetShouldShowPlatformChatBasedOnPolicy = require(Chrome.Flags.GetShouldShowPlatformChatBasedOnPolicy)
local v35 = game:DefineFastFlag("FixIntegrationActivated1", false)
local v36 = game:DefineFastFlag("FixInventoryFilledIcon", false)
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(Chrome.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v38 = game:DefineFastFlag("AppChatEnabledChromeDropdownFtuxTooltip", false)
local v39 = game:DefineFastFlag("AvatarSwitcherFtuxTooltip", false)
local v40 = game:DefineFastInt("UnibarConnectTooltipPriority", 2000)
local v41 = GetFFlagEnableAppChatInExperience() and (v38 and GetShouldShowPlatformChatBasedOnPolicy())
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local SELFIE_VIEW_ID = Constants.SELFIE_VIEW_ID
local v45 = MappedSignal.new(PlayerListManager:GetSetVisibleChangedEvent().Event, function() -- line: 67
	-- upvalues: PlayerListManager (copy)
	return PlayerListManager:GetSetVisible()
end)
local v46 = Service:register({
	id = "leaderboard",
	label = "CoreScripts.TopBar.Leaderboard",
	sideSheetPlacement = SideSheetPlacement.Vertical,
	activated = function(_) --[[ activated ]] -- line: 75
		-- upvalues: isInExperienceUIVREnabled (copy), VRService (copy), RobloxGui (copy), PlayerListManager (copy), isSpatial (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtils (copy)
		if not isInExperienceUIVREnabled and VRService.VREnabled then
			require(RobloxGui.Modules.InGameMenu).openPlayersPage()

			return
		end

		if PlayerListManager:GetSetVisible() then
			PlayerListManager:SetVisibility(not PlayerListManager:GetSetVisible())

			return
		end

		if isInExperienceUIVREnabled and isSpatial() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			PlayerListManager:SetVisibility(not PlayerListManager:GetSetVisible())

			return
		end

		ChromeIntegrationUtils.dismissRobloxMenuAndRun(function() -- line: 86
			-- upvalues: PlayerListManager (copy)
			PlayerListManager:SetVisibility(not PlayerListManager:GetSetVisible())
		end)
	end,
	isActivated = function() --[[ isActivated ]] -- line: 93
		-- upvalues: v45 (copy)
		return v45:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 97
			-- upvalues: CommonIcon (copy), v45 (copy)
			return CommonIcon("icons/controls/leaderboardOff", "icons/controls/leaderboardOn", v45)
		end
	}
})

ChromeUtils.setCoreGuiAvailability(v46, Enum.CoreGuiType.PlayerList)

local v47 = MappedSignal.new(EmotesMenuMaster.EmotesMenuToggled.Event, function() -- line: 104
	-- upvalues: EmotesMenuMaster (copy)
	return EmotesMenuMaster:isOpen()
end)
local v48 = Service:register({
	id = "emotes",
	label = "CoreScripts.TopBar.Emotes",
	sideSheetPlacement = SideSheetPlacement.Vertical,
	activated = function(_) --[[ activated ]] -- line: 111
		-- upvalues: EmotesMenuMaster (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtils (copy)
		if EmotesMenuMaster:isOpen() then
			EmotesMenuMaster:close()

			return
		end

		if isInExperienceUIVREnabled and isSpatial() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			EmotesMenuMaster:open()

			return
		end

		ChromeIntegrationUtils.dismissRobloxMenuAndRun(function() -- line: 118
			-- upvalues: EmotesMenuMaster (copy)
			EmotesMenuMaster:open()
		end)
	end,
	isActivated = function() --[[ isActivated ]] -- line: 124
		-- upvalues: v47 (copy)
		return v47:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 128
			-- upvalues: CommonIcon (copy), v47 (copy)
			return CommonIcon("icons/controls/emoteOff", "icons/controls/emoteOn", v47)
		end
	}
})
local u49 = false
local MenuIsVisible = EmotesMenuMaster.MenuIsVisible

function updateEmoteAvailability() -- line: 137
	-- upvalues: u49 (ref), MenuIsVisible (ref), v48 (copy)
	if u49 and MenuIsVisible then
		v48.availability:available()

		return
	end

	v48.availability:unavailable()
end

ChromeUtils.setCoreGuiAvailability(v48, Enum.CoreGuiType.EmotesMenu, function(p5) -- line: 145
	-- upvalues: u49 (ref)
	u49 = p5
	updateEmoteAvailability()
end)
EmotesMenuMaster.MenuVisibilityChanged.Event:Connect(function() -- line: 150
	-- upvalues: MenuIsVisible (ref), EmotesMenuMaster (copy)
	MenuIsVisible = EmotesMenuMaster.MenuIsVisible
	updateEmoteAvailability()
end)

local v51 = if FFlagEnableNewBackpack then nil else MappedSignal.new(v20.StateChanged.Event, function() -- line: 156
	-- upvalues: v20 (copy)
	return v20.IsOpen
end)
local v52 = Service:register({
	id = "backpack",
	label = "CoreScripts.TopBar.Inventory",
	sideSheetPlacement = SideSheetPlacement.Vertical,
	activated = function(_) --[[ activated ]] -- line: 164
		-- upvalues: FFlagEnableNewBackpack (copy), v19 (copy), isInExperienceUIVREnabled (copy), isSpatial (copy), InExperienceUIVRIXP (copy), ChromeIntegrationUtils (copy), v20 (copy)
		if FFlagEnableNewBackpack then
			if v19.getVisibility(v19.FeatureName.Backpack) then
				v19.toggleVisibility(v19.FeatureName.Backpack)

				return
			end

			if isInExperienceUIVREnabled and isSpatial() and not InExperienceUIVRIXP:isMovePanelToCenter() then
				v19.toggleVisibility(v19.FeatureName.Backpack)

				return
			end

			ChromeIntegrationUtils.dismissRobloxMenuAndRun(function() -- line: 172
				-- upvalues: v19 (copy)
				v19.toggleVisibility(v19.FeatureName.Backpack)
			end)

			return
		end

		if v20.IsOpen then
			v20:OpenClose()

			return
		end

		if isInExperienceUIVREnabled and isSpatial() and not InExperienceUIVRIXP:isMovePanelToCenter() then
			v20:OpenClose()

			return
		end

		ChromeIntegrationUtils.dismissRobloxMenuAndRun(function() -- line: 184
			-- upvalues: v20 (copy)
			v20:OpenClose()
		end)
	end,
	isActivated = function() --[[ isActivated ]] -- line: 191
		-- upvalues: FFlagEnableNewBackpack (copy), v19 (copy), v51 (copy)
		if FFlagEnableNewBackpack then
			return v19.getVisibility(v19.FeatureName.Backpack)
		end

		return v51:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 198
			-- upvalues: CommonIcon (copy), v36 (copy), v51 (copy)
			return CommonIcon("icons/menu/inventoryOff", not v36 and "icons/menu/inventory" or "icons/menu/inventoryOn", v51)
		end
	}
})

ChromeUtils.setCoreGuiAvailability(v52, Enum.CoreGuiType.Backpack)

local v53 = Service:register({
	id = "respawn",
	label = "CoreScripts.InGameMenu.QuickActions.Respawn",
	sideSheetPlacement = SideSheetPlacement.Vertical,
	activated = function(_) --[[ activated ]] -- line: 213
		-- upvalues: RespawnUtils (copy)
		RespawnUtils.respawnPage()
	end,
	isActivated = function() --[[ isActivated ]] -- line: 216
		-- upvalues: RespawnUtils (copy)
		return RespawnUtils.respawnPageOpenSignal:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 220
			-- upvalues: CommonIcon (copy)
			return CommonIcon("icons/actions/respawn")
		end
	}
})

function updateRespawn(p10) -- line: 226
	-- upvalues: v53 (copy)
	if p10 then
		v53.availability:available()

		return
	end

	v53.availability:unavailable()
end

task.defer(function() -- line: 234
	-- upvalues: RobloxGui (copy)
	local SettingsHub = require(RobloxGui.Modules.Settings.SettingsHub)

	SettingsHub.RespawnBehaviourChangedEvent.Event:connect(updateRespawn)
	updateRespawn(SettingsHub:GetRespawnBehaviour())
end)

local v54 = Service:currentSubMenu()
local v55 = MappedSignal.new(v54:signal(), function() -- line: 241
	-- upvalues: v54 (copy)
	return v54:get() == "nine_dot"
end)

if Service:orderAlignment():get() == Enum.HorizontalAlignment.Right then
	v55:connect(function(p11) -- line: 246
		-- upvalues: PlayerListManager (copy)
		PlayerListManager:SetMinimized(p11)
	end)
end

function HamburgerButton(p12) -- line: 251
	-- upvalues: useStyle (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), Constants (copy), v55 (copy), useMappedSignal (copy), v41 (copy), CommonFtuxTooltip (copy), v40 (copy), GetFFlagIsSquadEnabled (copy), GetFStringConnectTooltipLocalStorageKey (copy), GetFIntRobloxConnectFtuxShowDelayMs (copy), GetFIntRobloxConnectFtuxDismissDelayMs (copy), React (copy), ImageSetLabel (copy), Images (copy), SelfieView (copy), Service (copy), SELFIE_VIEW_ID (copy), v39 (copy), AvatarSwitcherFtuxTooltip (copy)
	local toggleTransition = p12.toggleTransition
	local v70 = useStyle()
	local ICON_SIZE, MEDIUM_ICON_SIZE

	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local v71 = UnibarStyle.use()

		ICON_SIZE = v71.ICON_SIZE
		MEDIUM_ICON_SIZE = v71.MEDIUM_ICON_SIZE
	else
		ICON_SIZE = Constants.ICON_SIZE
		MEDIUM_ICON_SIZE = Constants.MEDIUM_ICON_SIZE
	end

	local v74 = not not v55 and (useMappedSignal(v55) or false)
	local v75 = if not v41 then nil else CommonFtuxTooltip({
		id = "CONNECT_TOOLTIP",
		priority = v40,
		isIconVisible = p12.visible,
		headerKey = not GetFFlagIsSquadEnabled() and "CoreScripts.FTUX.Heading.CheckOutRobloxConnect" or "CoreScripts.FTUX.Heading.CheckOutRobloxParty",
		bodyKey = not GetFFlagIsSquadEnabled() and "CoreScripts.FTUX.Label.ChatWithYourFriendsAnytime" or "CoreScripts.FTUX.Label.PartyWithYourFriendsAnytime",
		localStorageKey = GetFStringConnectTooltipLocalStorageKey(),
		showDelay = GetFIntRobloxConnectFtuxShowDelayMs(),
		dismissDelay = GetFIntRobloxConnectFtuxDismissDelayMs()
	})

	return React.createElement("Frame", {
		Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
		BorderSizePixel = 0,
		BackgroundColor3 = v70.Theme.BackgroundOnHover.Color,
		BackgroundTransparency = toggleTransition:map(function(p13) -- line: 292
			-- upvalues: v70 (copy)
			return 1 - (1 - v70.Theme.BackgroundOnHover.Transparency) * p13
		end)
	}, {
		React.createElement("UICorner", {
			Name = "Corner",
			CornerRadius = UDim.new(1, 0)
		}),
		React.createElement(ImageSetLabel, {
			Name = "Overflow",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 1,
			Image = Images["icons/common/hamburgermenu"],
			Size = toggleTransition:map(function(p14) -- line: 306
				-- upvalues: ICON_SIZE (ref)
				local v79 = 1 - p14

				return UDim2.new(0, ICON_SIZE * v79, 0, ICON_SIZE * v79)
			end),
			ImageColor3 = v70.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p15) -- line: 312
				-- upvalues: v70 (copy)
				return p15 * v70.Theme.IconEmphasis.Transparency
			end)
		}),
		React.createElement(ImageSetLabel, {
			Name = "Close",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 1,
			Image = Images["icons/navigation/close"],
			Size = toggleTransition:map(function(p16) -- line: 322
				-- upvalues: MEDIUM_ICON_SIZE (ref)
				return UDim2.new(0, MEDIUM_ICON_SIZE * p16, 0, MEDIUM_ICON_SIZE * p16)
			end),
			ImageColor3 = v70.Theme.IconEmphasis.Color,
			ImageTransparency = toggleTransition:map(function(p17) -- line: 327
				-- upvalues: v70 (copy)
				return (1 - p17) * v70.Theme.IconEmphasis.Transparency
			end)
		}),
		if not SelfieView.useCameraOn() or (Service:isWindowOpen(SELFIE_VIEW_ID) or v74) then nil else React.createElement(SelfieView.CameraStatusDot, {
			Name = "CameraStatusDot",
			Position = UDim2.new(1, -4, 1, -7),
			ZIndex = 2
		}),
		v75,
		if not v39 then nil else React.createElement(AvatarSwitcherFtuxTooltip, {
			visible = p12.visible
		})
	})
end

return Service:register({
	initialAvailability = Service.AvailabilitySignal.Pinned,
	id = "nine_dot",
	label = "CoreScripts.TopBar.MoreMenu",
	sideSheetPlacement = SideSheetPlacement.None,
	isActivated = if not v35 then nil else function() -- line: 355
		-- upvalues: v55 (copy)
		return v55:get()
	end,
	components = {
		Icon = function(p18) --[[ Icon ]] -- line: 360
			-- upvalues: React (copy)
			return React.createElement(HamburgerButton, p18)
		end
	}
})

local GameTile = script:FindFirstAncestor("GameTile")
local GameTileParent = GameTile.Parent
local Cryo = require(GameTileParent.Cryo)
local RoactServices = require(GameTileParent.RoactServices).RoactServices
local RoactServiceTags = require(GameTileParent.RoactServiceTags)
local AppSessionService = RoactServiceTags.AppSessionService
local RoactNetworking = RoactServiceTags.RoactNetworking
local Roact = require(GameTileParent.Roact)
local RoactRodux = require(GameTileParent.RoactRodux)
local t = require(GameTileParent.t)
local ButtonSize = require(GameTileParent.Foundation).Enums.ButtonSize
local UIBlox = require(GameTileParent.UIBlox)
local ExperienceActionRow = UIBlox.App.Tile.ExperienceActionRow
local Images = UIBlox.App.ImageSet.Images
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local MenuDirection = UIBlox.App.Menu.MenuDirection
local RobloxAppSessionization = require(GameTileParent.RobloxAppSessionization)
local SetGamePlaySession = RobloxAppSessionization.SetGamePlaySession
local SessionType = RobloxAppSessionization.SessionType
local withLocalization = require(GameTileParent.Localization).withLocalization
local GamePlayButton = require(GameTileParent.GamePlayButton)
local PlayButton = GamePlayButton.PlayButton
local PlayButtonStates = GamePlayButton.PlayButtonStates
local usePlayButtonState = GamePlayButton.usePlayButtonState
local useOnPlaySquadButtonCallback = GamePlayButton.useOnPlaySquadButtonCallback
local useOnPlayButtonCallback = GamePlayButton.useOnPlayButtonCallback
local useRoactService = require(GameTileParent.RobloxAppHooks).useRoactService
local GamesProductInfoReducer = require(GameTileParent.GameProductInfoRodux).GamesProductInfoReducer
local CentralOverlayType = require(GameTileParent.RobloxAppEnums).CentralOverlayType
local CloseCentralOverlay = require(GameTileParent.CentralOverlay).Thunks.CloseCentralOverlay
local AppUserLayers = require(GameTileParent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(GameTileParent.RoactAppExperiment).useUserExperiment
local GetFFlagIsSquadEnabled = require(GameTileParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppEnablePlaySquadButton = require(GameTileParent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagLuaAppEnablePlayableStateWhenLoading = require(GameTileParent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local FFlagLuaAppUnifyPlayButtonTile = require(GameTileParent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppUnifyPlayButtonTileIxp = require(GameTileParent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(GameTileParent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagLuaAppCustomSpawnNonNilCheck = require(GameTileParent.SharedFlags).FFlagLuaAppCustomSpawnNonNilCheck
local FFlagUpdateActionNeededPlayButtonUi = require(GameTileParent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local GameTileExperimentation = require(GameTile.GameTileExperimentation)
local v42 = if not FFlagLuaAppUnifyPlayButtonTile then nil else 40
local v43 = Roact.PureComponent:extend("AppExperienceActionRow")

v43.validateProps = t.strictInterface({
	universeId = t.string,
	launchExperienceEventContext = t.optional(t.string),
	referralSource = t.optional(t.string),
	launchSource = t.string,
	reportExperienceLaunched = t.optional(t.callback),
	entry = t.table,
	openGameDetails = t.callback,
	horizontalPadding = t.optional(t.number),
	verticalPadding = t.optional(t.number),
	height = t.optional(t.number),
	fetchDelayInSeconds = t.optional(t.number),
	index = t.optional(t.number),
	showButtonText = t.optional(t.boolean),
	width = if not FFlagLuaAppUnifyPlayButtonTile then nil else t.optional(t.UDim),
	placeIdOverride = t.optional(t.string),
	launchDataOverride = t.optional(t.string),
	price = t.optional(t.number),
	centralOverlayType = t.optional(t.string),
	closeCentralOverlay = t.optional(t.callback),
	playButtonState = t.string,
	playabilityStatus = t.optional(t.table),
	onPlayButtonActivated = t.callback,
	onPlaySquadButtonActivated = t.optional(t.callback),
	sessionService = t.optional(t.union(t.Instance, t.table)),
	isUnifiedGameTileEnabled = t.optional(t.boolean),
	hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean),
	unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else t.optional(t.boolean)
})

function v43.init(p1) -- line: 107
	-- upvalues: SetGamePlaySession (copy), SessionType (copy), FFlagLuaAppUnifyPlayButtonTile (copy)
	function p1.onPlayPressed() -- line: 108
		-- upvalues: p1 (copy), SetGamePlaySession (copy), SessionType (copy)
		if p1:requiresPurchase() or p1:requiresFiatPurchase() then
			p1.props.openGameDetails()

			return
		end

		if p1:isButtonEnabled() then
			SetGamePlaySession(p1.props.sessionService, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)

			local v81 = if not p1.props.reportExperienceLaunched then nil else p1.reportExperienceLaunched

			p1.props.onPlayButtonActivated(p1.props.playButtonState, v81)
		end
	end
	function p1.reportExperienceLaunched() -- line: 122
		-- upvalues: FFlagLuaAppUnifyPlayButtonTile (copy), SetGamePlaySession (copy), p1 (copy), SessionType (copy)
		if FFlagLuaAppUnifyPlayButtonTile then
			SetGamePlaySession(p1.props.sessionService, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end

		p1.props.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, p1.props.launchSource, p1.props.launchExperienceEventContext, p1.props.index)
	end
end
function v43.willUnmount(p2) -- line: 137
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), CentralOverlayType (copy)
	if FFlagLuaAppEnablePlaySquadButton and p2.props.centralOverlayType == CentralOverlayType.GameDetailsSquad then
		p2.props.closeCentralOverlay()
	end
end
function v43.render(p3) -- line: 144
	-- upvalues: FFlagLuaAppUnifyPlayButtonTile (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppUnifyPlayButtonTileIxp (copy), GameTileExperimentation (copy), withLocalization (copy), Roact (copy), PlayButton (copy), ButtonSize (copy), v42 (copy), FFlagUpdateActionNeededPlayButtonUi (copy), ExperienceActionRow (copy), FFlagLuaAppEnablePlaySquadButton (copy)
	if FFlagLuaAppUnifyPlayButtonTile then
		local isUnifiedGameTileEnabled = p3.props.isUnifiedGameTileEnabled
		local v51 = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and p3.props.hasUnifiedPlayButtonIxp or FFlagLuaAppUnifyPlayButtonTileIxp and GameTileExperimentation.getIsPlayButtonMigrationEnabled()

		if isUnifiedGameTileEnabled and (not FFlagLuaAppUnifyPlayButtonTileIxp and not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v51) then
			local v52 = p3.props.horizontalPadding or 0
			local v53 = p3.props.verticalPadding or 0

			return withLocalization({
				buyText = "Feature.ExperienceDetails.PlayButtonText.Buy"
			})(function(p4) -- line: 164
				-- upvalues: Roact (copy), PlayButton (copy), p3 (copy), ButtonSize (copy), v42 (copy), v52 (copy), v53 (copy)
				return Roact.createElement(PlayButton, {
					universeId = p3.props.universeId,
					placeId = p3.props.placeIdOverride,
					referralSource = p3.props.referralSource,
					eventContext = p3.props.launchExperienceEventContext,
					launchSource = p3.props.launchSource,
					experienceJoinData = if not p3.props.launchDataOverride then nil else {
						launchData = p3.props.launchDataOverride
					},
					reportExperienceLaunched = p3.reportExperienceLaunched,
					fiatText = p4.buyText,
					hideOptionalText = not p3.props.showButtonText,
					buttonSize = ButtonSize.Medium,
					isPlayableWhenLoading = true,
					useUIBloxButton = p3.props.unifyToUIBloxIxp,
					onPurchaseRequiredCallback = p3.props.openGameDetails,
					fillBehavior = if p3.props.width then nil else "Fill",
					width = p3.props.width,
					squadButtonHeight = UDim.new(0, v42),
					Position = UDim2.new(0, v52, 1, -v53 - v42)
				})
			end)
		end
	end

	return withLocalization({
		actionNeededText = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlockText = if not FFlagUpdateActionNeededPlayButtonUi then nil else "Feature.ExperienceDetails.PlayButtonText.Unlock",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy"
	})(function(p5) -- line: 198
		-- upvalues: Roact (copy), ExperienceActionRow (copy), p3 (copy), FFlagLuaAppEnablePlaySquadButton (copy)
		return Roact.createElement(ExperienceActionRow, {
			isActionable = p3:isButtonEnabled(),
			text = p3:getButtonText(p5),
			icon = p3:getButtonIcon(),
			buttonType = p3:getButtonType(),
			onPlayPressed = p3.onPlayPressed,
			onOverflowPressed = if not FFlagLuaAppEnablePlaySquadButton or not p3:isOverflowButtonVisible() then nil else p3.props.onPlaySquadButtonActivated,
			horizontalPadding = p3.props.horizontalPadding,
			verticalPadding = p3.props.verticalPadding,
			height = p3.props.height
		})
	end)
end
function v43.isOverflowButtonVisible(p6) -- line: 215
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy)
	return FFlagLuaAppEnablePlaySquadButton and (p6.props.playButtonState == PlayButtonStates.PlayableWithParty or p6.props.playButtonState == PlayButtonStates.WaitingForParty)
end
function v43.isButtonEnabled(p7) -- line: 225
	-- upvalues: FFlagLuaAppEnablePlayableStateWhenLoading (copy), GetFFlagIsSquadEnabled (copy), PlayButtonStates (copy)
	if FFlagLuaAppEnablePlayableStateWhenLoading and (p7.props.playabilityStatus == nil and GetFFlagIsSquadEnabled() and p7.props.playButtonState == PlayButtonStates.WaitingForParty) then
		return false
	end

	return p7.props.playabilityStatus == nil or (p7.props.playButtonState == PlayButtonStates.Playable or (p7.props.playButtonState == PlayButtonStates.Loading or (GetFFlagIsSquadEnabled() and p7.props.playButtonState == PlayButtonStates.PlayableWithParty or (p7:isActionNeeded() or (p7:requiresPurchase() or p7:requiresFiatPurchase())))))
end
function v43.requiresFiatPurchase(p8) -- line: 250
	-- upvalues: PlayButtonStates (copy)
	return p8.props.playButtonState == PlayButtonStates.FiatPaidAccess
end
function v43.requiresPurchase(p9) -- line: 254
	-- upvalues: PlayButtonStates (copy)
	return p9.props.playButtonState == PlayButtonStates.PaidAccess
end
function v43.isActionNeeded(p10) -- line: 258
	-- upvalues: PlayButtonStates (copy)
	return p10.props.playButtonState == PlayButtonStates.ActionNeeded
end
function v43.getButtonText(p11, p12) -- line: 262
	-- upvalues: FFlagUpdateActionNeededPlayButtonUi (copy), FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy)
	if p11.props.showButtonText then
		if not FFlagUpdateActionNeededPlayButtonUi and p11:isActionNeeded() then
			return p12.actionNeededText
		end

		if not p11:isButtonEnabled() then
			if FFlagLuaAppEnablePlaySquadButton and p11.props.playButtonState == PlayButtonStates.WaitingForParty then
				return nil
			end

			return p12.unavailableText
		end
	end

	if FFlagUpdateActionNeededPlayButtonUi and p11:isActionNeeded() then
		return p12.unlockText
	end

	if p11:requiresPurchase() then
		return (tostring(p11.props.price or "--"))
	end

	if p11:requiresFiatPurchase() then
		return p12.buyText
	end

	return nil
end
function v43.getButtonType(p13) -- line: 290
	-- upvalues: FFlagUpdateActionNeededPlayButtonUi (copy), ButtonType (copy)
	if not FFlagUpdateActionNeededPlayButtonUi and p13:isActionNeeded() then
		return ButtonType.PrimarySystem
	end

	if not p13:isButtonEnabled() then
		return ButtonType.Secondary
	end

	return ButtonType.PrimaryContextual
end
function v43.getButtonIcon(p14) -- line: 300
	-- upvalues: FFlagUpdateActionNeededPlayButtonUi (copy), Images (copy), FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy)
	if not FFlagUpdateActionNeededPlayButtonUi and p14:isActionNeeded() then
		return Images["icons/status/private"]
	end

	if p14:requiresPurchase() then
		return Images["icons/common/robux"]
	end

	if p14:requiresFiatPurchase() or FFlagUpdateActionNeededPlayButtonUi and p14:isActionNeeded() then
		return nil
	end

	if not p14:isButtonEnabled() then
		if FFlagLuaAppEnablePlaySquadButton and p14.props.playButtonState == PlayButtonStates.WaitingForParty then
			return Images["icons/common/play"]
		end

		return Images["icons/status/unavailable"]
	end

	return Images["icons/common/play"]
end

local v44 = v43
local v45 = RoactRodux.connect(function(p15, p16) -- line: 387
	-- upvalues: GamesProductInfoReducer (copy), FFlagLuaAppEnablePlaySquadButton (copy)
	local universeId = p16.universeId
	local v79 = if not p15[GamesProductInfoReducer.key] then nil else p15[GamesProductInfoReducer.key][universeId]

	return {
		price = if v79 == nil then nil else v79.price,
		centralOverlayType = if not FFlagLuaAppEnablePlaySquadButton then nil else p15.CentralOverlay.OverlayType
	}
end, function(p17) -- line: 396
	-- upvalues: CloseCentralOverlay (copy)
	return {
		closeCentralOverlay = function() --[[ closeCentralOverlay ]] -- line: 398
			-- upvalues: p17 (copy), CloseCentralOverlay (copy)
			return p17(CloseCentralOverlay())
		end
	}
end)(function(p18) -- line: 319
	-- upvalues: useRoactService (copy), RoactNetworking (copy), usePlayButtonState (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), FFlagLuaAppCustomSpawnNonNilCheck (copy), useOnPlayButtonCallback (copy), FFlagLuaAppEnablePlaySquadButton (copy), useOnPlaySquadButtonCallback (copy), MenuDirection (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), useUserExperiment (copy), AppUserLayers (copy), Cryo (copy), PlayButtonStates (copy), Roact (copy), v44 (copy)
	local v64 = useRoactService(RoactNetworking)
	local v65 = usePlayButtonState(v64, p18.universeId, p18.fetchDelayInSeconds, not not FFlagLuaAppEnablePlayableStateWhenLoading or nil)
	local t1 = nil

	if FFlagLuaAppCustomSpawnNonNilCheck then
		if p18.launchDataOverride then
			t1 = {
				launchData = p18.launchDataOverride
			}
		end
	else
		t1 = {}

		if p18.launchDataOverride then
			t1.launchData = p18.launchDataOverride
		end
	end

	local v67 = useOnPlayButtonCallback(p18.universeId, p18.referralSource, p18.launchExperienceEventContext or "PlayButton", nil, p18.launchSource or "UnknownLaunchSource", t1, p18.placeIdOverride)
	local v68 = if not FFlagLuaAppEnablePlaySquadButton then nil else useOnPlaySquadButtonCallback(MenuDirection.Up, v65.playButtonState, p18.referralSource, p18.universeId)
	local v69 = nil
	local v70 = nil

	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v69, v70 = useUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p19) -- line: 364
			-- upvalues: AppUserLayers (copy)
			local v85 = p19[AppUserLayers.PlayButtonUXExposureLayer] or {}

			return v85.HasUnifiedPlayButton, v85.UnifyToUIBlox
		end, true)
	end

	local join = Cryo.Dictionary.join
	local t2 = {
		playabilityStatus = v65.playabilityStatus,
		onPlayButtonActivated = v67,
		onPlaySquadButtonActivated = v68
	}
	local playButtonState

	if FFlagLuaAppEnablePlayableStateWhenLoading then
		playButtonState = v65.playButtonState
	else
		local playButtonState2 = v65.playButtonState

		playButtonState = if playButtonState2 ~= PlayButtonStates.Loading then playButtonState2 else PlayButtonStates.Playable
	end

	t2.playButtonState = playButtonState
	t2.hasUnifiedPlayButtonIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v69
	t2.unifyToUIBloxIxp = if not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then nil else v70

	local v75 = join(p18, t2)

	return Roact.createElement(v44, v75)
end)

return (RoactServices.connect({
	sessionService = AppSessionService
})(v45))

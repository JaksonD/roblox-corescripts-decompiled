local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local tutils = require(Parent.tutils)
local React = require(Parent.React)
local useRoactService = require(Parent.RobloxAppHooks).useRoactService
local useSelector = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local UIBlox = require(Parent.UIBlox)
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ComboButton = UIBlox.App.Button.ComboButton
local Images = UIBlox.App.ImageSet.Images
local MenuDirection = UIBlox.App.Menu.MenuDirection
local Foundation = require(Parent.Foundation)
local Button2 = Foundation.Button
local IconButton = Foundation.IconButton
local Skeleton = Foundation.Skeleton
local ButtonVariant = Foundation.Enums.ButtonVariant
local InputSize = Foundation.Enums.InputSize
local EnumsRadius = Foundation.Enums.Radius
local useTokens = Foundation.Hooks.useTokens
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local useOnPlayButtonCallback = require(script.Parent.useOnPlayButtonCallback)
local useOnPlaySquadButtonCallback = require(script.Parent.useOnPlaySquadButtonCallback)
local usePlayButtonState = require(script.Parent.usePlayButtonState)
local PlayButtonStates = require(script.Parent.PlayButtonStates)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(Parent.RoactAppExperiment).useUserExperiment
local GetFFlagIsSquadEnabled = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppSupportUnifiedUIBloxPlayButton = require(Parent.SharedFlags).FFlagLuaAppSupportUnifiedUIBloxPlayButton
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local v32 = game:DefineFastFlag("LuaAppJoinTextPlayableButton", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local v33 = game:DefineFastFlag("LuaAppIconPlayButton", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local v34 = FFlagLuaAppSupportUnifiedUIBloxPlayButton and (game:DefineFastFlag("LuaAppPlayButtonLoadingSkeleton3", false) or FFlagLuaAppUnifyPlayButtonAllSurfacesIxp)
local v35 = game:DefineFastFlag("LuaAppFixPlayButtonDefaultLaunchSource", false)
local FFlagUpdateActionNeededPlayButtonUi = require(Parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local FFlagLuaAppUnifiedPlayButtonSquadMenuDirection = require(Parent.SharedFlags).FFlagLuaAppUnifiedPlayButtonSquadMenuDirection
local v38 = if not v33 then nil else "play-xlarge"
local v39 = Images["icons/common/play"]
local v40 = Images["icons/actions/truncationCollapse"]
local v41 = Images["icons/actions/truncationExpand"]

local function v42() -- line: 65
end

local t1 = {
	[InputSize.XSmall] = "Size_600",
	[InputSize.Small] = "Size_800",
	[InputSize.Medium] = "Size_1000",
	[InputSize.Large] = "Size_1200"
}

return React.memo(function(t2: {[any]: any}) --[[ PlayButton ]] -- line: 144
	-- upvalues: React (copy), useRoactService (copy), RoactNetworking (copy), useSelector (copy), GamesProductInfoReducer (copy), tutils (copy), usePlayButtonState (copy), useOnPlayButtonCallback (copy), v35 (copy), FFlagLuaAppUnifiedPlayButtonSquadMenuDirection (copy), MenuDirection (copy), useOnPlaySquadButtonCallback (copy), PlayButtonStates (copy), useLocalization (copy), FFlagUpdateActionNeededPlayButtonUi (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), useUserExperiment (copy), AppUserLayers (copy), FFlagLuaAppSupportUnifiedUIBloxPlayButton (copy), useTokens (copy), InputSize (copy), v34 (copy), t1 (copy), Skeleton (copy), EnumsRadius (copy), ButtonVariant (copy), v32 (copy), v33 (copy), v38 (copy), GetFFlagIsSquadEnabled (copy), v39 (copy), ComboButton (copy), v41 (copy), v40 (copy), ButtonType (copy), Images (copy), Button (copy), v42 (copy), IconButton (copy), Button2 (copy)
	local v45 = React.useRef(false)

	React.useEffect(function() -- line: 146
		-- upvalues: v45 (copy)
		v45.current = true

		return function() -- line: 148
			-- upvalues: v45 (copy)
			v45.current = false
		end
	end, {})

	local v46 = useRoactService(RoactNetworking)
	local v47 = useSelector(function(p1) -- line: 154
		-- upvalues: t2 (copy), GamesProductInfoReducer (copy)
		if t2.universeId then
			return p1[GamesProductInfoReducer.key][t2.universeId]
		end

		return nil
	end, tutils.shallowEqual)
	local playButtonState = usePlayButtonState(v46, t2.universeId, t2.fetchDelayInSeconds, t2.isPlayableWhenLoading).playButtonState
	local v49 = useOnPlayButtonCallback(t2.universeId, t2.referralSource, t2.eventContext or "PlayButton", nil, t2.launchSource or (not v35 and "LuaGameCard" or "UnknownLaunchSource"), t2.experienceJoinData, t2.placeId)
	local v50 = if not FFlagLuaAppUnifiedPlayButtonSquadMenuDirection or t2.squadButtonMenuDirection == nil then MenuDirection.Up else t2.squadButtonMenuDirection
	local v51 = useOnPlaySquadButtonCallback(v50, playButtonState, t2.referralSource, t2.universeId)
	local v52 = React.useCallback(function() -- line: 185
		-- upvalues: v45 (copy), t2 (copy), playButtonState (copy), PlayButtonStates (copy), v49 (copy)
		if not v45.current then
			return
		end

		if t2.onActivated then
			t2.onActivated()
		end

		if t2.onPurchaseRequiredCallback and (playButtonState == PlayButtonStates.PaidAccess or playButtonState == PlayButtonStates.FiatPaidAccess) then
			t2.onPurchaseRequiredCallback()

			return
		end

		v49(playButtonState, t2.reportExperienceLaunched)
	end, {
		v49,
		playButtonState,
		t2.onPurchaseRequiredCallback,
		t2.reportExperienceLaunched,
		t2.onActivated
	})
	local v53 = React.useCallback(function(p2) -- line: 215
		-- upvalues: v45 (copy), t2 (copy), v51 (copy)
		if not v45.current then
			return
		end

		if t2.onActivated then
			t2.onActivated()
		end

		v51(p2)
	end, {
		v51,
		t2.onActivated
	})
	local v54 = useLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = if not FFlagUpdateActionNeededPlayButtonUi then nil else "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty"
	})
	local v55 = nil
	local v56 = nil
	local v57 = nil

	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v55, v56, v57 = useUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p3) -- line: 237
			-- upvalues: AppUserLayers (copy)
			local v89 = p3[AppUserLayers.PlayButtonUXExposureLayer] or {}

			return v89.HasJoinTextButton, v89.HasIconPlayButton, v89.HasPlayButtonLoadingSkeleton
		end, true)
	end

	local v58 = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then nil else useTokens()
	local v59 = false
	local v60 = false
	local v61 = false
	local v62 = t2.buttonSize or InputSize.Medium
	local v63 = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton or not t2.width then t2.fillBehavior else "Fill"
	local Emphasis = nil
	local s1 = nil
	local v66 = nil
	local v67 = nil
	local v68 = nil

	if playButtonState == PlayButtonStates.Loading then
		if t2.hideIfLoading then
			return nil
		end

		if v34 and ((not FFlagLuaAppSupportUnifiedUIBloxPlayButton or not t2.useUIBloxButton) and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v57)) then
			local v69 = t1[v62] or "Size_1000"
			local v70 = v58 and v58.Size[v69]

			v68 = if v63 ~= "Fill" then UDim.new(0, v70) else UDim.new(1, 0)

			local uDim2 = UDim2.new(v68, UDim.new(0, v70))
			local v72 = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
			local v73 = React.createElement(Skeleton, {
				Size = if not v72 then uDim2 else UDim2.fromScale(1, 1),
				radius = EnumsRadius.Medium,
				ZIndex = 2
			})

			v67 = if not v72 then v73 else React.createElement("TextButton", {
				Size = uDim2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				[React.Event.Activated] = v52
			}, {
				Skeleton = v73
			})
			v61 = true
		end

		Emphasis = ButtonVariant.Emphasis
	elseif playButtonState == PlayButtonStates.Playable then
		Emphasis = ButtonVariant.Emphasis

		if v32 and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or v55) then
			v66 = t2.playableText or v54.join
		else
			if not v33 and not t2.hidePlayableIcon then
				s1 = "icons/common/play"
			end

			v66 = t2.playableText

			if v33 and not t2.hidePlayableIcon then
				s1 = if not v66 or v66 == "" then v38 else "icons/common/play"
			end
		end
	elseif GetFFlagIsSquadEnabled() and playButtonState == PlayButtonStates.PlayableWithParty then
		s1 = v39
		v66 = if not t2.hideOptionalText then v54.joinWithParty else nil
		v59 = true
	elseif GetFFlagIsSquadEnabled() and playButtonState == PlayButtonStates.WaitingForParty then
		s1 = v39
		v66 = if not t2.hideOptionalText then v54.waitingForParty else nil
		v61 = true
		v60 = true
		v59 = true
	elseif playButtonState == PlayButtonStates.PaidAccess then
		v66 = tostring(v47 and v47.price or 0)
		Emphasis = ButtonVariant.Emphasis
		s1 = "icons/common/robux"
	elseif playButtonState == PlayButtonStates.FiatPaidAccess then
		Emphasis = ButtonVariant.Emphasis

		local v74 = v47 and v47.localizedFiatPrice or ""

		v66 = t2.fiatText or v74
	elseif playButtonState == PlayButtonStates.ActionNeeded then
		if FFlagUpdateActionNeededPlayButtonUi then
			Emphasis = ButtonVariant.Emphasis
			v66 = v54.unlock
		else
			Emphasis = ButtonVariant.SubEmphasis
			s1 = "icons/status/private"
			v66 = if not t2.hideOptionalText then v54.join else nil
		end
	elseif playButtonState == PlayButtonStates.UnplayableOther then
		if t2.hideIfUnplayable then
			return nil
		end

		Emphasis = ButtonVariant.Subtle
		s1 = "icons/status/unavailable"
		v66 = if not t2.hideOptionalText then v54.unavailable else nil
		v61 = true
	else
		error("invalid play button state!")
	end

	local v77

	if v59 then
		local v75 = nil

		if FFlagLuaAppSupportUnifiedUIBloxPlayButton then
			local v76 = t1[v62] or "Size_1000"

			v75 = (not v58 or not v58.Size[v76]) and 40 or v58.Size[v76]
		end

		v77 = React.createElement(ComboButton, {
			layoutOrder = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.LayoutOrder else nil,
			position = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.Position else nil,
			size = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then UDim2.new(t2.width or UDim.new(1, 0), t2.squadButtonHeight or UDim.new(1, 0)) else UDim2.new(1, 0, 0, v75),
			button = {
				icon = s1,
				text = v66,
				isDisabled = v61,
				onActivated = v61 and function() -- line: 385
				end or v52
			},
			overflow = {
				icon = if not FFlagLuaAppUnifiedPlayButtonSquadMenuDirection or v50 ~= MenuDirection.Down then v40 else v41,
				isDisabled = v60,
				onActivated = v60 and function() -- line: 393
				end or v53
			},
			testId = t2.testId
		})
	elseif FFlagLuaAppSupportUnifiedUIBloxPlayButton and t2.useUIBloxButton then
		local v78 = t1[v62] or "Size_1000"
		local v79 = (not v58 or not v58.Size[v78]) and 40 or v58.Size[v78]
		local v80 = v63 == "Fit"
		local v81 = if not v80 then UDim2.new(1, 0, 0, v79) else UDim2.new(0, 0, 0, v79)
		local v82 = playButtonState == PlayButtonStates.Loading
		local v83 = if Emphasis ~= ButtonVariant.SubEmphasis then if Emphasis ~= ButtonVariant.Subtle then ButtonType.PrimaryContextual else ButtonType.Secondary else ButtonType.PrimarySystem
		local v84 = if s1 ~= v38 then s1 else v39

		if type(v84) == "string" then
			v84 = Images[v84]
		end

		v77 = React.createElement(Button, {
			size = v81,
			fitContent = v80,
			buttonType = v83,
			icon = v84,
			text = v66,
			isLoading = v82,
			isDisabled = v61 or v82,
			userInteractionEnabled = not (v61 or v82),
			onActivated = if v61 or v82 then v42 else v52,
			[React.Tag] = if not t2.testId then nil else `data-testid={ t2.testId }`
		})

		if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and v82 then
			v67 = React.createElement("TextButton", {
				Size = v81,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				AutoButtonColor = false,
				ZIndex = 2,
				[React.Event.Activated] = v52
			})
		end
	else
		local v85 = if not v33 then nil else (v66 == nil or v66 == "") and s1 ~= nil

		v77 = if not v33 or (FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and not v56 or not v85) then React.createElement(Button2, {
			LayoutOrder = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.LayoutOrder else nil,
			Position = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.Position else nil,
			icon = s1,
			text = v66,
			variant = Emphasis,
			size = v62,
			width = if not v34 or playButtonState ~= PlayButtonStates.Loading then if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.width else nil else v68,
			fillBehavior = v63,
			isDisabled = v61,
			onActivated = if v61 then v42 else v52,
			testId = t2.testId
		}) else React.createElement(IconButton, {
			LayoutOrder = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.LayoutOrder else nil,
			Position = if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.Position else nil,
			icon = s1,
			variant = Emphasis,
			size = v62,
			width = if not v34 or playButtonState ~= PlayButtonStates.Loading then if not FFlagLuaAppSupportUnifiedUIBloxPlayButton then t2.width else nil else v68,
			fillBehavior = v63,
			isDisabled = v61,
			onActivated = if v61 then v42 else v52,
			testId = t2.testId
		})
	end

	if FFlagLuaAppSupportUnifiedUIBloxPlayButton then
		return React.createElement("Frame", {
			LayoutOrder = t2.LayoutOrder,
			Position = t2.Position,
			Size = if not t2.width then if v63 ~= "Fill" then nil else UDim2.new(1, 0, 1, 0) else UDim2.new(t2.width, UDim.new(0, 0)),
			AutomaticSize = if v63 ~= "Fill" then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		}, {
			LoadingSkeleton = if playButtonState ~= PlayButtonStates.Loading then nil else v67,
			PlayButton = v77
		})
	end

	return v77
end)

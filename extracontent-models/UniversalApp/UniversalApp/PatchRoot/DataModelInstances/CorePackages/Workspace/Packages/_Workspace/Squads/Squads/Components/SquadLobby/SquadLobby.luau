local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Squads = script:FindFirstAncestor("Squads")
local SquadsParent = Squads.Parent
local RoactNavigation = require(SquadsParent.RoactNavigation)
local UIBlox = require(SquadsParent.UIBlox)
local useLocalUserId = require(SquadsParent.RobloxAppHooks).useLocalUserId
local useVoiceStatus = require(SquadsParent.CrossExperienceVoice).Hooks.useVoiceStatus
local Constants = require(Squads.Common.Constants)
local dependencies = require(Squads.dependencies)
local Logger = require(Squads.Logger)

require(Squads.Common.ModelTypes)

local SquadLobbyActionBar = require(script.Parent.SquadLobbyActionBar)
local SquadLobbyUserGrid = require(script.Parent.SquadLobbyUserGrid)
local SquadLobbyRegroupRow = require(script.Parent.SquadLobbyRegroupRow)
local SquadLobbyVoiceChatMenu = require(script.Parent.SquadLobbyVoiceChatMenu)
local SquadLobbyBanners = require(script.Parent.SquadLobbyBanners)
local SquadLobbyUserDropdownMenu = require(script.Parent.SquadLobbyUserDropdownMenu)
local SquadPartySheetActionEnum = require(Squads.Enums.SquadPartySheetActionEnum)
local SquadUserPartyStatus = require(Squads.Enums.SquadUserPartyStatus)
local Cryo = dependencies.Cryo
local Foundation = dependencies.Foundation
local LuauPolyfill = dependencies.LuauPolyfill
local NetworkingPresence = dependencies.NetworkingPresence
local NetworkingSquads = dependencies.NetworkingSquads
local React = dependencies.React
local Roact = dependencies.Roact
local SharedFlags = dependencies.SharedFlags
local EventNames = dependencies.SquadsCore.Analytics.EventNames
local SquadExternalContractContext = dependencies.SquadsCore.SquadExternalContractProvider.SquadExternalContractContext
local SquadPromptType = dependencies.SquadsCore.Enums.SquadPromptType
local SquadCoplayJoin = dependencies.SquadsCore.Enums.SquadCoplayJoin
local SquadViewFlags = dependencies.SquadsCore.SquadExternalContractProvider.SquadViewFlags
local SquadLobbySessionProvider = dependencies.SquadsCore.SquadSessionProvider.SquadLobbySessionProvider
local logInExpCoplayTelemetry = dependencies.SquadsCore.Analytics.logInExpCoplayTelemetry
local createOrJoinSquad = dependencies.SquadsCore.Thunks.createOrJoinSquad
local UserBlockingNetworking = dependencies.UserBlockingNetworking
local dependencyArray = dependencies.Hooks.dependencyArray
local useCurrentSquadSelector = dependencies.Hooks.useCurrentSquadSelector
local useDispatch = dependencies.Hooks.useDispatch
local useEffectOnce = dependencies.Hooks.useEffectOnce
local useNavigation = dependencies.useNavigation
local usePrevious = dependencies.Hooks.usePrevious
local useSelector = dependencies.Hooks.useSelector
local useStore = dependencies.Hooks.useStore
local useSquadState = dependencies.SquadsCore.Hooks.useSquadState
local PresenceType = dependencies.RoduxPresence.Enums.PresenceType
local StateLayerAffordance = Foundation.Enums.StateLayerAffordance
local useStyle = UIBlox.Core.Style.useStyle
local useTokens = Foundation.Hooks.useTokens
local clearInterval = LuauPolyfill.clearInterval
local setInterval = LuauPolyfill.setInterval
local v52 = game:DefineFastFlag("EnableSquadLobbyBanners", false)
local FFlagEnableSquadCoplayAnalytic = SharedFlags.FFlagEnableSquadCoplayAnalytic
local FFlagEnableSquadTopBannerWideMode = SharedFlags.FFlagEnableSquadTopBannerWideMode
local FFlagMakeCreateOrJoinSquadAThunks = SharedFlags.FFlagMakeCreateOrJoinSquadAThunks
local v56 = game:DefineFastInt("PartyInviteeNoResponseDurationSeconds", 3)
local v57 = game:DefineFastInt("PartyUserInvitedDurationSeconds", 10)
local SquadQuickStartExperimentation = dependencies.SocialExperiments.SquadQuickStartExperimentation
local SquadCoordinationExperienceJoinExperimentation = dependencies.SocialExperiments.SquadCoordinationExperienceJoinExperimentation
local SquadRegroupExperimentation = dependencies.SocialExperiments.SquadRegroupExperimentation
local FFlagEnablePartyQuickStartButton = SharedFlags.FFlagEnablePartyQuickStartButton
local FFlagEnableAppChatFocusableFixes = SharedFlags.FFlagEnableAppChatFocusableFixes
local FFlagEnablePartyVoiceChangersInLua = SharedFlags.FFlagEnablePartyVoiceChangersInLua
local FFlagEnableSquadRegroupExperimentation = SharedFlags.FFlagEnableSquadRegroupExperimentation
local FFlagEnableSquadRegroupExperimentationSmallScreenFix = SharedFlags.FFlagEnableSquadRegroupExperimentationSmallScreenFix
local FFlagEnableSquadRegroupServerCapacityCheck = SharedFlags.FFlagEnableSquadRegroupServerCapacityCheck
local FFlagAppChatShowOSAOnPageEntry = SharedFlags.FFlagAppChatShowOSAOnPageEntry
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern

return function(t1: {[any]: any}) --[[ SquadLobby ]] -- line: 98
	-- upvalues: useTokens (copy), useDispatch (copy), useLocalUserId (copy), useStyle (copy), useSquadState (copy), useNavigation (copy), React (copy), SquadExternalContractContext (copy), useVoiceStatus (copy), FFlagEnableSquadTopBannerWideMode (copy), HttpService (copy), RoactNavigation (copy), SquadViewFlags (copy), useCurrentSquadSelector (copy), useSelector (copy), useStore (copy), SquadQuickStartExperimentation (copy), FFlagEnablePartyQuickStartButton (copy), SquadPromptType (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), FFlagMakeCreateOrJoinSquadAThunks (copy), createOrJoinSquad (copy), NetworkingSquads (copy), FFlagEnableSquadCoplayAnalytic (copy), logInExpCoplayTelemetry (copy), SquadCoplayJoin (copy), useEffectOnce (copy), FFlagAppChatShowOSAOnPageEntry (copy), Logger (copy), Cryo (copy), SquadUserPartyStatus (copy), v57 (copy), v56 (copy), setInterval (copy), clearInterval (copy), usePrevious (copy), UserBlockingNetworking (copy), NetworkingPresence (copy), Constants (copy), FFlagEnableSquadRegroupServerCapacityCheck (copy), Players (copy), SquadRegroupExperimentation (copy), PresenceType (copy), FFlagEnableSquadRegroupExperimentationSmallScreenFix (copy), v52 (copy), SquadLobbyBanners (copy), FFlagEnableAppChatFocusableFixes (copy), Foundation (copy), SquadLobbyUserGrid (copy), EventNames (copy), SquadPartySheetActionEnum (copy), SquadLobbyRegroupRow (copy), SquadLobbyActionBar (copy), StateLayerAffordance (copy), SquadLobbyVoiceChatMenu (copy), FFlagEnablePartyVoiceChangersInLua (copy), SquadLobbyUserDropdownMenu (copy), SquadCoordinationExperienceJoinExperimentation (copy), FFlagEnableSquadRegroupExperimentation (copy), Roact (copy), SquadLobbySessionProvider (copy)
	local v70 = useTokens()
	local v71 = useDispatch()
	local v72 = tonumber(useLocalUserId()) or 0
	local v73 = useStyle()
	local v74 = useSquadState()
	local v75 = useNavigation()
	local isWideMode = t1.isWideMode
	local v77 = React.useContext(SquadExternalContractContext)
	local v78, v79 = React.useState(0)
	local v80 = useVoiceStatus()

	if FFlagEnableSquadTopBannerWideMode then
		local v81 = React.useRef(HttpService:GenerateGUID())

		React.useEffect(function() -- line: 113
			-- upvalues: isWideMode (copy), v81 (copy), v77 (copy), v75 (copy), RoactNavigation (copy)
			if not isWideMode then
				local current = v81.current

				v77.disableSquadTopBanner(current, true)

				local u133 = v75 and v75.addListener(RoactNavigation.Events.WillBlur, function(p1) -- line: 118
					-- upvalues: v77 (copy), current (copy)
					if p1.state.routeName ~= "SquadInviteFriends" and p1.state.routeName ~= "SquadLobby" then
						v77.disableSquadTopBanner(current, false)

						return
					end

					v77.disableSquadTopBanner(current, true)
				end)

				return function() -- line: 129
					-- upvalues: u133 (ref), v77 (copy), current (copy)
					if u133 then
						u133.remove()
						u133 = nil
					end

					v77.disableSquadTopBanner(current, false)
				end
			end

			return function() -- line: 139
			end
		end, {
			v77.disableSquadTopBanner,
			v75,
			isWideMode
		})
		React.useEffect(function() -- line: 142
			-- upvalues: v77 (copy), SquadViewFlags (copy)
			v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)

			return function() -- line: 144
				-- upvalues: v77 (copy), SquadViewFlags (copy)
				v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)
			end
		end, { v77.updateSquadViewFlags })
	else
		React.useEffect(function() -- line: 152
			-- upvalues: v77 (copy), SquadViewFlags (copy), v75 (copy), RoactNavigation (copy)
			v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)

			local u134 = v75 and v75.addListener(RoactNavigation.Events.WillBlur, function(p2) -- line: 155
				-- upvalues: v77 (copy), SquadViewFlags (copy)
				if p2.state.routeName ~= "SquadInviteFriends" and p2.state.routeName ~= "SquadLobby" then
					v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)

					return
				end

				v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, true)
			end)

			return function() -- line: 162
				-- upvalues: u134 (ref), v77 (copy), SquadViewFlags (copy)
				if u134 then
					u134.remove()
					u134 = nil
				end

				v77.updateSquadViewFlags(SquadViewFlags.SquadLobby, false)
			end
		end, {
			v77.updateSquadViewFlags,
			v75
		})
	end

	local v82, v83 = React.useState(false)
	local v84, v85 = React.useState(Vector2.zero)
	local v86 = React.useCallback(function(p3) -- line: 174
		-- upvalues: v85 (copy)
		v85(p3.AbsoluteSize)
	end, { v85 })
	local v87 = useCurrentSquadSelector()
	local v88 = not v87 and "" or v87.squadId
	local v89 = v87 and v87.members
	local v90 = React.useCallback(function(p4) -- line: 182
		if p4.Squad and (p4.Squad.Squad and p4.Squad.Squad.currentSquad) then
			return p4.Squad.Squad.currentSquad.parentChannelId or ""
		end

		return ""
	end, {})
	local v91 = useSelector(v90)
	local v92 = useStore()
	local v93 = v75.getParam("conversationId") or ""
	local v94 = v77.useGetConversationFromId(v93)
	local v95 = v94 and v94.participants
	local v96 = v87 and v87.invitees
	local squadCreateOrJoinAttemptId = nil
	local v98 = v75.getParam("extraParams") or {}
	local squadId = v98.squadId

	if SquadQuickStartExperimentation.getPartyQuickStartChangesEnabled() and FFlagEnablePartyQuickStartButton then
		squadCreateOrJoinAttemptId = v98.squadCreateOrJoinAttemptId
	end

	local v100 = React.useCallback(function() -- line: 206
		-- upvalues: v77 (copy), v92 (copy), SquadPromptType (copy), t1 (copy)
		v77.setSquadPrompt(v92, {
			hideCancelButton = true,
			promptType = SquadPromptType.Error,
			onConfirm = function() --[[ onConfirm ]] -- line: 210
				-- upvalues: t1 (copy)
				t1.navigateAwayFromSquad()
			end
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(t1.navigateAwayFromSquad, v92, v77.setSquadPrompt) else {
		t1.navigateAwayFromSquad,
		v92,
		v77.setSquadPrompt
	})
	local v101 = React.useCallback(function(s1: string) -- line: 221
		-- upvalues: FFlagMakeCreateOrJoinSquadAThunks (copy), v71 (copy), createOrJoinSquad (copy), v77 (copy), squadCreateOrJoinAttemptId (ref), t1 (copy), NetworkingSquads (copy), FFlagEnableSquadCoplayAnalytic (copy), logInExpCoplayTelemetry (copy), SquadCoplayJoin (copy), v100 (copy)
		if FFlagMakeCreateOrJoinSquadAThunks then
			v71(createOrJoinSquad(s1, v77.setSquadPrompt, v77.fireSquadAnalytics, v77.squadLocation, squadCreateOrJoinAttemptId, t1.navigateAwayFromSquad))

			return
		end

		local v138 = v71(NetworkingSquads.CreateOrJoinSquad.API({
			parentChannelId = s1,
			leaveExisting = true,
			squadLocation = if not FFlagEnableSquadCoplayAnalytic then nil else v77.squadLocation,
			partyAttemptId = squadCreateOrJoinAttemptId
		}))

		if FFlagEnableSquadCoplayAnalytic then
			v138 = v138:andThen(function(p5) -- line: 244
				-- upvalues: logInExpCoplayTelemetry (copy), v77 (copy), SquadCoplayJoin (copy)
				local groupUpId = p5.responseBody.groupUp.groupUpId
				local members = p5.responseBody.groupUp.members

				if groupUpId and members then
					logInExpCoplayTelemetry(groupUpId, members, v77.squadLocation, SquadCoplayJoin.PartyJoin, v77.fireSquadAnalytics)
				end
			end)
		end

		v138:catch(function(_) -- line: 260
			-- upvalues: v100 (copy)
			v100()
		end)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v71, if not FFlagMakeCreateOrJoinSquadAThunks then nil else createOrJoinSquad, if not FFlagMakeCreateOrJoinSquadAThunks then nil else t1.navigateAwayFromSquad, if FFlagMakeCreateOrJoinSquadAThunks then nil else v100, if not FFlagMakeCreateOrJoinSquadAThunks then nil else v77.setSquadPrompt, v77.squadLocation, v77.fireSquadAnalytics, squadCreateOrJoinAttemptId) else {
		v71,
		if not FFlagMakeCreateOrJoinSquadAThunks then nil else createOrJoinSquad,
		if not FFlagMakeCreateOrJoinSquadAThunks then nil else t1.navigateAwayFromSquad,
		if FFlagMakeCreateOrJoinSquadAThunks then nil else v100,
		if not FFlagMakeCreateOrJoinSquadAThunks then nil else v77.setSquadPrompt,
		v77.squadLocation,
		v77.fireSquadAnalytics,
		squadCreateOrJoinAttemptId
	})
	local v102 = squadId and squadId ~= v88

	React.useEffect(function() -- line: 292
		-- upvalues: v102 (copy), v77 (copy), v92 (copy), SquadPromptType (copy), v101 (copy), v93 (copy), t1 (copy), v75 (copy)
		if v102 then
			v77.setSquadPrompt(v92, {
				promptType = SquadPromptType.JoinAnotherSquad,
				onConfirm = function() --[[ onConfirm ]] -- line: 296
					-- upvalues: v101 (copy), v93 (copy)
					v101(v93)
				end,
				onCancel = function() --[[ onCancel ]] -- line: 299
					-- upvalues: t1 (copy)
					t1.navigateAwayFromSquad()
				end
			})
			v75.setParams({
				squadId = nil
			})
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(squadId, v77.setSquadPrompt, v101, v93, t1.navigateAwayFromSquad, v102) else {
		squadId,
		v77.setSquadPrompt,
		v101,
		v93,
		t1.navigateAwayFromSquad,
		v102
	})
	useEffectOnce(function() -- line: 330
		-- upvalues: v102 (copy), FFlagAppChatShowOSAOnPageEntry (copy), v77 (copy), v94 (copy), t1 (copy), v88 (copy), Logger (copy), v93 (copy), v71 (copy), v101 (copy), v100 (copy)
		if v102 then
			return
		end

		if FFlagAppChatShowOSAOnPageEntry and v77.shouldShowOSAForConversation and v77.shouldShowOSAForConversation(v94) then
			t1.navigateAwayFromSquad()

			return
		end

		if v88 == "" then
			if v94 and v94.source == "friends" then
				Logger:debug("Channel does not exist for: {}. Creating a friend conversation.", v93)
				v71(v77.createFriendConversation(v93)):andThen(function(p7) -- line: 354
					-- upvalues: v101 (copy)
					if p7 and p7.id then
						v101(p7.id)
					end
				end):catch(function(p8) -- line: 359
					-- upvalues: Logger (copy), v100 (copy)
					Logger:debug("Error while trying to create a friend conversation: {}", p8)
					v100()
				end)

				return
			end

			v101(v93)
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v71, v77.createFriendConversation, v93, v94, v101, v100) else {
		v71,
		v77.createFriendConversation,
		v93,
		v94,
		v101,
		v100
	})

	local v103, v104 = React.useState({})
	local v105 = React.useMemo(function() -- line: 390
		-- upvalues: v89 (copy)
		local t2 = {}

		if v89 then
			for _, v in ipairs(v89) do
				t2[tostring(v.userId)] = true
			end
		end

		return t2
	end, { v89 })
	local v106 = React.useCallback(function(p9, p10, p11) -- line: 411
		-- upvalues: Cryo (copy), v72 (copy), SquadUserPartyStatus (copy), v57 (copy), v56 (copy)
		local t3 = {}
		local n1 = 0

		if p10 and #Cryo.Dictionary.keys(p10) == 0 then
			table.insert(t3, {
				userId = v72,
				partyStatus = SquadUserPartyStatus.Connecting
			})
		elseif p9 then
			local timestamp = os.time()

			for _, v in ipairs(p9) do
				local Inactive = SquadUserPartyStatus.Inactive

				if p10[v] then
					Inactive = SquadUserPartyStatus.Active
				else
					local v151 = p11 and Cryo.List.findWhere(p11, function(p12) -- line: 436
						-- upvalues: v (copy)
						return v == tostring(p12.userId)
					end)

					if v151 then
						local v152 = math.floor(p11[v151].invitedAtTimestampMs / 1000) or 0

						if timestamp < v152 then
							continue
						end

						if timestamp - v152 < v57 then
							Inactive = SquadUserPartyStatus.Invited
							n1 += 1
						elseif timestamp - v152 < v56 + v57 then
							Inactive = SquadUserPartyStatus.NoResponse
							n1 += 1
						end
					end
				end

				table.insert(t3, {
					userId = tonumber(v),
					partyStatus = Inactive
				})
			end
		end

		return {
			users = t3,
			numberOfUpdatesPending = n1
		}
	end, {})

	React.useEffect(function() -- line: 480
		-- upvalues: v106 (copy), v95 (copy), v105 (copy), v96 (copy), v104 (copy), setInterval (copy), clearInterval (copy)
		local v153 = v106(v95, v105, v96)

		v104(v153.users)

		local u154 = nil

		u154 = setInterval(function() -- line: 486
			-- upvalues: v106 (copy), v95 (copy), v105 (copy), v96 (copy), v104 (copy), clearInterval (copy), u154 (ref)
			local v181 = v106(v95, v105, v96)

			v104(v181.users)

			if v181.numberOfUpdatesPending == 0 then
				clearInterval(u154)
			end
		end, 1000)

		return function() -- line: 495
			-- upvalues: clearInterval (copy), u154 (ref)
			clearInterval(u154)
		end
	end, {
		v105,
		v96,
		v95,
		v106
	})

	local v107 = usePrevious(v88) or ""

	React.useEffect(function() -- line: 502
		-- upvalues: v107 (copy), v88 (copy), t1 (copy), v93 (copy), v91 (copy), RoactNavigation (copy), isWideMode (copy), v75 (copy)
		if v107 ~= "" and v88 == "" then
			t1.navigateAwayFromSquad()

			return
		end

		if v88 ~= "" and v93 ~= "" and v91 ~= "" and v91 ~= v93 then
			local t4 = {
				RoactNavigation.Actions.navigate({
					routeName = "ChatConversation",
					params = {
						conversationId = v91
					}
				}),
				RoactNavigation.Actions.navigate({
					routeName = "SquadLobby",
					params = {
						conversationId = v91
					}
				})
			}

			if isWideMode then
				v75.navigate("ChatLanding", {
					conversationId = v91
				}, RoactNavigation.StackActions.reset({
					index = 2,
					actions = t4
				}))

				return
			end

			table.insert(t4, 1, RoactNavigation.Actions.navigate({
				routeName = "ChatLanding"
			}))
			v75.navigate("ChatLandingStack", {
				conversationId = v91
			}, RoactNavigation.StackActions.reset({
				index = 3,
				actions = t4
			}))
		end
	end, {
		v75,
		v91,
		v93,
		v88,
		t1.navigateAwayFromSquad
	})

	local v108 = usePrevious(v89)

	React.useEffect(function() -- line: 567
		-- upvalues: v89 (copy), v108 (copy), v72 (copy), v71 (copy), UserBlockingNetworking (copy), NetworkingPresence (copy)
		local t5 = {}

		if v89 then
			for _, v in pairs(v89) do
				local v159 = false

				if v108 then
					for _, v2 in pairs(v108) do
						if v2.userId == v.userId then
							v159 = true

							break
						end
					end
				end

				if not v159 then
					table.insert(t5, v.userId)

					if v72 ~= v.userId then
						v71(UserBlockingNetworking.IsBlockedById.API({
							userId = v.userId,
							currentUserId = v72
						}))
					end
				end
			end
		end

		v71(NetworkingPresence.GetPresencesFromUserIds.API(t5))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v89, v72, v108) else {
		v89,
		v72,
		v108
	})

	local v109 = React.useCallback(function() -- line: 602
		-- upvalues: v83 (copy), v82 (copy)
		v83(not v82)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v82, v83) else {
		v82,
		v83
	})
	local v110 = Constants.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 26 + 20
	local v111 = Constants.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 20
	local v112, v113 = React.useState(nil)
	local v114, v115 = React.useState(false)
	local v116 = React.useCallback(function(vector2: Vector2) -- line: 619
		-- upvalues: v79 (copy), v70 (copy)
		if vector2.Y > 0 then
			v79(vector2.Y + v70.Gap.Medium)

			return
		end

		v79(0)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v79, v70) else {
		v79,
		v70
	})
	local v117 = React.useCallback(function(p13) -- line: 632
		-- upvalues: v89 (copy)
		local v164 = p13.Squad and (not not p13.Squad.Presence and p13.Squad.Presence.byUserId) or {}
		local t6 = {}

		for _, v in ipairs(v89 or {}) do
			local str = tostring(v.userId)

			t6[str] = v164[str]
		end

		return t6
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v89) else { v89 })
	local v118 = useSelector(v117)
	local v119 = not FFlagEnableSquadRegroupServerCapacityCheck or Players.MaxPlayers > 1
	local v120 = React.useMemo(function() -- line: 651
		-- upvalues: SquadRegroupExperimentation (copy), t1 (copy), v119 (copy), v87 (copy), v118 (copy), v72 (copy), PresenceType (copy)
		if not SquadRegroupExperimentation.getSquadRegroupEnabled() or (not t1.isInExperience or not v119 or not v87 or not v87.members or not (#v87.members > 1) or not v87.selfPermissions or not v87.selfPermissions.canSeeRegroupJoinButton) then
			return false
		end

		local v169 = v118[tostring(v72)]

		if v169 == nil then
			return false
		end

		for k, v in pairs(v118) do
			if v ~= nil and k ~= tostring(v72) and (v.userPresenceType == PresenceType.Online or v.userPresenceType == PresenceType.InGame and v169.gameId ~= nil and v.gameId ~= nil and v169.gameId ~= v.gameId) then
				return true
			end
		end

		return false
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v118, v72, t1.isInExperience, v87, v119) else {
		v118,
		v72,
		t1.isInExperience,
		v87,
		v119
	})
	local v121 = v70.Size.Size_1000 + v70.Padding.Medium * 2
	local v122 = FFlagEnableSquadRegroupExperimentationSmallScreenFix and v120
	local v123 = (v122 or not v120) and 0 or v70.Gap.XXLarge + v121
	local v124 = React.useMemo(function() -- line: 716
		-- upvalues: v52 (copy), React (copy), SquadLobbyBanners (copy), v116 (copy)
		if v52 then
			return (React.createElement(SquadLobbyBanners, {
				onAbsoluteSizeChanged = v116
			}))
		end

		return nil
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v116) else { v116 })
	local v125 = React.useCallback(function() -- line: 729
		-- upvalues: t1 (copy), v91 (copy)
		t1.navigateToSquadInviteFriends(v91)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v91, t1.navigateToSquadInviteFriends) else {
		v91,
		t1.navigateToSquadInviteFriends
	})
	local v126 = React.useMemo(function() -- line: 739
		-- upvalues: React (copy), v78 (copy), v123 (copy), v73 (copy), FFlagEnableAppChatFocusableFixes (copy), v86 (copy), v122 (copy), Foundation (copy), SquadLobbyUserGrid (copy), v84 (copy), v110 (copy), v70 (copy), v121 (copy), v103 (copy), t1 (copy), v77 (copy), EventNames (copy), v91 (copy), SquadPartySheetActionEnum (copy), v80 (copy), v113 (copy), v115 (copy), v125 (copy), SquadLobbyRegroupRow (copy), v72 (copy)
		return React.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, v78),
			Size = UDim2.new(1, 0, 1, -(v78 + v123)),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarImageColor3 = v73.Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = v73.Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			Selectable = not FFlagEnableAppChatFocusableFixes and nil,
			ZIndex = 0,
			[React.Change.AbsoluteSize] = v86
		}, {
			FrameContents = if not v122 then nil else React.createElement(Foundation.View, {
				tag = "auto-y size-full-0 bg-surface-0 col align-x-center align-y-top"
			}, {
				UserGridContainer = React.createElement(Foundation.View, {
					tag = "auto-y size-full-0 bg-surface-0",
					LayoutOrder = 1
				}, {
					SquadLobbyUserGrid = React.createElement(SquadLobbyUserGrid, {
						containerSize = v84 - Vector2.new(0, v110 + v70.Gap.Medium + v121),
						paddingBottom = UDim.new(0, 0),
						users = v103,
						isInExperience = t1.isInExperience,
						onUserCardActivated = function(s2: string) --[[ onUserCardActivated ]] -- line: 769
							-- upvalues: v77 (copy), EventNames (copy), v91 (copy), SquadPartySheetActionEnum (copy), v80 (copy), v113 (copy), v115 (copy)
							v77.fireSquadAnalytics(EventNames.PartySheetAction, {
								parentChannelId = v91,
								actionType = SquadPartySheetActionEnum.UserCardClicked,
								voiceStatus = v80
							})
							v113(s2)
							v115(true)
						end,
						navigateToHomePage = t1.navigateToHomePage,
						navigateToSquadInviteFriends = v125
					})
				}),
				RegroupRowSpacer = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					Size = UDim2.new(1, 0, 0, v70.Gap.Medium),
					LayoutOrder = 2
				}),
				SquadLobbyRegroupRow = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					Size = UDim2.new(1, 0, 0, v121),
					LayoutOrder = 3
				}, {
					Row = React.createElement(SquadLobbyRegroupRow, {
						localUserId = v72
					})
				}),
				BottomPadding = React.createElement(Foundation.View, {
					tag = "bg-surface-0",
					Size = UDim2.new(1, 0, 0, v110),
					LayoutOrder = 4
				})
			}),
			SquadLobbyUserGrid = if not v122 then React.createElement(SquadLobbyUserGrid, {
				containerSize = v84 - Vector2.new(0, v110),
				paddingBottom = UDim.new(0, v110),
				users = v103,
				isInExperience = t1.isInExperience,
				onUserCardActivated = function(s3: string) --[[ onUserCardActivated ]] -- line: 811
					-- upvalues: v77 (copy), EventNames (copy), v91 (copy), SquadPartySheetActionEnum (copy), v80 (copy), v113 (copy), v115 (copy)
					v77.fireSquadAnalytics(EventNames.PartySheetAction, {
						parentChannelId = v91,
						actionType = SquadPartySheetActionEnum.UserCardClicked,
						voiceStatus = v80
					})
					v113(s3)
					v115(true)
				end,
				navigateToHomePage = t1.navigateToHomePage,
				navigateToSquadInviteFriends = v125
			}) else nil
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v113, v115, v84, v89, v125, v86, t1.navigateToHomePage, v110, v78, if not v120 then nil else v123, v103, v122, if not v122 then nil else v121, if not v122 then nil else v72, v80) else {
		v113,
		v115,
		v84,
		v89,
		v125,
		v86,
		t1.navigateToHomePage,
		v110,
		v78,
		if not v120 then nil else v123,
		v103,
		v122,
		if not v122 then nil else v121,
		if not v122 then nil else v72,
		v80
	})
	local v127 = React.useMemo(function() -- line: 863
		-- upvalues: React (copy), SquadLobbyActionBar (copy), v74 (copy), v94 (copy), t1 (copy), v109 (copy), v88 (copy)
		return React.createElement(SquadLobbyActionBar, {
			squadState = v74,
			anchorPoint = Vector2.new(0.5, 1),
			hasUnreadMessages = not not v94 and (not not v94.hasUnreadMessages and v94.hasUnreadMessages),
			navigateAwayFromSquad = t1.navigateAwayFromSquad,
			navigateToHomePage = t1.navigateToHomePage,
			toggleVoiceChatMenu = v109,
			position = UDim2.new(0.5, 0, 1, -20),
			squadId = v88,
			isInExperience = t1.isInExperience
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v88, t1.isInExperience, t1.navigateToHomePage, v74, v109, v94 and v94.hasUnreadMessages) else {
		v88,
		t1.isInExperience,
		t1.navigateToHomePage,
		v74,
		v109,
		v94 and v94.hasUnreadMessages
	})
	local v128 = React.useMemo(function() -- line: 898
		-- upvalues: v122 (copy), v120 (copy), React (copy), Foundation (copy), Constants (copy), v70 (copy), v121 (copy), SquadLobbyRegroupRow (copy), v72 (copy)
		if v122 or not v120 then
			return nil
		end

		return React.createElement(Foundation.View, {
			tag = "anchor-bottom-center auto-none gui-object-defaults",
			Position = UDim2.new(0.5, 0, 1, -(20 + Constants.SQUAD_LOBBY_ACTION_BAR_HEIGHT + v70.Gap.XXLarge)),
			Size = UDim2.new(1, 0, 0, v121)
		}, {
			Row = React.createElement(SquadLobbyRegroupRow, {
				localUserId = v72
			})
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v120, v72, v70, v121) else {
		v120,
		v72,
		v70,
		v121
	})
	local v129 = React.useMemo(function() -- line: 924
		-- upvalues: v82 (copy), React (copy), Foundation (copy), StateLayerAffordance (copy), v83 (copy), v111 (copy), v70 (copy), SquadLobbyVoiceChatMenu (copy), FFlagEnablePartyVoiceChangersInLua (copy), t1 (copy)
		if v82 then
			return (React.createElement(Foundation.View, {
				Size = UDim2.new(1, 0, 1, 0),
				stateLayer = {
					affordance = StateLayerAffordance.None
				},
				onActivated = function() --[[ onActivated ]] -- line: 930
					-- upvalues: v83 (copy)
					v83(false)
				end
			}, { React.createElement(Foundation.ScrollView, {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				sizeConstraint = {
					MaxSize = Vector2.new(350, 1e999)
				},
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y
				},
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}
			}, {
				FlexibleSpace = React.createElement(Foundation.View, {
					Size = UDim2.new(1, 0, 0, v111),
					flexItem = {
						FlexMode = Enum.UIFlexMode.Fill
					},
					LayoutOrder = 1,
					stateLayer = {
						affordance = StateLayerAffordance.None
					},
					onActivated = function() --[[ onActivated ]] -- line: 954
						-- upvalues: v83 (copy)
						v83(false)
					end
				}),
				Menu = React.createElement(Foundation.View, {
					Size = UDim2.new(1, 0, 1, 0),
					flexItem = {
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					},
					AutomaticSize = Enum.AutomaticSize.Y,
					LayoutOrder = 2,
					padding = Vector2.new(v70.Padding.XLarge, v70.Padding.Medium),
					stateLayer = {
						affordance = StateLayerAffordance.None
					},
					onActivated = function() --[[ onActivated ]] -- line: 967
					end,
					ZIndex = 3
				}, {
					SquadLobbyVoiceChatMenu = React.createElement(SquadLobbyVoiceChatMenu, {
						openSquadVoiceChangers = if not FFlagEnablePartyVoiceChangersInLua then nil else t1.openSquadVoiceChangers
					})
				}),
				BottomPadding = React.createElement(Foundation.View, {
					Size = UDim2.new(1, 0, 0, v111),
					LayoutOrder = 3,
					stateLayer = {
						affordance = StateLayerAffordance.None
					},
					onActivated = function() --[[ onActivated ]] -- line: 980
						-- upvalues: v83 (copy)
						v83(false)
					end
				})
			}) }))
		end

		return nil
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v111, v82, v83, v70) else {
		v111,
		v82,
		v83,
		v70
	})
	local v130 = React.useMemo(function() -- line: 999
		-- upvalues: v114 (copy), v112 (copy), React (copy), SquadLobbyUserDropdownMenu (copy), t1 (copy), v113 (copy), v115 (copy), v91 (copy)
		if v114 and v112 then
			return (React.createElement(SquadLobbyUserDropdownMenu, {
				userId = v112,
				isInExperience = t1.isInExperience,
				onDismiss = function() --[[ onDismiss ]] -- line: 1004
					-- upvalues: v113 (copy), v115 (copy)
					v113(nil)
					v115(false)
				end,
				openViewProfile = function() --[[ openViewProfile ]] -- line: 1008
					-- upvalues: t1 (copy), v112 (copy)
					t1.openViewProfile(v112)
				end,
				openSquadVoiceAbuseReport = t1.openSquadVoiceAbuseReport,
				parentChannelId = v91
			}))
		end

		return nil
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v91, t1.isInExperience, v114, v115, t1.openViewProfile, v112, v113) else {
		v91,
		t1.isInExperience,
		v114,
		v115,
		t1.openViewProfile,
		v112,
		v113
	})

	React.useEffect(function() -- line: 1037
		-- upvalues: SquadCoordinationExperienceJoinExperimentation (copy), FFlagEnableSquadRegroupExperimentation (copy), SquadRegroupExperimentation (copy)
		SquadCoordinationExperienceJoinExperimentation.logExposure()

		if FFlagEnableSquadRegroupExperimentation then
			SquadRegroupExperimentation.logExposure()
		end
	end, {})

	local v131 = Roact.createFragment({
		SquadLobbyBanners = v124,
		SquadLobbyUsersScrollingFrame = v126,
		SquadLobbyRegroupRow = v128,
		SquadLobbyActionBar = v127,
		SquadLobbyVoiceChatMenu = v129,
		UserDropdownMenu = v130
	})

	if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
		v131 = React.createElement(SquadLobbySessionProvider.Provider, nil, v131)
	end

	return v131
end

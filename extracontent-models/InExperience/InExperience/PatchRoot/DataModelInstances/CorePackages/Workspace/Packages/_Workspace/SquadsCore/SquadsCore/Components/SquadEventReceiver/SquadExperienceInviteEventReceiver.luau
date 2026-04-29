local SquadsCore = script:FindFirstAncestor("SquadsCore")
local SquadsCoreParent = SquadsCore.Parent
local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local MessageBusService = game:GetService("MessageBusService")
local SquadLocationEnum = require(SquadsCore.Enums.SquadLocationEnum)
local SquadToastActionsAndStates = require(SquadsCore.Enums.SquadToastActionsAndStates)
local SquadToastType = require(SquadsCore.Enums.SquadToastType)
local Logger = require(SquadsCore.Logger)
local NetworkingSquads = require(SquadsCore.Http.NetworkingSquads)
local RoduxSquads = require(SquadsCore.RoduxSquads)
local serializeTable = require(SquadsCore.Utils.serializeTable)
local useCurrentSquadParentChannelId = require(SquadsCore.Hooks.useCurrentSquadParentChannelId)
local Cryo = require(SquadsCoreParent.Cryo)
local ExperienceService = require(SquadsCoreParent.ExperienceService)
local LocalStorageKey = require(SquadsCoreParent.LocalStorage).Enums.LocalStorageKey
local React = require(SquadsCoreParent.React)
local RealtimeDelivery = require(SquadsCoreParent.RealtimeDelivery)
local SharedFlags = require(SquadsCoreParent.SharedFlags)
local SoundManager = require(SquadsCoreParent.SoundManager)
local SquadCoordinationExperienceJoinExperimentation = require(SquadsCoreParent.SocialExperiments).SquadCoordinationExperienceJoinExperimentation
local ToastNotification = require(SquadsCoreParent.ToastNotification)
local ToastNotificationsProtocol = require(SquadsCoreParent.ToastNotificationsProtocol)
local LuauPolyfill = require(SquadsCoreParent.LuauPolyfill)
local dependencyArray = require(SquadsCoreParent.RoactUtils).Hooks.dependencyArray
local useDispatch = require(SquadsCoreParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalUserId = require(SquadsCoreParent.RobloxAppHooks).useLocalUserId
local useSelector = require(SquadsCoreParent.RoactUtils).Hooks.RoactRodux.useSelector
local GameParams = ExperienceService.GameParams
local ExperienceService2 = ExperienceService.ExperienceService
local clearInterval = LuauPolyfill.clearInterval
local setInterval = LuauPolyfill.setInterval
local ExperienceInviteState = RoduxSquads.Enums.ExperienceInviteState
local ExperienceInviteVoteType = RoduxSquads.Enums.ExperienceInviteVoteType
local ExperienceInviteType = RoduxSquads.Enums.ExperienceInviteType
local Sounds = SoundManager.Sounds
local SoundManager2 = SoundManager.SoundManager
local SquadExternalContractContext = require(SquadsCore.Components.SquadExternalContractProvider.SquadExternalContractContext)
local EventNames = require(SquadsCore.Analytics.EventNames)
local LifecycleEvents = ToastNotification.LifecycleEvents
local NotificationTypeEnum = ToastNotification.ToastNotificationTypeModule.NotificationTypeEnum
local v42 = game:DefineFastInt("SquadExperienceInvitePollingIntervalSeconds", 4)
local v43 = game:DefineFastInt("SquadExperienceInviteTimeoutSeconds", 30)
local FFlagDebugSquadLogsEnabled = SharedFlags.FFlagDebugSquadLogsEnabled
local FFlagSquadLaunchExperienceMobileFix = SharedFlags.FFlagSquadLaunchExperienceMobileFix
local FFlagEnablePrivatePartyAcceptInvite = SharedFlags.FFlagEnablePrivatePartyAcceptInvite
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local MessageId = MessageBusService:GetMessageId("ToastNotifications", "userActionOnToastNotification")

return function(t1: {[any]: any}) -- line: 84
	-- upvalues: useDispatch (copy), useLocalUserId (copy), React (copy), SquadExternalContractContext (copy), AppStorageService (copy), LocalStorageKey (copy), ToastNotificationsProtocol (copy), useSelector (copy), useCurrentSquadParentChannelId (copy), ExperienceInviteVoteType (copy), RoduxSquads (copy), NetworkingSquads (copy), Logger (copy), FFlagDebugSquadLogsEnabled (copy), HttpService (copy), EventNames (copy), Cryo (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), SquadCoordinationExperienceJoinExperimentation (copy), v43 (copy), ExperienceInviteState (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteType (copy), SquadLocationEnum (copy), FFlagSquadLaunchExperienceMobileFix (copy), GameParams (copy), ExperienceService2 (copy), v42 (copy), setInterval (copy), clearInterval (copy), serializeTable (copy), SquadToastActionsAndStates (copy), SquadToastType (copy), RealtimeDelivery (copy), NotificationTypeEnum (copy), MessageBusService (copy), MessageId (copy), LifecycleEvents (copy), SoundManager2 (copy), Sounds (copy)
	local v51 = useDispatch()
	local v52 = tonumber(useLocalUserId()) or 0
	local v53 = React.useContext(SquadExternalContractContext)
	local v54, v55 = React.useState("")

	React.useEffect(function() -- line: 92
		-- upvalues: AppStorageService (copy), LocalStorageKey (copy), v55 (copy)
		local ok, result = pcall(function() -- line: 94
			-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
			return AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
		end)

		if ok then
			v55(result)
		end

		local connection = AppStorageService.ItemWasSet:Connect(function(p1, p2) -- line: 101
			-- upvalues: LocalStorageKey (copy), v55 (copy)
			if p1 == LocalStorageKey.BrowserTrackerId then
				v55(p2)
			end
		end)

		return function() -- line: 106
			-- upvalues: connection (copy)
			connection:Disconnect()
		end
	end, { v55 })

	local default = ToastNotificationsProtocol.ToastNotificationProtocol.default
	local v57 = React.useRef(false)
	local v58 = React.useCallback(function(p3) -- line: 114
		if p3.Squad and p3.Squad.Squad then
			return p3.Squad.Squad.currentExperienceInvite
		end

		return nil
	end, {})
	local v59 = useSelector(v58)
	local v60 = useCurrentSquadParentChannelId()
	local v61 = v59 and v59.model
	local v62 = v61 and v61.experienceInviteId or ""
	local v63 = v61 and v61.state or ""
	local v64 = v61 and v61.experienceDetail.gameInstanceId or ""
	local v65 = v61 and v61.experienceDetail.placeId or 0
	local v66 = v61 and v61.inviterId or 0
	local v67, v68 = React.useMemo(function() -- line: 134
		-- upvalues: v59 (copy), ExperienceInviteVoteType (copy), v52 (copy), v54 (copy)
		if not v59 or not v59.model then
			if v59 and v59.notification.isInviter then
				return ExperienceInviteVoteType.Accept, false
			end

			return ExperienceInviteVoteType.Invalid, false
		end

		for _, v in ipairs(v59.model.votes) do
			if v.userId == v52 then
				local v79 = false

				if v.voteIdentifier and v.voteIdentifier ~= "" then
					v79 = v.voteIdentifier ~= v54
				end

				return v.voteType, v79
			end
		end

		return ExperienceInviteVoteType.NoVote, false
	end, {
		v59,
		v52,
		v54
	})
	local v69 = React.useCallback(function(s1: string, b1: boolean) -- line: 161
		-- upvalues: default (copy), v51 (copy), RoduxSquads (copy), v57 (copy)
		if b1 then
			default:dismissNotification(s1)
		end

		v51(RoduxSquads.Actions.CurrentExperienceInviteDismissed(s1))
		v57.current = false
	end, { v51 })
	local v70 = React.useCallback(function(p4, p5) -- line: 172
		-- upvalues: v51 (copy), NetworkingSquads (copy), Logger (copy), FFlagDebugSquadLogsEnabled (copy), HttpService (copy)
		return v51(NetworkingSquads.GetExperienceInvite.API({
			experienceInviteId = p4,
			membershipEntityId = p5
		})):catch(function(p6) -- line: 176
			-- upvalues: Logger (copy), FFlagDebugSquadLogsEnabled (copy), HttpService (copy), p4 (copy), p5 (copy)
			Logger:warning("Error getting experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}", if not FFlagDebugSquadLogsEnabled then not p6.StatusCode and -1 or p6.StatusCode else HttpService:JSONEncode(p6), p4, p5)
		end)
	end, { v51 })
	local v71 = React.useCallback(function(p7, p8, p9) -- line: 186
		-- upvalues: v60 (copy), v51 (copy), NetworkingSquads (copy), v54 (copy), v53 (copy), EventNames (copy), Cryo (copy), HttpService (copy), Logger (copy), FFlagDebugSquadLogsEnabled (copy)
		local t2 = {
			parentChannelId = v60,
			experienceInviteId = p7,
			voteType = p8
		}

		return v51(NetworkingSquads.VoteForExperienceInvite.API({
			experienceInviteId = p7,
			membershipEntityId = p9,
			voteIdentifier = v54,
			voteType = p8
		})):andThen(function() -- line: 199
			-- upvalues: v53 (copy), EventNames (copy), Cryo (copy), t2 (copy)
			v53.fireSquadAnalytics(EventNames.SquadVoteApiCall, Cryo.Dictionary.union(t2, {
				isSuccess = true
			}))
		end):catch(function(p10) -- line: 207
			-- upvalues: HttpService (copy), v53 (copy), EventNames (copy), Cryo (copy), t2 (copy), Logger (copy), FFlagDebugSquadLogsEnabled (copy), p7 (copy), p9 (copy), p8 (copy)
			local Body = p10.Body
			local ok, result = pcall(function() -- line: 209
				-- upvalues: HttpService (copy), Body (copy)
				return HttpService:JSONDecode(Body)
			end)
			local v115 = if not ok then nil else result.errorType

			v53.fireSquadAnalytics(EventNames.SquadVoteApiCall, Cryo.Dictionary.union(t2, {
				isSuccess = false,
				errorMessage = v115,
				errorType = if not p10.StatusCode then nil else tostring(p10.StatusCode)
			}))
			Logger:warning("Error voting for experience invite. Error: {}, ExperienceInviteId: {}, MembershipEntityId: {}, VoteType: {}", if not FFlagDebugSquadLogsEnabled then not p10.StatusCode and -1 or p10.StatusCode else HttpService:JSONEncode(p10), p7, p9, p8)
		end)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v51, v54) else {
		v51,
		v54
	})
	local v72 = React.useCallback(function(p11) -- line: 239
		-- upvalues: v53 (copy), EventNames (copy), v62 (copy), v64 (copy), v65 (copy), v66 (copy), v63 (copy), v60 (copy)
		v53.fireSquadAnalytics(EventNames.SquadExperienceInviteStateChange, {
			experienceInviteId = v62,
			invitationGameInstanceId = v64,
			invitationPlaceId = v65,
			inviterId = v66,
			inviteState = v63,
			parentChannelId = v60,
			joinAttemptId = p11
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v64, v62, v66, v65, v63, v60, if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else v53.fireSquadAnalytics) else {
		v64,
		v62,
		v66,
		v65,
		v63,
		v60,
		if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else v53.fireSquadAnalytics
	})

	React.useEffect(function() -- line: 278
		-- upvalues: v59 (copy), v43 (copy), v69 (copy)
		local thread = nil

		if v59 then
			thread = task.delay(v43, function() -- line: 281
				-- upvalues: v69 (copy), v59 (copy)
				v69(v59.notification.notificationId, true)
			end)
		end

		return function() -- line: 285
			-- upvalues: thread (ref)
			if thread then
				task.cancel(thread)
			end
		end
	end, {
		v69,
		v59
	})
	React.useEffect(function() -- line: 294
		-- upvalues: v59 (copy), v67 (copy), ExperienceInviteVoteType (copy), v57 (copy), ExperienceInviteState (copy), FFlagEnablePrivatePartyAcceptInvite (copy), ExperienceInviteType (copy), Logger (copy), v69 (copy), v53 (copy), SquadLocationEnum (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadCoordinationExperienceJoinExperimentation (copy), HttpService (copy), v72 (copy), GameParams (copy), ExperienceService2 (copy)
		if not v59 or (v67 ~= ExperienceInviteVoteType.Accept or v57.current) then
			return
		end

		local model = v59.model
		local notification = v59.notification

		if model and model.state == ExperienceInviteState.ReservationSuccessful then
			local gameInstanceId = model.experienceDetail.gameInstanceId
			local placeId = model.experienceDetail.placeId

			if not FFlagEnablePrivatePartyAcceptInvite or v59.model.inviteType ~= ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
				assert(gameInstanceId, "Game instance id should exist.")
			end

			v57.current = true
			Logger:debug("Launching experience. GameInstanceId: {}, PlaceId: {}", gameInstanceId, placeId)

			local thread = task.delay(1, function() -- line: 321
				-- upvalues: v69 (copy), notification (copy), v53 (copy), SquadLocationEnum (copy), FFlagSquadLaunchExperienceMobileFix (copy), SquadCoordinationExperienceJoinExperimentation (copy), HttpService (copy), v72 (copy), GameParams (copy), placeId (copy), gameInstanceId (copy), FFlagEnablePrivatePartyAcceptInvite (copy), v59 (copy), ExperienceInviteType (copy), ExperienceService2 (copy)
				v69(notification.notificationId, true)

				if v53.squadLocation == SquadLocationEnum.InExperience and FFlagSquadLaunchExperienceMobileFix then
					game:Shutdown()
				end

				local s2 = "SquadExperienceInvite"

				if v53.squadLocation == SquadLocationEnum.UniversalApp then
					s2 = "SquadExperienceInviteFromUA"
				elseif v53.squadLocation == SquadLocationEnum.InExperience then
					s2 = "SquadExperienceInviteFromInExp"
				end

				local guid = nil

				if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
					guid = HttpService:GenerateGUID(false)
					v72(guid)
				end

				local v118 = GameParams.fromPlaceInstance(placeId, gameInstanceId)

				if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
					v118.joinAttemptId = guid
				end

				if FFlagEnablePrivatePartyAcceptInvite and v59.model.inviteType == ExperienceInviteType.PlayWithPartyInPrivatePartyServer then
					v118.isPrivateParty = true
				end

				ExperienceService2:LaunchExperience(v118, s2, nil)
			end)

			return function() -- line: 356
				-- upvalues: thread (copy)
				task.cancel(thread)
			end
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v53.squadLocation, v59, v69, v67, if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else v72) else {
		v53.squadLocation,
		v59,
		v69,
		v67,
		if not SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then nil else v72
	})
	React.useEffect(function() -- line: 384
		-- upvalues: v42 (copy), v59 (copy), ExperienceInviteState (copy), setInterval (copy), v70 (copy), clearInterval (copy)
		local v95 = v42
		local u96 = nil

		if v59 and (not v59.model or v59.model.state == ExperienceInviteState.Active or v59.model.state == ExperienceInviteState.Reserving) then
			u96 = setInterval(function() -- line: 395
				-- upvalues: v70 (copy), v59 (copy)
				v70(v59.notification.experienceInviteId, v59.notification.membershipEntityId)
			end, v95 * 1000)
		end

		return function() -- line: 403
			-- upvalues: u96 (ref), clearInterval (copy)
			if u96 then
				clearInterval(u96)
			end
		end
	end, {
		v59,
		v70
	})
	React.useEffect(function() -- line: 412
		-- upvalues: v59 (copy), t1 (copy), v68 (copy), v69 (copy)
		if v59 and (t1.currentSquadId ~= v59.notification.membershipEntityId or v68) then
			v69(v59.notification.notificationId, true)
		end
	end, {
		v59,
		v69,
		t1.currentSquadId,
		v68
	})
	React.useEffect(function() -- line: 422
		-- upvalues: ExperienceInviteState (copy), v63 (copy), SquadCoordinationExperienceJoinExperimentation (copy), v72 (copy)
		if ExperienceInviteState[v63] then
			if SquadCoordinationExperienceJoinExperimentation.getIsSquadLobbySessionEnabled() then
				if ExperienceInviteState[v63] ~= ExperienceInviteState.ReservationSuccessful then
					v72()

					return
				end
			else
				v72()
			end
		end
	end, {
		v63,
		v72
	})
	React.useEffect(function() -- line: 440
		-- upvalues: v59 (copy), Logger (copy), serializeTable (copy), v52 (copy), ExperienceInviteState (copy), default (copy), v69 (copy), v67 (copy), ExperienceInviteVoteType (copy), v53 (copy), EventNames (copy), v60 (copy), SquadToastActionsAndStates (copy), SquadToastType (copy)
		if not v59 or not v59.model then
			return
		end

		Logger:debug("Current experience invite updated: {}", serializeTable(v59.model))

		local notificationId = v59.notification.notificationId
		local state = v59.model.state

		if v59.model.inviterId == v52 then
			if state == ExperienceInviteState.Active then
				if v59.model.spotsTaken > 1 then
					default:updateNotification(notificationId, v59.model.spotsTaken .. "SpotsFilled")

					return
				end
			else
				if state == ExperienceInviteState.Reserving or state == ExperienceInviteState.ReservationSuccessful then
					default:updateNotification(notificationId, "launching")

					return
				end

				v69(notificationId, true)

				if state ~= ExperienceInviteState.Cancelled and state ~= ExperienceInviteState.ReservationFailed then
					Logger:warning("Invitee unexpected squad experience invite state: {}", state)

					return
				end
			end
		elseif state == ExperienceInviteState.Active then
			if v67 == ExperienceInviteVoteType.Invalid or v67 == ExperienceInviteVoteType.NoVote then
				if v59.model.spotsTaken >= v59.model.totalSpots then
					v53.fireSquadAnalytics(EventNames.SquadToastActions, {
						parentChannelId = v60,
						experienceInviteId = v59.model.experienceInviteId,
						toastAction = SquadToastActionsAndStates.ExpInvSlotsFull,
						toastType = SquadToastType.ExperienceInvite
					})
					default:updateNotification(notificationId, "slotsFull")

					return
				end
			else
				if v67 == ExperienceInviteVoteType.Accept then
					default:updateNotification(notificationId, "waiting")

					return
				end

				if v67 == ExperienceInviteVoteType.Decline or v67 == ExperienceInviteVoteType.Dismiss then
					v69(notificationId, true)

					return
				end
			end
		elseif state == ExperienceInviteState.Reserving or state == ExperienceInviteState.ReservationSuccessful then
			if v67 == ExperienceInviteVoteType.Invalid or v67 == ExperienceInviteVoteType.NoVote then
				v53.fireSquadAnalytics(EventNames.SquadToastActions, {
					parentChannelId = v60,
					experienceInviteId = v59.model.experienceInviteId,
					toastAction = SquadToastActionsAndStates.ExpInvExpired,
					toastType = SquadToastType.ExperienceInvite
				})
				default:updateNotification(notificationId, "expired")

				return
			end

			if v67 == ExperienceInviteVoteType.Accept then
				default:updateNotification(notificationId, "waiting")

				return
			end

			if v67 == ExperienceInviteVoteType.Decline or v67 == ExperienceInviteVoteType.Dismiss then
				v69(notificationId, true)

				return
			end
		else
			if state == ExperienceInviteState.Cancelled then
				default:updateNotification(notificationId, "cancelled")

				return
			end

			v69(notificationId, true)

			if state ~= ExperienceInviteState.ReservationFailed then
				Logger:warning("Inviter unexpected squad experience invite state: {}", state)
			end
		end
	end, {
		v59,
		v60,
		v69,
		v52,
		v53.fireSquadAnalytics,
		v67
	})
	RealtimeDelivery.useRealtimeNamespace("ExperienceInviteUpdate", function(p12) -- line: 532
		-- upvalues: Logger (copy), serializeTable (copy), v51 (copy), RoduxSquads (copy)
		Logger:debug("Experience invite RTN received. Detail: {}", serializeTable(p12))
		v51(RoduxSquads.Actions.CurrentExperienceInviteUpdated(p12))
	end, { v51 })
	React.useEffect(function() -- line: 544
		-- upvalues: default (copy), v59 (copy), v67 (copy), ExperienceInviteVoteType (copy), v69 (copy), ExperienceInviteState (copy), v53 (copy), EventNames (copy), v60 (copy), SquadToastActionsAndStates (copy), SquadToastType (copy), v71 (copy)
		local v100 = default:listenToDismissNotification(function(p13) -- line: 546
			-- upvalues: v59 (copy), v67 (copy), ExperienceInviteVoteType (copy), v69 (copy), ExperienceInviteState (copy), v53 (copy), EventNames (copy), v60 (copy), SquadToastActionsAndStates (copy), SquadToastType (copy), v71 (copy)
			if v59 and v59.notification.notificationId == p13.notificationId then
				if v67 ~= ExperienceInviteVoteType.Accept then
					v69(p13.notificationId, false)
				end

				if (not v59.model or v59.model.state == ExperienceInviteState.Active) and (v67 == ExperienceInviteVoteType.Invalid or v67 == ExperienceInviteVoteType.NoVote) then
					v53.fireSquadAnalytics(EventNames.SquadToastActions, {
						parentChannelId = v60,
						experienceInviteId = v59.notification.experienceInviteId,
						toastAction = SquadToastActionsAndStates.ExpInvDismiss,
						toastType = SquadToastType.ExperienceInvite
					})
					v71(v59.notification.experienceInviteId, ExperienceInviteVoteType.Dismiss, v59.notification.membershipEntityId)
				end
			end
		end)

		return function() -- line: 587
			-- upvalues: v100 (copy)
			if v100 then
				v100:Disconnect()
			end
		end
	end, {
		v59,
		v60,
		v69,
		v51,
		v53.fireSquadAnalytics,
		v67,
		v71
	})
	React.useEffect(function() -- line: 603
		-- upvalues: default (copy), v52 (copy), NotificationTypeEnum (copy), HttpService (copy), v51 (copy), RoduxSquads (copy)
		local v101 = default:listenToDisplayNotification(function(p14) -- line: 605
			-- upvalues: v52 (copy), NotificationTypeEnum (copy), HttpService (copy), v51 (copy), RoduxSquads (copy)
			if not p14 then
				return
			end

			if v52 <= 0 then
				return
			end

			if p14.notificationType == NotificationTypeEnum.SquadExperienceInvitation then
				local data = HttpService:JSONDecode(p14.lifecycleData)

				v51(RoduxSquads.Actions.CurrentExperienceInviteReceived(data.experienceInviteId, data.membershipEntityId, p14.notificationId, data.isInviter))
			end
		end)

		return function() -- line: 626
			-- upvalues: v101 (copy)
			if v101 then
				v101:Disconnect()
			end
		end
	end, { v52 })
	React.useEffect(function() -- line: 635
		-- upvalues: MessageBusService (copy), MessageId (copy), NotificationTypeEnum (copy), v59 (copy), HttpService (copy), v51 (copy), RoduxSquads (copy), default (copy), ExperienceInviteState (copy), v67 (copy), ExperienceInviteVoteType (copy)
		local v102 = MessageBusService:Subscribe(MessageId, function(p15) -- line: 638
			-- upvalues: NotificationTypeEnum (copy), v59 (copy), HttpService (copy), v51 (copy), RoduxSquads (copy), default (copy), ExperienceInviteState (copy), v67 (copy), ExperienceInviteVoteType (copy)
			if p15.notificationType == NotificationTypeEnum.SquadExperienceInvitation and p15.userActionType == "timerElapsed" then
				if not v59 then
					local data = HttpService:JSONDecode(p15.parameters)

					v51(RoduxSquads.Actions.CurrentExperienceInviteReceived(data.experienceInviteId, data.membershipEntityId, p15.notificationId, data.isInviter))
					v51(function() -- line: 653
						-- upvalues: default (copy), p15 (copy)
						default:updateNotification(p15.notificationId, "expired")
					end)

					return
				end

				assert(v59, "Experience invite must exist to perform actions.")

				if (not v59.model or v59.model.state == ExperienceInviteState.Active) and (v67 == ExperienceInviteVoteType.Invalid or v67 == ExperienceInviteVoteType.NoVote) then
					default:updateNotification(p15.notificationId, "expired")
				end
			end
		end, false, true)

		return function() -- line: 683
			-- upvalues: v102 (copy)
			if v102 then
				v102:Disconnect()
			end
		end
	end, {
		v59,
		v67,
		v71
	})
	React.useEffect(function() -- line: 691
		-- upvalues: LifecycleEvents (copy), NotificationTypeEnum (copy), HttpService (copy), v60 (copy), SquadToastType (copy), v59 (copy), v51 (copy), RoduxSquads (copy), v53 (copy), EventNames (copy), Cryo (copy), SquadToastActionsAndStates (copy), v71 (copy), ExperienceInviteVoteType (copy)
		local v103 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.UserAction, NotificationTypeEnum.SquadExperienceInvitation, function(p16) -- line: 695
			-- upvalues: HttpService (copy), v60 (copy), SquadToastType (copy), v59 (copy), v51 (copy), RoduxSquads (copy), v53 (copy), EventNames (copy), Cryo (copy), SquadToastActionsAndStates (copy), v71 (copy), ExperienceInviteVoteType (copy)
			if p16 and (p16.userActionType == "click" and p16.visualItem and p16.visualItem.actionEventParams) then
				local data = HttpService:JSONDecode(p16.visualItem.actionEventParams)
				local t3 = {
					parentChannelId = v60,
					experienceInviteId = data.experienceInviteId,
					toastType = SquadToastType.ExperienceInvite
				}

				if not v59 then
					v51(RoduxSquads.Actions.CurrentExperienceInviteReceived(data.experienceInviteId, data.membershipEntityId, p16.notificationData.id, data.isInviter))
				end

				if p16.visualItem.eventName == "GroupUpSquadExperience" then
					v53.fireSquadAnalytics(EventNames.SquadToastActions, Cryo.Dictionary.union(t3, {
						toastAction = SquadToastActionsAndStates.ExpInvAccept
					}))
					v71(data.experienceInviteId, ExperienceInviteVoteType.Accept, data.membershipEntityId)

					return
				end

				if p16.visualItem.eventName == "DismissSquadExperienceInvited" then
					v53.fireSquadAnalytics(EventNames.SquadToastActions, Cryo.Dictionary.union(t3, {
						toastAction = SquadToastActionsAndStates.ExpInvDecline
					}))
					v71(data.experienceInviteId, ExperienceInviteVoteType.Decline, data.membershipEntityId)

					return
				end

				if p16.visualItem.eventName == "CancelSquadExperienceSpotsFilled" then
					v53.fireSquadAnalytics(EventNames.SquadToastActions, Cryo.Dictionary.union(t3, {
						toastAction = SquadToastActionsAndStates.ExpInvCancel
					}))
					v71(data.experienceInviteId, ExperienceInviteVoteType.Cancel, data.membershipEntityId)
				end
			end
		end)

		return function() -- line: 763
			-- upvalues: v103 (copy)
			v103()
		end
	end, {
		v59,
		v60,
		v51,
		v53.fireSquadAnalytics,
		v71
	})
	React.useEffect(function() -- line: 776
		-- upvalues: LifecycleEvents (copy), NotificationTypeEnum (copy), HttpService (copy), v53 (copy), EventNames (copy)
		local v104 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, function(p17) -- line: 780
			-- upvalues: HttpService (copy), v53 (copy), EventNames (copy)
			local v128 = p17 and (p17.state and (p17.state.visualItems and (p17.state.visualItems.button and (p17.state.visualItems.button[1] and p17.state.visualItems.button[1].actionEventParams))))

			if v128 then
				local experienceInviteId = HttpService:JSONDecode(v128).experienceInviteId

				v53.fireSquadAnalytics(EventNames.SquadExperienceInviteImpression, {
					experienceInviteId = experienceInviteId,
					notificationId = p17.id,
					clientTimestamp = os.time()
				})
			end
		end)

		return function() -- line: 800
			-- upvalues: v104 (copy)
			v104()
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v53.fireSquadAnalytics) else { v53.fireSquadAnalytics })
	React.useEffect(function() -- line: 810
		-- upvalues: SoundManager2 (copy), Sounds (copy), LifecycleEvents (copy), NotificationTypeEnum (copy)
		local function v105(p18) -- line: 811
			-- upvalues: SoundManager2 (copy), Sounds (copy)
			if p18.currentState == "invited" then
				SoundManager2:PlaySound(Sounds.PartyToast.Name)
			end
		end

		local v106 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Display, NotificationTypeEnum.SquadExperienceInvitation, v105)
		local v107 = LifecycleEvents:RegisterCallback(LifecycleEvents.ToastEvents.Update, NotificationTypeEnum.SquadExperienceInvitation, v105)

		return function() -- line: 829
			-- upvalues: v106 (copy), v107 (copy)
			v106()
			v107()
		end
	end, {})

	return nil
end

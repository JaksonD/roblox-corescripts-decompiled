local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local getDeepValue = require(ProfilePlatform.Utils.getDeepValue)
local Navigation = require(ProfilePlatformParent.Navigation)
local React = require(ProfilePlatformParent.React)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local RobloxAppEnums = require(ProfilePlatformParent.RobloxAppEnums)
local SharedFlags = require(ProfilePlatformParent.SharedFlags)
local SocialLuaAnalytics = require(ProfilePlatformParent.SocialLuaAnalytics)
local SocialStopwatch = require(ProfilePlatformParent.SocialStopwatch)
local Cryo = require(ProfilePlatformParent.Cryo)
local checkQrSession = require(ProfilePlatform.Networking.checkQrSession)
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useEffectOnMount = RoactUtils.Hooks.useEffectOnMount
local useLocalUserId = require(ProfilePlatformParent.RobloxAppHooks).useLocalUserId
local dependencyArray = RoactUtils.Hooks.dependencyArray
local useSignalState = require(ProfilePlatformParent.SignalsReact).useSignalState
local ProfileRefreshSignal = require(ProfilePlatformParent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local parseComponentsFromJson = require(ProfilePlatform.Components.ProfilePlatformPage.parseComponentsFromJson)
local useAvailableComponents = require(ProfilePlatform.Hooks.useAvailableComponents)
local useProfileJson = require(ProfilePlatform.Hooks.useProfileJson)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local ProfilePlatformEventReceiver = require(script.Parent.ProfilePlatformEventReceiver)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNames = require(ProfilePlatform.Analytics.EventNames)
local Enums = require(ProfilePlatform.Common.Enums)
local getFriendStatusFromProfileResponse = require(script.Parent.getFriendStatusFromProfileResponse)
local getIsTrustedConnectionsStatusFromProfileResponse = require(script.Parent.getIsTrustedConnectionsStatusFromProfileResponse)
local refreshProfilePlatformActionInfo = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local LoadingStages = SocialLuaAnalytics.Analytics.Enums.LoadingStages
local LoadingStagesExtension = require(ProfilePlatform.Analytics.LoadingStagesExtension)
local FFlagProfilePlatformEnableVR = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableLazyLoadingComponents = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local FFlagProfilePlatformTrustedConnectionsMVP = SharedFlags.FFlagProfilePlatformTrustedConnectionsMVP
local FFlagTCUnifyNavigationEntry = SharedFlags.FFlagTCUnifyNavigationEntry
local v36 = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView")
local v37 = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary")
local v38 = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView")
local IXPService = game:GetService("IXPService")
local v40 = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false)
local v41 = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false)
local v42 = game:DefineFastFlag("ProfilePlatformEnableSessionization", false)
local v43 = if not v42 then nil else game:GetService("SessionService")
local v44 = if not v42 then nil else require(ProfilePlatformParent.RobloxAppSessionization).SessionType
local FFlagPPVBackgroundPrefetchAvatar = SharedFlags.FFlagPPVBackgroundPrefetchAvatar
local v46 = if not FFlagPPVBackgroundPrefetchAvatar then nil else require(ProfilePlatformParent.EditProfileBackground).AvatarModelPrefetch
local ProfilePlatformPage = require(script.Parent.ProfilePlatformPage)
local getProfilePlatform = require(ProfilePlatform.Networking.getProfilePlatform)
local FFlagRemoveDependencyArrayAntipattern = require(ProfilePlatformParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern

return function() -- line: 69
	-- upvalues: React (copy), useProfileWrapperContext (copy), useProfileAnalyticsContext (copy), useLocalUserId (copy), useDispatch (copy), FFlagProfilePlatformTrustedConnectionsMVP (copy), Navigation (copy), useProfileJson (copy), useAvailableComponents (copy), SocialStopwatch (copy), EventNames (copy), LoadingStages (copy), getProfilePlatform (copy), FFlagProfilePlatformEnableLazyLoadingComponents (copy), FFlagProfilePlatformEnableVR (copy), getDeepValue (copy), Enums (copy), getFriendStatusFromProfileResponse (copy), getIsTrustedConnectionsStatusFromProfileResponse (copy), checkQrSession (copy), FFlagTCUnifyNavigationEntry (copy), RobloxAppEnums (copy), refreshProfilePlatformActionInfo (copy), LoadingStagesExtension (copy), FFlagPPVBackgroundPrefetchAvatar (copy), useEffectOnMount (copy), v46 (copy), v41 (copy), useSignalState (copy), ProfileRefreshSignal (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), v40 (copy), IXPService (copy), v36 (copy), v37 (copy), v38 (copy), v42 (copy), v43 (copy), v44 (copy), Cryo (copy), parseComponentsFromJson (copy), ProfilePlatformEventReceiver (copy), ProfilePlatformPage (copy)
	local v50, v51 = React.useState(true)
	local v52 = useProfileWrapperContext()
	local v53 = useProfileAnalyticsContext()
	local profileId = v52.profileId
	local profileType = v52.profileType
	local v56 = useLocalUserId()
	local v57 = tostring(profileId) == tostring(v56)
	local v58 = useDispatch()
	local v59 = if not FFlagProfilePlatformTrustedConnectionsMVP then nil else Navigation.useNavigation()
	local v60 = useProfileJson()
	local v61 = useAvailableComponents()
	local v62 = React.useRef(0)

	local function v63(n1: number?) -- line: 90
		-- upvalues: SocialStopwatch (copy), v53 (copy), EventNames (copy), LoadingStages (copy), v58 (copy), getProfilePlatform (copy), profileId (copy), profileType (copy), v61 (copy), FFlagProfilePlatformEnableLazyLoadingComponents (copy), v51 (copy), FFlagProfilePlatformEnableVR (copy), getDeepValue (copy), Enums (copy), FFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponse (copy), getIsTrustedConnectionsStatusFromProfileResponse (copy), v52 (copy), checkQrSession (copy), FFlagTCUnifyNavigationEntry (copy), v59 (copy), RobloxAppEnums (copy), refreshProfilePlatformActionInfo (copy), LoadingStagesExtension (copy)
		local v68 = SocialStopwatch.Stopwatch.get(SocialStopwatch.Events.ProfileOpened)

		v53.fireAnalyticsEvent(EventNames.ProfileLoadingStage, {
			statValue = if not v68 then nil else v68.timeElapsed,
			status = LoadingStages.Fetching,
			isProfilePlatform = true
		})
		v58(getProfilePlatform.API({
			profileId = profileId,
			profileType = profileType,
			components = v61,
			includeComponentOrdering = true,
			onlyEssentialComponents = not not FFlagProfilePlatformEnableLazyLoadingComponents or nil
		})):andThen(function(p1) -- line: 106
			-- upvalues: FFlagProfilePlatformEnableLazyLoadingComponents (copy), v51 (copy), FFlagProfilePlatformEnableVR (copy), n1 (copy), v53 (copy), EventNames (copy), getDeepValue (copy), Enums (copy), FFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponse (copy), getIsTrustedConnectionsStatusFromProfileResponse (copy), v52 (copy), v58 (copy), checkQrSession (copy), profileId (copy), FFlagTCUnifyNavigationEntry (copy), v59 (copy), RobloxAppEnums (copy), refreshProfilePlatformActionInfo (copy)
			if FFlagProfilePlatformEnableLazyLoadingComponents then
				v51(false)
			end

			if FFlagProfilePlatformEnableVR and n1 > 1 then
				v53.fireAnalyticsEvent(EventNames.ProfilePlatformPageReloaded, {
					reloadCount = n1
				})

				return
			end

			local v73 = getDeepValue(p1, `responseBody.components.{ Enums.Components.Actions }.buttons`)
			local v74 = if not v73 or not v73[1] then nil else v73[1].type

			if FFlagProfilePlatformTrustedConnectionsMVP and getFriendStatusFromProfileResponse(p1) == Enums.FriendStatus.Friends and not getIsTrustedConnectionsStatusFromProfileResponse(p1) and v52.sourceInfo.source == Enums.Sources.QrCode then
				v58(checkQrSession.API(profileId)):andThen(function(p2) -- line: 128
					-- upvalues: FFlagTCUnifyNavigationEntry (copy), v59 (copy), RobloxAppEnums (copy), profileId (copy), v58 (copy), refreshProfilePlatformActionInfo (copy)
					if p2.responseBody == true then
						if FFlagTCUnifyNavigationEntry then
							v59.push(RobloxAppEnums.AppPage.TrustedContactsModal, {
								props = {
									userId = profileId,
									sentFromQrCode = true,
									onRequestSent = function() --[[ onRequestSent ]] -- line: 135
										-- upvalues: v58 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
										return v58(refreshProfilePlatformActionInfo(profileId))
									end
								}
							})

							return
						end

						v59.push(RobloxAppEnums.AppPage.TrustedContactsModal, {
							userId = profileId,
							sentFromQrCode = true,
							onRequestSent = function() --[[ onRequestSent ]] -- line: 144
								-- upvalues: v58 (copy), refreshProfilePlatformActionInfo (copy), profileId (copy)
								return v58(refreshProfilePlatformActionInfo(profileId))
							end
						})
					end
				end)
			end

			v53.fireAnalyticsEvent(EventNames.ProfilePageLoadedWithData, {
				friendStatus = getFriendStatusFromProfileResponse(p1),
				absolutePosition = v52.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = v52.sourceInfo.source == Enums.Sources.HomepageFriendsCarousel,
				source = v52.sourceInfo.source,
				isRecommendation = v52.sourceInfo.isRecommendation,
				v52.sourceInfo.recommendationContextType,
				recommendationRank = v52.sourceInfo.recommendationRank,
				recommendationSessionId = v52.sourceInfo.recommendationSessionId,
				shareLinkId = v52.sourceInfo.shareLinkId,
				primaryAction = v74
			})
		end):catch(function(_) -- line: 168
			-- upvalues: v53 (copy), EventNames (copy), v68 (copy), LoadingStages (copy)
			v53.fireAnalyticsEvent(EventNames.ProfileLoadingStage, {
				statValue = if not v68 then nil else v68.timeElapsed,
				status = LoadingStages.Failed,
				isProfilePlatform = true
			})
		end)

		if FFlagProfilePlatformEnableLazyLoadingComponents then
			v58(getProfilePlatform.API({
				profileId = profileId,
				profileType = profileType,
				components = v61,
				includeComponentOrdering = true,
				onlyEssentialComponents = false
			})):andThen(function(_) -- line: 184
				-- upvalues: v53 (copy), EventNames (copy), v68 (copy), LoadingStagesExtension (copy)
				v53.fireAnalyticsEvent(EventNames.ProfileLoadingStage, {
					statValue = if not v68 then nil else v68.timeElapsed,
					status = LoadingStagesExtension.LazyLoaded,
					isProfilePlatform = true
				})
			end):catch(function(_) -- line: 191
				-- upvalues: v53 (copy), EventNames (copy), v68 (copy), LoadingStages (copy)
				v53.fireAnalyticsEvent(EventNames.ProfileLoadingStage, {
					statValue = if not v68 then nil else v68.timeElapsed,
					status = LoadingStages.Failed,
					isProfilePlatform = true
				})
			end)
		end
	end

	if FFlagPPVBackgroundPrefetchAvatar then
		useEffectOnMount(function() -- line: 202
			-- upvalues: profileType (copy), Enums (copy), profileId (copy), v46 (copy)
			if profileType ~= Enums.ProfileTypes.User then
				return
			end

			local num = tonumber(profileId)

			if num then
				v46.prefetch(num)
			end
		end)
	end

	if v41 then
		local v64 = useSignalState(ProfileRefreshSignal.getProfileRefreshSignal)
		local v65 = React.useRef(0)

		React.useEffect(function() -- line: 218
			-- upvalues: v57 (copy), v64 (copy), v65 (copy), v63 (copy)
			if v57 and v64 > v65.current then
				v65.current = v64
				v63()
			end
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v64, v57, profileId, v63) else {
			v64,
			v57,
			profileId,
			v63
		})
	end

	if FFlagProfilePlatformEnableVR then
		React.useEffect(function() -- line: 231
			-- upvalues: v62 (copy), v63 (copy)
			local v70 = v62.current + 1

			v62.current = v70
			v63(v70)
		end, { v61 })
	else
		useEffectOnMount(function() -- line: 237
			-- upvalues: v63 (copy)
			v63()
		end)
	end

	React.useEffect(function() -- line: 242
		-- upvalues: SocialStopwatch (copy), v53 (copy), EventNames (copy)
		return function() -- line: 243
			-- upvalues: SocialStopwatch (copy), v53 (copy), EventNames (copy)
			SocialStopwatch.Stopwatch.stop(SocialStopwatch.Events.ProfileOpened)
			v53.fireAnalyticsEvent(EventNames.ProfileClosed)
		end
	end, {})

	if v40 then
		useEffectOnMount(function() -- line: 251
			-- upvalues: IXPService (copy), v36 (copy), v37 (copy), v57 (copy), v38 (copy)
			IXPService:LogFlagLinkedUserLayerExposure(v36)
			IXPService:LogFlagLinkedUserLayerExposure(v37)

			if v57 then
				IXPService:LogFlagLinkedUserLayerExposure(v38)
			end
		end)
	end

	if v42 then
		React.useEffect(function() -- line: 261
			-- upvalues: v43 (copy), v44 (copy), v52 (copy)
			local Metadata = nil

			if v43:SessionExists(v44.StructuralIdentifier.ProfilePlatformPage) then
				Metadata = v43:GetMetadata(v44.StructuralIdentifier.ProfilePlatformPage, v44.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				v43:SetSession(v44.StructuralIdentifier.Level2a, v44.StructuralIdentifier.ProfilePlatformPage, v44.StructuralIdentifier.ProfilePlatformPage)
			end

			v43:SetMetadata(v44.StructuralIdentifier.ProfilePlatformPage, v44.Metadata.ProfilePlatformPage.ProfileSessionId, v52.profileSessionId)

			return function() -- line: 281
				-- upvalues: Metadata (ref), v43 (copy), v44 (copy)
				if Metadata ~= nil then
					v43:SetMetadata(v44.StructuralIdentifier.ProfilePlatformPage, v44.Metadata.ProfilePlatformPage.ProfileSessionId, Metadata)

					return
				end

				v43:RemoveSession(v44.StructuralIdentifier.ProfilePlatformPage)
			end
		end, {})
	end

	local v66 = React.useMemo(function() -- line: 297
		-- upvalues: Cryo (copy), parseComponentsFromJson (copy), v60 (copy), profileType (copy), React (copy), ProfilePlatformEventReceiver (copy)
		return Cryo.Dictionary.union(parseComponentsFromJson(v60.components, v60.componentOrdering, profileType), {
			ProfilePlatformEventReceiver = React.createElement(ProfilePlatformEventReceiver)
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v60.components, v60.componentOrdering) else {
		v60.components,
		v60.componentOrdering
	})

	return React.createElement(ProfilePlatformPage, {
		children = if not FFlagProfilePlatformEnableLazyLoadingComponents or not v50 then v66 else {}
	})
end

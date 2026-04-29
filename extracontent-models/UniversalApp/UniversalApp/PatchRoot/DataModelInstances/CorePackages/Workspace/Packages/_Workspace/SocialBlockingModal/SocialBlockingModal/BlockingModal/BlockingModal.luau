local SocialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local SocialBlockingModalParent = SocialBlockingModal.Parent
local React = require(SocialBlockingModalParent.React)
local RobloxAppHooks = require(SocialBlockingModalParent.RobloxAppHooks)
local useScreenSize = RobloxAppHooks.useScreenSize
local useLocalUserId = RobloxAppHooks.useLocalUserId
local useLocalization = require(SocialBlockingModalParent.Localization).Hooks.useLocalization
local useNavigation = require(SocialBlockingModalParent.Navigation).useNavigation
local useDispatch = require(SocialBlockingModalParent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDown = require(SocialBlockingModalParent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(SocialBlockingModalParent.RobloxAppEnums).AppPage
local Url = require(SocialBlockingModalParent.Http).Url
local UIBlox = require(SocialBlockingModalParent.UIBlox)
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local useLayerCollector = UIBlox.Core.Layout.LayerCollector.useLayerCollector
local UserProfiles = require(SocialBlockingModalParent.UserProfiles)
local GenericAbuseReporting = require(SocialBlockingModalParent.GenericAbuseReporting)
local AbuseVector = GenericAbuseReporting.Enums.AbuseVector
local OpenDynamicAbuseReport = GenericAbuseReporting.Thunks.OpenDynamicAbuseReport
local CloseCentralOverlay = require(SocialBlockingModalParent.CentralOverlay).Thunks.CloseCentralOverlay
local myUserBlockingNetworking = require(SocialBlockingModal.Networking.myUserBlockingNetworking)
local useShowToastOnError = require(script.Parent.useShowToastOnError)
local Analytics = require(script.Parent.Parent.Analytics)
local useSocialBlockingModalAnalytics = Analytics.useSocialBlockingModalAnalytics
local EventNames = Analytics.EventNames
local FocusNavigationUtils = require(SocialBlockingModalParent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtils.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FFlagEnableAbuseReportRevampFlow = require(SocialBlockingModalParent.SharedFlags).FFlagEnableAbuseReportRevampFlow
local FFlagDisableBlockAndReport = require(SocialBlockingModalParent.SharedFlags).FFlagDisableBlockAndReport
local FFlagConnectionsToFriendsRename = require(SocialBlockingModalParent.SharedFlags).FFlagConnectionsToFriendsRename
local v33 = game:DefineFastFlag("SocialBlockingModalFocusNavSupport", false)

return function() --[[ BlockingModal ]] -- line: 53
	-- upvalues: useNavigation (copy), FFlagDisableBlockAndReport (copy), useLocalUserId (copy), useDispatch (copy), useScreenSize (copy), useLayerCollector (copy), React (copy), useSocialBlockingModalAnalytics (copy), EventNames (copy), useShowToastOnError (copy), myUserBlockingNetworking (copy), FFlagEnableAbuseReportRevampFlow (copy), OpenDynamicAbuseReport (copy), AbuseVector (copy), CloseCentralOverlay (copy), NavigateDown (copy), AppPage (copy), Url (copy), UserProfiles (copy), useLocalization (copy), FFlagConnectionsToFriendsRename (copy), ButtonType (copy), v33 (copy), InteractiveAlert (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local v34 = useNavigation()
	local v35 = v34.getParam("navProps")
	local userId = v35.userId
	local onBlockSuccess = v35.onBlockSuccess
	local openReportUser = v35.openReportUser
	local v39 = if not FFlagDisableBlockAndReport then nil else v35.disableReportOption
	local v40 = useLocalUserId()
	local v41 = useDispatch()
	local v42 = useScreenSize()
	local v43 = useLayerCollector()

	if not v42 and (v43 and v43.absoluteSize) then
		v42 = v43.absoluteSize
	end

	local v44 = React.useCallback(function() -- line: 71
		-- upvalues: v34 (copy)
		v34.pop()
	end, { v34 })
	local fireAnalyticsEvent = useSocialBlockingModalAnalytics({
		userId = userId
	}).fireAnalyticsEvent

	React.useEffect(function() -- line: 77
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy)
		fireAnalyticsEvent(EventNames.SocialBlockingModalSeen)
	end, { userId })

	local v46 = useShowToastOnError()
	local v47 = React.useCallback(function() -- line: 83
		-- upvalues: v41 (copy), myUserBlockingNetworking (copy), userId (copy), v40 (copy), onBlockSuccess (copy), v46 (copy), v44 (copy)
		v41(myUserBlockingNetworking.BlockUserById.API({
			userId = userId,
			currentUserId = v40
		})):andThen(function() -- line: 88
			-- upvalues: onBlockSuccess (copy)
			if onBlockSuccess then
				onBlockSuccess()
			end
		end):catch(function(p1) -- line: 93
			-- upvalues: v46 (copy)
			v46(p1)
		end)
		v44()
	end, {
		onBlockSuccess,
		v44,
		userId,
		v40,
		v41,
		v46
	})
	local v48 = React.useCallback(function() -- line: 100
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), v47 (copy)
		fireAnalyticsEvent(EventNames.SocialBlockingModalBlockPressed)
		v47()
	end, {
		v47,
		userId,
		fireAnalyticsEvent
	})
	local v49 = React.useCallback(function() -- line: 106
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), v47 (copy), openReportUser (copy), FFlagEnableAbuseReportRevampFlow (copy), v41 (copy), OpenDynamicAbuseReport (copy), AbuseVector (copy), userId (copy), CloseCentralOverlay (copy), NavigateDown (copy), AppPage (copy), Url (copy)
		fireAnalyticsEvent(EventNames.SocialBlockingModalBlockAndReportPressed)
		v47()

		if openReportUser then
			openReportUser()

			return
		end

		if FFlagEnableAbuseReportRevampFlow then
			v41(OpenDynamicAbuseReport({
				abuseVector = AbuseVector.UserProfile,
				targetId = userId,
				onClose = function() --[[ onClose ]] -- line: 117
					-- upvalues: v41 (copy), CloseCentralOverlay (copy)
					v41(CloseCentralOverlay())
				end
			}))

			return
		end

		v41(NavigateDown({
			name = AppPage.GenericWebPage,
			detail = `{ Url.BASE_URL }abusereport/userprofile?id={ userId }`,
			extraProps = {
				title = ""
			}
		}))
	end, {
		v47,
		v41,
		userId,
		fireAnalyticsEvent,
		openReportUser
	})
	local v50 = React.useCallback(function() -- line: 141
		-- upvalues: fireAnalyticsEvent (copy), EventNames (copy), v44 (copy)
		fireAnalyticsEvent(EventNames.SocialBlockingModalCancelPressed)
		v44()
	end, {
		v44,
		fireAnalyticsEvent
	})
	local v51 = UserProfiles.Hooks.useUserProfilesFetch({
		userIds = { userId },
		query = UserProfiles.Queries.userProfilesCombinedNameByUserIds
	})
	local v52 = if not v51.data then nil else UserProfiles.Selectors.getCombinedNameFromId(v51.data, userId)
	local v53 = useLocalization({
		title = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = v52
		},
		bodyText = not FFlagConnectionsToFriendsRename and "Feature.BlockingModal.Message.BlockConfirmation" or "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename",
		cancelBtnText = "Feature.BlockingModal.Action.Cancel",
		blockBtnText = "Feature.BlockingModal.Action.Block",
		blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport"
	})
	local v54 = React.useMemo(function() -- line: 169
		-- upvalues: ButtonType (copy), v53 (copy), v50 (copy), FFlagDisableBlockAndReport (copy), v39 (copy), v49 (copy), v48 (copy)
		local t1 = {}

		table.insert(t1, {
			buttonType = ButtonType.Secondary,
			props = {
				text = v53.cancelBtnText,
				onActivated = v50
			}
		})

		if not FFlagDisableBlockAndReport or not v39 then
			table.insert(t1, {
				buttonType = ButtonType.Alert,
				props = {
					text = v53.blockAndReportBtnText,
					onActivated = v49
				}
			})
		end

		table.insert(t1, {
			buttonType = ButtonType.Alert,
			props = {
				text = v53.blockBtnText,
				onActivated = v48
			}
		})

		return t1
	end, {
		v53,
		v50,
		v49,
		v39,
		v48
	})

	if v33 then
		local v55 = React.createElement(InteractiveAlert, {
			screenSize = v42,
			title = v53.title,
			bodyText = v53.bodyText,
			richText = true,
			isRoactGamepadEnabled = false,
			buttonStackInfo = {
				buttons = v54 or {}
			}
		})

		return React.createElement(FocusRoot, {
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
			isIsolated = true,
			isAutoFocusRoot = true
		}, {
			BlockingModalScreen = v55
		})
	end

	return React.createElement(InteractiveAlert, {
		screenSize = v42,
		title = v53.title,
		bodyText = v53.bodyText,
		richText = true,
		buttonStackInfo = {
			buttons = v54 or {}
		}
	})
end

local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local NotApprovedPageParent = NotApprovedPage.Parent
local GuiService = game:GetService("GuiService")
local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local canReactivate = require(NotApprovedPage.Utils.canReactivate)
local CtaButtonsContainer = require(NotApprovedPage.Components.cta.CtaButtonsContainer)
local GetCommutationEligibility = require(NotApprovedPage.Http.GetCommutationEligibility)
local hasAnyCommutation = require(NotApprovedPage.Utils.hasAnyCommutation)
local Header = require(NotApprovedPage.Components.header.Header)
local LoadingSkeleton = require(NotApprovedPage.Components.LoadingSkeleton)
local NotApprovedPageProvider = require(NotApprovedPage.Contexts.NotApprovedPageContext).NotApprovedPageProvider
local PageAnalyticsProvider = require(NotApprovedPage.Contexts.PageAnalyticsContext).PageAnalyticsProvider
local PageItemsFromConfigs = require(NotApprovedPage.Components.pageItemConfigs.PageItemsFromConfigs)
local PageNavigationProvider = require(NotApprovedPage.Contexts.PageNavigationContext).PageNavigationProvider
local sendNotApprovedPageEvent = require(NotApprovedPage.Utils.sendNotApprovedPageEvent)
local setBadUtterancesTranslationKeys = require(NotApprovedPage.Utils.setBadUtterancesTranslationKeys)
local setViolationEvidenceTranslationKeys = require(NotApprovedPage.Utils.setViolationEvidenceTranslationKeys)

require(NotApprovedPage.Common.Types)

local Constants = require(NotApprovedPageParent.NotApprovedPageState).Constants
local React = require(NotApprovedPageParent.React)
local useEffect = React.useEffect
local useState = React.useState
local AppUserLayers = require(NotApprovedPageParent.ExperimentLayers).AppUserLayers
local dependencyArray = require(NotApprovedPageParent.RoactUtils).Hooks.dependencyArray
local RoactNetworking = require(NotApprovedPageParent.RoactServiceTags).RoactNetworking
local useLocalization = require(NotApprovedPageParent.Localization).Hooks.useLocalization
local useRoactService = require(NotApprovedPageParent.RobloxAppHooks).useRoactService
local Responsive = require(NotApprovedPageParent.Responsive)
local usePreferredInput = Responsive.usePreferredInput
local View = require(NotApprovedPageParent.Foundation).View
local FFlagReactivationNoticeIxpExposure = require(NotApprovedPage.Flags.FFlagReactivationNoticeIxpExposure)
local FFlagRemoveDependencyArrayAntipattern = require(NotApprovedPageParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local EVENT_TYPES = Constants.EVENT_TYPES
local TRANSLATION_KEYS = Constants.TRANSLATION_KEYS

return React.memo(function(t1: {[any]: any}) --[[ NotApprovedPageV2 ]] -- line: 64
	-- upvalues: useState (copy), UserInputService (copy), GuiService (copy), useRoactService (copy), RoactNetworking (copy), usePreferredInput (copy), Responsive (copy), useEffect (copy), GetCommutationEligibility (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), FFlagReactivationNoticeIxpExposure (copy), canReactivate (copy), hasAnyCommutation (copy), IXPService (copy), AppUserLayers (copy), sendNotApprovedPageEvent (copy), EVENT_TYPES (copy), TRANSLATION_KEYS (copy), setBadUtterancesTranslationKeys (copy), setViolationEvidenceTranslationKeys (copy), useLocalization (copy), React (copy), CtaButtonsContainer (copy), LoadingSkeleton (copy), NotApprovedPageProvider (copy), PageNavigationProvider (copy), PageAnalyticsProvider (copy), View (copy), Header (copy), PageItemsFromConfigs (copy)
	local v36, v37 = useState(true)
	local v38, v39 = useState(nil)
	local StatusBarSizeY = UserInputService.StatusBarSize.Y
	local BottomBarSizeY = UserInputService.BottomBarSize.Y
	local bottom = GuiService:GetSafeZoneOffsets().bottom
	local v43 = if BottomBarSizeY ~= 0 then BottomBarSizeY else bottom
	local moderationDetail = t1.moderationDetail
	local interventionType = t1.interventionType
	local verificationCategory = moderationDetail.verificationCategory
	local v47 = useRoactService(RoactNetworking)
	local v48 = usePreferredInput() == Responsive.Input.Directional

	useEffect(function() -- line: 82
		-- upvalues: GetCommutationEligibility (copy), v47 (copy), v39 (copy), v37 (copy)
		GetCommutationEligibility(v47):andThen(function(p1) -- line: 84
			-- upvalues: v39 (copy)
			if p1.responseBody then
				v39(p1.responseBody)
			end
		end):catch(function(_) -- line: 89
			-- upvalues: v39 (copy)
			v39({
				educational_pass_eligible = false
			})
		end):finally(function() -- line: 95
			-- upvalues: v37 (copy)
			v37(false)
		end)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v47) else { v47 })
	useEffect(function() -- line: 101
		-- upvalues: FFlagReactivationNoticeIxpExposure (copy), canReactivate (copy), interventionType (copy), moderationDetail (copy), hasAnyCommutation (copy), v38 (copy), verificationCategory (copy), IXPService (copy), AppUserLayers (copy), sendNotApprovedPageEvent (copy), EVENT_TYPES (copy)
		if FFlagReactivationNoticeIxpExposure and (game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") and canReactivate(interventionType, moderationDetail.endDate, moderationDetail.verificationCategory) and not hasAnyCommutation(v38)) and (not verificationCategory or verificationCategory == "") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.NotApprovedPageUserIDLayer)
		end

		sendNotApprovedPageEvent({
			eventType = EVENT_TYPES.PageRendered,
			interventionId = moderationDetail.interventionId,
			verificationCategory = moderationDetail.verificationCategory,
			isReactivationEligible = tostring(canReactivate(interventionType, moderationDetail.endDate, moderationDetail.verificationCategory)),
			punishedUserId = moderationDetail.punishedUserId
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(interventionType, moderationDetail.endDate, moderationDetail.verificationCategory, v38) else {
		interventionType,
		moderationDetail.endDate,
		moderationDetail.verificationCategory,
		v38
	})

	local v49 = TRANSLATION_KEYS

	setBadUtterancesTranslationKeys(moderationDetail, v49)
	setViolationEvidenceTranslationKeys(moderationDetail, v49)

	local v50 = useLocalization(v49)
	local v51 = React.createElement(CtaButtonsContainer, {
		moderationDetail = moderationDetail,
		LogoutThunk = t1.LogoutThunk
	})

	if v36 then
		return React.createElement(LoadingSkeleton)
	end

	return React.createElement(NotApprovedPageProvider, {
		translations = v50,
		moderationDetail = moderationDetail,
		commutationEligibility = v38
	}, React.createElement(PageNavigationProvider, {
		moderationDetail = moderationDetail
	}, React.createElement(PageAnalyticsProvider, nil, React.createElement(View, {
		tag = "size-full col align-x-center align-y-center bg-surface-0",
		padding = {
			top = UDim.new(0, StatusBarSizeY),
			bottom = UDim.new(0, v43)
		}
	}, {
		InnerContainer = React.createElement(View, {
			tag = "size-full col bg-surface-100 radius-large stroke-default stroke-standard",
			sizeConstraint = {
				MaxSize = if not v48 then Vector2.new(600, 800) else Vector2.new(800, 1000)
			},
			LayoutOrder = 1
		}, {
			HeaderSection = React.createElement(Header, {
				moderationDetail = moderationDetail,
				LogoutThunk = t1.LogoutThunk,
				LayoutOrder = 1
			}),
			Content = React.createElement(View, {
				tag = "size-full-0 grow col",
				LayoutOrder = 2
			}, React.createElement(PageItemsFromConfigs, {
				moderationDetail = moderationDetail,
				LogoutThunk = t1.LogoutThunk,
				commutationEligibility = v38
			})),
			Footer = React.createElement(View, {
				tag = "size-full-0 auto-y col",
				LayoutOrder = 3
			}, {
				FooterContent = v51
			})
		})
	}))))
end)

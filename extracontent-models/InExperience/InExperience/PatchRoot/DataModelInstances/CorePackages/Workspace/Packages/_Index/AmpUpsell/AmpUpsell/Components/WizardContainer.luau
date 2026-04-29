local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local AmpUpsellParent = AmpUpsell.Parent
local React = require(AmpUpsellParent.React)
local useNavigation = require(AmpUpsellParent.Navigation).useNavigation
local Enums = require(AmpUpsell.Common.Enums)
local ActionTypeEnum = Enums.ActionTypeEnum
local ActionStatusEnum = Enums.ActionStatusEnum
local AccessResponseEnum = Enums.AccessResponseEnum
local UserSettingsSettingNameEnum = Enums.UserSettingsSettingNameEnum

require(AmpUpsell.Common.Types)

local accountSettingsUpsellStringsFn = require(AmpUpsell.Common.LocalizationStrings).accountSettingsUpsellStringsFn
local LoadingSpinner = require(AmpUpsellParent.UIBlox).App.Loading.LoadingSpinner
local Cryo = require(AmpUpsellParent.Cryo)
local AnalyticsService = require(AmpUpsell.Analytics.AnalyticsService)
local sendModalActionEvent = require(AmpUpsell.Analytics.sendModalActionEvent)
local AmpApiProvider = require(AmpUpsell.Common.AmpApiProvider)
local AppScreens = require(AmpUpsell.Common.AppScreens)
local ErrorScreen = require(AmpUpsell.Components.ErrorScreen)
local useCompletionCallbackWithReturnPage = require(AmpUpsell.Common.useCompletionCallbackWithReturnPage)
local useApolloClient = require(AmpUpsellParent.ApolloClient).useApolloClient
local FFlagEnableAmpWizardDeepLink = require(AmpUpsellParent.SharedFlags).FFlagEnableAmpWizardDeepLink
local GetFFlagEnableAmpUpsellGql = require(AmpUpsell.Flags.GetFFlagEnableAmpUpsellGql)
local GetFFlagEnableAmpEmailUpsellSupport = require(AmpUpsell.Flags.GetFFlagEnableAmpEmailUpsellSupport)
local GetFFlagEnableAmpIDVUpsellSupport = require(AmpUpsell.Flags.GetFFlagEnableAmpIDVUpsellSupport)
local GetFFlagEnableAmpSubscriptionUpsell = require(AmpUpsell.Flags.GetFFlagEnableAmpSubscriptionUpsell)
local logEventOnceIfEnabled = require(AmpUpsell.Common.LoggingUtils).logEventOnceIfEnabled

local function getSuccessfulActions(t1: {[any]: any}) -- line: 56
	-- upvalues: ActionStatusEnum (copy)
	local t2 = {}

	for k, v in pairs(t1) do
		if v == ActionStatusEnum.Success then
			table.insert(t2, k)
		end
	end

	return t2
end

return function(t3: {[any]: any}) --[[ WizardContainer ]] -- line: 66
	-- upvalues: useNavigation (copy), AmpApiProvider (copy), AnalyticsService (copy), React (copy), useApolloClient (copy), useCompletionCallbackWithReturnPage (copy), FFlagEnableAmpWizardDeepLink (copy), ActionTypeEnum (copy), AppScreens (copy), Cryo (copy), ActionStatusEnum (copy), AccessResponseEnum (copy), GetFFlagEnableAmpEmailUpsellSupport (copy), GetFFlagEnableAmpIDVUpsellSupport (copy), logEventOnceIfEnabled (copy), GetFFlagEnableAmpSubscriptionUpsell (copy), UserSettingsSettingNameEnum (copy), accountSettingsUpsellStringsFn (copy), GetFFlagEnableAmpUpsellGql (copy), getSuccessfulActions (copy), sendModalActionEvent (copy), ErrorScreen (copy), LoadingSpinner (copy)
	local v32 = useNavigation()
	local featureName = t3.featureName
	local nameSpace = t3.nameSpace
	local recourseData = t3.recourseData
	local extraParameters = t3.extraParameters
	local entryPointEventCtx = t3.entryPointEventCtx
	local openUpsells = t3.openUpsells
	local completionCallback = t3.completionCallback
	local metadata = t3.metadata
	local v41 = if not t3.ampApiProvider then AmpApiProvider else t3.ampApiProvider
	local v42 = if not t3.analyticsService then AnalyticsService.EventStream else t3.analyticsService
	local v43 = if not t3.openAccountSettingsUpsell then v32.push else t3.openAccountSettingsUpsell
	local v44, v45 = React.useState({})
	local v46, v47 = React.useState(false)
	local v48 = useApolloClient()
	local v49 = useCompletionCallbackWithReturnPage(v32, completionCallback, metadata)
	local v50 = if not FFlagEnableAmpWizardDeepLink then completionCallback else v49
	local v51 = React.useCallback(function(_, p2) -- line: 93
		-- upvalues: ActionTypeEnum (copy), AppScreens (copy), v45 (copy), Cryo (copy), v44 (copy), ActionStatusEnum (copy), v50 (copy), AccessResponseEnum (copy), GetFFlagEnableAmpEmailUpsellSupport (copy), GetFFlagEnableAmpIDVUpsellSupport (copy), featureName (copy), recourseData (copy), entryPointEventCtx (copy), v32 (copy), metadata (copy), t3 (copy), logEventOnceIfEnabled (copy), GetFFlagEnableAmpSubscriptionUpsell (copy)
		local action = p2.action

		if action == ActionTypeEnum.Phone then
			return {
				eventContext = "AmpUpsell",
				origin = AppScreens.AmpWizardContainer,
				onSuccess = function() --[[ onSuccess ]] -- line: 99
					-- upvalues: v45 (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v45(Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Phone] = ActionStatusEnum.Success
					}))
				end,
				onFailure = function() --[[ onFailure ]] -- line: 104
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Phone] = ActionStatusEnum.Failure
					}))
				end,
				onCancelled = function() --[[ onCancelled ]] -- line: 110
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Phone] = ActionStatusEnum.Cancelled
					}))
				end
			}
		end

		if GetFFlagEnableAmpEmailUpsellSupport() and action == ActionTypeEnum.AddedEmail then
			return {
				eventContext = "AmpUpsell",
				closeOnEmailUpdate = true,
				addEmailOver13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailUnder13TextKey = "Feature.VerificationUpsell.Description.IDVerificationAddEmailText",
				addEmailTitleKey = "Feature.VerificationUpsell.Heading.AddEmail",
				successCallback = function(_) --[[ successCallback ]] -- line: 124
					-- upvalues: v45 (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v45(Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Email] = ActionStatusEnum.Success
					}))
				end,
				failureCallback = function() --[[ failureCallback ]] -- line: 129
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Phone] = ActionStatusEnum.Failure
					}))
				end,
				closeCentralOverlay = function() --[[ closeCentralOverlay ]] -- line: 135
				end
			}
		end

		if GetFFlagEnableAmpIDVUpsellSupport() and action == ActionTypeEnum.GovernmentId then
			return {
				featureName = featureName,
				onSuccess = function() --[[ onSuccess ]] -- line: 140
					-- upvalues: v45 (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v45(Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.GovernmentId] = ActionStatusEnum.Success
					}))
				end,
				onFailure = function() --[[ onFailure ]] -- line: 148
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.GovernmentId] = ActionStatusEnum.Failure
					}))
				end,
				onCancelled = function() --[[ onCancelled ]] -- line: 157
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.GovernmentId] = ActionStatusEnum.Cancelled
					}))
				end
			}
		end

		if action == ActionTypeEnum.ParentConsent or action == ActionTypeEnum.ParentLink then
			return {
				recourseAction = p2.action,
				parentConsentTypes = p2.parentConsentTypes,
				recourseData = recourseData,
				entryPointEventCtx = entryPointEventCtx,
				onCancel = function() --[[ onCancel ]] -- line: 174
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), action (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[action] = ActionStatusEnum.Cancelled
					}))
				end,
				onSuccess = function() --[[ onSuccess ]] -- line: 180
					-- upvalues: v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), action (copy), ActionStatusEnum (copy)
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[action] = ActionStatusEnum.Success
					}))
				end,
				onRetryAmp = function() --[[ onRetryAmp ]] -- line: 186
					-- upvalues: v32 (copy), v45 (copy), Cryo (copy), v44 (copy), action (copy), ActionStatusEnum (copy)
					v32.pop()
					v45(Cryo.Dictionary.join(v44, {
						[action] = ActionStatusEnum.RetryRequested
					}))
				end
			}
		end

		if action == ActionTypeEnum.AgeEstimation then
			return {
				featureName = featureName,
				entryPointEventCtx = entryPointEventCtx,
				metadata = metadata,
				skipFacialAgeEstimationWebLinkModal = t3.skipFacialAgeEstimationWebLinkModal,
				onSuccess = function() --[[ onSuccess ]] -- line: 199
					-- upvalues: logEventOnceIfEnabled (copy), v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_success")
					v32.pop()
					v50(AccessResponseEnum.Granted, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Success
					}))
				end,
				onFailure = function() --[[ onFailure ]] -- line: 210
					-- upvalues: logEventOnceIfEnabled (copy), v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_error")
					v32.pop()
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Failure
					}))
				end,
				onCancel = function() --[[ onCancel ]] -- line: 221
					-- upvalues: logEventOnceIfEnabled (copy), v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					logEventOnceIfEnabled("complete_flow_with_cancel")
					v32.pop()
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.Cancelled
					}))
				end,
				onRetry = function() --[[ onRetry ]] -- line: 232
					-- upvalues: v32 (copy), v45 (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v32.pop()
					v45(Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.AgeEstimation] = ActionStatusEnum.RetryRequested
					}))
				end
			}
		end

		if GetFFlagEnableAmpSubscriptionUpsell() and action == ActionTypeEnum.Subscription then
			local v58 = recourseData

			return {
				purchaseUIOptions = v58 and v58.purchaseUIOptions,
				surfaceName = v58 and v58.surfaceName,
				surfaceContext = v58 and v58.surfaceContext,
				analyticsContext = v58 and v58.analyticsContext,
				onSuccess = function() --[[ onSuccess ]] -- line: 249
					-- upvalues: v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v32.pop()
					v50(AccessResponseEnum.Granted, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Subscription] = ActionStatusEnum.Success
					}))
				end,
				onFailure = function() --[[ onFailure ]] -- line: 259
					-- upvalues: v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v32.pop()
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Subscription] = ActionStatusEnum.Failure
					}))
				end,
				onCancel = function() --[[ onCancel ]] -- line: 269
					-- upvalues: v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), ActionTypeEnum (copy), ActionStatusEnum (copy)
					v32.pop()
					v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
						[ActionTypeEnum.Subscription] = ActionStatusEnum.Cancelled
					}))
				end
			}
		end

		return {}
	end, {
		v44,
		v50
	})
	local v52 = React.useCallback(function(p4) -- line: 290
		-- upvalues: ActionTypeEnum (copy), UserSettingsSettingNameEnum (copy), openUpsells (copy)
		local action = p4.action

		if action == ActionTypeEnum.UserSettings then
			local userSettings = p4.userSettings

			if userSettings and userSettings.settingName == UserSettingsSettingNameEnum.AllowFacialAgeEstimation then
				return nil
			end
		end

		return openUpsells[action]
	end, { openUpsells })
	local v53 = React.useCallback(function(_, t4: {[any]: any}?) -- line: 304
		-- upvalues: v47 (copy), v52 (copy), v51 (copy), ActionTypeEnum (copy), v50 (copy), AccessResponseEnum (copy), v44 (copy), accountSettingsUpsellStringsFn (copy), v43 (copy), featureName (copy), v32 (copy), Cryo (copy), ActionStatusEnum (copy)
		if t4 == nil or #t4 == 0 then
			v47(true)

			return
		end

		local v64 = t4[1]
		local action = v64.action
		local v66 = v52(v64)

		if v66 ~= nil then
			v66((v51(action, v64)))

			return
		end

		if action == ActionTypeEnum.Subscription then
			v50(AccessResponseEnum.Denied, v44)

			return
		end

		local v67 = accountSettingsUpsellStringsFn(v64)

		if not v67 then
			v50(AccessResponseEnum.Error, v44)

			return
		end

		v43({
			featureName = featureName,
			localizationStrings = v67,
			onCloseModal = function() --[[ onCloseModal ]] -- line: 333
				-- upvalues: v32 (copy), v50 (copy), AccessResponseEnum (copy), Cryo (copy), v44 (copy), action (copy), ActionStatusEnum (copy)
				v32.pop()
				v50(AccessResponseEnum.Denied, Cryo.Dictionary.join(v44, {
					[action] = ActionStatusEnum.Cancelled
				}))
			end
		})
	end, {
		v44,
		v50,
		featureName,
		v51,
		v32.pop,
		v43,
		v52
	})
	local v54 = React.useCallback(function(p6, p7) -- line: 351
		-- upvalues: v47 (copy), logEventOnceIfEnabled (copy), GetFFlagEnableAmpUpsellGql (copy), v41 (copy), v48 (copy), getSuccessfulActions (copy), v44 (copy), extraParameters (copy), AccessResponseEnum (copy), v53 (copy), v50 (copy)
		v47(false)
		logEventOnceIfEnabled("amp_feature_access_init")

		local v70 = if not GetFFlagEnableAmpUpsellGql() then v41.upsellFeatureAccess(p6, getSuccessfulActions(v44), p7, extraParameters) else v41.upsellFeatureAccessGql(v48, p6, getSuccessfulActions(v44), p7, extraParameters)

		if v70.access == AccessResponseEnum.Error then
			v47(true)

			return
		end

		if v70.access == AccessResponseEnum.Actionable then
			logEventOnceIfEnabled("amp_feature_access_actionable")
			v53(v70.recourse, v70.recourses)

			return
		end

		if v70.access == AccessResponseEnum.Granted then
			logEventOnceIfEnabled("amp_feature_access_granted")
			v50(AccessResponseEnum.Granted, v44)

			return
		end

		if v70.access == AccessResponseEnum.Denied then
			logEventOnceIfEnabled("amp_feature_access_denied")
			v50(AccessResponseEnum.Denied, v44)

			return
		end

		v50(AccessResponseEnum.Pending, v44)
	end, {
		v41,
		extraParameters,
		v50
	})

	React.useEffect(function() -- line: 384
		-- upvalues: sendModalActionEvent (copy), v42 (copy), AppScreens (copy), featureName (copy)
		sendModalActionEvent(v42, AppScreens.AmpWizardContainer, featureName, "Shown")
	end, { v42 })
	React.useEffect(function() -- line: 388
		-- upvalues: v54 (copy), featureName (copy), nameSpace (copy)
		v54(featureName, nameSpace)
	end, {
		v44,
		featureName,
		v54,
		nameSpace
	})

	if v46 then
		return React.createElement(ErrorScreen, {
			featureName = featureName,
			onRetry = function() --[[ onRetry ]] -- line: 395
				-- upvalues: v47 (copy), v54 (copy), featureName (copy)
				v47(false)
				v54(featureName)
			end,
			onCancel = function() --[[ onCancel ]] -- line: 399
				-- upvalues: v50 (copy), AccessResponseEnum (copy), v44 (copy)
				v50(AccessResponseEnum.Denied, v44)
			end
		})
	end

	return React.createElement(LoadingSpinner, {
		size = UDim2.fromOffset(42, 42),
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5)
	})
end

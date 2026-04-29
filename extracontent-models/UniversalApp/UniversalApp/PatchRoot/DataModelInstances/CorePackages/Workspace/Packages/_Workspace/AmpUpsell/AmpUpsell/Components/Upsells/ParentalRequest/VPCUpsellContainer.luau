local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local AmpUpsellParent = AmpUpsell.Parent
local React = require(AmpUpsellParent.React)
local VPCApiProvider = require(AmpUpsell.Common.VPCApiProvider)
local AmpApiProvider = require(AmpUpsell.Common.AmpApiProvider)
local useLocalization = require(AmpUpsellParent.Localization).Hooks.useLocalization
local vpcConfirmationScreenStrings = require(AmpUpsell.Common.LocalizationStrings).vpcConfirmationScreenStrings
local vpcUpsellGatherEmailStrings = require(AmpUpsell.Common.LocalizationStrings).vpcUpsellGatherEmailStrings
local VPCErrorScreen = require(script.Parent.VPCErrorScreen)
local VPCConfirmationScreen = require(script.Parent.VPCConfirmationScreen)
local VPCNewParentUpsell = require(script.Parent.VPCNewParentUpsell)
local isStringEmail = require(AmpUpsellParent.AuthCommon).Utils.isStringEmail
local AppScreens = require(AmpUpsell.Common.AppScreens)
local GetFStringPrivacyPolicyLink = require(AmpUpsell.Flags.GetFStringPrivacyPolicyLink)
local useNavigation = require(AmpUpsellParent.Navigation).useNavigation
local Enums = require(AmpUpsell.Common.Enums)
local ActionTypeEnum = Enums.ActionTypeEnum
local VPCStepEnum = Enums.VPCStepEnum
local AccessResponseEnum = Enums.AccessResponseEnum
local AuthAnalytics = require(AmpUpsellParent.AuthAnalytics)
local authMsgShown = AuthAnalytics.Events.authMsgShown
local authButtonClick = AuthAnalytics.Events.authButtonClick
local authFormInteraction = AuthAnalytics.Events.authFormInteraction
local vpcEventConstants = require(AmpUpsell.Common.EventConstants).vpcEventConstants
local useAppPolicy = require(AmpUpsellParent.UniversalAppPolicy).useAppPolicy
local useRoactService = require(AmpUpsellParent.RobloxAppHooks).useRoactService
local ArgCheck = require(AmpUpsellParent.ArgCheck)
local AppLinking = require(AmpUpsellParent.RoactServiceTags).AppLinking
local GetFFlagEnableExternalBrowserForVPCPrivacyPolicy = require(AmpUpsell.Flags.GetFFlagEnableExternalBrowserForVPCPrivacyPolicy)
local RoactNetworking = require(AmpUpsellParent.RoactServiceTags).RoactNetworking

return function(t1: {[any]: any}) --[[ VPCUpsellContainer ]] -- line: 48
	-- upvalues: VPCApiProvider (copy), AmpApiProvider (copy), useRoactService (copy), RoactNetworking (copy), GetFFlagEnableExternalBrowserForVPCPrivacyPolicy (copy), useAppPolicy (copy), AppLinking (copy), React (copy), ActionTypeEnum (copy), VPCStepEnum (copy), useLocalization (copy), vpcUpsellGatherEmailStrings (copy), useNavigation (copy), ArgCheck (copy), GetFStringPrivacyPolicyLink (copy), AppScreens (copy), isStringEmail (copy), AccessResponseEnum (copy), authMsgShown (copy), vpcEventConstants (copy), VPCConfirmationScreen (copy), vpcConfirmationScreenStrings (copy), authButtonClick (copy), VPCNewParentUpsell (copy), authFormInteraction (copy), VPCErrorScreen (copy)
	local onCancel = t1.onCancel
	local onSuccess = t1.onSuccess
	local v34 = if not t1.vpcApiProvider then VPCApiProvider else t1.vpcApiProvider
	local v35 = if not t1.ampApiProvider then AmpApiProvider else t1.ampApiProvider
	local recourseAction = t1.recourseAction
	local recourseData = t1.recourseData
	local v38 = not t1.entryPointEventCtx and "" or t1.entryPointEventCtx
	local parentConsentTypes = t1.parentConsentTypes
	local v40 = not not t1.disablePortal and t1.disablePortal
	local v41 = useRoactService(RoactNetworking)
	local u42 = false
	local u43 = nil

	if GetFFlagEnableExternalBrowserForVPCPrivacyPolicy() then
		u42 = useAppPolicy(function(p1) -- line: 64
			return p1.shouldUseExternalBrowserForDisclaimerLinks()
		end)
		u43 = useRoactService(AppLinking)
	end

	local v44, v45 = React.useState(if recourseAction ~= ActionTypeEnum.ParentLink then VPCStepEnum.AlreadyLinkedSendRequest else VPCStepEnum.NewParentLoading)
	local v46, v47 = React.useState("Unknown")
	local v48, v49 = React.useState({})
	local v50, v51 = React.useState(true)
	local v52 = useLocalization(vpcUpsellGatherEmailStrings)
	local v53, v54 = React.useState(false)
	local v55, v56 = React.useState("")
	local v57, v58 = React.useState("")
	local v59 = useNavigation()

	local function handleEmailInput(s1: string) -- line: 107
		-- upvalues: v56 (copy), isStringEmail (copy), v54 (copy), v58 (copy), v52 (copy)
		v56(s1)

		if isStringEmail(s1) then
			v54(true)
			v58("")

			return
		end

		v54(false)

		if s1 == "" then
			v58("")

			return
		end

		v58(v52.errorText)
	end

	local v61, v62 = React.useState(0)
	local onRetryAmp = t1.onRetryAmp

	local function onRetryVPC() -- line: 125
		-- upvalues: v62 (copy), v61 (copy), v49 (copy), v47 (copy), v56 (copy), isStringEmail (copy), v54 (copy), v58 (copy), v45 (copy), recourseAction (copy), ActionTypeEnum (copy), VPCStepEnum (copy)
		v62(v61 + 1)
		v49({})
		v47("Unknown")
		v56("")

		if isStringEmail("") then
			v54(true)
			v58("")
		else
			v54(false)
			v58("")
		end

		v45(if recourseAction ~= ActionTypeEnum.ParentLink then VPCStepEnum.AlreadyLinkedSendRequest else VPCStepEnum.NewParentCollectEmail)
	end
	local function getLinkedParentEmailsAndSendRequestToAllParents() -- line: 137
		-- upvalues: v34 (copy), v41 (copy), v49 (copy), parentConsentTypes (copy), recourseData (copy), v45 (copy), VPCStepEnum (copy), v47 (copy)
		v34.getLinkedParentEmails(v41):andThen(function(p2) -- line: 140
			-- upvalues: v49 (copy)
			v49(p2.parentEmails)
		end):catch(function(_) -- line: 143
		end)
		v34.sendRequestToAllParents(v41, parentConsentTypes, recourseData):andThen(function(_) -- line: 147
			-- upvalues: v45 (copy), VPCStepEnum (copy)
			v45(VPCStepEnum.RequestSent)
		end):catch(function(p5) -- line: 150
			-- upvalues: v47 (copy), v45 (copy), VPCStepEnum (copy)
			v47(p5.code)
			v45(VPCStepEnum.Error)
		end)
	end
	local function sendRequestToNewParent(p6) -- line: 156
		-- upvalues: v34 (copy), v41 (copy), parentConsentTypes (copy), recourseData (copy), v45 (copy), VPCStepEnum (copy), v47 (copy)
		v34.sendRequestToNewParent(v41, p6, parentConsentTypes, recourseData):andThen(function(_) -- line: 159
			-- upvalues: v45 (copy), VPCStepEnum (copy)
			v45(VPCStepEnum.RequestSent)
		end):catch(function(p8) -- line: 162
			-- upvalues: v47 (copy), v45 (copy), VPCStepEnum (copy)
			v47(p8.code)
			v45(VPCStepEnum.Error)
		end)
	end
	local function getIsChildSubjectToParentalControls() -- line: 168
		-- upvalues: v35 (copy), AccessResponseEnum (copy), v51 (copy), v45 (copy), VPCStepEnum (copy)
		local v75 = v35.getFeatureAccess({ "IsChildSubjectToParentalControls" })
		local v76 = true

		if v75.featureAccessList and v75.featureAccessList[1] then
			v76 = v75.featureAccessList[1].access ~= AccessResponseEnum.Denied
		end

		v51(v76)
		v45(VPCStepEnum.NewParentCollectEmail)
	end

	React.useEffect(function() -- line: 178
		-- upvalues: recourseAction (copy), ActionTypeEnum (copy), getLinkedParentEmailsAndSendRequestToAllParents (copy), getIsChildSubjectToParentalControls (copy)
		if recourseAction == ActionTypeEnum.ParentConsent then
			getLinkedParentEmailsAndSendRequestToAllParents()

			return
		end

		if recourseAction == ActionTypeEnum.ParentLink then
			getIsChildSubjectToParentalControls()
		end
	end, { v61 })

	if v44 == VPCStepEnum.RequestSent then
		authMsgShown(v38, "", vpcEventConstants.confirmationPageLoadField, "")

		return React.createElement(VPCConfirmationScreen, {
			messageStrings = vpcConfirmationScreenStrings,
			parentEmails = v48,
			onAck = function() --[[ onAck ]] -- line: 191
				-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), onSuccess (copy)
				authButtonClick(v38, vpcEventConstants.confirmationPageButton)
				onSuccess()
			end
		})
	end

	if v44 == VPCStepEnum.NewParentCollectEmail then
		authMsgShown(v38, "", vpcEventConstants.collectEmailPageLoadField, "")

		return React.createElement(VPCNewParentUpsell, {
			onCancel = onCancel,
			onCollectEmailAndSendRequest = function(p9) --[[ onCollectEmailAndSendRequest ]] -- line: 200
				-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), v49 (copy), v45 (copy), VPCStepEnum (copy), sendRequestToNewParent (copy)
				authButtonClick(v38, vpcEventConstants.collectEmailPageSubmitButton)
				v49({ p9 })
				v45(VPCStepEnum.NewParentSendRequest)
				sendRequestToNewParent(p9)
			end,
			onTextChange = function(p10) --[[ onTextChange ]] -- line: 206
				-- upvalues: authFormInteraction (copy), v38 (copy), vpcEventConstants (copy), handleEmailInput (copy)
				authFormInteraction(v38, vpcEventConstants.collectEmailPageInteractFormField)
				handleEmailInput(p10)
			end,
			canSendRequest = v53,
			textInput = v55,
			openPrivacyPolicyLink = function() -- line: 93
				-- upvalues: GetFFlagEnableExternalBrowserForVPCPrivacyPolicy (copy), u42 (ref), u43 (ref), GetFStringPrivacyPolicyLink (copy), ArgCheck (copy), v59 (copy), AppScreens (copy), v52 (copy)
				if GetFFlagEnableExternalBrowserForVPCPrivacyPolicy() and u42 then
					local v71 = u43
					local v72 = GetFStringPrivacyPolicyLink()

					ArgCheck.isNotNil(v71, "linking")
					ArgCheck.isType(v72, "string", "url")
					v71:openURL(v72)

					return
				end

				v59.navigate(AppScreens.GenericWebPage, {
					detail = GetFStringPrivacyPolicyLink(),
					extraProps = {
						title = v52.privacyLinkText,
						transitionAnimation = "SlideInFromBottom"
					}
				})
			end,
			errorText = v57,
			messageStrings = vpcUpsellGatherEmailStrings,
			isChildSubjectToParentalControls = v50,
			disablePortal = v40
		})
	end

	if v44 == VPCStepEnum.AlreadyLinkedSendRequest then
		return nil
	end

	if v44 == VPCStepEnum.NewParentSendRequest then
		return nil
	end

	if v44 == VPCStepEnum.NewParentLoading then
		return nil
	end

	authMsgShown(v38, "", vpcEventConstants.errorPageLoadField, v46)

	return React.createElement(VPCErrorScreen, {
		errorCode = v46,
		onRetryAmp = function() --[[ onRetryAmp ]] -- line: 228
			-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), onRetryAmp (copy)
			authButtonClick(v38, vpcEventConstants.errorPageRetryButton)
			onRetryAmp()
		end,
		onRetryVPC = function() --[[ onRetryVPC ]] -- line: 232
			-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), onRetryVPC (copy)
			authButtonClick(v38, vpcEventConstants.errorPageRetryButton)
			onRetryVPC()
		end,
		onCancel = function() --[[ onCancel ]] -- line: 236
			-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), onCancel (copy)
			authButtonClick(v38, vpcEventConstants.errorPageCancelButton)
			onCancel()
		end,
		onSuccess = function() --[[ onSuccess ]] -- line: 240
			-- upvalues: authButtonClick (copy), v38 (copy), vpcEventConstants (copy), onSuccess (copy)
			authButtonClick(v38, vpcEventConstants.confirmationPageButton)
			onSuccess()
		end,
		retryNum = v61
	})
end

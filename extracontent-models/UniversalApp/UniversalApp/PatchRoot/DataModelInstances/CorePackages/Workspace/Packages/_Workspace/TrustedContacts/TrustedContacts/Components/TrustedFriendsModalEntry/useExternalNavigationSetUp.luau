local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local TrustedContactsParent = TrustedContacts.Parent
local React = require(TrustedContactsParent.React)
local NotificationModalsManager = require(TrustedContactsParent.NotificationModalsManager)
local default = require(TrustedContactsParent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local OpenAmpWizardContainer = require(TrustedContactsParent.AmpUpsell).OpenAmpWizardContainer
local InExpAmpWizardController = require(TrustedContactsParent.AmpUpsell).InExpAmpWizardController
local NavigateBack = require(TrustedContactsParent.NavigationRodux).Thunks.NavigateBack
local useDispatch = require(TrustedContactsParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useOpenWebView = require(TrustedContactsParent.WebViewUtils).useOpenWebView
local v11 = game:DefineFastFlag("TCOpenAmpInGame", false)

require(TrustedContacts.Common.Types)

return function(t1: {[any]: any}) --[[ useExternalNavigationSetUp ]] -- line: 30
	-- upvalues: useDispatch (copy), React (copy), NotificationModalsManager (copy), useOpenWebView (copy), v11 (copy), NavigateBack (copy), InExpAmpWizardController (copy), OpenAmpWizardContainer (copy), default (copy)
	local v13 = useDispatch()
	local v14 = React.useCallback(function(s1: string) -- line: 33
		-- upvalues: NotificationModalsManager (copy)
		NotificationModalsManager.SetUIBloxToast({
			sequenceNumber = DateTime.now().UnixTimestamp,
			toastTitle = s1
		})
	end, {})
	local v15 = useOpenWebView()
	local v16 = React.useCallback(function(p1) -- line: 42
		-- upvalues: v11 (copy), v13 (copy), NavigateBack (copy), InExpAmpWizardController (copy), OpenAmpWizardContainer (copy)
		local function v21(p2, p3) -- line: 43
			-- upvalues: v11 (copy), v13 (copy), NavigateBack (copy), p1 (copy)
			if not v11 then
				v13(NavigateBack(true))
			end

			p1.completionCallback(p2, p3)
		end

		if v11 then
			InExpAmpWizardController.OpenAmpWizardContainerInExp(p1.featureName, v21, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace)

			return
		end

		v13(OpenAmpWizardContainer(p1.featureName, v21, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace))
	end, { v13 })
	local v17 = React.useCallback(function() -- line: 74
		-- upvalues: t1 (copy)
		if t1.onClosed then
			t1.onClosed()

			return
		end

		if t1.navigation then
			t1.navigation.pop()
		end
	end, {
		t1,
		t1.navigation
	})
	local v18 = React.useCallback(function(p4) -- line: 82
		-- upvalues: default (copy)
		default:shareUrl(p4)
	end, {})

	return {
		closeModal = v17,
		openAmpWizard = v16,
		showToast = v14,
		openWebView = v15,
		shareUrl = v18
	}
end

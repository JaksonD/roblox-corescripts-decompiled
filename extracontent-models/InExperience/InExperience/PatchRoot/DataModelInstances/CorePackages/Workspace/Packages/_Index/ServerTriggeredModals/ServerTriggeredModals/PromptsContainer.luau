local ServerTriggeredModals = script:FindFirstAncestor("ServerTriggeredModals")
local ServerTriggeredModalsParent = ServerTriggeredModals.Parent
local React = require(ServerTriggeredModalsParent.React)
local SduiSharedUtilities = require(ServerTriggeredModalsParent.SduiSharedUtilities)
local RoactServiceTags = require(ServerTriggeredModalsParent.RoactServiceTags)
local useRoactService = require(ServerTriggeredModalsParent.RobloxAppHooks).useRoactService
local SduiFeatureEntryPoint = SduiSharedUtilities.SduiFeatureEntryPoint
local reportModalImpression = require(ServerTriggeredModals.reportModalImpression)
local sendModalImpressionEvent = require(ServerTriggeredModals.sendModalImpressionEvent)

return React.memo(function(t1: {[any]: any}) --[[ PromptsContainer ]] -- line: 21
	-- upvalues: useRoactService (copy), RoactServiceTags (copy), React (copy), reportModalImpression (copy), sendModalImpressionEvent (copy), SduiFeatureEntryPoint (copy)
	local v11 = useRoactService(RoactServiceTags.RoactNetworking)
	local modalId = t1.modalId
	local modalType = t1.modalType

	React.useEffect(function() -- line: 26
		-- upvalues: modalId (copy), modalType (copy), reportModalImpression (copy), v11 (copy), sendModalImpressionEvent (copy)
		if modalId and modalType then
			reportModalImpression(v11, modalId, modalType)
			sendModalImpressionEvent(modalId, modalType)
		end
	end, {
		modalId,
		modalType,
		v11
	})

	return React.createElement(SduiFeatureEntryPoint, {
		configKey = t1.configKey,
		appPage = t1.appPage,
		shouldDisplayLoading = false,
		shouldDisplayError = false
	})
end)

local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local AmpUpsell = require(ServerDrivenUiParent.AmpUpsell)
local AccessResponseEnum = AmpUpsell.AmpEnums.AccessResponseEnum
local ActionStatusEnum = AmpUpsell.AmpEnums.ActionStatusEnum
local ActionTypeEnum = AmpUpsell.AmpEnums.ActionTypeEnum
local AgeCheckUpsellDismissedData = require(ServerDrivenUi.DataStore.AgeCheckUpsellDismissedData)

return function(p1, p2) --[[ onAmpWizardCompletion ]] -- line: 16
	-- upvalues: AccessResponseEnum (copy), ActionTypeEnum (copy), ActionStatusEnum (copy), AgeCheckUpsellDismissedData (copy)
	if p1 == AccessResponseEnum.Granted and (p2 and p2[ActionTypeEnum.AgeEstimation] == ActionStatusEnum.Success) then
		AgeCheckUpsellDismissedData.setAgeCheckUpsellDismissed()
	end
end

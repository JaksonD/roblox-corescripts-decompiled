local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local React = require(ServerDrivenUiParent.React)
local SignalsReact = require(ServerDrivenUiParent.SignalsReact)
local SduiContentRow = require(ServerDrivenUiParent.SduiSharedContent).SduiContentRow
local AgeCheckUpsellDismissedData = require(ServerDrivenUi.DataStore.AgeCheckUpsellDismissedData)

return React.memo(function(t1: {[any]: any}) --[[ SduiAgeCheckUpsellRow ]] -- line: 32
	-- upvalues: SignalsReact (copy), AgeCheckUpsellDismissedData (copy), React (copy), SduiContentRow (copy)
	if SignalsReact.useSignalState(AgeCheckUpsellDismissedData.getIsAgeCheckUpsellDismissed) then
		return nil
	end

	return React.createElement(SduiContentRow, t1)
end)

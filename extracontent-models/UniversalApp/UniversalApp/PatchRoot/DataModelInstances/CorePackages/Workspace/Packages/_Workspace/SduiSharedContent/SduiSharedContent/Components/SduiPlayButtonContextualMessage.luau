local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local GamePlayButton = require(Parent.GamePlayButton)
local RoactServiceTags = require(Parent.RoactServiceTags)
local useTokens = Foundation.Hooks.useTokens
local useRoactService = require(Parent.RobloxAppHooks).useRoactService
local usePlayButtonContextualMessage = GamePlayButton.usePlayButtonContextualMessage
local usePlayButtonState = GamePlayButton.usePlayButtonState

require(Parent.SduiCoreSystem)

local FoundationText = Foundation.Text

return React.memo(function(t1: {[any]: any}) --[[ SduiPlayButtonContextualMessage ]] -- line: 28
	-- upvalues: useRoactService (copy), RoactServiceTags (copy), useTokens (copy), usePlayButtonState (copy), usePlayButtonContextualMessage (copy), React (copy), FoundationText (copy)
	local v12 = useRoactService(RoactServiceTags.RoactNetworking)
	local v13 = useTokens()
	local v14 = usePlayButtonState(v12, t1.universeId, t1.fetchDelayInSeconds)
	local v15 = usePlayButtonContextualMessage(t1.universeId, v14.playButtonState, v14.playabilityStatus)

	if v15 == nil or v15 == "" then
		return nil
	end

	return React.createElement(FoundationText, {
		tag = "auto-xy text-body-medium text-wrap text-align-x-left",
		textStyle = v13.Color.Content.Emphasis,
		Text = v15,
		LayoutOrder = t1.layoutOrder
	})
end)

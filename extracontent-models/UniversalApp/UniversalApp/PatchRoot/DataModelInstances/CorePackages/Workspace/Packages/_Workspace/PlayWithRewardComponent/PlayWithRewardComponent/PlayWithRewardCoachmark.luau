local PlayWithRewardComponent = script:FindFirstAncestor("PlayWithRewardComponent")
local PlayWithRewardComponentParent = PlayWithRewardComponent.Parent
local Foundation = require(PlayWithRewardComponentParent.Foundation)
local React = require(PlayWithRewardComponentParent.React)
local PlayWithRewardCoachmarkStorage = require(PlayWithRewardComponent.PlayWithRewardCoachmarkStorage)
local PlayWithRewardTelemetry = require(PlayWithRewardComponent.PlayWithRewardTelemetry)
local Coachmark = Foundation.Coachmark
local PopoverAlign = Foundation.Enums.PopoverAlign
local PopoverSide = Foundation.Enums.PopoverSide

return React.memo(function(t1: {[any]: any}) --[[ PlayWithRewardCoachmark ]] -- line: 34
	-- upvalues: React (copy), PlayWithRewardCoachmarkStorage (copy), PlayWithRewardTelemetry (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	local v11, v12 = React.useState(false)

	React.useEffect(function() -- line: 37
		-- upvalues: v12 (copy), t1 (copy), PlayWithRewardCoachmarkStorage (copy), PlayWithRewardTelemetry (copy)
		v12(false)

		if t1.localUserId <= 0 then
			return
		end

		if PlayWithRewardCoachmarkStorage.consumeImpressionIfEligible(t1.localUserId) then
			v12(true)
			PlayWithRewardTelemetry.logPlayWithRewardCoachmark("shown", t1.flowId, t1.universeId, t1.productId)
		end
	end, {
		t1.flowId,
		t1.localUserId,
		t1.productId,
		t1.universeId
	})

	local v13 = React.useCallback(function() -- line: 50
		-- upvalues: PlayWithRewardCoachmarkStorage (copy), t1 (copy), PlayWithRewardTelemetry (copy), v12 (copy)
		PlayWithRewardCoachmarkStorage.dismissCurrentWindow(t1.localUserId)
		PlayWithRewardTelemetry.logPlayWithRewardCoachmark("dismissed", t1.flowId, t1.universeId, t1.productId)
		v12(false)
	end, {
		t1.flowId,
		t1.universeId,
		t1.productId,
		t1.localUserId
	})

	return React.createElement(Coachmark, {
		title = t1.title,
		text = t1.text,
		isOpen = v11,
		side = PopoverSide.Bottom,
		align = PopoverAlign.Center,
		anchorRef = t1.anchorRef,
		onClose = v13
	})
end)

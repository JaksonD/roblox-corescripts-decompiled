local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local React = require(CorePackages.Packages.React)
local t = require(CorePackages.Packages.t)
local PlayButtonStates = require(CorePackages.Workspace.Packages.GamePlayButton).PlayButtonStates
local UIBlox = require(CorePackages.Packages.UIBlox)
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local ComboButton = UIBlox.App.Button.ComboButton
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GetFFlagIsSquadEnabled = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppPlayButtonLoadingPrimary = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagUpdateActionNeededPlayButtonUi = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local Images = UIBlox.App.ImageSet.Images
local v16 = Images["icons/common/play"]
local v17 = Images["icons/status/private"]
local v18 = Images["icons/status/unavailable"]
local v19 = Images["icons/common/robux"]
local v20 = Images["icons/actions/truncationCollapse"]
local v21 = Roact.PureComponent:extend("PlayButton")

v21.validateProps = t.strictInterface({
	price = t.number,
	localizedFiatPrice = t.string,
	playButtonState = t.string,
	onPlayButtonActivated = t.callback,
	onPlaySquadButtonActivated = if not FFlagLuaAppEnablePlaySquadButton then nil else t.callback,
	Size = t.optional(t.UDim2),
	LayoutOrder = t.optional(t.number),
	testId = t.optional(t.string)
})

function v21.renderWithLocalization(p1, p2) -- line: 41
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), ButtonType (copy), v16 (copy), GetFFlagIsSquadEnabled (copy), v19 (copy), FFlagUpdateActionNeededPlayButtonUi (copy), v17 (copy), v18 (copy), Roact (copy), ComboButton (copy), v20 (copy), Button (copy), React (copy)
	local propsSize = p1.props.Size
	local propsLayoutOrder = p1.props.LayoutOrder
	local price = p1.props.price
	local playButtonState = p1.props.playButtonState
	local onPlayButtonActivated = p1.props.onPlayButtonActivated
	local onPlaySquadButtonActivated = p1.props.onPlaySquadButtonActivated
	local v30 = false
	local v31 = false
	local v32 = not FFlagLuaAppEnablePlaySquadButton and nil
	local v33 = not FFlagLuaAppEnablePlaySquadButton and nil
	local v34 = nil
	local v35 = nil
	local joinWithParty = nil

	if playButtonState == PlayButtonStates.Loading then
		v34 = if not FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.Secondary else ButtonType.PrimaryContextual
		v30 = true
	elseif playButtonState == PlayButtonStates.Playable then
		v34 = ButtonType.PrimaryContextual
		v35 = v16
	elseif GetFFlagIsSquadEnabled() and playButtonState == PlayButtonStates.PlayableWithParty then
		v35 = v16
		joinWithParty = p2.joinWithParty
		v32 = true
	elseif GetFFlagIsSquadEnabled() and playButtonState == PlayButtonStates.WaitingForParty then
		v35 = v16
		joinWithParty = p2.waitingForParty
		v31 = true
		v33 = true
		v32 = true
	elseif playButtonState == PlayButtonStates.PaidAccess then
		v34 = ButtonType.PrimaryContextual
		v35 = v19
		joinWithParty = tostring(price)
	elseif playButtonState == PlayButtonStates.FiatPaidAccess then
		v34 = ButtonType.PrimaryContextual
		joinWithParty = p1.props.localizedFiatPrice
	elseif playButtonState == PlayButtonStates.ActionNeeded then
		if FFlagUpdateActionNeededPlayButtonUi then
			v34 = ButtonType.PrimaryContextual
			joinWithParty = p2.unlock
		else
			v34 = ButtonType.PrimarySystem
			v35 = v17
			joinWithParty = p2.join
		end
	elseif playButtonState == PlayButtonStates.UnplayableOther then
		v34 = ButtonType.Secondary
		v35 = v18
		joinWithParty = p2.unavailable
		v31 = true
	else
		error("invalid play button state!")
	end

	if FFlagLuaAppEnablePlaySquadButton and v32 then
		return Roact.createElement(ComboButton, {
			layoutOrder = propsLayoutOrder,
			size = propsSize,
			button = {
				icon = v35,
				text = joinWithParty,
				isDisabled = v31,
				onActivated = v31 and function() -- line: 104
				end or onPlayButtonActivated
			},
			overflow = {
				icon = v20,
				isDisabled = v33,
				onActivated = v33 and function() -- line: 109
				end or onPlaySquadButtonActivated
			},
			testId = p1.props.testId
		})
	end

	return Roact.createElement(Button, {
		size = propsSize,
		layoutOrder = propsLayoutOrder,
		isLoading = v30,
		icon = v35,
		text = joinWithParty,
		buttonType = v34,
		userInteractionEnabled = not v31,
		isDisabled = v31,
		onActivated = v31 and function() -- line: 123
		end or onPlayButtonActivated,
		[React.Tag] = if not p1.props.testId then nil else `data-testid={ p1.props.testId }`
	})
end
function v21.render(p3) -- line: 129
	-- upvalues: withLocalization (copy), FFlagUpdateActionNeededPlayButtonUi (copy)
	return withLocalization({
		join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unlock = if not FFlagUpdateActionNeededPlayButtonUi then nil else "Feature.ExperienceDetails.PlayButtonText.Unlock",
		joinWithParty = "Feature.Squads.Action.JoinWithParty",
		unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		waitingForParty = "Feature.Squads.Action.WaitingForParty"
	})(function(p4) -- line: 136
		-- upvalues: p3 (copy)
		return p3:renderWithLocalization(p4)
	end)
end

return v21

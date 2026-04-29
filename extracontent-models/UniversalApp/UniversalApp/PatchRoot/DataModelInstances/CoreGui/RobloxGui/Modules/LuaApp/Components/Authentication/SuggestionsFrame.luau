local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Cryo = require(CorePackages.Packages.Cryo)
local Roact = require(CorePackages.Packages.Roact)
local UIBlox = require(CorePackages.Packages.UIBlox)
local withStyle = UIBlox.Style.withStyle
local withLocalization = require(Modules.LuaApp.withLocalization)
local FitChildren = require(Modules.LuaApp.FitChildren)
local FitTextLabel = require(Modules.LuaApp.Components.FitTextLabel)
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local Pillv2 = UIBlox.App.Control.Pillv2
local Chip = require(CorePackages.Packages.Foundation).Chip
local InputValidity = require(CorePackages.Workspace.Packages.AuthCommon).Enums.InputValidity
local ControlState = UIBlox.Core.Control.Enum.ControlState
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local RefreshButton = require(Modules.LuaApp.Components.Authentication.RefreshButton)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local v20 = Roact.PureComponent:extend("SuggestionsFrame")
local GetFFlagEnableSuggestionRefreshLoadingAnimation = require(Modules.LuaApp.Flags.GetFFlagEnableSuggestionRefreshLoadingAnimation)
local GetFFlagEnableUsernameSuggestionBorder = require(Modules.LuaApp.Flags.GetFFlagEnableUsernameSuggestionBorder)
local v23 = game:DefineFastFlag("UseChipForUsernameSuggestions", false)

function v20.init(p1) -- line: 34
	-- upvalues: Cryo (copy)
	p1.state = {
		showSuggestions = p1.props.showSuggestions or false,
		didGenerate = false,
		currentSuggestions = p1.props.prefilledSuggestions or {},
		lastUsernameInput = ""
	}
	p1.isMounted = false
	p1.usernameSuggestionsShown = p1.props.usernameSuggestionsShown

	function p1.suggestUsername(p2) -- line: 45
		-- upvalues: p1 (copy)
		p1.props.suggest.suggestUsernames(p1.props.networking, p2, p1.props.birthday, p1.props.context):andThen(function(p3) -- line: 50
			-- upvalues: p1 (copy)
			if p3.shouldUpdateState then
				p1:setState({
					didGenerate = p3.didGenerate,
					currentSuggestions = p3.suggestions
				})
			end
		end)
	end
	function p1.refreshSuggestions(p4) -- line: 61
		-- upvalues: p1 (copy)
		p1.props.suggest.suggestUsernames(p1.props.networking, p4, p1.props.birthday, p1.props.context):andThen(function(p5) -- line: 67
			-- upvalues: p1 (copy)
			if p5.shouldUpdateState and p5.didGenerate then
				p1:setState({
					didGenerate = p5.didGenerate,
					currentSuggestions = p5.suggestions
				})
			end
		end)
	end
	function p1.suggestionsToString(p6) -- line: 78
		return table.concat(p6, ",")
	end

	p1.shouldSuggest = p1.props.shouldSuggest
	p1.loadSuggestions = p1.props.loadSuggestions
	p1.finishSuggestions = p1.props.finishSuggestions
	p1.padding = {
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 2)
	}

	if p1.props.padding then
		p1.padding = Cryo.Dictionary.join(p1.padding, p1.props.padding)
	end
end
function v20.didMount(p7) -- line: 98
	p7.isMounted = true
end
function v20.didUpdate(p8, _, _) -- line: 102
	-- upvalues: InputValidity (copy)
	if p8.isMounted then
		local v29 = p8.props.textBoxRef:getValue()

		if v29.Text ~= "" and p8.props.prefilledSuggestions ~= p8.state.currentSuggestions then
			if p8.props.usernameValid == InputValidity.Invalid then
				if v29.Text ~= p8.state.lastUsernameInput and p8.shouldSuggest() then
					p8.suggestUsername(v29.Text)
				end

				p8:setState({
					lastUsernameInput = v29.Text
				})
			else
				p8:setState({
					didGenerate = false,
					lastUsernameInput = ""
				})
			end

			p8:setState({
				showSuggestions = p8.state.didGenerate
			})

			if p8.state.showSuggestions and p8.usernameSuggestionsShown then
				p8.usernameSuggestionsShown(v29.Text, p8.suggestionsToString(p8.state.currentSuggestions))
			end
		end
	end
end
function pillPressed(p11) -- line: 128
	-- upvalues: ControlState (copy)
	return p11 == ControlState.Pressed or p11 == ControlState.SelectedPressed
end
function suggestionPill(p12, p13, p14, p15, p16, p17) -- line: 133
	-- upvalues: v23 (copy), Roact (copy), Chip (copy), ControlState (copy), GetFFlagEnableSuggestionRefreshLoadingAnimation (copy), GetFFlagEnableUsernameSuggestionBorder (copy), Focusable (copy), Pillv2 (copy)
	if v23 then
		return Roact.createElement(Chip, {
			text = p12,
			onActivated = function() --[[ onActivated ]] -- line: 144
				-- upvalues: p14 (copy), p13 (copy), p15 (copy), p12 (copy), p16 (copy), ControlState (copy)
				if p14 then
					p14()
				end

				local v51 = p13:getValue()

				if p15 then
					p15(v51.Text, p12)
				end

				v51.Text = p12
				p16(ControlState.Pressed)
			end
		})
	end

	local t1 = {
		text = p12,
		onStateChanged = function(_, p19) --[[ onStateChanged ]] -- line: 160
			-- upvalues: p14 (copy), p13 (copy), p15 (copy), p12 (copy), p16 (copy)
			if pillPressed(p19) then
				if p14 then
					p14()
				end

				local v54 = p13:getValue()

				if p15 then
					p15(v54.Text, p12)
				end

				v54.Text = p12
				p16(p19)
			end
		end,
		onActivated = function() --[[ onActivated ]] -- line: 179
		end,
		isLoading = not not GetFFlagEnableSuggestionRefreshLoadingAnimation() and (p17 or false)
	}

	if GetFFlagEnableUsernameSuggestionBorder() then
		t1.hasBorder = true
	end

	return Roact.createElement(Focusable[Pillv2], t1)
end
function getPills(p20, p21, p22, p23, p24, p25) -- line: 189
	local t2 = {}

	for _, v in pairs(p20) do
		t2[v] = suggestionPill(v, p21, p22, p23, p24, p25)
	end

	return t2
end
function v20.render(p26) -- line: 218
	-- upvalues: withStyle (copy), withLocalization (copy), TextService (copy), Roact (copy), FitChildren (copy), FitTextLabel (copy), FitFrameHorizontal (copy), RefreshButton (copy)
	if p26.isMounted and p26.props.textBoxRef:getValue().Text ~= p26.state.lastUsernameInput then
		p26:setState({
			showSuggestions = false
		})
	end

	return withStyle(function(p27) -- line: 227
		-- upvalues: withLocalization (copy), TextService (copy), p26 (copy), Roact (copy), FitChildren (copy), FitTextLabel (copy), FitFrameHorizontal (copy), RefreshButton (copy)
		return withLocalization({
			tryText = "Authentication.SignUp.Description.Try"
		})(function(p28) -- line: 230
			-- upvalues: p27 (copy), TextService (copy), p26 (copy), Roact (copy), FitChildren (copy), FitTextLabel (copy), FitFrameHorizontal (copy), RefreshButton (copy)
			local CaptionHeader = p27.Font.CaptionHeader
			local v60 = p27.Font.BaseSize * p27.Font.CaptionHeader.RelativeSize
			local v61 = TextService:GetTextSize(p28.tryText, v60, CaptionHeader.Font, Vector2.new()).X + 12

			return p26.state.showSuggestions and Roact.createElement(FitChildren.FitFrame, {
				Size = UDim2.new(1, 0, 0, 0),
				LayoutOrder = p26.props.layoutOrder,
				fitAxis = FitChildren.FitAxis.Height,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				BackgroundColor3 = p27.Theme.BackgroundUIDefault.Color,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				padding = Roact.createElement("UIPadding", p26.padding),
				Title = Roact.createElement(FitTextLabel, {
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildren.FitAxis.Height,
					BackgroundTransparency = 1,
					Text = p28.tryText .. ":",
					TextWrapped = true,
					Font = CaptionHeader.Font,
					TextSize = v60,
					TextColor3 = p27.Theme.TextEmphasis.Color,
					TextTransparency = p27.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				SuggestionButtons = Roact.createElement(FitFrameHorizontal, {
					Position = UDim2.new(0, v61, 0, -6),
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					FillDirection = Enum.FillDirection.Vertical,
					contentPadding = UDim.new(0, 6),
					BorderSizePixel = 0,
					AutomaticSize = Enum.AutomaticSize.XY
				}, getPills(p26.state.currentSuggestions, p26.props.textBoxRef, p26.props.updatePillClicked, p26.props.usernameSuggestionClicked, p26.props.updateSuggestionControlState, p26.props.loadingSuggestions)),
				RefreshButtonFrame = p26.props.useRefreshButton and Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right
					}),
					RefreshButton = Roact.createElement(RefreshButton, {
						onRefresh = function() --[[ onRefresh ]] -- line: 295
							-- upvalues: p26 (copy)
							p26.props.logRefreshButtonClicked()

							local v62 = p26.props.textBoxRef:getValue()

							p26.refreshSuggestions(v62.Text)
						end,
						loadSuggestions = p26.loadSuggestions,
						finishSuggestions = p26.finishSuggestions
					})
				})
			})
		end)
	end)
end

return (RoactServices.connect({
	networking = RoactNetworking
})(v20))

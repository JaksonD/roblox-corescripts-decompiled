local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local React = require(Parent.React)
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local FoundationText = Foundation.Text
local View = Foundation.View
local Enums = Foundation.Enums

require(Parent.AvatarExperienceCommon)

local WearTimeOptionButton = require(script.Parent.WearTimeOptionButton)
local CombinedFFlagShouldUseLegacyGamepadFocus = AvatarExperienceFlags.CombinedFFlagShouldUseLegacyGamepadFocus
local AXTooltip = require(Parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip

return function(t1: {[any]: any}) --[[ WearTimeOptionsCarousel ]] -- line: 33
	-- upvalues: useTokens (copy), useLocalization (copy), React (copy), WearTimeOptionButton (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy), View (copy), FoundationText (copy), Foundation (copy), Enums (copy), AXTooltip (copy)
	local v14 = useTokens()
	local v15 = useLocalization({
		wearTimeOptions = "Feature.Durables.ItemDetails.WearTimeOptions.Title",
		tooltipText = "Feature.Durables.FTUX.Tooltip"
	})
	local v16, v17 = React.useState(false)

	React.useEffect(function() -- line: 42
		-- upvalues: v17 (copy)
		local thread = task.delay(5, function() -- line: 43
			-- upvalues: v17 (copy)
			v17(false)
		end)

		return function() -- line: 47
			-- upvalues: thread (copy)
			task.cancel(thread)
		end
	end, {})

	local v18, v19 = React.useState(function() -- line: 52
		-- upvalues: t1 (copy)
		for v24, v25 in t1.options do
			if v25.selected then
				return v24
			end
		end

		return 1
	end)
	local v20 = React.useMemo(function() -- line: 63
		-- upvalues: t1 (copy), React (copy), WearTimeOptionButton (copy), v18 (copy), v19 (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy)
		local t2 = {}

		for v27, v28 in t1.options do
			t2[v27] = React.createElement(WearTimeOptionButton, {
				option = {
					days = v28.days,
					price = v28.price,
					selected = v27 == v18
				},
				onActivated = function() --[[ onActivated ]] -- line: 72
					-- upvalues: v19 (copy), v27 (copy), t1 (copy)
					v19(v27)

					if t1.onOptionActivated then
						t1.onOptionActivated(v27)
					end
				end,
				LayoutOrder = v27,
				ref = if not CombinedFFlagShouldUseLegacyGamepadFocus or (v27 ~= 1 or not t1.firstOptionRef) then nil else t1.firstOptionRef,
				nextSelectionDownRef = if not CombinedFFlagShouldUseLegacyGamepadFocus or v27 ~= #t1.options then nil else t1.nextSelectionDown
			})
		end

		return t2
	end, {
		t1.options,
		v18,
		t1.onOptionActivated,
		if not CombinedFFlagShouldUseLegacyGamepadFocus then nil else t1.firstOptionRef,
		if not CombinedFFlagShouldUseLegacyGamepadFocus then nil else t1.nextSelectionDown
	})
	local v21 = React.createElement(View, {
		tag = "row gap-medium align-y-center auto-xy"
	}, {
		Options = React.createElement(React.Fragment, nil, v20)
	})
	local v22 = if not t1.useWrapping then React.createElement(View, {
		tag = "size-full-0",
		Size = UDim2.new(1, 0, 0, v14.Size.Size_1200),
		LayoutOrder = 2
	}, {
		ScrollingFrame = React.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, v14.Size.Size_1200),
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ClipsDescendants = false,
			ElasticBehavior = Enum.ElasticBehavior.Always,
			Selectable = false
		}, v21)
	}) else React.createElement(View, {
		tag = "row wrap gap-medium align-y-center size-full-0 auto-y",
		LayoutOrder = 2,
		wrap = true
	}, v20)

	return React.createElement(View, {
		LayoutOrder = t1.LayoutOrder,
		tag = "size-full-0 auto-y col gap-medium"
	}, {
		Heading = React.createElement(View, {
			tag = "auto-xy row gap-xxsmall align-y-center",
			LayoutOrder = 1
		}, {
			HeadingText = React.createElement(FoundationText, {
				Text = v15.wearTimeOptions,
				textStyle = v14.Color.Content.Emphasis,
				fontStyle = {
					Font = v14.Typography.TitleLarge.Font,
					FontSize = v14.FontSize.FontSize_500
				},
				AutomaticSize = Enum.AutomaticSize.XY,
				LayoutOrder = 1
			}),
			InfoIconContainer = React.createElement(View, {
				tag = "auto-xy",
				LayoutOrder = 2
			}, {
				InfoIcon = React.createElement(Foundation.IconButton, {
					icon = Enums.IconName.CircleI,
					size = Enums.IconSize.Small,
					onActivated = function() --[[ onActivated ]] -- line: 161
						-- upvalues: v17 (copy)
						v17(true)
					end
				}),
				Tooltip = React.createElement(AXTooltip, {
					isOpen = v16,
					popoverSide = "Top",
					tooltipText = v15.tooltipText,
					maxWidth = v14.Size.Size_1200 * 3,
					onTooltipActivated = function() --[[ onTooltipActivated ]] -- line: 170
						-- upvalues: v17 (copy)
						v17(false)
					end
				})
			})
		}),
		CarouselContainer = v22
	})
end

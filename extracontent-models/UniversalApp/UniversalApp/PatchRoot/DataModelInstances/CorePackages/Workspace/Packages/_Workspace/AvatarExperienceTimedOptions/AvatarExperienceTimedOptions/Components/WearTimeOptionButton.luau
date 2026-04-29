local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)

require(Parent.AvatarExperienceCommon)

local React = require(Parent.React)
local useLocalization = require(Parent.Localization).Hooks.useLocalization
local Foundation = require(Parent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local FoundationText = Foundation.Text
local Enums = Foundation.Enums
local CombinedFFlagShouldUseLegacyGamepadFocus = AvatarExperienceFlags.CombinedFFlagShouldUseLegacyGamepadFocus

return (React.forwardRef(function(t1: {[any]: any}, p1) -- line: 23
	-- upvalues: useTokens (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy), React (copy), useLocalization (copy), Foundation (copy), Enums (copy), FoundationText (copy)
	local v12 = useTokens()
	local u13 = nil
	local v14 = nil

	if CombinedFFlagShouldUseLegacyGamepadFocus then
		u13 = React.useRef(nil)
		React.useEffect(function() -- line: 31
			-- upvalues: u13 (ref), t1 (copy)
			local v17 = u13 and u13.current

			if not v17 then
				return
			end

			local v18 = if not t1.nextSelectionDownRef then nil else t1.nextSelectionDownRef.current

			if v18 then
				v17.NextSelectionDown = v18
			end

			if not t1.nextSelectionDownRef then
				return
			end

			local connection = v17.SelectionGained:Connect(function() -- line: 46
				-- upvalues: v17 (copy)
				local Parent2 = v17.Parent

				while Parent2 and not Parent2:IsA("ScrollingFrame") do
					Parent2 = Parent2.Parent
				end

				if Parent2 and Parent2:IsA("ScrollingFrame") then
					local AbsolutePositionY = v17.AbsolutePosition.Y
					local AbsolutePositionY2 = Parent2.AbsolutePosition.Y
					local AbsoluteWindowSizeY = Parent2.AbsoluteWindowSize.Y
					local AbsoluteSizeY = v17.AbsoluteSize.Y
					local v26 = AbsolutePositionY - (AbsoluteWindowSizeY * 0.5 - AbsoluteSizeY * 0.5 + AbsolutePositionY2)
					local v27 = Parent2.CanvasPosition.Y + v26

					Parent2.CanvasPosition = Vector2.new(0, (math.max(0, v27)))
				end
			end)

			return function() -- line: 63
				-- upvalues: connection (copy)
				connection:Disconnect()
			end
		end, { t1.nextSelectionDownRef })
		v14 = React.useCallback(function(p2) -- line: 68
			-- upvalues: u13 (ref), p1 (copy)
			if u13 then
				u13.current = p2
			end

			if typeof(p1) == "function" then
				p1(p2)

				return
			end

			if p1 then
				p1.current = p2
			end
		end, { p1 })
	end

	local v15 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = t1.option.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = t1.option.days
		}
	})
	local v16 = if t1.option.days ~= 0 then if t1.option.days ~= 1 then v15.xDays else v15.xDay else v15.infinite

	return React.createElement(Foundation.View, {
		tag = {
			["row align-y-center gap-small padding-medium radius-medium stroke-standard"] = true,
			["stroke-thick"] = t1.option.selected,
			["stroke-system-contrast"] = t1.option.selected,
			["stroke-emphasis"] = not t1.option.selected
		},
		ref = if not CombinedFFlagShouldUseLegacyGamepadFocus then p1 else v14,
		onActivated = t1.onActivated,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 0, v12.Size.Size_1000),
		stateLayer = {
			affordance = Enums.StateLayerAffordance.None
		},
		selection = {
			Selectable = true
		}
	}, {
		DaysLabel = React.createElement(FoundationText, {
			tag = "auto-xy text-title-small content-emphasis",
			Text = v16,
			LayoutOrder = 1,
			selection = {
				Selectable = false
			}
		}),
		PriceTag = React.createElement(Foundation.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 2
		}, {
			RobuxIcon = React.createElement(Foundation.Icon, {
				name = Enums.IconName.Robux,
				variant = Enums.IconVariant.Filled,
				size = Enums.IconSize.XSmall,
				LayoutOrder = 1
			}),
			PriceLabel = React.createElement(FoundationText, {
				tag = "auto-xy text-body-small",
				Text = tostring(t1.option.price),
				LayoutOrder = 2,
				selection = {
					Selectable = false
				}
			})
		})
	})
end))

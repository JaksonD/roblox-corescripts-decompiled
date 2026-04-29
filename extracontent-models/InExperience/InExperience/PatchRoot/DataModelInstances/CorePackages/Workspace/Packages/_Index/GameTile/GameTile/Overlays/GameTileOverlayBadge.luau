local Parent = script:FindFirstAncestor("GameTile").Parent
local Foundation = require(Parent.Foundation)
local GetTextSize = require(Parent.Style).GetTextSize
local Icon = Foundation.Icon
local IconSize = Foundation.Enums.IconSize
local React = require(Parent.React)
local dependencyArray = require(Parent.RoactUtils).Hooks.dependencyArray
local useTokens = Foundation.Hooks.useTokens
local t1 = {}
local FFlagRemoveDependencyArrayAntipattern = require(Parent.SharedFlags).FFlagRemoveDependencyArrayAntipattern

return React.memo(function(t2: {[any]: any}) --[[ GameTileOverlayBadge ]] -- line: 38
	-- upvalues: t1 (copy), useTokens (copy), React (copy), GetTextSize (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), Icon (copy), IconSize (copy)
	local v12 = t2.icons or t1
	local v13 = t2.text or ""
	local v14 = #v12 > 0
	local v15 = #v13 > 0
	local v16 = useTokens()
	local v17 = if not t2.styleOptions then v16.Color.Extended.White.White_90 else t2.styleOptions.backgroundColorStyle or v16.Color.Extended.White.White_90
	local v18 = if not t2.styleOptions then v16.LightMode.Content.Emphasis else t2.styleOptions.contentColorStyle or v16.LightMode.Content.Emphasis
	local v19 = t2.styleOptions and t2.styleOptions.cornerRadius or UDim.new(1, 0)
	local v20 = if not v15 and not (#v12 > 1) then v16.Size.Size_150 else v16.Size.Size_200
	local v21 = if not t2.styleOptions then v16.Size.Size_150 else t2.styleOptions.verticalPadding or v16.Size.Size_150
	local XSmall = v16.Padding.XSmall
	local TitleSmall = v16.Typography.TitleSmall
	local Size_400 = v16.Size.Size_400
	local v25 = React.useMemo(function() -- line: 64
		-- upvalues: v15 (copy), GetTextSize (copy), v13 (copy), TitleSmall (copy)
		if v15 then
			return (GetTextSize(v13, TitleSmall.FontSize, TitleSmall.Font, Vector2.new(1e999, 1e999)))
		end

		return (Vector2.new(0, 0))
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v13, v15, TitleSmall.FontSize, TitleSmall.Font) else {
		v13,
		v15,
		TitleSmall.FontSize,
		TitleSmall.Font
	})

	if not v15 and not v14 then
		return nil
	end

	local t3 = {
		Padding = React.createElement("UIPadding", {
			PaddingTop = UDim.new(0, v21),
			PaddingLeft = UDim.new(0, v20),
			PaddingBottom = UDim.new(0, v21),
			PaddingRight = UDim.new(0, v20)
		}),
		Layout = React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, XSmall)
		})
	}
	local n1 = 0

	for v28, v29 in v12 do
		t3[`Icon{ v28 }`] = React.createElement(Icon, {
			LayoutOrder = v28,
			name = v29,
			size = IconSize.Small,
			style = v18
		})

		local v30 = Size_400 + XSmall

		n1 += v30
	end

	if v15 then
		t3.BadgeText = React.createElement("TextLabel", {
			LayoutOrder = #v12 + 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(v25.X, v25.Y),
			Text = v13,
			TextColor3 = v18.Color3,
			Font = TitleSmall.Font,
			TextSize = TitleSmall.FontSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = false,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			UISizeConstraint = React.createElement("UISizeConstraint", {
				MaxSize = t2.maxWidthBinding:map(function(n2: number) -- line: 122
					-- upvalues: v20 (copy), n1 (ref)
					local v32 = n2 - 2 * v20 - n1

					if v32 > 0 then
						return (Vector2.new(v32, 1e999))
					end

					return nil
				end)
			})
		})
	end

	return React.createElement("Frame", {
		BackgroundColor3 = v17.Color3,
		BackgroundTransparency = v17.Transparency,
		Position = t2.Position,
		AnchorPoint = t2.AnchorPoint,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Corner = React.createElement("UICorner", {
			CornerRadius = v19
		}),
		BadgeContent = React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, t3)
	})
end)

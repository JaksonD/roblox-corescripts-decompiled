local Parent = script:FindFirstAncestor("AppBlox").Parent
local Cryo = require(Parent.Cryo)
local React = require(Parent.React)
local Foundation = require(Parent.Foundation)
local Button = Foundation.Button
local BannerBadge = require(script.Parent.BannerBadge)
local Icon = Foundation.Icon
local IconButton = Foundation.IconButton
local View = Foundation.View
local FoundationText = Foundation.Text
local FoundationImage = Foundation.Image
local t1 = {
	isContained = true,
	width = UDim.new(1, 0),
	tags = {
		container = "col auto-y"
	}
}

return React.memo(function(t2: {[any]: any}) --[[ Banner ]] -- line: 48
	-- upvalues: Cryo (copy), t1 (copy), React (copy), Button (copy), Foundation (copy), BannerBadge (copy), IconButton (copy), View (copy), Icon (copy), FoundationImage (copy), FoundationText (copy)
	local v14 = Cryo.Dictionary.join(t1, t2)
	local s1 = "col auto-y"

	if v14.isContained then
		s1 ..= " " .. "radius-medium padding-large stroke-standard stroke-default bg-shift-100"
	end

	local v16 = v14.badges and #v14.badges > 0
	local v17 = v14.buttons and (#v14.buttons < 2 and (not v14.image and (not v14.body and (not v16 and not v14.onDismiss))))
	local v18 = React.useMemo(function() -- line: 63
		-- upvalues: v14 (copy), React (copy), Button (copy), Cryo (copy), Foundation (copy)
		local t3 = {}

		if v14.buttons and #v14.buttons > 0 then
			for v22, v23 in v14.buttons do
				t3["banner-button-" .. v22] = React.createElement(Button, Cryo.Dictionary.join({
					LayoutOrder = v22 + 1,
					size = Foundation.Enums.InputSize.Small,
					testId = "--banner-button-" .. v22
				}, v23))
			end
		end

		return t3
	end, { v14.buttons })
	local v19 = React.useMemo(function() -- line: 80
		-- upvalues: v14 (copy), React (copy), BannerBadge (copy), Cryo (copy)
		local t4 = {}

		if v14.badges then
			for i, v in ipairs(v14.badges) do
				t4["banner-badge-" .. i] = React.createElement(BannerBadge, Cryo.Dictionary.join({
					testId = "--banner-badge-" .. i,
					LayoutOrder = i + 1
				}, v))
			end
		end

		return t4
	end, { v14.badges })
	local v20 = React.useMemo(function() -- line: 96
		-- upvalues: v14 (copy), React (copy), IconButton (copy), v16 (copy), Foundation (copy)
		if not v14.onDismiss then
			return nil
		end

		return (React.createElement(IconButton, {
			testId = not v16 and "--banner-dismiss" or "--banner-badges-dismiss",
			LayoutOrder = not v16 and 3 or 1,
			icon = Foundation.Enums.IconName.XSmall,
			isCircular = true,
			variant = Foundation.Enums.ButtonVariant.Utility,
			onActivated = v14.onDismiss
		}))
	end, {
		v14.onDismiss,
		v16
	})

	return React.createElement(View, {
		LayoutOrder = v14.LayoutOrder,
		Size = UDim2.new(v14.width.Scale, v14.width.Offset, 0, 0),
		testId = "--banner",
		tag = s1
	}, {
		BadgesRow = if not v16 then nil else React.createElement(View, {
			tag = "row auto-y size-full-0 flex-between gap-large align-y-center padding-bottom-large",
			LayoutOrder = 2
		}, {
			Badges = React.createElement(View, {
				LayoutOrder = 1,
				testId = "--banner-badges",
				tag = "row auto-xy gap-small fill"
			}, v19),
			Dismiss = if not v20 then nil else React.createElement(View, {
				tag = "auto-xy",
				LayoutOrder = 2
			}, {
				Dismiss = v20
			})
		}),
		ContentRow = React.createElement(View, {
			tag = {
				["row auto-y size-full-0 gap-large"] = true,
				["align-y-center"] = v17
			},
			LayoutOrder = 3
		}, {
			Icon = if not v14.icon or v14.image then nil else React.createElement(Icon, {
				testId = "--banner-icon",
				LayoutOrder = 1,
				size = Foundation.Enums.IconSize.Large,
				name = v14.icon,
				variant = v14.iconVariant,
				style = v14.iconStyle
			}),
			Image = if not v14.image then nil else React.createElement(View, {
				tag = "auto-xy flex-none bg-shift-100 radius-medium"
			}, {
				Image = React.createElement(FoundationImage, {
					Image = v14.image,
					testId = "--banner-image",
					tag = "size-1800",
					ScaleType = Enum.ScaleType.Fit
				})
			}),
			Content = React.createElement(View, {
				LayoutOrder = 2,
				tag = {
					["auto-xy gap-small align-x-left fill"] = true,
					["col flex-fill"] = not v17,
					["row align-y-center flex-between"] = v17
				}
			}, {
				Title = React.createElement(FoundationText, {
					Text = v14.title,
					testId = "--banner-title",
					tag = "auto-xy text-title-medium content-emphasis fill text-wrap text-align-x-left",
					LayoutOrder = 1
				}),
				InlineButton = if not v17 or (not v14.buttons or not v14.buttons[1]) then nil else React.createElement(Button, Cryo.Dictionary.join({
					tag = "auto-xy shrink",
					LayoutOrder = 2,
					testId = "--banner-button-inline"
				}, v14.buttons[1])),
				Subcontent = if v17 then nil else React.createElement(View, {
					tag = "auto-xy col gap-large shrink",
					LayoutOrder = 2
				}, {
					Body = if not v14.body then nil else React.createElement(FoundationText, {
						testId = "--banner-body",
						Text = v14.body,
						tag = "auto-xy text-body-medium content-default text-wrap text-align-x-left",
						LayoutOrder = 1,
						RichText = true
					}),
					Buttons = React.createElement(View, {
						tag = "row auto-xy grow gap-small wrap",
						LayoutOrder = 2,
						testId = "--banner-buttons"
					}, v18)
				})
			}),
			Dismiss = if v16 then nil else v20
		})
	})
end)

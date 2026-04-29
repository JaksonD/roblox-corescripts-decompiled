local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)

require(Foundation.Providers.Style.Tokens)
require(script.Parent.Types)

local staticRules = require(script.Parent.staticRules)
local tokenAttributePascalName = require(script.Parent.Parent.tokenAttributePascalName)

local function kebabToPascal(s1: string) -- line: 26
	return (s1:gsub("^%-?(.)", function(p1) -- line: 28
		return p1:upper()
	end):gsub("%-(.)", function(p2) -- line: 33
		return p2:upper()
	end))
end
local function DefaultSizeRules(p3, n1: number) -- line: 49
	local v27 = p3.TextSize / n1 * (p3.LineHeight * n1) - p3.TextSize
	local uDim = UDim.new(0, v27 / 2)

	return {{
		tag = "text-size-defaults",
		priority = -1,
		properties = {
			TextSize = "$TextSizeBodyLarge",
			LineHeight = p3.LineHeight
		},
		children = {{
			tag = "text-size-defaults",
			pseudo = "UIPadding",
			priority = -1,
			properties = {
				PaddingTop = "$TextPaddingBodyLarge",
				PaddingBottom = "$TextPaddingBodyLarge"
			},
			attributes = {{
				name = "TextPaddingBodyLarge",
				value = uDim
			}}
		}},
		attributes = {{
			name = "TextSizeBodyLarge",
			value = p3.TextSize
		}}
	}}
end
local function ListLayoutSpacingRules(p4, p5) -- line: 87
	-- upvalues: kebabToPascal (copy), Dash (copy)
	local t1 = {}

	for _, v33 in p4 do
		local v34 = kebabToPascal(v33.name)

		table.insert(t1, {
			tag = `gap-{ v33.name }`,
			pseudo = "UIListLayout",
			properties = {
				Padding = `$Gap{ v34 }`
			},
			attributes = {{
				name = `Gap{ v34 }`,
				value = v33.size
			}}
		})
	end

	local t2 = {}

	for _, v37 in p5 do
		local v38 = kebabToPascal(v37.name)

		table.insert(t2, {
			tag = `gutter-{ v37.name }`,
			pseudo = "UIListLayout",
			properties = {
				Padding = `$Gutter{ v38 }`
			},
			attributes = {{
				name = `Gutter{ v38 }`,
				value = v37.size
			}}
		})
	end

	return Dash.joinArrays(t1, t2)
end
local function CornerRules(p6) -- line: 129
	-- upvalues: kebabToPascal (copy)
	local t3 = {}

	for _, v42 in p6 do
		local v43 = kebabToPascal(v42.name)

		table.insert(t3, {
			tag = `radius-{ v42.name }`,
			pseudo = "UICorner",
			properties = {
				CornerRadius = `$Radius{ v43 }`
			},
			attributes = {{
				name = `Radius{ v43 }`,
				value = v42.size
			}}
		})
	end

	return t3
end
local function SizeRules(p7) -- line: 152
	-- upvalues: kebabToPascal (copy)
	local t4 = {}

	for _, v47 in p7 do
		local v48 = kebabToPascal(v47.name)

		table.insert(t4, {
			tag = `size-{ v47.name }`,
			properties = {
				Size = `$Size{ v48 }`
			},
			attributes = {{
				name = `Size{ v48 }`,
				value = UDim2.new(v47.size, v47.size)
			}}
		})

		for _, v50 in p7 do
			local v51 = kebabToPascal(v50.name)

			table.insert(t4, {
				tag = `size-{ v47.name }-{ v50.name }`,
				properties = {
					Size = `$Size{ v48 }_{ v51 }`
				},
				attributes = {{
					name = `Size{ v48 }_{ v51 }`,
					value = UDim2.new(v47.size, v50.size)
				}}
			})
		end
	end

	return t4
end
local function TypographyRules(p8, n2: number) -- line: 190
	-- upvalues: kebabToPascal (copy)
	local t5 = {}

	for v55, v56 in p8 do
		local v57 = kebabToPascal(v55)
		local v58 = v56.TextSize / n2 * (v56.LineHeight * n2) - v56.TextSize
		local uDim = UDim.new(0, v58 / 2)

		table.insert(t5, {
			tag = `text-{ v55 }`,
			properties = {
				Font = `$Font{ v57 }`,
				TextSize = `$TextSize{ v57 }`,
				LineHeight = v56.LineHeight
			},
			attributes = {
				{
					name = `Font{ v57 }`,
					value = v56.Font
				},
				{
					name = `TextSize{ v57 }`,
					value = v56.TextSize
				}
			},
			children = {{
				tag = `text-{ v55 }`,
				pseudo = "UIPadding",
				priority = 0,
				properties = {
					PaddingTop = `$TextPadding{ v57 }`,
					PaddingBottom = `$TextPadding{ v57 }`
				},
				attributes = {{
					name = `TextPadding{ v57 }`,
					value = uDim
				}}
			}}
		})
	end

	return t5
end
local function PaddingRules(p9, p10) -- line: 237
	-- upvalues: kebabToPascal (copy)
	local t6 = {}
	local t7 = {
		x = {
			"PaddingLeft",
			"PaddingRight"
		},
		y = {
			"PaddingTop",
			"PaddingBottom"
		},
		top = { "PaddingTop" },
		bottom = { "PaddingBottom" },
		left = { "PaddingLeft" },
		right = { "PaddingRight" }
	}

	for _, v65 in p9 do
		local v66 = kebabToPascal(v65.name)

		table.insert(t6, {
			tag = `padding-{ v65.name }`,
			pseudo = "UIPadding",
			properties = {
				PaddingTop = `$Padding{ v66 }`,
				PaddingBottom = `$Padding{ v66 }`,
				PaddingLeft = `$Padding{ v66 }`,
				PaddingRight = `$Padding{ v66 }`
			},
			attributes = {{
				name = `Padding{ v66 }`,
				value = v65.size
			}}
		})
	end

	for _, v68 in p10 do
		local v69 = kebabToPascal(v68.name)

		table.insert(t6, {
			tag = `margin-{ v68.name }`,
			pseudo = "UIPadding",
			properties = {
				PaddingTop = `$Margin{ v69 }`,
				PaddingBottom = `$Margin{ v69 }`,
				PaddingLeft = `$Margin{ v69 }`,
				PaddingRight = `$Margin{ v69 }`
			},
			attributes = {{
				name = `Margin{ v69 }`,
				value = v68.size
			}}
		})
	end

	for v70, v71 in t7 do
		for _, v73 in p9 do
			local v74 = kebabToPascal(v73.name)
			local t8 = {}

			for _, v77 in v71 do
				t8[v77] = `$Padding{ v74 }`
			end

			table.insert(t6, {
				tag = `padding-{ v70 }-{ v73.name }`,
				pseudo = "UIPadding",
				properties = t8,
				attributes = {{
					name = `Padding{ v74 }`,
					value = v73.size
				}}
			})
		end

		for _, v79 in p10 do
			local v80 = kebabToPascal(v79.name)
			local t9 = {}

			for _, v83 in v71 do
				t9[v83] = `$Margin{ v80 }`
			end

			table.insert(t6, {
				tag = `margin-{ v70 }-{ v79.name }`,
				pseudo = "UIPadding",
				properties = t9,
				attributes = {{
					name = `Margin{ v80 }`,
					value = v79.size
				}}
			})
		end
	end

	return t6
end

local t10 = {
	Content = { "content" },
	Stroke = { "stroke" },
	Shift = { "bg" },
	Surface = { "bg" },
	OverMedia = { "bg" },
	System = {
		"bg",
		"content",
		"stroke"
	},
	Extended = {},
	Common = {},
	Selection = {},
	State = {},
	None = {}
}

local function DefaultRules(p11) -- line: 350
	local BodyLargeFont = p11.Typography.BodyLarge.Font

	return {
		{
			tag = "gui-object-defaults",
			priority = -1,
			properties = {
				BackgroundTransparency = 1
			}
		},
		{
			tag = "text-defaults",
			priority = -1,
			properties = {
				Font = "$FontBodyLarge"
			},
			attributes = {{
				name = "FontBodyLarge",
				value = BodyLargeFont
			}}
		}
	}
end
local function DefaultColorRules(p12) -- line: 376
	local DefaultColor3 = p12.Color.Content.Default.Color3
	local DefaultTransparency = p12.Color.Content.Default.Transparency

	return {{
		tag = "text-color-defaults",
		priority = -1,
		properties = {
			TextColor3 = "$ColorContentDefaultColor3",
			TextTransparency = "$ColorContentDefaultTransparency"
		},
		attributes = {
			{
				name = "ColorContentDefaultColor3",
				value = DefaultColor3
			},
			{
				name = "ColorContentDefaultTransparency",
				value = DefaultTransparency
			}
		}
	}}
end
local function BackgroundRules(p13, p14) -- line: 401
	-- upvalues: t10 (copy), tokenAttributePascalName (copy), kebabToPascal (copy)
	local t11 = {}

	for v92, v93 in p13 do
		if table.find(t10[v92], "bg") then
			for v94, v95 in v93 do
				local v96 = tokenAttributePascalName(v92, v94)

				table.insert(t11, {
					tag = `bg-{ v94 }`,
					properties = {
						BackgroundColor3 = `$Color{ v92 }{ v96 }Color3`,
						BackgroundTransparency = `$Color{ v92 }{ v96 }Transparency`
					},
					attributes = {
						{
							name = `Color{ v92 }{ v96 }Color3`,
							value = v95.Color3
						},
						{
							name = `Color{ v92 }{ v96 }Transparency`,
							value = v95.Transparency
						}
					}
				})
			end
		end
	end

	for v97, v98 in p14 do
		local v99 = kebabToPascal(v97)

		table.insert(t11, {
			tag = `bg-{ v97 }`,
			properties = {
				BackgroundColor3 = `$Color{ v99 }BackgroundColor3`,
				BackgroundTransparency = `$Color{ v99 }BackgroundTransparency`
			},
			attributes = {
				{
					name = `Color{ v99 }BackgroundColor3`,
					value = v98.Background.Color3
				},
				{
					name = `Color{ v99 }BackgroundTransparency`,
					value = v98.Background.Transparency
				}
			}
		})
	end

	return t11
end
local function StrokeSizeRules(p15) -- line: 453
	-- upvalues: kebabToPascal (copy)
	local t12 = {}

	for _, v103 in p15 do
		if v103.name ~= "none" then
			local v104 = kebabToPascal(v103.name)

			table.insert(t12, {
				tag = `stroke-{ v103.name }`,
				pseudo = "UIStroke",
				properties = {
					Thickness = `$StrokeThickness{ v104 }`
				},
				attributes = {{
					name = `StrokeThickness{ v104 }`,
					value = v103.size
				}}
			})
		end
	end

	return t12
end
local function StrokeRules(p16, p17) -- line: 480
	-- upvalues: t10 (copy), tokenAttributePascalName (copy), kebabToPascal (copy)
	local t13 = {}

	for v108, v109 in p16 do
		if table.find(t10[v108], "stroke") then
			for v110, v111 in v109 do
				local v112 = tokenAttributePascalName(v108, v110)

				table.insert(t13, {
					tag = `stroke-{ v110 }`,
					pseudo = "UIStroke",
					properties = {
						Color = `$Color{ v108 }{ v112 }Color3`,
						Transparency = `$Color{ v108 }{ v112 }Transparency`
					},
					attributes = {
						{
							name = `Color{ v108 }{ v112 }Color3`,
							value = v111.Color3
						},
						{
							name = `Color{ v108 }{ v112 }Transparency`,
							value = v111.Transparency
						}
					}
				})
			end
		end
	end

	for v113, v114 in p17 do
		local v115 = kebabToPascal(v113)

		table.insert(t13, {
			tag = `stroke-{ v113 }`,
			pseudo = "UIStroke",
			properties = {
				Color = `$Color{ v115 }BorderColor3`,
				Transparency = `$Color{ v115 }BorderTransparency`
			},
			attributes = {
				{
					name = `Color{ v115 }BorderColor3`,
					value = v114.Border.Color3
				},
				{
					name = `Color{ v115 }BorderTransparency`,
					value = v114.Border.Transparency
				}
			}
		})
	end

	for v116, v117 in {
		center = Enum.BorderStrokePosition.Center,
		inner = Enum.BorderStrokePosition.Inner,
		outer = Enum.BorderStrokePosition.Outer
	} do
		table.insert(t13, {
			tag = `stroke-position-{ v116 }`,
			pseudo = "UIStroke",
			properties = {
				BorderStrokePosition = v117
			}
		})
	end

	return t13
end
local function ContentRules(p18, p19) -- line: 550
	-- upvalues: t10 (copy), tokenAttributePascalName (copy), kebabToPascal (copy)
	local t14 = {}

	for v121, v122 in p18 do
		if table.find(t10[v121], "content") then
			for v123, v124 in v122 do
				local v125 = tokenAttributePascalName(v121, v123)

				table.insert(t14, {
					tag = `content-{ v123 }`,
					properties = {
						ImageColor3 = `$Color{ v121 }{ v125 }Color3`,
						ImageTransparency = `$Color{ v121 }{ v125 }Transparency`,
						TextColor3 = `$Color{ v121 }{ v125 }Color3`,
						TextTransparency = `$Color{ v121 }{ v125 }Transparency`
					},
					attributes = {
						{
							name = `Color{ v121 }{ v125 }Color3`,
							value = v124.Color3
						},
						{
							name = `Color{ v121 }{ v125 }Transparency`,
							value = v124.Transparency
						}
					}
				})
			end
		end
	end

	for v126, v127 in p19 do
		local v128 = kebabToPascal(v126)

		table.insert(t14, {
			tag = `content-{ v126 }`,
			properties = {
				ImageColor3 = `$Color{ v128 }ForegroundColor3`,
				ImageTransparency = `$Color{ v128 }ForegroundTransparency`,
				TextColor3 = `$Color{ v128 }ForegroundColor3`,
				TextTransparency = `$Color{ v128 }ForegroundTransparency`
			},
			attributes = {
				{
					name = `Color{ v128 }ForegroundColor3`,
					value = v127.Foreground.Color3
				},
				{
					name = `Color{ v128 }ForegroundTransparency`,
					value = v127.Foreground.Transparency
				}
			}
		})
	end

	return t14
end
local function DeprecatedColorRules(p20) -- line: 606
	-- upvalues: tokenAttributePascalName (copy)
	local t15 = {}

	for v131, v132 in p20.System do
		local v133 = v131:sub(8)
		local v134 = tokenAttributePascalName("System", v131)

		table.insert(t15, {
			tag = `bg-{ v133 }`,
			properties = {
				BackgroundColor3 = `$ColorSystem{ v134 }Color3`,
				BackgroundTransparency = `$ColorSystem{ v134 }Transparency`
			},
			attributes = {
				{
					name = `ColorSystem{ v134 }Color3`,
					value = v132.Color3
				},
				{
					name = `ColorSystem{ v134 }Transparency`,
					value = v132.Transparency
				}
			},
			deprecatedFor = `bg-{ v131 }`
		})

		if v133 ~= "emphasis" then
			table.insert(t15, {
				tag = `content-{ v133 }`,
				properties = {
					ImageColor3 = `$ColorSystem{ v134 }Color3`,
					ImageTransparency = `$ColorSystem{ v134 }Transparency`,
					TextColor3 = `$ColorSystem{ v134 }Color3`,
					TextTransparency = `$ColorSystem{ v134 }Transparency`
				},
				attributes = {
					{
						name = `ColorSystem{ v134 }Color3`,
						value = v132.Color3
					},
					{
						name = `ColorSystem{ v134 }Transparency`,
						value = v132.Transparency
					}
				},
				deprecatedFor = `content-{ v131 }`
			})
			table.insert(t15, {
				tag = `stroke-{ v133 }`,
				pseudo = "UIStroke",
				properties = {
					Color = `$ColorSystem{ v134 }Color3`,
					Transparency = `$ColorSystem{ v134 }Transparency`
				},
				attributes = {
					{
						name = `ColorSystem{ v134 }Color3`,
						value = v132.Color3
					},
					{
						name = `ColorSystem{ v134 }Transparency`,
						value = v132.Transparency
					}
				},
				deprecatedFor = `stroke-{ v131 }`
			})
		end
	end

	return t15
end

return {
	rulesGenerator = function(p21, p22) --[[ rulesGenerator ]] -- line: 682
		-- upvalues: Dash (copy), DefaultRules (copy), staticRules (copy), DefaultSizeRules (copy), ListLayoutSpacingRules (copy), CornerRules (copy), SizeRules (copy), StrokeSizeRules (copy), TypographyRules (copy), PaddingRules (copy), DefaultColorRules (copy), DeprecatedColorRules (copy), BackgroundRules (copy), StrokeRules (copy), ContentRules (copy)
		local colors = p22.colors
		local variants = p22.variants
		local gaps = p22.gaps
		local gutters = p22.gutters
		local radii = p22.radii
		local sizes = p22.sizes
		local strokes = p22.strokes
		local typography = p22.typography
		local paddings = p22.paddings
		local margins = p22.margins

		return Dash.joinArrays(DefaultRules(p21), staticRules.rules.EngineDefaultBypassRules(), staticRules.rules.FlexItemRules(), staticRules.rules.TextRules(), staticRules.rules.AutomaticSizeRules(), staticRules.rules.PositionRules(), staticRules.rules.AnchorPointRules(), staticRules.rules.ClipsDescendantRules(), staticRules.rules.AspectRatioRules()), Dash.joinArrays(DefaultSizeRules(typography["body-large"], p21.Config.Text.NominalScale), staticRules.rules.ListLayoutRules(), ListLayoutSpacingRules(gaps, gutters), CornerRules(radii), SizeRules(sizes), StrokeSizeRules(strokes), TypographyRules(typography, p21.Config.Text.NominalScale), (PaddingRules(paddings, margins))), (Dash.joinArrays(DefaultColorRules(p21), DeprecatedColorRules(colors), BackgroundRules(colors, variants), StrokeRules(colors, variants), (ContentRules(colors, variants))))
	end,
	rules = {
		DefaultRules = DefaultRules,
		DefaultSizeRules = DefaultSizeRules,
		DefaultColorRules = DefaultColorRules,
		ListLayoutSpacingRules = ListLayoutSpacingRules,
		CornerRules = CornerRules,
		SizeRules = SizeRules,
		StrokeSizeRules = StrokeSizeRules,
		TypographyRules = TypographyRules,
		PaddingRules = PaddingRules,
		BackgroundRules = BackgroundRules,
		StrokeRules = StrokeRules,
		ContentRules = ContentRules,
		DeprecatedColorRules = DeprecatedColorRules
	}
}

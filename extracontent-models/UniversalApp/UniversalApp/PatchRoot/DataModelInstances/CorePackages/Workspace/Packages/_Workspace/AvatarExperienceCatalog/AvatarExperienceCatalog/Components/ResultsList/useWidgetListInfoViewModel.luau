local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local useSelector = require(AvatarExperienceCatalogParent.RoactUtils).Hooks.RoactRodux.useSelector
local React = require(AvatarExperienceCatalogParent.React)
local Cryo = require(AvatarExperienceCatalogParent.Cryo)
local useTokens = require(AvatarExperienceCatalogParent.Foundation).Hooks.useTokens
local Responsive = require(AvatarExperienceCatalogParent.Responsive)
local v8 = Responsive.GetInputModeStore(false)
local useSignalState = require(AvatarExperienceCatalogParent.SignalsReact).useSignalState
local FFlagAXNoCarouselsOnCatalogWithGamepad = require(AvatarExperienceCatalog.Flags.FFlagAXNoCarouselsOnCatalogWithGamepad)

require(AvatarExperienceCatalog.Models.WidgetListInfo)
require(script.Parent.WidgetListInfoViewModel)

local WidgetListBreakPointEnum = require(script.Parent.WidgetListBreakPointEnum)
local t1 = {
	{
		contentType = "ItemName"
	},
	{
		contentType = "Price"
	},
	{
		contentType = "AgentName"
	}
}
local t2 = {
	type = "Carousel",
	numItemsToShow = 12,
	itemFooters = t1,
	previewRows = {
		default = 1
	},
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local t3 = {
	type = "ItemGroup",
	itemFooters = t1,
	previewRows = {
		default = 1
	},
	previewColumns = {
		default = 3,
		medium = 4,
		large = 5,
		xLarge = 7,
		x2Large = 9
	}
}
local t4 = {
	Default = "default",
	XSmall = "xSmall",
	Small = "small",
	Medium = "medium",
	Large = "large",
	XLarge = "xLarge",
	X2Large = "x2Large",
	Landscape = "landscape",
	Portrait = "portrait"
}
local t5 = {
	Dark = "dark",
	Light = "light",
	Default = "default"
}

local function getQueryStringForSearchWidgets(p1) -- line: 63
	if not p1 or not p1.searchKeyword then
		return nil
	end

	local t6 = { p1.searchKeyword }

	if p1.sortAndFilters and p1.sortAndFilters.SelectedTopics then
		for _, v34 in p1.sortAndFilters.SelectedTopics do
			table.insert(t6, 1, v34)
		end
	end

	return table.concat(t6, " ")
end
local function colorToColor3(p2) -- line: 112
	return Color3.new(p2.r, p2.g, p2.b)
end
local function formatColorSequence(t7: {[any]: any}) -- line: 140
	-- upvalues: colorToColor3 (copy)
	local t8 = {}

	for _, v57 in t7 do
		table.insert(t8, ColorSequenceKeypoint.new(v57.time, colorToColor3(v57.color)))
	end

	return ColorSequence.new(t8)
end
local function formatNumberSequence(p3) -- line: 148
	if type(p3) == "number" then
		return NumberSequence.new(p3)
	end

	if #p3 == 0 then
		return nil
	end

	local t9 = {}

	for _, v61 in p3 do
		table.insert(t9, NumberSequenceKeypoint.new(v61.time, v61.number))
	end

	return NumberSequence.new(t9)
end
local function formatImageBackground(p4, s1: string?) -- line: 162
	-- upvalues: t4 (copy)
	local vector2

	if p4.anchorPoint then
		local anchorPoint = p4.anchorPoint
		local v65

		if not anchorPoint then
			v65 = nil
		else
			local v66 = (not s1 or not t4[s1]) and "default" or t4[s1]

			v65 = if not anchorPoint[v66] then anchorPoint.default else anchorPoint[v66]
		end

		local v67 = v65 or {
			x = 0,
			y = 0
		}

		vector2 = Vector2.new(v67.x, v67.y)
	else
		vector2 = nil
	end

	local uDim2

	if p4.position then
		local position = p4.position
		local v70

		if not position then
			v70 = nil
		else
			local v71 = (not s1 or not t4[s1]) and "default" or t4[s1]

			v70 = if not position[v71] then position.default else position[v71]
		end

		local v72 = v70 or {
			x = 0,
			y = 0
		}

		uDim2 = UDim2.fromOffset(v72.x, v72.y)
	else
		uDim2 = nil
	end

	local t10 = {
		type = "ImageBackground"
	}
	local v76

	if p4.resourceIdentifier then
		local resourceIdentifier = p4.resourceIdentifier

		if not resourceIdentifier then
			v76 = nil
		else
			local v77 = (not s1 or not t4[s1]) and "default" or t4[s1]

			v76 = if not resourceIdentifier[v77] then resourceIdentifier.default else resourceIdentifier[v77]
		end
	else
		v76 = nil
	end

	t10.resourceIdentifier = v76

	local color3

	if p4.color then
		local color = p4.color

		color3 = Color3.new(color.r, color.g, color.b)
	else
		color3 = nil
	end

	t10.color = color3
	t10.anchorPoint = vector2
	t10.position = uDim2

	local v81

	if p4.transparency then
		local transparency = p4.transparency

		if not transparency then
			v81 = nil
		else
			local v82 = (not s1 or not t4[s1]) and "default" or t4[s1]

			v81 = if not transparency[v82] then transparency.default else transparency[v82]
		end
	else
		v81 = nil
	end

	t10.transparency = v81

	return t10
end
local function formatGradientBackground(p5) -- line: 186
	-- upvalues: formatColorSequence (copy), formatNumberSequence (copy)
	local t11 = {
		type = "GradientBackground",
		colorSequence = formatColorSequence(p5.colorSequence),
		rotation = p5.rotation,
		transparency = if not p5.transparency then nil else formatNumberSequence(p5.transparency)
	}
	local vector2

	if p5.offset then
		local offset = p5.offset

		vector2 = Vector2.new(offset.x, offset.y)
	else
		vector2 = nil
	end

	t11.offset = vector2

	return t11
end
local function getFormattedBackgroundLayers(p6, s2: string, p7) -- line: 200
	-- upvalues: t5 (copy), formatImageBackground (copy), formatGradientBackground (copy)
	local v90

	if not p6 then
		v90 = nil
	else
		local v91 = (not p7 or not t5[p7]) and "default" or t5[p7]

		v90 = if not p6[v91] then p6.default else p6[v91]
	end

	if not v90 then
		v90 = {}
	end

	local t12 = {}

	for _, v94 in v90 do
		if v94.type == "ImageBackground" then
			table.insert(t12, (formatImageBackground(v94, s2)))
		elseif v94.type == "GradientBackground" then
			table.insert(t12, (formatGradientBackground(v94)))
		end
	end

	return t12
end
local function formatWidgetTemplateAsItemGroup(p8, s3: string, p9) -- line: 242
	-- upvalues: t4 (copy), getFormattedBackgroundLayers (copy)
	local previewColumns = p8.previewColumns
	local v105

	if not previewColumns then
		v105 = nil
	else
		local v106 = (not s3 or not t4[s3]) and "default" or t4[s3]

		v105 = if not previewColumns[v106] then previewColumns.default else previewColumns[v106]
	end

	local v107 = v105 or 1
	local previewRows = p8.previewRows
	local v109

	if not previewRows then
		v109 = nil
	else
		local v110 = (not s3 or not t4[s3]) and "default" or t4[s3]

		v109 = if not previewRows[v110] then previewRows.default else previewRows[v110]
	end

	local v111 = v109 or 1
	local t13 = {
		type = "ItemGroup",
		seeAllButton = p8.seeAllButton,
		title = p8.title,
		localizedTitle = p8.localizedTitle,
		description = p8.description,
		localizedDescription = p8.localizedDescription,
		itemFooters = p8.itemFooters
	}
	local t14

	if p8.widgetStyle then
		local widgetStyle = p8.widgetStyle

		t14 = {
			backgroundLayers = if not widgetStyle.backgroundLayers then nil else getFormattedBackgroundLayers(widgetStyle.backgroundLayers, s3, p9)
		}
	else
		t14 = nil
	end

	t13.widgetStyle = t14

	local t15

	if p8.cardStyle then
		local cardStyle = p8.cardStyle

		t15 = {
			backgroundLayers = if not cardStyle.backgroundLayers then nil else getFormattedBackgroundLayers(cardStyle.backgroundLayers, s3, p9),
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t15 = nil
	end

	t13.cardStyle = t15
	t13.previewRows = v111
	t13.previewColumns = v107

	return t13
end
local function formatWidgetTemplateAsCarousel(p10, s4: string, p11) -- line: 264
	-- upvalues: t4 (copy), getFormattedBackgroundLayers (copy)
	local previewColumns = p10.previewColumns
	local v121

	if not previewColumns then
		v121 = nil
	else
		local v122 = (not s4 or not t4[s4]) and "default" or t4[s4]

		v121 = if not previewColumns[v122] then previewColumns.default else previewColumns[v122]
	end

	local v123 = v121 or 1
	local previewRows = p10.previewRows
	local v125

	if not previewRows then
		v125 = nil
	else
		local v126 = (not s4 or not t4[s4]) and "default" or t4[s4]

		v125 = if not previewRows[v126] then previewRows.default else previewRows[v126]
	end

	local v127 = v125 or 1
	local t16 = {
		type = "Carousel",
		numItemsToShow = p10.numItemsToShow,
		seeAllButton = p10.seeAllButton,
		title = p10.title,
		localizedTitle = p10.localizedTitle,
		description = p10.description,
		localizedDescription = p10.localizedDescription,
		itemFooters = p10.itemFooters
	}
	local t17

	if p10.widgetStyle then
		local widgetStyle = p10.widgetStyle

		t17 = {
			backgroundLayers = if not widgetStyle.backgroundLayers then nil else getFormattedBackgroundLayers(widgetStyle.backgroundLayers, s4, p11)
		}
	else
		t17 = nil
	end

	t16.widgetStyle = t17

	local t18

	if p10.cardStyle then
		local cardStyle = p10.cardStyle

		t18 = {
			backgroundLayers = if not cardStyle.backgroundLayers then nil else getFormattedBackgroundLayers(cardStyle.backgroundLayers, s4, p11),
			thumbnailAspectRatio = cardStyle.thumbnailAspectRatio
		}
	else
		t18 = nil
	end

	t16.cardStyle = t18
	t16.previewRows = v127
	t16.previewColumns = v123

	return t16
end
local function mergeCardStyle(p12, p13) -- line: 287
	-- upvalues: Cryo (copy)
	if not p12 and not p13 then
		return nil
	end

	local v135 = if not p13 then nil else p13.thumbnailAspectRatio
	local v136 = if not p12 then nil else p12.thumbnailAspectRatio

	return {
		thumbnailAspectRatio = if v135 ~= nil then v135 else v136,
		backgroundLayers = Cryo.Dictionary.join(if not p12 or not p12.backgroundLayers then {} else p12.backgroundLayers, if not p13 or not p13.backgroundLayers then {} else p13.backgroundLayers)
	}
end
local function mergeWidgetStyle(p14, p15) -- line: 303
	-- upvalues: Cryo (copy)
	if not p14 and not p15 then
		return nil
	end

	return {
		backgroundLayers = Cryo.Dictionary.join(if not p14 or not p14.backgroundLayers then {} else p14.backgroundLayers, if not p15 or not p15.backgroundLayers then {} else p15.backgroundLayers)
	}
end
local function mergeItemGroupTemplates(p16, p17) -- line: 318
	-- upvalues: mergeWidgetStyle (copy), mergeCardStyle (copy), Cryo (copy)
	return {
		type = "ItemGroup",
		seeAllButton = if p17.seeAllButton ~= nil then p17.seeAllButton else p16.seeAllButton,
		title = if p17.title ~= nil then p17.title else p16.title,
		localizedTitle = if p17.localizedTitle ~= nil then p17.localizedTitle else p16.localizedTitle,
		description = if p17.description ~= nil then p17.description else p16.description,
		localizedDescription = if p17.localizedDescription ~= nil then p17.localizedDescription else p16.localizedDescription,
		itemFooters = if p17.itemFooters ~= nil then p17.itemFooters else p16.itemFooters,
		widgetStyle = mergeWidgetStyle(p16.widgetStyle, p17.widgetStyle),
		cardStyle = mergeCardStyle(p16.cardStyle, p17.cardStyle),
		previewRows = Cryo.Dictionary.join(p16.previewRows or {}, p17.previewRows or {}),
		previewColumns = Cryo.Dictionary.join(p16.previewColumns or {}, p17.previewColumns or {})
	}
end
local function mergeCarouselTemplates(p18, p19) -- line: 337
	-- upvalues: mergeWidgetStyle (copy), mergeCardStyle (copy), Cryo (copy)
	return {
		type = "Carousel",
		numItemsToShow = if p19.numItemsToShow ~= nil then p19.numItemsToShow else p18.numItemsToShow,
		seeAllButton = if p19.seeAllButton ~= nil then p19.seeAllButton else p18.seeAllButton,
		title = if p19.title ~= nil then p19.title else p18.title,
		localizedTitle = if p19.localizedTitle ~= nil then p19.localizedTitle else p18.localizedTitle,
		description = if p19.description ~= nil then p19.description else p18.description,
		localizedDescription = if p19.localizedDescription ~= nil then p19.localizedDescription else p18.localizedDescription,
		itemFooters = if p19.itemFooters ~= nil then p19.itemFooters else p18.itemFooters,
		widgetStyle = mergeWidgetStyle(p18.widgetStyle, p19.widgetStyle),
		cardStyle = mergeCardStyle(p18.cardStyle, p19.cardStyle),
		previewRows = Cryo.Dictionary.join(p18.previewRows or {}, p19.previewRows or {}),
		previewColumns = Cryo.Dictionary.join(p18.previewColumns or {}, p19.previewColumns or {})
	}
end
local function formatWidgetListStateToWidgetListInfoViewModel(t19: {[any]: any}?, s5: string, p20, s6: string?) -- line: 366
	-- upvalues: FFlagAXNoCarouselsOnCatalogWithGamepad (copy), Responsive (copy), Cryo (copy), t2 (copy), t3 (copy), formatWidgetTemplateAsCarousel (copy), mergeCarouselTemplates (copy), formatWidgetTemplateAsItemGroup (copy), mergeItemGroupTemplates (copy)
	local t20 = {
		configuration = {},
		widgets = {}
	}
	local v150 = if not t19 then nil else t19.Configuration
	local v151 = if not FFlagAXNoCarouselsOnCatalogWithGamepad then nil else s6 ~= Responsive.Input.Directional
	local v152 = if not v150 or not v150.defaultItemCarouselTemplate then t2 else Cryo.Dictionary.join(t2, v150.defaultItemCarouselTemplate)
	local v153 = if not v150 or not v150.defaultItemGroupTemplate then if not v150 or not v150.defaultTemplate then t3 else Cryo.Dictionary.join(t3, v150.defaultTemplate) else Cryo.Dictionary.join(t3, v150.defaultItemGroupTemplate)

	if t19 and t19.Details then
		for v154, v155 in t19.Details do
			local v157

			if FFlagAXNoCarouselsOnCatalogWithGamepad then
				if v155.template.type == "Carousel" and not v151 then
					local template = v155.template

					v157 = table.clone(template)
					v157.type = "ItemGroup"
					v157.numItemsToShow = nil
				else
					v157 = v155.template
				end
			else
				v157 = nil
			end

			local v158 = if not if not FFlagAXNoCarouselsOnCatalogWithGamepad then v155.template.type == "Carousel" else v157.type == "Carousel" then formatWidgetTemplateAsItemGroup(mergeItemGroupTemplates(v153, if not FFlagAXNoCarouselsOnCatalogWithGamepad then v155.template else v157), s5, p20) else formatWidgetTemplateAsCarousel(mergeCarouselTemplates(v152, if not FFlagAXNoCarouselsOnCatalogWithGamepad then v155.template else v157), s5, p20)

			t20.widgets[v154] = {
				id = v155.id,
				type = v155.type,
				content = v155.content,
				tagId = v155.tagId,
				template = v158,
				requestId = t19.RequestId
			}
		end
	end

	if v150 then
		t20.configuration.customizedDataMap = v150.customizedDataMap
	end

	t20.configuration.defaultItemGroupTemplate = formatWidgetTemplateAsItemGroup(v153, s5, p20)
	t20.configuration.defaultItemCarouselTemplate = formatWidgetTemplateAsCarousel(v152, s5, p20)

	return t20
end

return function(s7: string?, s8: string?, p21) --[[ useWidgetListInfoViewModel ]] -- line: 441
	-- upvalues: WidgetListBreakPointEnum (copy), FFlagAXNoCarouselsOnCatalogWithGamepad (copy), useSignalState (copy), v8 (copy), React (copy), getQueryStringForSearchWidgets (copy), useSelector (copy), useTokens (copy), formatWidgetListStateToWidgetListInfoViewModel (copy)
	local v162 = p21 or WidgetListBreakPointEnum.Default
	local v163 = if not FFlagAXNoCarouselsOnCatalogWithGamepad then nil else useSignalState(v8.getLastInputType)
	local v164 = React.useCallback(function(p22) -- line: 450
		-- upvalues: s7 (copy), getQueryStringForSearchWidgets (copy), s8 (copy)
		local v168 = p22.SearchesParameters[s7]
		local v169 = v168 and v168.searchKeyword ~= nil
		local v170 = getQueryStringForSearchWidgets(v168)

		if v169 then
			return p22.AvatarExperience.Common.Widgets.SearchPageWidgetInfo[v170]
		end

		if s8 then
			return p22.AvatarExperience.Common.Widgets.ContextWidgetInfo[s8]
		end

		return p22.AvatarExperience.Common.Widgets.WidgetInfo
	end, {
		s7,
		s8
	})
	local v165 = useSelector(v164)
	local v166 = useTokens()

	return (React.useMemo(function() -- line: 466
		-- upvalues: formatWidgetListStateToWidgetListInfoViewModel (copy), v165 (copy), v162 (copy), v166 (copy), FFlagAXNoCarouselsOnCatalogWithGamepad (copy), v163 (copy)
		return (formatWidgetListStateToWidgetListInfoViewModel(v165, v162, v166.Config.ColorMode.Name, if not FFlagAXNoCarouselsOnCatalogWithGamepad then nil else v163))
	end, {
		v166.Config.ColorMode.Name,
		v165,
		v162,
		if not FFlagAXNoCarouselsOnCatalogWithGamepad then nil else v163
	}))
end

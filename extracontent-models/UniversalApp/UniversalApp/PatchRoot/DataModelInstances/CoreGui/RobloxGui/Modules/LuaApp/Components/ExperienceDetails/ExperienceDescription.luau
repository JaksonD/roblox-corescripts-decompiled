local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local UIBlox = require(CorePackages.Packages.UIBlox)
local ExpandableTextArea = UIBlox.App.Text.ExpandableTextArea
local GetCanExpand = UIBlox.Core.Text.ExpandableText.GetCanExpand
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local RetrievalStatus = UIBlox.App.Loading.Enum.RetrievalStatus
local StyledTextLabel = UIBlox.App.Text.StyledTextLabel
local useStyle = UIBlox.Core.Style.useStyle
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local GetTextSize = require(CorePackages.Workspace.Packages.Style).GetTextSize
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ExperienceDetailsPanel = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsPanel)
local sendExpandableTextImpressionEvent = require(Modules.LuaApp.Components.ExperienceDetails.sendExpandableTextImpressionEvent)
local ContentThresholdImpressionsDetector = require(CorePackages.Workspace.Packages.Impressions).ContentThresholdImpressionsDetector
local useAppPolicy = require(Modules.LuaApp.Hooks.useAppPolicy)
local FFlagExperienceDetailsTextUseTokens = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local FFlagLuaAppExpandableTextImpressionsEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled
local v20 = game:DefineFastFlag("LuaAppFixDescriptionImpressionExpanded", false)
local useCursor = require(CorePackages.Packages.Foundation).Hooks.useCursor
local t1 = {
	0.01,
	0.5,
	1
}

local function NOOP_NEEDED_FOR_SELECTION() -- line: 54
end

return function(t2: {[any]: any}) -- line: 58
	-- upvalues: useCursor (copy), useStyle (copy), useLocalization (copy), useAppPolicy (copy), useDesignTokens (copy), RetrievalStatus (copy), FFlagExperienceDetailsTextUseTokens (copy), React (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), GetTextSize (copy), v20 (copy), GetCanExpand (copy), sendExpandableTextImpressionEvent (copy), HttpService (copy), ExpandableTextArea (copy), StyledTextLabel (copy), NOOP_NEEDED_FOR_SELECTION (copy), ContentThresholdImpressionsDetector (copy), t1 (copy), ExperienceDetailsPanel (copy)
	local v25 = useCursor("RoundedRect")
	local v26 = useStyle()
	local v27 = useLocalization({
		DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
	})
	local v28 = useAppPolicy(function(p1) -- line: 64
		return p1.enableExperienceDetailsPanel()
	end)
	local v29 = useDesignTokens(function(p2) -- line: 67
		if p2 then
			return p2.LuaApps.ExperienceDetails.PanelWidthScale
		end

		return 1
	end)
	local v30 = useDesignTokens(function(p3) -- line: 70
		if p3 then
			return p3.LuaApps.ExperienceDetails.PanelInnerPadding
		end

		return 0
	end)
	local v31 = t2.dataStatus == RetrievalStatus.Done
	local v32 = t2.descriptionText and #t2.descriptionText > 0
	local v33 = useDesignTokens(function(p4) -- line: 77
		return p4.Semantic.Typography.Body
	end)
	local v34 = useDesignTokens(function(p5) -- line: 80
		return p5.Semantic.Typography.Header
	end)
	local LineHeight = v33.LineHeight
	local FontSize, Font

	if FFlagExperienceDetailsTextUseTokens then
		FontSize = v33.FontSize
		Font = v33.Font
	else
		FontSize = v26.Font.BaseSize * v26.Font.Body.RelativeSize
		Font = v26.Font.Body.Font
	end

	local v38, v39 = React.useState(0)
	local v40 = v38 * v29
	local v41 = React.useMemo(function() -- line: 99
		-- upvalues: v32 (copy), FFlagLuaAppExpandableTextImpressionsEnabled (copy), v28 (copy), GetTextSize (copy), t2 (copy), FontSize (ref), Font (ref), v40 (copy), LineHeight (copy)
		if v32 and (FFlagLuaAppExpandableTextImpressionsEnabled or v28) then
			local v55 = GetTextSize(t2.descriptionText, FontSize, Font, Vector2.new(v40, 1e999))

			if FFlagLuaAppExpandableTextImpressionsEnabled and t2.expandable then
				return v55.Y
			end

			return v55.Y * LineHeight
		end

		return 0
	end, {
		t2.descriptionText,
		FontSize,
		Font,
		v40,
		if not FFlagLuaAppExpandableTextImpressionsEnabled then v28 else nil,
		LineHeight,
		if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else t2.expandable,
		if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else v32
	})
	local u42 = nil
	local v43 = nil

	if FFlagLuaAppExpandableTextImpressionsEnabled then
		u42 = React.useRef(false)
		v43 = React.useCallback(function() -- line: 135
			-- upvalues: u42 (ref)
			u42.current = not u42.current
		end)
	end

	local u44 = nil

	if v20 then
		u44 = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else React.useRef(nil)
	end

	local v45 = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else React.useCallback(function(t3: {[any]: any}) -- line: 149
		-- upvalues: v20 (copy), t2 (copy), u44 (ref), GetCanExpand (copy), v26 (copy), sendExpandableTextImpressionEvent (copy), u42 (ref), HttpService (copy)
		local v57 = nil

		if v20 and t2.expandable then
			local v58 = u44.current and u44.current.AbsoluteSize.X or 0

			if v58 > 0 then
				v57 = GetCanExpand(v26.Font, v58, t2.descriptionText, 3)
			end
		end

		for _, v60 in t3 do
			sendExpandableTextImpressionEvent({
				impressionThreshold = v60 * 100,
				isButtonExpanded = if not v20 then if not t2.expandable then nil else u42.current else if not v57 then nil else u42.current,
				interactionUuid = HttpService:GenerateGUID(false),
				contentType = "description",
				pageContext = t2.pageContext,
				itemId = tonumber(t2.universeId),
				componentType = t2.componentType or "unknown"
			})
		end
	end, {
		if not v20 then nil else t2.descriptionText,
		u42,
		t2.expandable,
		t2.componentType,
		t2.pageContext,
		t2.universeId,
		if not v20 then nil else v26.Font
	})
	local v46 = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else `ExperienceDescription_{ t2.universeId }_{ t2.componentType }_{ t2.pageContext }`

	if not v20 then
		u44 = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else React.useRef(nil)
	end

	local v47 = React.useRef(nil)

	React.useEffect(function() -- line: 202
		-- upvalues: v47 (copy), v39 (copy)
		if v47.current then
			v39(v47.current.AbsoluteSize.X)
		end
	end)

	if v31 and v32 then
		local v48 = if not t2.expandable then React.createElement(StyledTextLabel, {
			text = t2.descriptionText,
			size = UDim2.new(v29, 0, 0, v41),
			textYAlignment = Enum.TextYAlignment.Top,
			fontStyle = if not FFlagExperienceDetailsTextUseTokens then v26.Font.Body else v33,
			colorStyle = v26.Theme.TextDefault,
			automaticSize = if not v28 then Enum.AutomaticSize.Y else nil,
			lineHeight = LineHeight,
			richText = false,
			fluidSizing = false
		}) else React.createElement(ExpandableTextArea, {
			Text = t2.descriptionText,
			compactNumberOfLines = not v20 and 3 or 3,
			padding = Vector2.new(0, 0),
			gradientColor = v26.Theme.BackgroundContrast.Color,
			onClick = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else v43
		})
		local v49 = React.createElement("Frame", {
			ref = v47,
			[React.Change.AbsoluteSize] = function(p6) -- line: 233
				-- upvalues: v39 (copy)
				v39(p6.AbsoluteSize.X)
			end,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = t2.LayoutOrder,
			Selectable = true,
			[React.Event.SelectionGained] = NOOP_NEEDED_FOR_SELECTION,
			SelectionImageObject = v25
		}, {
			Padding = if not v28 then nil else React.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, v30),
				PaddingTop = UDim.new(0, v30),
				PaddingRight = UDim.new(0, v30),
				PaddingBottom = UDim.new(0, v30)
			}),
			UIListLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, t2.listPadding or 24)
			}),
			Title = if not v28 then React.createElement(StyledTextLabel, {
				text = t2.headerText or v27.DescriptionTitle,
				size = UDim2.fromScale(1, 0),
				fontStyle = if not FFlagExperienceDetailsTextUseTokens then v26.Font.Header1 else v34,
				colorStyle = v26.Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.Y,
				richText = false,
				fluidSizing = false
			}) else nil,
			Description = if not FFlagLuaAppExpandableTextImpressionsEnabled then v48 else React.createElement("Frame", {
				ref = u44,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				LayoutOrder = 2
			}, {
				Body = v48
			}),
			ContentThresholdImpressionsDetector = if not FFlagLuaAppExpandableTextImpressionsEnabled then nil else React.createElement(ContentThresholdImpressionsDetector, {
				containerRef = u44,
				fullContentHeight = v41,
				thresholds = t1,
				impressionsTag = v46,
				sendImpressions = v45,
				viewportBoundsOffset = t2.viewportBoundsOffset
			})
		})

		if v28 then
			return React.createElement(ExperienceDetailsPanel, {
				title = t2.headerText or v27.DescriptionTitle,
				onFocusChanged = t2.onFocusChanged
			}, v49)
		end

		return v49
	end

	return nil
end

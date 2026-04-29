local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local React = require(FoundationParent.React)
local ReactUtils = require(FoundationParent.ReactUtils)
local Components = Foundation.Components
local Icon = require(Components.Icon)
local Padding = require(Components.Padding)
local ScrollView = require(Components.ScrollView)

require(Components.Types)

local View = require(Components.View)
local Constants = require(Foundation.Constants)
local Flags = require(Foundation.Utility.Flags)
local blendTransparencies = require(Foundation.Utility.blendTransparencies)
local getBindableValue = require(Foundation.Utility.getBindableValue)
local getDisabledStyle = require(Foundation.Utility.getDisabledStyle)
local getMultiLineTextHeight = require(Foundation.Utility.getMultiLineTextHeight)
local isPluginSecurity = require(Foundation.Utility.isPluginSecurity)
local mapBindable = require(Foundation.Utility.mapBindable)
local truncateTextToCursor = require(script.Parent.truncateTextToCursor)
local useBindable = require(Foundation.Utility.useBindable)
local usePreferredInput = require(Foundation.Utility.usePreferredInput)
local useStyleTags = require(Foundation.Providers.Style.useStyleTags)
local useTextInputVariants = require(Components.TextInput.useTextInputVariants)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withCommonProps = require(Foundation.Utility.withCommonProps)
local withDefaults = require(Foundation.Utility.withDefaults)
local InputFocusBehavior = require(Foundation.Enums.InputFocusBehavior)
local InputSize = require(Foundation.Enums.InputSize)
local InputVariant = require(Foundation.Enums.InputVariant)
local Radius = require(Foundation.Enums.Radius)
local ControlState = require(Foundation.Enums.ControlState)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)
local t1 = {
	size = InputSize.Large,
	variant = InputVariant.Standard,
	numLines = 1,
	testId = "--foundation-internal-text-input"
}
local v33 = React.memo(React.forwardRef(function(t2: {[any]: any}, p1) -- line: 121
	-- upvalues: React (copy), Flags (copy), isPluginSecurity (copy), Padding (copy)
	local isBoundsChecker = t2.isBoundsChecker
	local v37 = t2.isMultiLine or isBoundsChecker

	return React.createElement("TextBox", {
		ClearTextOnFocus = false,
		Selectable = false,
		Active = not isBoundsChecker and nil,
		Visible = not isBoundsChecker and nil,
		BackgroundTransparency = not Flags.FoundationCleanupTextInputPolyfill and 1 or nil,
		ClipsDescendants = not Flags.FoundationCleanupTextInputPolyfill or nil,
		TextXAlignment = if not Flags.FoundationCleanupTextInputPolyfill then Enum.TextXAlignment.Left else nil,
		Font = t2.fontStyle.Font,
		TextSize = t2.fontStyle.FontSize,
		LineHeight = t2.fontStyle.LineHeight,
		TextColor3 = if not t2.textStyle then nil else t2.textStyle.Color3,
		TextTransparency = if not t2.textStyle then nil else t2.textStyle.Transparency,
		MultiLine = v37,
		TextWrapped = v37,
		TextYAlignment = if not v37 then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top,
		TextEditable = not isBoundsChecker and not t2.isDisabled,
		PlaceholderText = t2.placeholder,
		TextInputType = if not isPluginSecurity() then nil else t2.textInputType,
		Size = if t2.Size == nil then UDim2.fromScale(1, 1) else t2.Size,
		AutomaticSize = t2.automaticSize,
		Text = if not isBoundsChecker then t2.text else nil,
		ref = p1,
		[React.Tag] = t2.tag,
		[React.Change.Text] = t2.onTextChanged,
		[React.Change.CursorPosition] = t2.onCursorPositionChanged,
		[React.Event.Focused] = t2.onFocusGained,
		[React.Event.FocusLost] = t2.onFocusLost
	}, if not t2.padding then nil else {
		Padding = React.createElement(Padding, {
			value = t2.padding
		})
	}, t2.children)
end))

return React.memo(React.forwardRef(function(p2, p3) --[[ InternalTextInput ]] -- line: 168
	-- upvalues: withDefaults (copy), t1 (copy), useTokens (copy), React (copy), Flags (copy), getBindableValue (copy), useTextInputVariants (copy), useStyleTags (copy), usePreferredInput (copy), getDisabledStyle (copy), InputFocusBehavior (copy), ControlState (copy), getMultiLineTextHeight (copy), truncateTextToCursor (copy), useBindable (copy), ReactUtils (copy), View (copy), withCommonProps (copy), blendTransparencies (copy), Constants (copy), Radius (copy), StateLayerAffordance (copy), ScrollView (copy), v33 (copy), mapBindable (copy), Icon (copy)
	local v40 = withDefaults(p2, t1)
	local v41 = useTokens()
	local v42 = math.max(1, v40.numLines)
	local v43 = v42 > 1
	local v44 = React.useRef(nil)
	local v45 = if not Flags.FoundationTextInputFocusBehavior then nil else React.useRef(nil)
	local v46 = React.useRef(nil)
	local v47 = React.useRef(nil)
	local v48 = React.useRef("")
	local v49 = if not Flags.FoundationTextInputFocusBehavior then nil else React.useRef(getBindableValue(v40.text))
	local v50 = React.useRef(nil)
	local v51 = React.useRef(Vector2.zero)
	local v52, v53 = React.useState(false)
	local v54, v55 = React.useState(false)
	local v56 = useTextInputVariants(v41, v40.size, v40.variant, v40.radius, v54, v52, v40.hasError)
	local v57 = if not Flags.FoundationInputVariantsConsolidateContainer then v56.innerContainer else v56.container
	local v58 = if not Flags.FoundationInputVariantsConsolidateContainer then v56.outerContainer else v56.container
	local v59 = if not Flags.FoundationInputVariantsConsolidateContainer then v56.outerView else v56.container
	local v60 = useStyleTags(v56.textBox.tag)
	local v61 = usePreferredInput()
	local v62, v63 = React.useState(false)
	local v64 = v61 == Enum.PreferredInput.Touch
	local Standard = v41.Stroke.Standard
	local v66 = math.ceil(Standard) * 2
	local v67 = math.ceil(v41.Stroke.Thick) * 2
	local v68 = getDisabledStyle(v41.Color.Content.Emphasis, v40.isDisabled)
	local fontStyle = v56.textBox.fontStyle
	local FontSize = fontStyle.FontSize
	local LineHeight = fontStyle.LineHeight
	local v72 = React.useCallback(function() -- line: 220
		-- upvalues: v44 (copy)
		if v44.current then
			v44.current:CaptureFocus()
		end
	end, {})
	local v73 = React.useCallback(function() -- line: 226
		-- upvalues: v44 (copy)
		if v44.current then
			v44.current:ReleaseFocus()
		end
	end, {})
	local v74 = React.useCallback(function() -- line: 232
		-- upvalues: v44 (copy)
		if v44.current then
			return (v44.current:IsFocused())
		end

		return nil
	end, {})
	local v75 = React.useCallback(function() -- line: 239
		-- upvalues: v44 (copy)
		if v44.current then
			return v44.current.SelectionStart
		end

		return nil
	end, {})
	local v76 = React.useCallback(function() -- line: 246
		-- upvalues: v44 (copy)
		if v44.current then
			return v44.current.CursorPosition
		end

		return nil
	end, {})
	local v77 = React.useCallback(function(p4) -- line: 253
		-- upvalues: v44 (copy), Flags (copy), v45 (copy)
		if v44.current then
			v44.current.SelectionStart = p4
		end

		if Flags.FoundationTextInputFocusBehavior and v45.current then
			v45.current.SelectionStart = p4
		end
	end, {})
	local v78 = React.useCallback(function(p5) -- line: 262
		-- upvalues: v44 (copy), Flags (copy), v45 (copy)
		if v44.current then
			v44.current.CursorPosition = p5
		end

		if Flags.FoundationTextInputFocusBehavior and v45.current then
			v45.current.CursorPosition = p5
		end
	end, {})
	local v79 = if not Flags.FoundationInternalTextInputClearButton then nil else React.useCallback(function() -- line: 272
		-- upvalues: v44 (copy)
		if v44.current then
			v44.current.Text = ""
		end
	end, {})

	React.useImperativeHandle(p3, function() -- line: 281
		-- upvalues: v74 (copy), v72 (copy), v73 (copy), v53 (copy), v75 (copy), v76 (copy), v78 (copy), v77 (copy)
		return {
			getIsFocused = v74,
			focus = v72,
			releaseFocus = v73,
			setHover = v53,
			getSelectionStart = v75,
			getCursorPosition = v76,
			setCursorPosition = v78,
			setSelectionStart = v77
		}
	end, {
		v76,
		v74,
		v75,
		v72,
		v73,
		v78,
		v77
	})

	local v80 = React.useCallback(function(p6) -- line: 304
		-- upvalues: v48 (copy), Flags (copy), v49 (copy), v43 (copy), v46 (copy), v40 (copy)
		if p6 == nil or (p6.Parent == nil or v48.current ~= "") then
			return
		end

		local p6Text = p6.Text

		if Flags.FoundationTextInputFocusBehavior then
			if p6Text == v49.current then
				return
			end

			v49.current = p6Text
		end

		if v43 and v46.current then
			v46.current.Text = p6Text
		end

		v40.onChanged(p6Text)
	end, {
		v40.onChanged,
		v43,
		v62
	})
	local v81 = React.useCallback(function() -- line: 327
		-- upvalues: v40 (copy), v43 (copy), v64 (copy), v44 (copy), v48 (copy), v63 (copy), v55 (copy), Flags (copy), InputFocusBehavior (copy), v45 (copy), v77 (copy), v78 (copy)
		if v40.isDisabled then
			return
		end

		if v43 and v64 then
			if v44.current and v44.current.Parent then
				v48.current = v44.current.Text
			end

			v63(true)
		end

		v55(true)

		if v40.onFocus then
			v40.onFocus()
		end

		if Flags.FoundationTextInputFocusBehavior then
			local focusBehavior = v40.focusBehavior

			if focusBehavior == InputFocusBehavior.Clear then
				v48.current = ""

				if v44.current then
					v44.current.Text = ""
				end

				if v45.current then
					v45.current.Text = ""

					return
				end
			elseif focusBehavior == InputFocusBehavior.Highlight then
				task.spawn(function() -- line: 359
					-- upvalues: v44 (copy), v45 (copy), v77 (copy), v78 (copy)
					local v138 = v44.current or v45.current

					if v138 and v138.Parent ~= nil then
						local v139 = utf8.len(v138.Text)

						if v139 then
							v77(0)
							v78(v139 + 1)
						end
					end
				end)
			end
		end
	end, {
		v40.onFocus,
		v40.isDisabled,
		v64,
		v43,
		if not Flags.FoundationTextInputFocusBehavior then nil else v40.focusBehavior,
		if not Flags.FoundationTextInputFocusBehavior then nil else v77,
		if not Flags.FoundationTextInputFocusBehavior then nil else v78
	})
	local v82 = React.useCallback(function(_, b1: boolean, p8) -- line: 384
		-- upvalues: v55 (copy), v43 (copy), v63 (copy), v40 (copy)
		v55(false)

		if v43 then
			v63(false)
		end

		if v40.onFocusLost then
			v40.onFocusLost(p8)
		end

		if b1 and v40.onReturnPressed then
			v40.onReturnPressed()
		end
	end, {
		v40.onReturnPressed,
		v43,
		v40.onFocusLost
	})
	local v83 = React.useCallback(function(p9) -- line: 402
		-- upvalues: v53 (copy), ControlState (copy)
		v53(p9 == ControlState.Hover)
	end, {})
	local v84 = React.useCallback(function(p10, vector2: Vector2) -- line: 406
		-- upvalues: v50 (copy), v40 (copy)
		v50.current = vector2

		if v40.onDragStarted then
			v40.onDragStarted(p10, vector2)
		end
	end, { v40.onDragStarted })
	local v85 = React.useCallback(function(p11, vector2: Vector2) -- line: 413
		-- upvalues: v40 (copy)
		if v40.onDrag then
			v40.onDrag(p11, vector2)
		end
	end, { v40.onDrag })
	local v86 = React.useCallback(function(p12, vector2: Vector2) -- line: 419
		-- upvalues: v50 (copy), v72 (copy), v73 (copy), v55 (copy), v40 (copy)
		if vector2 == v50.current then
			v72()
		else
			v73()
			v55(false)
		end

		v50.current = nil

		if v40.onDragEnded then
			v40.onDragEnded(p12, vector2)
		end
	end, { v40.onDragEnded })
	local v87 = React.useMemo(function() -- line: 432
		-- upvalues: v57 (copy), v41 (copy)
		return {
			radius = UDim.new(0, v57.radius),
			offset = v41.Stroke.Thick,
			borderWidth = v41.Stroke.Thick
		}
	end, {
		v41,
		v57.radius
	})
	local v88 = React.useMemo(function() -- line: 440
		-- upvalues: getMultiLineTextHeight (copy), FontSize (copy), v42 (copy), LineHeight (copy)
		return getMultiLineTextHeight(FontSize, v42, LineHeight)
	end, {
		FontSize,
		v42,
		LineHeight
	})
	local v89, v90 = React.useMemo(function() -- line: 445
		-- upvalues: v58 (copy), v66 (copy), getMultiLineTextHeight (copy), FontSize (copy), LineHeight (copy), v88 (copy)
		local v119 = math.round((v58.minHeight - v66 - getMultiLineTextHeight(FontSize, 1, LineHeight)) * 2) / 2
		local uDim = UDim.new(0, (math.floor(v119 / 2)))
		local uDim2 = UDim.new(0, (math.ceil(v119 / 2)))
		local v122 = v88 + math.round(v119) + v66

		return {
			top = uDim,
			bottom = uDim2,
			left = UDim.new(0, 0),
			right = UDim.new(0, 0)
		}, v122
	end, {
		v58.minHeight,
		v66,
		v67,
		FontSize,
		v88,
		LineHeight
	})
	local v91 = v89.bottom.Offset + v89.top.Offset
	local uDim2 = UDim2.new(1, 0, 0, v88 + v91)
	local v93 = React.useMemo(function() -- line: 478
		-- upvalues: v43 (copy)
		if v43 then
			return {
				FillDirection = Enum.FillDirection.Vertical,
				ItemLineAlignment = Enum.ItemLineAlignment.Center
			}
		end

		return nil
	end, { v43 })
	local v94 = React.useMemo(function() -- line: 487
		-- upvalues: v43 (copy)
		if v43 then
			return {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				VerticalScrollBarInset = Enum.ScrollBarInset.Always
			}
		end

		return nil
	end, { v43 })
	local v95 = React.useCallback(function(p13) -- line: 498
		-- upvalues: v47 (copy), v46 (copy), truncateTextToCursor (copy), v89 (copy)
		local current = v47.current
		local current2 = v46.current

		if current == nil or current2 == nil then
			return
		end

		local v126 = p13.TextSize * p13.LineHeight
		local CanvasPositionY = current.CanvasPosition.Y

		current2.Text = truncateTextToCursor(p13)

		local TextBoundsY = current2.TextBounds.Y
		local v129 = CanvasPositionY - v89.top.Offset + v89.bottom.Offset
		local v130 = CanvasPositionY + current.AbsoluteSize.Y - v89.top.Offset - v89.bottom.Offset

		if v129 > TextBoundsY - v126 then
			current.CanvasPosition = current.CanvasPosition + Vector2.new(0, TextBoundsY - v126 - v129)
		end

		if v130 < TextBoundsY then
			current.CanvasPosition = current.CanvasPosition + Vector2.new(0, TextBoundsY - v130)
		end
	end, { v89 })
	local v96 = React.useCallback(function(p14) -- line: 531
		-- upvalues: v47 (copy), v51 (copy)
		if p14 == nil then
			return
		end

		v47.current = p14
		p14.ClipsDescendants = true
		p14.CanvasPosition = v51.current
	end, {})
	local v97 = React.useCallback(function(p15) -- line: 541
		-- upvalues: v48 (copy)
		if p15 then
			p15.Text = v48.current
			v48.current = ""
			p15:CaptureFocus()
		end
	end, {})
	local v98 = React.useCallback(function(p16) -- line: 549
		-- upvalues: v51 (copy)
		v51.current = p16.CanvasPosition
	end, {})
	local v99 = React.useMemo(function() -- line: 553
		-- upvalues: v40 (copy), React (copy), v84 (copy), v85 (copy), v86 (copy), v54 (copy)
		if not v40.onDragStarted and (not v40.onDrag and not v40.onDragEnded) then
			return nil
		end

		return React.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			[React.Event.DragStart] = v84,
			[React.Event.DragContinue] = v85,
			[React.Event.DragEnd] = v86,
			Enabled = not v54 and not v40.isDisabled
		})
	end, {
		v84,
		v85,
		v86,
		v54,
		v40.isDisabled
	})
	local v100 = useBindable(if not v40.horizontalPadding then UDim.new(0, 0) else v40.horizontalPadding.left or UDim.new(0, 0))
	local v101 = useBindable(if not v40.horizontalPadding then UDim.new(0, 0) else v40.horizontalPadding.right or UDim.new(0, 0))
	local v102 = if not Flags.FoundationInternalTextInputClearButton then nil else React.useMemo(function() -- line: 574
		-- upvalues: v40 (copy), v58 (copy), v41 (copy)
		if v40.hasClearButton then
			return (UDim2.fromOffset(0, (v58.minHeight - v41.Stroke.Standard) / 2))
		end

		return nil
	end, {
		v40.hasClearButton,
		v58.minHeight,
		v41.Stroke.Standard
	})
	local v103 = if not Flags.FoundationTextInputFocusBehavior then nil else ReactUtils.useComposedRef(v45, v97)

	return React.createElement(View, withCommonProps(v40, {
		Size = UDim2.new(1, 0, 0, v90),
		selection = {
			Selectable = not v40.isDisabled
		},
		cursor = v87,
		stroke = if not v59.strokeStyle or not v59.strokeThickness then nil else {
			Color = v59.strokeStyle.Color3,
			Transparency = if not v40.isDisabled then v59.strokeStyle.Transparency else blendTransparencies(v59.strokeStyle.Transparency, Constants.DISABLED_TRANSPARENCY),
			Thickness = v59.strokeThickness,
			BorderStrokePosition = if not v54 and not v52 then Enum.BorderStrokePosition.Inner else Enum.BorderStrokePosition.Center
		},
		cornerRadius = if v40.radius ~= Radius.Circle then nil else UDim.new(0, (math.ceil(v58.minHeight / 2))),
		padding = {
			left = v100:map(function(p17) -- line: 615
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p17
			end),
			right = if not Flags.FoundationInternalTextInputClearButton or (v40.trailingElement ~= nil or not v40.hasClearButton) then v101:map(function(p18) -- line: 623
				-- upvalues: Standard (copy)
				return UDim.new(0, Standard) + p18
			end) else UDim.new(0, Standard),
			top = UDim.new(0, Standard),
			bottom = UDim.new(0, Standard)
		},
		onActivated = if v40.isDisabled then nil else v72,
		onStateChanged = v83,
		isDisabled = v40.isDisabled,
		backgroundStyle = if not v59.bgStyle then nil else getDisabledStyle({
			Color3 = v59.bgStyle.Color3,
			Transparency = if not v40.backgroundGradient then v59.bgStyle.Transparency else 0
		}, v40.isDisabled),
		stateLayer = {
			affordance = StateLayerAffordance.None
		},
		tag = v59.tag,
		testId = `{ v40.testId }--outer-container`
	}), {
		DragDetector = v99,
		Background = v40.backgroundGradient,
		Leading = if not v40.leadingElement then nil else React.createElement(View, {
			GroupTransparency = if not v40.isDisabled then nil else Constants.DISABLED_TRANSPARENCY,
			LayoutOrder = 1,
			tag = "size-0-full auto-x",
			testId = `{ v40.testId }--leading`
		}, v40.leadingElement),
		TextBoxWrapper = React.createElement(if not v43 then View else ScrollView, {
			LayoutOrder = 2,
			selection = if not Flags.FoundationTextAreaFixDoubleSelection then nil else {
				Selectable = false
			},
			scroll = v94,
			layout = v93,
			onCanvasPositionChanged = if not v43 then nil else v98,
			scrollingFrameRef = if not v43 then nil else v96,
			tag = "fill size-full clip"
		}, {
			TextBox = if v62 then nil else React.createElement(v33, {
				text = v40.text,
				placeholder = v40.placeholder,
				textInputType = v40.textInputType,
				fontStyle = fontStyle,
				textStyle = v68,
				isMultiLine = v43,
				isDisabled = v40.isDisabled,
				ref = v44,
				tag = `{ v60 or "" } data-testid={ v40.testId }--textbox`,
				Size = if not v43 then nil else uDim2,
				automaticSize = if not Flags.FoundationNumberInputBindableValue then if not v43 or (v62 or v40.text == "") then nil else Enum.AutomaticSize.Y else mapBindable(v40.text, function(p19) -- line: 677
					-- upvalues: v43 (copy), v62 (copy)
					if v43 and (not v62 and p19 ~= "") then
						return Enum.AutomaticSize.Y
					end

					return nil
				end),
				padding = v89,
				onFocusGained = v81,
				onFocusLost = if not v43 or not v64 then v82 else nil,
				onTextChanged = v80,
				onCursorPositionChanged = if not v43 then nil else v95
			}, {
				DragDetector = v99,
				BoundsChecker = if not v43 then nil else React.createElement(v33, {
					isBoundsChecker = true,
					fontStyle = fontStyle,
					textStyle = v68,
					Size = UDim2.new(1, 0, 1, v91),
					ref = v46
				})
			}),
			MobileTextBox = if not v43 or not v62 then nil else React.createElement(v33, {
				text = v40.text,
				placeholder = v40.placeholder,
				textInputType = v40.textInputType,
				fontStyle = fontStyle,
				textStyle = v68,
				isMultiLine = v43,
				isDisabled = v40.isDisabled,
				padding = v89,
				ref = if not Flags.FoundationTextInputFocusBehavior then v97 else v103,
				tag = `{ v60 or "" } data-testid={ v40.testId }--mobile-textbox`,
				Size = uDim2,
				onFocusLost = if not v43 or not v64 then nil else v82,
				onTextChanged = v80,
				onCursorPositionChanged = if not v43 then nil else v95
			})
		}),
		Clear = if not Flags.FoundationInternalTextInputClearButton or not v40.hasClearButton then nil else React.createElement(View, {
			isDisabled = v40.isDisabled,
			GroupTransparency = if not v40.isDisabled then nil else Constants.DISABLED_TRANSPARENCY,
			LayoutOrder = 3,
			Visible = mapBindable(v40.text, function(p20) -- line: 737
				return p20 ~= ""
			end),
			tag = v56.clearButton.tag
		}, {
			ClearButton = React.createElement(View, {
				onActivated = v79,
				padding = UDim.new(0, v56.clearButton.padding),
				Position = v102,
				stateLayer = {
					affordance = StateLayerAffordance.None
				},
				tag = "anchor-center-left auto-xy",
				testId = `{ v40.testId }--clear-button`
			}, {
				Icon = React.createElement(Icon, {
					name = v56.clearButton.icon
				})
			})
		}),
		Trailing = if not v40.trailingElement then nil else React.createElement(View, {
			GroupTransparency = if not v40.isDisabled then nil else Constants.DISABLED_TRANSPARENCY,
			LayoutOrder = not Flags.FoundationInternalTextInputClearButton and 3 or 4,
			tag = "size-0-full auto-x",
			testId = `{ v40.testId }--trailing`
		}, v40.trailingElement)
	})
end))

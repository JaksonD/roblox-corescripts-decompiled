local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local Otter = require(FoundationParent.Otter)
local React = require(FoundationParent.React)
local ReactOtter = require(FoundationParent.ReactOtter)
local ReactRoblox = require(FoundationParent.ReactRoblox)
local useAnimatedBinding = ReactOtter.useAnimatedBinding
local CloseAffordanceVariant = require(Foundation.Enums.CloseAffordanceVariant)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)
local useOverlay = require(Foundation.Providers.Overlay.useOverlay)
local useScaledValue = require(Foundation.Utility.useScaledValue)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withDefaults = require(Foundation.Utility.withDefaults)
local DIALOG_SIZES = require(Foundation.Components.Dialog.useDialogVariants).DIALOG_SIZES
local Constants = require(Foundation.Constants)
local DialogSize = require(Foundation.Enums.DialogSize)
local ElevationLayer = require(Foundation.Enums.ElevationLayer)
local useElevation = require(Foundation.Providers.Elevation.useElevation)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local Flags = require(Foundation.Utility.Flags)
local usePreferences = require(Foundation.Providers.Preferences.usePreferences)
local SheetContext = require(script.Parent.SheetContext)
local Types = require(script.Parent.Types)
local SheetType = require(script.Parent.SheetType)
local childrenHasFullBleed = require(script.Parent.childrenHasFullBleed)
local CloseAffordance = require(Foundation.Components.CloseAffordance)
local Image = require(Foundation.Components.Image)
local View = require(Foundation.Components.View)
local t1 = {
	size = DialogSize.Medium,
	testId = "--foundation-sheet"
}
local SHADOW_IMAGE = Constants.SHADOW_IMAGE
local SHADOW_SIZE = Constants.SHADOW_SIZE

return React.memo(React.forwardRef(function(p1, p2) --[[ CenterSheet ]] -- line: 52
	-- upvalues: withDefaults (copy), t1 (copy), useOverlay (copy), useTokens (copy), useElevation (copy), ElevationLayer (copy), usePreferences (copy), useScaledValue (copy), DIALOG_SIZES (copy), React (copy), useAnimatedBinding (copy), Flags (copy), childrenHasFullBleed (copy), Otter (copy), Dash (copy), SheetType (copy), View (copy), StateLayerAffordance (copy), Types (copy), SheetContext (copy), ElevationOwnerScope (copy), CloseAffordance (copy), CloseAffordanceVariant (copy), Image (copy), SHADOW_IMAGE (copy), SHADOW_SIZE (copy), ReactRoblox (copy)
	local v35 = withDefaults(p1, t1)
	local v36 = useOverlay()
	local v37 = useTokens()
	local v38 = useElevation(ElevationLayer.Sheet, {
		stackAboveOwner = false
	})
	local reducedMotion = usePreferences().reducedMotion
	local v40 = useScaledValue(DIALOG_SIZES[v35.size])
	local v41 = useScaledValue(600)
	local Size_800 = v37.Size.Size_800
	local v43, v44 = React.useBinding(v41)
	local v45 = if not v43 then nil else v43:map(function(n1: number) -- line: 69
		-- upvalues: v35 (copy)
		if v35.centerSheetHeight then
			if v35.centerSheetHeight > 0 and v35.centerSheetHeight <= 1 then
				return n1 * v35.centerSheetHeight
			end

			if v35.centerSheetHeight > 1 then
				return (math.min(v35.centerSheetHeight, n1))
			end
		end

		return nil
	end)
	local v46, v47 = React.useState(true)
	local v48 = React.useRef(false)
	local v49, v50 = useAnimatedBinding(1, function() -- line: 84
		-- upvalues: v48 (copy), v35 (copy)
		if v48.current then
			v35.onClose()
		end
	end)
	local v51, v52 = useAnimatedBinding(Size_800, function() -- line: 90
		-- upvalues: v47 (copy)
		v47(false)
	end)
	local v53, v54 = React.useBinding(false)
	local v55, v56 = React.useBinding(false)
	local u57 = nil
	local u58 = nil
	local u59 = nil

	if Flags.FoundationSheetFullBleed then
		u57 = childrenHasFullBleed(v35.children)

		local v60, v61 = React.useBinding(0)

		u58 = v60
		u59 = v61
	end

	local v62, v63 = React.useBinding(0)
	local v64, v65 = React.useBinding(0)
	local v66 = React.useRef(nil)
	local v67, v68 = React.useState(nil)
	local v69 = if not Flags.FoundationCenterSheetUseStableContainer then nil else React.useMemo(function() -- line: 112
		local Frame = Instance.new("Frame")

		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.AutomaticSize = Enum.AutomaticSize.XY

		return Frame
	end, {})

	if Flags.FoundationCenterSheetUseStableContainer then
		React.useEffect(function() -- line: 122
			-- upvalues: v69 (copy)
			return function() -- line: 123
				-- upvalues: v69 (copy)
				v69:Destroy()
			end
		end, {})
	end

	local v70 = if not Flags.FoundationCenterSheetUseStableContainer then nil else React.useCallback(function(p3) -- line: 131
		-- upvalues: v69 (copy)
		if p3 then
			v69.Parent = p3

			return
		end

		v69.Parent = nil
	end, {})

	React.useEffect(function() -- line: 143
		-- upvalues: reducedMotion (copy), v52 (copy), Otter (copy), v50 (copy), v37 (copy)
		if reducedMotion then
			v52((Otter.instant(0)))
			v50((Otter.instant(0)))

			return
		end

		v52(Otter.ease(0, {
			easingStyle = v37.Ease.StandardOut,
			duration = v37.Time.Time_300
		}))
		v50(Otter.ease(0, {
			duration = v37.Time.Time_100
		}))
	end, {})

	local v71 = React.useCallback(function() -- line: 159
		-- upvalues: v48 (copy), reducedMotion (copy), v52 (copy), Otter (copy), Size_800 (copy), v50 (copy), v37 (copy), v47 (copy)
		if v48.current then
			return
		end

		if reducedMotion then
			v48.current = true
			v52(Otter.instant(Size_800))
			v50(Otter.instant(1))

			return
		end

		v52(Otter.ease(Size_800, {
			easingStyle = v37.Ease.StandardIn,
			duration = v37.Time.Time_100
		}))
		v50(Otter.ease(1, {
			duration = v37.Time.Time_100
		}))
		v47(true)
		v48.current = true
	end, {
		Size_800,
		reducedMotion
	})

	React.useImperativeHandle(v35.sheetRef, function() -- line: 180
		-- upvalues: v71 (copy)
		return {
			close = v71
		}
	end, {})

	local v72 = React.useMemo(function() -- line: 187
		-- upvalues: Dash (copy), v53 (copy), v54 (copy), v45 (copy), v62 (copy), v63 (copy), v55 (copy), v56 (copy), Flags (copy), u57 (ref), u58 (ref), u59 (ref), v71 (copy), SheetType (copy), v35 (copy), v66 (copy), v67 (copy), v68 (copy)
		return {
			actionsHeight = 0,
			setActionsHeight = Dash.noop,
			hasActionsDivider = v53,
			setHasActionsDivider = v54,
			sheetContentHeight = v45,
			setSheetContentHeight = Dash.noop,
			sheetHeightAvailable = 0,
			setSheetHeightAvailable = Dash.noop,
			safeAreaPadding = 0,
			bottomPadding = 0,
			innerScrollingEnabled = true,
			innerScrollY = v62,
			setInnerScrollY = v63,
			hasHeader = v55,
			setHasHeader = v56,
			hasFullBleed = if not Flags.FoundationSheetFullBleed then nil else u57,
			fullBleedHeight = if not Flags.FoundationSheetFullBleed then nil else u58,
			setFullBleedHeight = if not Flags.FoundationSheetFullBleed then nil else u59,
			closeSheet = v71,
			hasRadius = not not Flags.FoundationSheetFullBleed or nil,
			sheetType = SheetType.Center,
			testId = v35.testId,
			closeAffordanceRef = v66,
			contentStartRef = v67,
			setContentStartRef = v68
		}
	end, {
		v35.testId,
		v71,
		v67,
		v66,
		v45,
		u57
	})
	local v73 = React.createElement(View, {
		ClipsDescendants = true,
		Size = if not v35.centerSheetHeight or not v45 then nil else v45:map(function(n2: number?) -- line: 222
			if n2 then
				return (UDim2.new(1, 0, 0, n2))
			end

			return nil
		end),
		sizeConstraint = if not v35.centerSheetHeight or not v43 then nil else {
			MaxSize = v43:map(function(n3: number) -- line: 228
				return Vector2.new(1e999, n3)
			end)
		},
		stateLayer = {
			affordance = StateLayerAffordance.None
		},
		ZIndex = 2,
		onActivated = Dash.noop,
		onAbsoluteSizeChanged = function(p4) --[[ onAbsoluteSizeChanged ]] -- line: 239
			-- upvalues: v65 (copy)
			v65(p4.AbsoluteSize.Y)
		end,
		ref = p2,
		selection = Types.nonSelectable,
		selectionGroup = Types.isolatedSelectionGroup,
		tag = {
			["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
			["size-full-0 auto-y"] = v35.centerSheetHeight == nil
		},
		testId = v35.testId
	}, {
		Content = React.createElement(View, {
			Size = if not v35.centerSheetHeight or not v45 then nil else v45:map(function(n4: number?) -- line: 255
				if n4 then
					return (UDim2.new(1, 0, 0, n4))
				end

				return nil
			end),
			tag = "col items-center size-full-0 auto-y clip"
		}, React.createElement(SheetContext.Provider, {
			value = v72
		}, React.createElement(ElevationOwnerScope, {
			owner = v38
		}, v35.children))),
		CloseAffordance = React.createElement(CloseAffordance, {
			onActivated = v71,
			ref = v66,
			NextSelectionDown = v67,
			variant = if not Flags.FoundationSheetFullBleed or not u57 then CloseAffordanceVariant.Utility else CloseAffordanceVariant.OverMedia,
			Position = UDim2.new(1, -v37.Margin.Small, 0, v37.Margin.Small),
			AnchorPoint = Vector2.new(1, 0),
			Visible = v55:map(function(b1: boolean) -- line: 274
				return not b1
			end),
			testId = `{ v35.testId }--close-affordance`
		})
	})
	local v74 = React.createElement(Image, {
		Image = SHADOW_IMAGE,
		Size = v64:map(function(n5: number) -- line: 283
			-- upvalues: SHADOW_SIZE (copy)
			return UDim2.new(1, SHADOW_SIZE * 2, 0, n5 + SHADOW_SIZE * 2)
		end),
		Position = UDim2.new(0, -SHADOW_SIZE, 0.5, 0),
		ZIndex = 1,
		slice = {
			center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1),
			scale = 2
		},
		imageStyle = v37.Color.Extended.Black.Black_10,
		tag = "anchor-center-left"
	})

	return v36 and React.createElement(React.Fragment, nil, {
		OverlayPortal = ReactRoblox.createPortal(React.createElement(View, {
			ZIndex = v38.zIndex,
			tag = "size-full",
			testId = `{ v35.testId }--surface`
		}, {
			SheetContainer = React.createElement(View, {
				ref = v70,
				ZIndex = 2,
				sizeConstraint = {
					MaxSize = Vector2.new(v40, v41)
				},
				Position = v51:map(function(n6: number) -- line: 312
					return UDim2.new(0.5, 0, 0.5, n6)
				end),
				tag = "col align-y-center anchor-center-center size-full padding-medium",
				testId = `{ v35.testId }--center-sheet-container`,
				GroupTransparency = if not v46 then nil else v51:map(function(n7: number) -- line: 318
					-- upvalues: Size_800 (copy)
					return n7 / Size_800
				end),
				onAbsoluteSizeChanged = if not v35.centerSheetHeight or not v44 then nil else function(p5) -- line: 323
					-- upvalues: v37 (copy), v44 (copy), v41 (copy)
					local v87 = v37.Margin.Medium * 2

					v44((math.min(p5.AbsoluteSize.Y - v87, v41)))
				end
			}, if Flags.FoundationCenterSheetUseStableContainer then nil else {
				Sheet = v73,
				Shadow = React.createElement("Folder", nil, v74)
			}),
			Backdrop = React.createElement(View, {
				Size = UDim2.fromScale(2, 2),
				Position = UDim2.fromScale(-0.5, -0.5),
				ZIndex = 1,
				stateLayer = {
					affordance = StateLayerAffordance.None
				},
				backgroundStyle = v49:map(function(n8: number) -- line: 343
					-- upvalues: v37 (copy)
					return {
						Color3 = v37.Color.Common.Backdrop.Color3,
						Transparency = math.lerp(v37.Color.Common.Backdrop.Transparency, 1, n8)
					}
				end),
				onActivated = v71,
				testId = `{ v35.testId }--backdrop`
			})
		}), v36),
		SheetContent = if not Flags.FoundationCenterSheetUseStableContainer then nil else ReactRoblox.createPortal({
			Sheet = v73,
			Shadow = v74
		}, v69)
	})
end))

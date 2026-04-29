local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local Otter = require(FoundationParent.Otter)
local React = require(FoundationParent.React)
local ReactOtter = require(FoundationParent.ReactOtter)
local ReactRoblox = require(FoundationParent.ReactRoblox)
local ReactUtils = require(FoundationParent.ReactUtils)
local useAnimatedBinding = ReactOtter.useAnimatedBinding
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)
local useElevation = require(Foundation.Providers.Elevation.useElevation)
local useOverlay = require(Foundation.Providers.Overlay.useOverlay)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withDefaults = require(Foundation.Utility.withDefaults)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local ElevationLayer = require(Foundation.Enums.ElevationLayer)
local Constants = require(Foundation.Constants)
local SheetContext = require(script.Parent.SheetContext)
local Types = require(script.Parent.Types)
local SheetType = require(script.Parent.SheetType)
local childrenHasFullBleed = require(script.Parent.childrenHasFullBleed)
local useHardwareInsets = require(script.Parent.useHardwareInsets)
local useScreenHeight = require(script.Parent.useScreenHeight)
local Flags = require(Foundation.Utility.Flags)
local Image = require(Foundation.Components.Image)
local View = require(Foundation.Components.View)
local usePreferences = require(Foundation.Providers.Preferences.usePreferences)
local t1 = {
	defaultSnapPointIndex = 1,
	testId = "--foundation-sheet"
}
local SHADOW_IMAGE = Constants.SHADOW_IMAGE
local SHADOW_SIZE = Constants.SHADOW_SIZE

return React.memo(React.forwardRef(function(p1, p2) --[[ BottomSheet ]] -- line: 77
	-- upvalues: withDefaults (copy), t1 (copy), useOverlay (copy), useTokens (copy), useElevation (copy), ElevationLayer (copy), usePreferences (copy), useScreenHeight (copy), React (copy), useHardwareInsets (copy), useAnimatedBinding (copy), Flags (copy), childrenHasFullBleed (copy), Otter (copy), ReactUtils (copy), SheetType (copy), View (copy), StateLayerAffordance (copy), ReactRoblox (copy), Types (copy), Dash (copy), SheetContext (copy), ElevationOwnerScope (copy), Image (copy), SHADOW_IMAGE (copy), SHADOW_SIZE (copy)
	local v43 = withDefaults(p1, t1)
	local v44 = useOverlay()
	local v45 = useTokens()
	local v46 = useElevation(ElevationLayer.Sheet, {
		stackAboveOwner = false
	})
	local reducedMotion = usePreferences().reducedMotion
	local v48 = useScreenHeight()
	local v49, v50 = React.useState(0)
	local v51 = React.useMemo(function() -- line: 88
		-- upvalues: v49 (copy)
		return { v49 }
	end, { v49 })
	local v52 = v43.snapPoints or v51
	local v53 = React.useCallback(function(n1: number) -- line: 95
		-- upvalues: v48 (copy)
		if n1 > 1 then
			return n1
		end

		return n1 * v48
	end, { v48 })
	local n2 = 0

	for _, v56 in v52 do
		local v57 = v53(v56)

		if n2 < v57 then
			n2 = v57
		end
	end

	local u58 = math.min(n2, v48)
	local bottom = useHardwareInsets(v44).bottom
	local v60 = React.useRef(0)
	local v61 = React.useRef(false)
	local v62, v63 = useAnimatedBinding(1, function() -- line: 115
		-- upvalues: v61 (copy), v43 (copy)
		if v61.current then
			v43.onClose()
		end
	end)
	local v64, v65 = React.useBinding(-bottom)
	local v66, v67 = React.useBinding(0)
	local v68, v69 = React.useBinding(false)
	local v70, v71 = React.useBinding(false)
	local u72 = nil
	local u73 = nil
	local u74 = nil

	if Flags.FoundationSheetFullBleed then
		u72 = childrenHasFullBleed(v43.children)

		local v75, v76 = React.useBinding(0)

		u73 = v75
		u74 = v76
	end

	local v77 = React.useRef(0)
	local v78 = React.useRef(nil)
	local v79, v80 = React.useBinding(0)
	local v81, v82 = React.useBinding(false)
	local v83 = React.useRef(false)
	local v84 = React.useRef(0)
	local v85 = React.useRef(nil)
	local v86 = React.useRef(false)
	local v87 = React.useRef(0)
	local v88 = React.useCallback(function() -- line: 142
		-- upvalues: v85 (copy), v84 (copy), v86 (copy)
		if v85.current then
			v85.current:Disconnect()
			v85.current = nil
		end

		v84.current = 0
		v86.current = false
	end, {})
	local v89 = React.useCallback(function(n3: number) -- line: 151
		-- upvalues: v88 (copy), v86 (copy), Flags (copy), v78 (copy), v85 (copy), v87 (copy)
		v88()
		v86.current = true

		if Flags.FoundationBottomSheetImproveSpring and v78.current then
			v78.current:ResetScrollVelocity()
		end

		local u106 = not v78.current and 0 or v78.current.CanvasPosition.Y

		v85.current = game:GetService("RunService").Heartbeat:Connect(function(dt) -- line: 163
			-- upvalues: v78 (copy), v86 (copy), v88 (copy), Flags (copy), v87 (copy), n3 (copy), u106 (ref)
			if not v78.current or not v86.current then
				v88()

				return
			end

			local CanvasPositionY = v78.current.CanvasPosition.Y
			local v137

			if Flags.FoundationBottomSheetImproveSpring then
				local current = v87.current
				local v129 = n3
				local v130 = CanvasPositionY - v129
				local v131 = 25.132741228718345 * dt
				local v132 = math.exp(-v131)
				local v133 = current + 25.132741228718345 * v130
				local v134 = (v130 + v133 * dt) * v132
				local v135 = (current - v133 * v131) * v132
				local v136 = v129 + v134

				v87.current = v135
				v78.current.CanvasPosition = Vector2.new(0, v136)
				u106 = v78.current.CanvasPosition.Y
				v137 = n3 - v78.current.CanvasPosition.Y
			else
				v137 = n3 - CanvasPositionY

				local v138 = v137 * 18 * 18
				local v139 = (CanvasPositionY - u106) / dt
				local v140 = v87

				v140.current = v140.current - v139

				local v141 = v138 + -v87.current * 2 * 0.9 * 18
				local v142 = math.min(dt, 0.03333333333333333)

				v87.current = v87.current + v141 * v142

				local v143 = CanvasPositionY + v87.current * v142

				v78.current.CanvasPosition = Vector2.new(0, v143)
				u106 = v78.current.CanvasPosition.Y
			end

			if math.abs(v137) < 0.5 and math.abs(v87.current) < 1 then
				v78.current.CanvasPosition = Vector2.new(0, n3)
				v88()
			end
		end)
	end, { v88 })
	local v90 = React.useCallback(function(n4: number) -- line: 210
		-- upvalues: v53 (copy), bottom (copy)
		return v53(n4) + bottom
	end, {
		bottom,
		v53
	})
	local v91 = React.useCallback(function(n5: number) -- line: 214
		-- upvalues: v60 (copy), v89 (copy), v90 (copy), v52 (copy)
		v60.current = n5
		v89(v90(v52[n5]))
	end, {
		v90,
		v52
	})
	local v92 = React.useCallback(function(n6: number) -- line: 219
		-- upvalues: v88 (copy), v60 (copy), v78 (copy), v90 (copy), v52 (copy)
		v88()
		v60.current = n6

		if v78.current then
			v78.current.CanvasPosition = Vector2.new(0, v90(v52[n6]))
		end
	end, {
		v88,
		v90,
		v52
	})
	local v93 = React.useCallback(function(b1: boolean?) -- line: 227
		-- upvalues: v61 (copy), reducedMotion (copy), v88 (copy), v78 (copy), v63 (copy), Otter (copy), v87 (copy), v84 (copy), v89 (copy), v45 (copy)
		if v61.current then
			return
		end

		if reducedMotion and not b1 then
			v61.current = true
			v88()

			if v78.current then
				v78.current.CanvasPosition = Vector2.new(0, 0)
			end

			v63((Otter.instant(1)))

			return
		end

		v87.current = -v84.current
		v89(0)
		v63(Otter.ease(1, {
			duration = v45.Time.Time_100
		}))
		v61.current = true
	end, {
		v89,
		v88,
		reducedMotion
	})
	local v94 = React.useCallback(function() -- line: 248
		-- upvalues: v79 (copy), v77 (copy), Flags (copy), u58 (ref), bottom (copy), v84 (copy), v83 (copy), v82 (copy)
		local v111 = v79:getValue() <= 0
		local v112 = v77.current >= if not Flags.FoundationBottomSheetImproveSpring then math.round(u58 + bottom) else math.floor(u58 + bottom)

		if v84.current > 0 and v111 and v83.current then
			v82(false)

			return
		end

		if (v84.current < 0 or Flags.FoundationBottomSheetImproveSpring and v84.current == 0) and v112 then
			v82(true)
		end
	end, {
		u58,
		bottom
	})
	local v95 = React.useCallback(function() -- line: 265
		-- upvalues: v84 (copy), v77 (copy), v52 (copy), v90 (copy), v83 (copy), v87 (copy), v93 (copy), v91 (copy)
		local current = v84.current
		local v114 = v77.current - current / 2.35
		local t2 = {{
			index = 0,
			position = 0
		}}

		for v116, v117 in v52 do
			table.insert(t2, {
				index = v116,
				position = v90(v117)
			})
		end

		table.sort(t2, function(p3, p4) -- line: 283
			-- upvalues: v114 (copy)
			return math.abs(p3.position - v114) < math.abs(p4.position - v114)
		end)

		local v118 = t2[1]

		if not v83.current then
			v87.current = -current

			if v118.index == 0 then
				v93(true)

				return
			end

			v91(v118.index)
		end
	end, {
		v52,
		v91,
		v90,
		v93
	})

	React.useEffect(function() -- line: 299
		-- upvalues: v44 (copy), reducedMotion (copy), v92 (copy), v43 (copy), v63 (copy), Otter (copy), v91 (copy), v45 (copy), v53 (copy), v52 (copy), u58 (ref), v82 (copy), v88 (copy)
		if v44 then
			if reducedMotion then
				v92(v43.defaultSnapPointIndex)
				v63(Otter.instant(0))
			else
				v91(v43.defaultSnapPointIndex)
				v63(Otter.ease(0, {
					duration = v45.Time.Time_100
				}))
			end

			if v53(v52[v43.defaultSnapPointIndex]) == u58 then
				v82(true)
			end
		end

		return function() -- line: 317
			-- upvalues: v88 (copy)
			v88()
		end
	end, {
		v44,
		v52,
		v43.defaultSnapPointIndex,
		v91,
		v53,
		v92,
		reducedMotion
	})
	React.useEffect(function() -- line: 335
		-- upvalues: v84 (copy), v94 (copy), v83 (copy), v88 (copy), Flags (copy), v78 (copy), v77 (copy), u58 (ref), bottom (copy), v61 (copy), v82 (copy), v95 (copy)
		local connection = game:GetService("UserInputService").TouchPan:Connect(function(_, _, p7, _) -- line: 336
			-- upvalues: v84 (copy), v94 (copy)
			v84.current = p7.Y
			v94()
		end)
		local connection2 = game:GetService("UserInputService").InputBegan:Connect(function() -- line: 340
			-- upvalues: v83 (copy), v84 (copy), v88 (copy)
			v83.current = true
			v84.current = 0
			v88()
		end)
		local connection3 = game:GetService("UserInputService").InputEnded:Connect(function() -- line: 345
			-- upvalues: v83 (copy), Flags (copy), v78 (copy), v84 (copy), v77 (copy), u58 (ref), bottom (copy), v61 (copy), v82 (copy), v95 (copy)
			if v83.current == false then
				return
			end

			v83.current = false

			if Flags.FoundationBottomSheetImproveSpring then
				v84.current = not v78.current and 0 or v78.current:GetScrollVelocity().Y

				if v77.current >= math.floor(u58 + bottom) or v61.current then
					v82(true)

					return
				end
			else
				local v150 = nil

				if v78.current then
					local ok, result = pcall(function() -- line: 370
						-- upvalues: v78 (copy)
						return v78.current:GetScrollVelocity().Y == 0
					end)

					if ok then
						v150 = result
					end
				end

				if v150 or v61.current then
					v82(true)

					return
				end
			end

			v95()
		end)

		return function() -- line: 391
			-- upvalues: connection (copy), connection2 (copy), connection3 (copy)
			connection:Disconnect()
			connection2:Disconnect()
			connection3:Disconnect()
		end
	end, {
		v44,
		v95,
		v94,
		v88
	})

	local v96 = React.useRef(nil)
	local v97, v98 = React.useState(nil)
	local v99, v100 = React.useState(nil)
	local v101 = ReactUtils.useComposedRef(p2, v100)

	React.useImperativeHandle(v43.sheetRef, function() -- line: 404
		-- upvalues: v93 (copy)
		return {
			close = v93
		}
	end, {})

	local v102 = React.useMemo(function() -- line: 411
		-- upvalues: v66 (copy), v67 (copy), v68 (copy), v69 (copy), v64 (copy), v65 (copy), bottom (copy), v81 (copy), v79 (copy), v80 (copy), v94 (copy), v70 (copy), v71 (copy), Flags (copy), u72 (ref), u73 (ref), u74 (ref), v93 (copy), SheetType (copy), v99 (copy), v43 (copy), v96 (copy), v97 (copy), v98 (copy)
		return {
			actionsHeight = v66,
			setActionsHeight = v67,
			hasActionsDivider = v68,
			setHasActionsDivider = v69,
			sheetHeightAvailable = v64,
			setSheetHeightAvailable = v65,
			safeAreaPadding = bottom,
			bottomPadding = 200,
			innerScrollingEnabled = v81,
			innerScrollY = v79,
			setInnerScrollY = function(n7: number) --[[ setInnerScrollY ]] -- line: 423
				-- upvalues: v80 (copy), v94 (copy)
				v80(n7)
				v94()
			end,
			hasHeader = v70,
			setHasHeader = v71,
			hasFullBleed = if not Flags.FoundationSheetFullBleed then nil else u72,
			fullBleedHeight = if not Flags.FoundationSheetFullBleed then nil else u73,
			setFullBleedHeight = if not Flags.FoundationSheetFullBleed then nil else u74,
			closeSheet = v93,
			hasRadius = not not Flags.FoundationSheetFullBleed or nil,
			sheetType = SheetType.Bottom,
			innerSurface = v99,
			testId = v43.testId,
			closeAffordanceRef = v96,
			contentStartRef = v97,
			setContentStartRef = v98
		}
	end, {
		v43.testId,
		v93,
		bottom,
		v94,
		v99,
		v96,
		v97,
		u72
	})
	local v103 = React.createElement(View, {
		ZIndex = 3,
		backgroundStyle = v45.Color.Content.Muted,
		Position = if not Flags.FoundationSheetFullBleed then nil else UDim2.new(0.5, 0, 0, if not u72 then -v45.Padding.XSmall else v45.Padding.Small),
		AnchorPoint = if not Flags.FoundationSheetFullBleed then nil else Vector2.new(0.5, 0),
		tag = "align-y-center size-1000-100 padding-y-small radius-small",
		testId = `{ v43.testId }--gripper`
	}, {
		TouchTarget = React.createElement(View, {
			tag = "size-1000-600",
			stateLayer = {
				affordance = StateLayerAffordance.None
			},
			onActivated = function() --[[ onActivated ]] -- line: 469
				-- upvalues: v83 (copy), v52 (copy), v60 (copy), reducedMotion (copy), v92 (copy), v91 (copy), v53 (copy), u58 (ref), v82 (copy), v93 (copy)
				v83.current = false

				if #v52 > 1 then
					local v122 = v60.current % #v52 + 1

					if reducedMotion then
						v92(v122)
					else
						v91(v122)
					end

					if v53(v52[v122]) == u58 then
						v82(true)

						return
					end
				else
					v93()
				end
			end
		})
	})

	return v44 and ReactRoblox.createPortal(React.createElement(View, {
		ZIndex = v46.zIndex,
		ref = v101,
		selection = Types.nonSelectable,
		selectionGroup = Types.isolatedSelectionGroup,
		tag = "size-full",
		testId = `{ v43.testId }--surface`
	}, React.createElement("ScrollingFrame", {
		Size = UDim2.fromScale(1, 1),
		CanvasSize = if not Flags.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 0, v48 + u58 + bottom) else UDim2.new(1, 0, 1, u58 + bottom),
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ScrollingDirection = Enum.ScrollingDirection.Y,
		ScrollBarThickness = 0,
		ref = v78,
		[React.Change.CanvasPosition] = function(p9) -- line: 512
			-- upvalues: v77 (copy), v65 (copy), bottom (copy), v45 (copy), v94 (copy), v93 (copy)
			v77.current = p9.CanvasPosition.Y
			v65(v77.current - bottom - v45.Margin.Small)
			v94()

			if v77.current <= 0 then
				v93()
			end
		end
	}, {
		SheetContainer = React.createElement(View, {
			Size = if not Flags.FoundationSheetPreventCloseOnResize then UDim2.new(1, 0, 0, v48 + 200) else UDim2.new(1, 0, 1, 200 - u58 - bottom),
			Position = if not Flags.FoundationSheetPreventCloseOnResize then UDim2.fromOffset(0, v48 + bottom) else UDim2.new(0, 0, 1, -u58),
			ZIndex = 3
		}, {
			Sheet = React.createElement(View, {
				Size = if v43.snapPoints ~= nil then UDim2.new(1, 0, 0, u58 + 200) else UDim2.fromScale(1, 0),
				AutomaticSize = if v43.snapPoints ~= nil then nil else Enum.AutomaticSize.Y,
				onAbsoluteSizeChanged = if v43.snapPoints ~= nil then nil else function(p10) -- line: 536
					-- upvalues: v50 (copy)
					v50(p10.AbsoluteSize.Y - 200)
				end,
				stateLayer = {
					affordance = StateLayerAffordance.None
				},
				onActivated = Dash.noop,
				testId = v43.testId,
				tag = not Flags.FoundationSheetFullBleed and "col items-center padding-top-small radius-large clip bg-surface-100" or {
					["col items-center radius-large clip bg-surface-100"] = true,
					["padding-top-medium"] = not u72
				}
			}, {
				GripperContainer = if not Flags.FoundationSheetFullBleed then v103 else React.createElement("Folder", nil, {
					Gripper = v103
				}),
				Content = React.createElement(SheetContext.Provider, {
					value = v102
				}, React.createElement(ElevationOwnerScope, {
					owner = v46
				}, v43.children))
			})
		}),
		Shadow = React.createElement(Image, {
			Image = SHADOW_IMAGE,
			Size = UDim2.new(1, SHADOW_SIZE * 2, 0, u58 + 200 + SHADOW_SIZE * 2),
			Position = if not Flags.FoundationSheetPreventCloseOnResize then UDim2.fromOffset(-SHADOW_SIZE, v48 + bottom - SHADOW_SIZE) else UDim2.new(-SHADOW_SIZE, 0, 1, -u58 - SHADOW_SIZE),
			ZIndex = 2,
			slice = {
				center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1),
				scale = 2
			},
			imageStyle = v45.Color.Extended.Black.Black_10
		}),
		Backdrop = React.createElement(View, {
			Size = UDim2.fromScale(1, 2),
			Position = UDim2.fromScale(0, -0.5),
			ZIndex = 1,
			stateLayer = {
				affordance = StateLayerAffordance.None
			},
			backgroundStyle = v62:map(function(n8: number) -- line: 585
				-- upvalues: v45 (copy)
				return {
					Color3 = v45.Color.Common.Backdrop.Color3,
					Transparency = math.lerp(v45.Color.Common.Backdrop.Transparency, 1, n8)
				}
			end),
			onActivated = function() --[[ onActivated ]] -- line: 591
				-- upvalues: v93 (copy)
				v93()
			end,
			testId = `{ v43.testId }--backdrop`
		})
	})), v44)
end))

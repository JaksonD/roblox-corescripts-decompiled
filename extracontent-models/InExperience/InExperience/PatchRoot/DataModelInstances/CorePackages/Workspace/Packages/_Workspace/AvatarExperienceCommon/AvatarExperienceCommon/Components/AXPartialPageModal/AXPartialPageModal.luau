local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local React = require(Parent.React)
local Responsive = require(Parent.Responsive)
local ModalWindow = require(Parent.UIBlox).App.Dialog.Modal.ModalWindow
local Foundation = require(Parent.Foundation)
local Button = Foundation.Button
local View = Foundation.View
local useTokens = Foundation.Hooks.useTokens
local FillBehavior = Foundation.Enums.FillBehavior
local useSelector = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local wrapForReactPortal = require(script.Parent.Parent.Wrappers.wrapForReactPortal)
local useIsSpatial = Responsive.useIsSpatial
local useAXPartialPageModalFocusHandler = require(script.Parent.useAXPartialPageModalFocusHandler)
local AvatarExperienceFlags = require(Parent.AvatarExperienceFlags)
local v15 = game:DefineFastFlag("AXPartialPageModalDockedPadding", false)
local FFlagAXFixAvatarScreenVR = AvatarExperienceFlags.FFlagAXFixAvatarScreenVR
local v17 = game:DefineFastInt("AXCatalogPartialPageModalBottomInsetMultiplier", 25)

local function selectDeviceOrientation(p1) -- line: 33
	return p1.DeviceOrientation
end
local function v19(p2) -- line: 53
	return p2.ScreenSize
end
local function v20(p3) -- line: 57
	return p3.GlobalGuiInset and p3.GlobalGuiInset.bottom or 0
end

return function(t1: {[any]: any}) --[[ AXPartialPageModal ]] -- line: 61
	-- upvalues: useTokens (copy), useSelector (copy), v19 (copy), React (copy), FFlagAXFixAvatarScreenVR (copy), v20 (copy), useIsSpatial (copy), useAXPartialPageModalFocusHandler (copy), v15 (copy), v17 (copy), selectDeviceOrientation (copy), Responsive (copy), View (copy), Button (copy), FillBehavior (copy), ModalWindow (copy), wrapForReactPortal (copy)
	local v25 = useTokens()
	local v26 = useSelector(v19)
	local Medium = v25.Margin.Medium
	local uDim = UDim.new(0, v25.Margin.Medium)
	local v29 = React.useRef(nil)
	local v30 = if not FFlagAXFixAvatarScreenVR then nil else React.useRef(nil)
	local v31 = nil
	local u32 = nil

	if FFlagAXFixAvatarScreenVR then
		local v33

		v31, v33 = React.useState(Vector2.new(360, 700))
		u32 = v33
	end

	local v34 = useSelector(v20)
	local v35 = if not FFlagAXFixAvatarScreenVR then nil else useIsSpatial()
	local v36 = useAXPartialPageModalFocusHandler(v29)

	if FFlagAXFixAvatarScreenVR then
		React.useLayoutEffect(function() -- line: 81
			-- upvalues: v35 (copy), v30 (copy), u32 (ref)
			if not v35 then
				return
			end

			local current = v30.current

			if current == nil then
				return
			end

			local SurfaceGui = current:FindFirstAncestorOfClass("SurfaceGui")

			if SurfaceGui == nil then
				return
			end

			u32(SurfaceGui.AbsoluteSize)

			local connection = SurfaceGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ syncSize ]] -- line: 95
				-- upvalues: u32 (ref), SurfaceGui (copy)
				u32(SurfaceGui.AbsoluteSize)
			end)

			return function() -- line: 101
				-- upvalues: connection (copy)
				connection:Disconnect()
			end
		end, {
			v35,
			v36,
			u32
		})
	end

	local v37 = if not FFlagAXFixAvatarScreenVR or not v35 then v26 else v31

	if v15 then
		if v37.X < 540 then
			uDim = UDim.new(0, v25.Margin.Large + v34 * v17 / 100)
		end
	elseif useSelector(selectDeviceOrientation) == Responsive.Keys.Portrait then
		uDim = UDim.new(0, v25.Margin.Large + v34 * v17 / 100)
	end

	local position = nil

	if t1.position then
		position = t1.position
	end

	local v39 = t1.visible == nil or t1.visible
	local v40 = React.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		Selectable = false,
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[React.Event.Activated] = t1.onBackgroundPress,
		ZIndex = 5,
		Visible = v39,
		ref = if not FFlagAXFixAvatarScreenVR then nil else v30
	}, {
		PartialPageModal = React.createElement(ModalWindow, {
			isFullHeight = false,
			screenSize = v37,
			position = position,
			anchorPoint = t1.anchorPoint
		}, {
			ContentContainer = React.createElement(View, {
				tag = "auto-y col size-full-0 align-x-left padding-x-xxlarge padding-top-xxlarge radius-medium",
				Position = UDim2.new(0, 0, 0, Medium),
				backgroundStyle = v25.Color.Surface.Surface_100,
				padding = {
					bottom = uDim
				},
				ref = if v36 ~= nil then nil else v29,
				selectionGroup = if v36 ~= nil then nil else {
					SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
					SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
					SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
					SelectionBehaviorRight = Enum.SelectionBehavior.Stop
				}
			}, {
				Content = React.createElement(View, {
					tag = "auto-y size-full-0"
				}, t1.children),
				Buttons = t1.buttonStackProps and React.createElement(View, {
					tag = {
						["col gap-medium auto-y size-full-0 fill-x"] = not t1.buttonStackProps.rowLayout,
						["row gap-small auto-y size-full-0 fill-x"] = t1.buttonStackProps.rowLayout
					}
				}, if not t1.buttonStackProps.rowLayout then (function() -- line: 131
					-- upvalues: t1 (copy), React (copy), View (copy), Button (copy), FillBehavior (copy)
					local t2 = {}

					if t1.buttonStackProps == nil then
						return {}
					end

					local buttons = t1.buttonStackProps.buttons

					for i, _ in ipairs(buttons) do
						local props = buttons[i].props

						t2[i] = React.createElement(View, {
							tag = "row gap-small wrap auto-y size-full-0 fill-x",
							key = props.text or i
						}, React.createElement(Button, {
							text = props.text,
							variant = props.variant,
							onActivated = props.onActivated,
							LayoutOrder = props.layoutOrder or i,
							fillBehavior = FillBehavior.Fill,
							size = props.size
						}))
					end

					return t2
				end)() else (function() -- line: 161
					-- upvalues: t1 (copy), React (copy), Button (copy), FillBehavior (copy)
					local t3 = {}

					if t1.buttonStackProps == nil then
						return {}
					end

					local buttons = t1.buttonStackProps.buttons

					for i, _ in ipairs(buttons) do
						local props = buttons[i].props

						t3[i] = React.createElement(Button, {
							text = props.text,
							key = props.text or i,
							variant = props.variant,
							width = UDim.new(1, 0),
							onActivated = props.onActivated,
							LayoutOrder = props.layoutOrder or i,
							fillBehavior = FillBehavior.Fill,
							size = props.size
						})
					end

					return t3
				end)())
			})
		})
	})

	if v36 ~= nil then
		return wrapForReactPortal(v40, v36, v29)
	end

	return v40
end

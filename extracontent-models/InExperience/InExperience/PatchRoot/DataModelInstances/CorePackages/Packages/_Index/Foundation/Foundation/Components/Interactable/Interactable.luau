local Foundation = script:FindFirstAncestor("Foundation")
local FoundationParent = Foundation.Parent
local Dash = require(FoundationParent.Dash)
local React = require(FoundationParent.React)

require(Foundation.Components.Types)

local blendColors = require(Foundation.Utility.blendColors)
local getOriginalBackgroundStyle = require(script.Parent.getOriginalBackgroundStyle)
local getStateLayerStyle = require(script.Parent.getStateLayerStyle)
local joinBindables = require(Foundation.Utility.joinBindables)
local mapBindable = require(Foundation.Utility.mapBindable)
local useCursor = require(Foundation.Providers.Cursor.useCursor)
local useGuiControlState = require(Foundation.Utility.Control.useGuiControlState)
local useTokens = require(Foundation.Providers.Style.useTokens)
local withDefaults = require(Foundation.Utility.withDefaults)
local StateLayerAffordance = require(Foundation.Enums.StateLayerAffordance)

require(Foundation.Enums.StateLayerMode)

local ControlState = require(Foundation.Enums.ControlState)
local t1 = {
	component = "ImageButton",
	isDisabled = false
}
local color3 = Color3.fromRGB(163, 162, 165)

return React.memo(React.forwardRef(function(p1, p2) --[[ Interactable ]] -- line: 48
	-- upvalues: withDefaults (copy), t1 (copy), React (copy), useTokens (copy), useCursor (copy), ControlState (copy), color3 (copy), getOriginalBackgroundStyle (copy), StateLayerAffordance (copy), getStateLayerStyle (copy), blendColors (copy), joinBindables (copy), useGuiControlState (copy), mapBindable (copy), Dash (copy)
	local v20 = withDefaults(p1, t1)
	local v21 = React.useRef(nil)
	local v22 = useTokens()
	local v23 = useCursor(v20.cursor)
	local v24, v25 = React.useBinding(ControlState.Initialize)
	local v26 = React.useRef(nil)
	local v27 = React.useCallback(function(p3) -- line: 56
		-- upvalues: v24 (copy), ControlState (copy), v21 (copy), color3 (copy), v26 (copy), v25 (copy), v20 (copy)
		if v24:getValue() == ControlState.Default and v21.current ~= nil then
			local Styled = v21.current:GetStyled("BackgroundColor3")
			local Styled2 = v21.current:GetStyled("BackgroundTransparency")

			if Styled ~= color3 or Styled2 ~= 0 then
				v26.current = {
					Color3 = Styled,
					Transparency = Styled2
				}
			end
		end

		v25(p3)

		if v20.onStateChanged ~= nil then
			v20.onStateChanged(p3)
		end
	end, { v20.onStateChanged })
	local v28 = React.useMemo(function() -- line: 73
		-- upvalues: getOriginalBackgroundStyle (copy), v20 (copy)
		return getOriginalBackgroundStyle(v20.BackgroundColor3, v20.BackgroundTransparency)
	end, {
		v20.BackgroundColor3,
		v20.BackgroundTransparency
	})
	local v29 = React.useCallback(function(p4, p5, p6, p7) -- line: 78
		-- upvalues: ControlState (copy), StateLayerAffordance (copy), v26 (copy), getStateLayerStyle (copy), v22 (copy), blendColors (copy)
		if p4 == ControlState.Initialize or (p4 == ControlState.Default or p4 == ControlState.Disabled or p7 == StateLayerAffordance.None) then
			return p5
		end

		local t2 = {
			Color3 = p5.Color3,
			Transparency = p5.Transparency
		}

		if p5.Color3 == nil then
			t2.Color3 = if not v26.current then nil else v26.current.Color3
		end

		if p5.Transparency == nil then
			t2.Transparency = if not v26.current then nil else v26.current.Transparency
		end

		local v42 = getStateLayerStyle(v22, p6, p4)

		return blendColors(t2, v42)
	end, {
		v22,
		v20.BackgroundColor3,
		v20.BackgroundTransparency
	})
	local v30 = React.useMemo(function() -- line: 121
		-- upvalues: joinBindables (copy), v24 (copy), v28 (copy), v20 (copy), v29 (copy)
		return joinBindables({
			controlState = v24,
			backgroundStyle = v28,
			mode = if not v20.stateLayer then nil else v20.stateLayer.mode,
			affordance = if not v20.stateLayer then nil else v20.stateLayer.affordance
		}, function(p8) -- line: 127
			-- upvalues: v29 (copy)
			return v29(p8.controlState, p8.backgroundStyle, p8.mode, p8.affordance)
		end)
	end, {
		v28,
		v24,
		v29,
		if not v20.stateLayer then nil else v20.stateLayer.mode,
		if not v20.stateLayer then nil else v20.stateLayer.affordance
	})
	local v31 = useGuiControlState(v21, v27)

	React.useImperativeHandle(p2, function() -- line: 142
		-- upvalues: v21 (copy)
		return v21.current
	end, {})

	local t3 = {
		BackgroundColor3 = mapBindable(v30, function(p9) -- line: 147
			return p9.Color3
		end),
		BackgroundTransparency = mapBindable(v30, function(p10) -- line: 150
			return p10.Transparency
		end),
		Active = not v20.isDisabled,
		Interactable = not v20.isDisabled,
		[React.Event.Activated] = if v20.isDisabled then nil else v20.onActivated,
		[React.Event.MouseButton2Click] = if v20.isDisabled then nil else v20.onSecondaryActivated,
		ref = v31,
		SelectionImageObject = v20.SelectionImageObject or v23
	}
	local v33 = Dash.union(v20, t3)

	v33.component = nil
	v33.isDisabled = nil
	v33.onActivated = nil
	v33.onSecondaryActivated = nil
	v33.onStateChanged = nil
	v33.stateLayer = nil
	v33.cursor = nil

	return React.createElement(v20.component, v33)
end))

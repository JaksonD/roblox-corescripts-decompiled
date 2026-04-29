local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Cryo = require(AppChatParent.Cryo)
local Foundation = require(AppChatParent.Foundation)
local useCursor = Foundation.Hooks.useCursor
local React = require(AppChatParent.React)
local useState = React.useState
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local useMemo = React.useMemo
local UIBlox = require(AppChatParent.UIBlox)
local ControlState = UIBlox.Core.Control.Enum.ControlState
local v13 = memo(UIBlox.Core.Control.Interactable)
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)

require(AppChat.types)

local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	Size = UDim2.new(1, 0, 0, 48),
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	BackgroundTransparency = 0,
	onPressedBackgroundColor3 = Color3.fromRGB(242, 242, 242),
	onPressedBackgroundTransparency = 1,
	LayoutOrder = 0,
	isDisabled = false,
	onActivated = function() --[[ onActivated ]] -- line: 54
		print("BaseCell onActivated")
	end,
	showDivider = true,
	dividerTransparency = 0,
	dividerColor3 = Color3.fromRGB(227, 227, 227),
	avatarCircleCellWidth = 60
}

return memo(function(t2: {[any]: any}) --[[ BaseCell ]] -- line: 64
	-- upvalues: Cryo (copy), t1 (copy), useState (copy), ControlState (copy), React (copy), useMemo (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useCursor (copy), Foundation (copy), v13 (copy), FFlagDebugAppChatEnableDomLocators (copy)
	local v18 = Cryo.Dictionary.join(t1, t2)
	local v19, v20 = useState(ControlState.Initialize)
	local v21 = React.useCallback(function(_, p2) -- line: 68
		-- upvalues: v18 (copy), v20 (copy)
		if not v18.isDisabled then
			v20(p2)
		end
	end, { v18.isDisabled })
	local v22 = React.useCallback(function() -- line: 74
		-- upvalues: v18 (copy)
		if not v18.isDisabled then
			v18.onActivated()
		end
	end, {
		v18.isDisabled,
		v18.onActivated
	})
	local v23 = useMemo(function() -- line: 81
		-- upvalues: v19 (copy), ControlState (copy), React (copy), v18 (copy)
		if v19 == ControlState.Pressed then
			return (React.createElement("ImageLabel", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = v18.onPressedBackgroundTransparency,
				BackgroundColor3 = v18.onPressedBackground3,
				BorderSizePixel = 0
			}))
		end

		return nil
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v19, v18.onPressedBackground3, v18.onPressedBackgroundTransparency) else {
		v19,
		v18.onPressedBackground3,
		v18.onPressedBackgroundTransparency
	})
	local v24 = useMemo(function() -- line: 96
		-- upvalues: v18 (copy), React (copy)
		if v18.showDivider then
			return (React.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1
			}, {
				layout = React.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Bottom,
					HorizontalAlignment = Enum.HorizontalAlignment.Right
				}),
				divider = React.createElement("Frame", {
					BackgroundTransparency = v18.dividerTransparency,
					BackgroundColor3 = v18.dividerColor3,
					BorderSizePixel = 0,
					Size = UDim2.new(1, -v18.avatarCircleCellWidth, 0, 1)
				})
			}))
		end

		return nil
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v18.showDivider, v18.dividerTransparency, v18.dividerColor3, v18.avatarCircleCellWidth) else {
		v18.showDivider,
		v18.dividerTransparency,
		v18.dividerColor3,
		v18.avatarCircleCellWidth
	})
	local v25 = useMemo(function() -- line: 132
		-- upvalues: Cryo (copy), v18 (copy), v23 (copy), v24 (copy)
		return Cryo.Dictionary.join(v18.children or {}, {
			overlay = v23,
			divider = v24
		})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v18.children, v23, v24) else {
		v18.children,
		v23,
		v24
	})
	local v26 = useCursor(Foundation.Enums.CursorType.RoundedSlot)

	return React.createElement(v13, {
		onStateChanged = v21,
		[React.Event.Activated] = v22,
		[React.Tag] = if not FFlagDebugAppChatEnableDomLocators or v18.testId == nil then nil else `data-testid={ v18.testId }`,
		AutoButtonColor = false,
		Selectable = v18.Selectable,
		SelectionImageObject = v26,
		Size = v18.Size,
		AutomaticSize = v18.AutomaticSize,
		BackgroundColor3 = v18.BackgroundColor3,
		BackgroundTransparency = v18.BackgroundTransparency,
		LayoutOrder = v18.LayoutOrder,
		BorderSizePixel = 0
	}, v25)
end)

local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local UIBlox = require(AppChatParent.UIBlox)
local useStyle = UIBlox.Core.Style.useStyle
local IconButton = UIBlox.App.Button.IconButton
local IconSize = UIBlox.App.ImageSet.Enum.IconSize
local BaseCell = require(AppChat.Components.Cells.BaseCell)
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local Foundation = require(AppChatParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local t1 = {
	bodyText = "Placeholder body",
	iconImage = nil,
	iconSize = IconSize.Small,
	iconCellWidth = 30,
	cellHeight = 28,
	onIconActivated = function() --[[ onIconActivated ]] -- line: 37
	end
}

return function(t2: {[any]: any}) --[[ ConversationTypeCell ]] -- line: 42
	-- upvalues: Cryo (copy), t1 (copy), useStyle (copy), useTokens (copy), useIsInExperience (copy), React (copy), BaseCell (copy), Foundation (copy), IconButton (copy)
	local v15 = Cryo.Dictionary.join(t1, t2)
	local v16 = useStyle()
	local v17 = v15.style or v16
	local Theme = v17.Theme
	local Size_150 = v17.Tokens.Global.Size_150
	local v20 = useTokens()
	local v21 = useIsInExperience()
	local v22, v23 = React.useBinding(0)
	local v24 = React.useCallback(function(p1) -- line: 51
		-- upvalues: v23 (copy)
		v23(p1.AbsoluteSize.X)
	end, {})

	return React.createElement(BaseCell, {
		Size = UDim2.new(1, 0, 0, v15.cellHeight),
		BackgroundColor3 = if not v21 then Theme.BackgroundDefault.Color else v20.Color.None.Color3,
		BackgroundTransparency = if not v21 then v17.Theme.BackgroundDefault.Transparency else v20.Color.None.Transparency,
		LayoutOrder = v15.layoutOrder,
		Selectable = false,
		dividerColor3 = Theme.Divider.Color,
		dividerTransparency = Theme.Divider.Transparency,
		isDisabled = true,
		showDivider = false
	}, {
		UIPadding = React.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Size_150),
			PaddingRight = UDim.new(0, Size_150)
		}),
		Content = React.createElement(Foundation.View, {
			tag = "row size-full align-y-center",
			onAbsoluteSizeChanged = v24
		}, {
			Text = React.createElement(Foundation.Text, {
				LayoutOrder = 1,
				Text = v15.bodyText,
				sizeConstraint = {
					MaxSize = v22:map(function(n1: number) -- line: 80
						-- upvalues: v15 (copy)
						local v27 = n1 - v15.iconCellWidth

						return Vector2.new(not (v27 > 0) and 1e999 or v27, 1e999)
					end)
				},
				tag = "size-0-full auto-x content-emphasis text-align-x-left text-title-large text-truncate-end"
			}),
			InfoIcon = React.createElement(IconButton, {
				backgroundTransparency = 1,
				icon = v15.iconImage,
				iconColor3 = Theme.IconDefault.Color,
				iconSize = v15.iconSize,
				iconTransparency = Theme.IconDefault.Transparency,
				layoutOrder = 2,
				size = UDim2.fromOffset(v15.iconCellWidth, v15.iconCellWidth),
				onActivated = v15.onIconActivated
			})
		})
	})
end

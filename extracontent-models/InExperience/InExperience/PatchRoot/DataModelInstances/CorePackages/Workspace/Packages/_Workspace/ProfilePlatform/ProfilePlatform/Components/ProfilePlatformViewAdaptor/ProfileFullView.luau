local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local UIBlox = require(ProfilePlatformParent.UIBlox)
local Foundation = require(ProfilePlatformParent.Foundation)
local FFlagFixCommunityHeaderForWideMode = require(ProfilePlatformParent.SharedFlags).FFlagFixCommunityHeaderForWideMode
local FullscreenPageWithSafeArea = require(ProfilePlatformParent.AppBlox).FullscreenPageWithSafeArea
local Enums = require(ProfilePlatform.Common.Enums)
local useProfileFormFactor = require(ProfilePlatform.Hooks.useProfileFormFactor)
local useProfileJsonComponent = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local Constants = require(ProfilePlatform.Common.Constants)
local View = Foundation.View
local IconButton = Foundation.IconButton
local IconSize = Foundation.Enums.IconSize
local useStyle = UIBlox.Core.Style.useStyle

return function(t1: {[any]: any}) --[[ ProfileFullView ]] -- line: 36
	-- upvalues: useStyle (copy), useProfileFormFactor (copy), Enums (copy), Constants (copy), FFlagFixCommunityHeaderForWideMode (copy), useProfileJsonComponent (copy), React (copy), View (copy), IconButton (copy), IconSize (copy), FullscreenPageWithSafeArea (copy)
	local Theme = useStyle().Theme
	local v18 = useProfileFormFactor().formFactor == Enums.ProfileFormFactor.Wide
	local v19 = not v18 and 16 or 36
	local v20 = not v18 and 16 or 24
	local v21 = not v18 and 1e999 or 1018
	local v22 = -Constants.PAGE_PADDING

	if FFlagFixCommunityHeaderForWideMode then
		v22 = (useProfileJsonComponent(Enums.Components.CoverPhoto) or {}).coverPhotoId == nil and 56 or -Constants.PAGE_PADDING
	end

	local v23, v24 = React.useState(0)
	local v25 = v23 > 50
	local v26 = React.useCallback(function(p1) -- line: 56
		-- upvalues: v24 (copy)
		local v30 = math.abs(p1.CanvasPosition.Y)

		v24(v30)
	end, {})
	local v27 = React.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 56),
		Position = UDim2.fromOffset(0, 0),
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = not v25 and 1 or 0.1,
		BorderSizePixel = 0,
		ZIndex = 1000
	}, {
		DropShadow = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 2),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundColor3 = Theme.DropShadow.Color,
			BackgroundTransparency = not v25 and 1 or Theme.DropShadow.Transparency,
			BorderSizePixel = 0
		}),
		HeaderContent = React.createElement(View, {
			Size = UDim2.fromScale(1, 1),
			tag = "padding-medium"
		}, {
			CloseButton = React.createElement(IconButton, {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				iconSize = IconSize.Medium,
				icon = "icons/navigation/close",
				onActivated = t1.navigateBack,
				backgroundTransparency = 1
			})
		})
	})
	local v28 = React.createElement("Frame", {
		Size = UDim2.fromScale(1, not v18 and 1 or 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, v22)
	}, {
		UIListLayout = if not v18 then nil else React.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 0)
		}),
		ConstrainedContent = React.createElement("Frame", {
			Size = UDim2.fromScale(1, not v18 and 1 or 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if not v18 then nil else 1
		}, {
			UISizeConstraint = if not v18 then nil else React.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(v21, 1e999)
			}),
			UIPadding = React.createElement("UIPadding", {
				PaddingLeft = if not v18 then nil else UDim.new(0, v19),
				PaddingRight = if not v18 then nil else UDim.new(0, v19),
				PaddingTop = if not v18 then nil else UDim.new(0, v20),
				PaddingBottom = UDim.new(0, v20)
			}),
			Content = t1.renderContent()
		})
	})

	return React.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency
	}, {
		ContentContainer = React.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0
		}, {
			ScrollingFrame = React.createElement("ScrollingFrame", {
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				Selectable = false,
				ElasticBehavior = Enum.ElasticBehavior.Never,
				[React.Change.CanvasPosition] = v26
			}, {
				ContentFrame = v28
			})
		}),
		StickyHeader = v27
	})
end

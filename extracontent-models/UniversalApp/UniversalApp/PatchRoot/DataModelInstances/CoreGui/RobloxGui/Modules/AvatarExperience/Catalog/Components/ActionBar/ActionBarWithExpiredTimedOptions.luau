local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local Foundation = require(CorePackages.Packages.Foundation)
local UIBlox = require(CorePackages.Packages.UIBlox)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ActionButton = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionButton)
local View = Foundation.View
local FoundationText = Foundation.Text
local useTokens = Foundation.Hooks.useTokens
local useStyle = UIBlox.Core.Style.useStyle
local CombinedFFlagShouldUseLegacyGamepadFocus = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).CombinedFFlagShouldUseLegacyGamepadFocus

function ActionBarWithExpiredTimedOptions(t1: {[any]: any}) -- line: 29
	-- upvalues: useTokens (copy), CombinedFFlagShouldUseLegacyGamepadFocus (copy), React (copy), useLocalization (copy), useStyle (copy), FoundationText (copy), ActionButton (copy), View (copy), Focusable (copy)
	local v15 = useTokens()
	local v16 = if not CombinedFFlagShouldUseLegacyGamepadFocus then nil else React.useRef(nil)
	local v17 = useLocalization({
		expiredItemsPlural = {
			"Feature.Durables.BottomBar.Repurchase.ExpiredItemsPlural",
			number = t1.expiredItemCount
		},
		expiredItemsSingular = {
			"Feature.Durables.BottomBar.Repurchase.ExpiredItemsSingular",
			number = t1.expiredItemCount
		}
	})
	local v18 = if t1.expiredItemCount ~= 1 then v17.expiredItemsPlural else v17.expiredItemsSingular
	local t2 = {
		buttonText = "View",
		buttonIcon = nil,
		buttonIconPadding = 0,
		buttonIconSize = 0,
		buttonIsDisabled = false,
		buttonIsLoading = false,
		buttonColor = v15.Color.ActionEmphasis.Background.Color3,
		buttonTextColor = v15.Color.ActionEmphasis.Foreground.Color3,
		onActivated = t1.onViewPressed
	}
	local v20 = useStyle()
	local t3 = {
		ExpiredLabel = React.createElement(FoundationText, {
			tag = "text-title-large content-emphasis auto-xy anchor-center-left",
			Position = UDim2.new(0, v15.Size.Size_200, 0.5, 0),
			Text = v18,
			LayoutOrder = 1
		}),
		ActionButton = React.createElement(ActionButton, {
			Size = UDim2.new(0.5, -v15.Size.Size_250, 0, v15.Size.Size_1000),
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, -v15.Size.Size_200, 0.5, 0),
			LayoutOrder = 2,
			Font = v20.Font,
			buttonProps = t2,
			ref = if not CombinedFFlagShouldUseLegacyGamepadFocus then nil else v16
		})
	}

	return React.createElement(View, {
		tag = "size-full-0 anchor-bottom-left",
		Size = UDim2.new(1, 0, 0, v15.Size.Size_1500),
		Position = UDim2.new(0, 0, 1, 0),
		ZIndex = 3
	}, {
		TopBorder = React.createElement(View, {
			backgroundStyle = v15.Color.Stroke.Default,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 0, -1),
			ZIndex = 2
		}),
		ActionBarFrame = React.createElement(View, {
			tag = "bg-surface-0 padding-y-small padding-x-small",
			Size = UDim2.fromScale(1, 1)
		}, {
			FocusableContent = if not CombinedFFlagShouldUseLegacyGamepadFocus then nil else React.createElement(Focusable.Frame, {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				defaultChild = v16
			}, t3),
			ExpiredLabel = if CombinedFFlagShouldUseLegacyGamepadFocus then nil else t3.ExpiredLabel,
			ActionButton = if CombinedFFlagShouldUseLegacyGamepadFocus then nil else t3.ActionButton
		})
	})
end

return ActionBarWithExpiredTimedOptions

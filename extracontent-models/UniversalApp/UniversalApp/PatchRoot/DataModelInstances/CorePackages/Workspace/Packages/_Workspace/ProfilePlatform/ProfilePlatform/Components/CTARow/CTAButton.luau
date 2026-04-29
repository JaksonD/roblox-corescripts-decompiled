local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent

require(ProfilePlatform.Components.CTARow.Types)

local React = require(ProfilePlatformParent.React)

require(ProfilePlatformParent.ReactFocusNavigation)

local InputHandlers = require(ProfilePlatformParent.InputHandlers)
local FocusNavigationUtils = require(ProfilePlatformParent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local useAppFocusRoot = FocusNavigationUtils.useAppFocusRoot
local ContextualMenu = require(ProfilePlatform.Components.CTARow.ContextualMenu)
local Foundation = require(ProfilePlatformParent.Foundation)
local View = Foundation.View
local Button = Foundation.Button
local IconButton = Foundation.IconButton
local ButtonVariant = Foundation.Enums.ButtonVariant
local FillBehavior = Foundation.Enums.FillBehavior

return function(t1: {[any]: any}) --[[ CTAButton ]] -- line: 40
	-- upvalues: React (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), useAppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ButtonVariant (copy), IconButton (copy), Button (copy), FillBehavior (copy), View (copy), ContextualMenu (copy)
	local v17, v18 = React.useState(false)
	local v19 = React.useCallback(function() -- line: 43
		-- upvalues: v18 (copy)
		v18(false)
	end, {})
	local v20 = React.useCallback(function() -- line: 47
		-- upvalues: v18 (copy)
		v18(function(p1) -- line: 48
			return not p1
		end)
	end, {})
	local v21 = React.useMemo(function() -- line: 53
		-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), v19 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlers.onRelease(v19)
			}
		}
	end, { v19 })
	local v22 = useAppFocusRoot({
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
		customEventHandlers = v21,
		isAutoFocusRoot = true,
		isFocusable = v17
	})
	local v23 = React.useRef(nil)
	local menuItem = t1.buttonItem.menuItem
	local displayValue = menuItem.displayValue
	local icon = displayValue.icon
	local text = displayValue.text
	local contextualMenuItems = t1.buttonItem.contextualMenuItems
	local v29 = if not t1.buttonItem.buttonStyle then ButtonVariant.Standard else t1.buttonItem.buttonStyle
	local v30 = contextualMenuItems and #contextualMenuItems > 0
	local isDisabled = t1.buttonItem.menuItem.isDisabled
	local v32 = if not v30 then menuItem.onActivated else v20
	local v33 = icon ~= nil and text == nil
	local v34 = if not v33 then React.createElement(Button, {
		text = text,
		icon = icon,
		onActivated = v32,
		fillBehavior = FillBehavior.Fill,
		variant = v29,
		isLoading = t1.buttonItem.isLoading,
		LayoutOrder = t1.layoutOrder,
		ref = v23,
		isDisabled = isDisabled
	}) else React.createElement(IconButton, {
		icon = icon,
		LayoutOrder = t1.layoutOrder,
		onActivated = v32,
		variant = ButtonVariant.Standard,
		ref = v23,
		isDisabled = isDisabled
	})

	return React.createElement(View, {
		tag = {
			["auto-xy"] = v33,
			["fill auto-y"] = not v33
		},
		LayoutOrder = t1.layoutOrder
	}, {
		Button = v34,
		ContextualMenu = if not v30 then nil else React.createElement(ContextualMenu, {
			isOpen = v17,
			menuItems = contextualMenuItems,
			anchorRef = v23,
			menuRef = v22,
			closeMenu = v19,
			align = t1.align
		})
	})
end

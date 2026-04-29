local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local Foundation = require(CorePackages.Packages.Foundation)
local ButtonVariant = Foundation.Enums.ButtonVariant
local ButtonSize = Foundation.Enums.ButtonSize
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPage = require(Modules.LuaApp.AppPage)
local useSetDrawerVisible = require(CorePackages.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible
local MoreLogOut = require(Modules.LuaApp.Components.More.MoreLogOut)
local FFlagCTAChangeLogOutToSignOut = require(Modules.LuaApp.Flags.FFlagCTAChangeLogOutToSignOut)

return function(p1) --[[ FlyoutLogoutButton ]] -- line: 18
	-- upvalues: useSetDrawerVisible (copy), React (copy), MoreLogOut (copy), AppPage (copy), FFlagCTAChangeLogOutToSignOut (copy), ButtonVariant (copy), ButtonSize (copy)
	local v12 = useSetDrawerVisible()
	local v13 = React.useCallback(function() -- line: 20
		-- upvalues: v12 (copy)
		v12(false)
	end, {})

	return React.createElement(MoreLogOut, {
		item = {
			badgeCount = 0,
			context = {
				page = AppPage.LogoutConfirmation
			},
			itemType = "LogOut",
			textKey = not FFlagCTAChangeLogOutToSignOut and "Application.Logout.Action.Logout" or "Feature.AccountLock.Action.Signout"
		},
		willActivate = v13,
		layoutOrder = p1.layoutOrder,
		foundationButtonType = ButtonVariant.Standard,
		foundationButtonSize = ButtonSize.Large
	})
end

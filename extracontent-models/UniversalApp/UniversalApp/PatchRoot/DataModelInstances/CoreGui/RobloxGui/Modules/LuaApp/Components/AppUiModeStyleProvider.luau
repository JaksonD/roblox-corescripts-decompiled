local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local React = require(CorePackages.Packages.React)
local ReactRoblox = require(CorePackages.Packages.ReactRoblox)
local UiModeStyleProvider = require(CorePackages.Workspace.Packages.Style).UiModeStyleProvider

require(CorePackages.Packages.Foundation)

local Cryo = require(CorePackages.Packages.Cryo)
local useAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local AccountTypeThemeOverrides = require(script.Parent.Parent.Themes.AccountTypeThemeOverrides)
local FFlagEnableCoreContentTheme = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentTheme
local FFlagEnableCoreContentThemeUseGuacForTokenOverrides = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableCoreContentThemeUseGuacForTokenOverrides

return function(p1) -- line: 51
	-- upvalues: FFlagEnableCoreContentTheme (copy), useAppPolicy (copy), FFlagEnableCoreContentThemeUseGuacForTokenOverrides (copy), AccountTypeThemeOverrides (copy), ReactRoblox (copy), React (copy), UiModeStyleProvider (copy), Cryo (copy), CoreGui (copy)
	local t1 = nil

	if FFlagEnableCoreContentTheme then
		local v15, v16 = useAppPolicy(function(p2) -- line: 30
			-- upvalues: FFlagEnableCoreContentThemeUseGuacForTokenOverrides (copy)
			local getAccountType = p2.getAccountType
			local v25 = if not getAccountType then nil else getAccountType()
			local v26 = nil

			if FFlagEnableCoreContentThemeUseGuacForTokenOverrides then
				local getCoreContentTheme = p2.getCoreContentTheme

				if getCoreContentTheme then
					return v25, (getCoreContentTheme())
				end

				v26 = nil
			end

			return v25, v26
		end)
		local v17 = if not v16 then if not v15 or not AccountTypeThemeOverrides[v15] then nil else AccountTypeThemeOverrides[v15] else v16

		if v17 then
			t1 = {
				tokenOverridesByTheme = v17
			}
		end
	end

	return ReactRoblox.createPortal({ React.createElement(UiModeStyleProvider, if not t1 then p1 else Cryo.Dictionary.join(p1, t1)) }, CoreGui)
end

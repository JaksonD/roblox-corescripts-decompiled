local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Service = require(Chrome.Service)
local CommonIcon = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InGameMenuIntegrationUtils = require(script.Parent.InGameMenuIntegrationUtils)
local v7 = InGameMenuIntegrationUtils.createPageOpenSignal("GameSettingsPage")

return Service:register({
	initialAvailability = Service.AvailabilitySignal.Available,
	id = "settings",
	label = "CoreScripts.InGameMenu.PageTitle.GameSettings",
	sideSheetPlacement = SideSheetPlacement.Page,
	activated = function(_) --[[ activated ]] -- line: 19
		-- upvalues: InGameMenuIntegrationUtils (copy), v7 (copy)
		InGameMenuIntegrationUtils.toggleIGMPage("GameSettingsPage", v7:get())
	end,
	isActivated = function() --[[ isActivated ]] -- line: 22
		-- upvalues: v7 (copy)
		return v7:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 26
			-- upvalues: CommonIcon (copy), v7 (copy)
			return CommonIcon("icons/common/settings", "icons/common/settingsOn", v7)
		end
	}
})

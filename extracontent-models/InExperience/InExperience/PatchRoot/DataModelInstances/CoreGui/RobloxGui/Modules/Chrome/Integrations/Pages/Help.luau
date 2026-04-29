local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Service = require(Chrome.Service)
local CommonIcon = require(Chrome.Integrations.CommonIcon)
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local InGameMenuIntegrationUtils = require(script.Parent.InGameMenuIntegrationUtils)
local v7 = InGameMenuIntegrationUtils.createPageOpenSignal("HelpPage")

return Service:register({
	initialAvailability = Service.AvailabilitySignal.Available,
	id = "help",
	label = "CoreScripts.Feedback.Help.MainHeader",
	sideSheetPlacement = SideSheetPlacement.Page,
	activated = function(_) --[[ activated ]] -- line: 19
		-- upvalues: InGameMenuIntegrationUtils (copy), v7 (copy)
		InGameMenuIntegrationUtils.toggleIGMPage("HelpPage", v7:get())
	end,
	isActivated = function() --[[ isActivated ]] -- line: 22
		-- upvalues: v7 (copy)
		return v7:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 26
			-- upvalues: CommonIcon (copy), v7 (copy)
			return CommonIcon("CircleQuestion", nil, v7)
		end
	}
})

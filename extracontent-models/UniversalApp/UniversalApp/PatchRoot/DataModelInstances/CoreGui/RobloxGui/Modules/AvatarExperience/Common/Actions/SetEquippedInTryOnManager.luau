local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return Rodux.makeActionCreator(script.Name, function(s1: string, b1: boolean, p1) -- line: 11
	return {
		itemId = s1,
		selectedInTryOnManager = b1,
		itemType = p1
	}
end)

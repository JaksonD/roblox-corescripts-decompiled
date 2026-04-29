local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return Rodux.makeActionCreator(script.Name, function(p1) -- line: 18
	return {
		itemIdToOrderMap = p1
	}
end)

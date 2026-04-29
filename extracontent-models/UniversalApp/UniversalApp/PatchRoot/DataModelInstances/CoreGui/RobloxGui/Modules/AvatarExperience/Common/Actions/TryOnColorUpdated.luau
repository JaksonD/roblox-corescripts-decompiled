local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)

return Rodux.makeActionCreator(script.Name, function(p1, p2) -- line: 13
	return {
		colors = p1,
		bodyPartColorRangeIds = p2
	}
end)

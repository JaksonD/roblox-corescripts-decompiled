local CorePackages = game:GetService("CorePackages")
local Rodux = require(CorePackages.Packages.Rodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules

require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
require(Modules.AvatarExperience.Common.Types)
require(Modules.AvatarExperience.Common.Context.WidgetInfoContext)

local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS

return Rodux.makeActionCreator(script.Name, function(p1, s1: string, s2: string, b1: boolean, n1: number?, p2, p3, b2: boolean, b3: boolean?, t1: {[any]: any}?, b4: boolean?, n2: number?) -- line: 39
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), FFlagAXDurablesForMIS (copy)
	return {
		itemType = p1,
		itemSubType = s1,
		itemId = s2,
		selectedInTryOnManager = b1,
		overrideOrder = n1,
		bundleInfo = p2,
		widgetInfo = p3,
		receivedBundleInfo = b2,
		isRecolorable = b3,
		bundleItems = if not FFlagAXMISEnableMultiShopping then nil else t1,
		resetTryOnsBeforeToggleOn = if not FFlagAXMISEnableMultiShopping then nil else b4,
		selectedTimedOptionIndex = if not FFlagAXDurablesForMIS then nil else n2
	}
end)

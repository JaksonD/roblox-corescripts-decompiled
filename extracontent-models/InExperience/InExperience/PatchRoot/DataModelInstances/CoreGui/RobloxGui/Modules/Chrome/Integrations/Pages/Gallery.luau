local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local Service = require(Chrome.Service)
local CommonIcon = require(Chrome.Integrations.CommonIcon)
local CapturesPolicy = require(CorePackages.Workspace.Packages.CapturesInExperience).CapturesPolicy
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local isSpatial = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local isInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local FFlagFixSpatialUICaptures = require(CorePackages.Workspace.Packages.SharedFlags).FFlagFixSpatialUICaptures
local InGameMenuIntegrationUtils = require(script.Parent.InGameMenuIntegrationUtils)
local v11 = InGameMenuIntegrationUtils.createPageOpenSignal("CapturesPage")
local v12 = CapturesPolicy.PolicyImplementation.read()
local v13 = not not v12 and CapturesPolicy.Mapper(v12).eligibleForCapturesFeature()
local v14 = isInExperienceUIVREnabled and FFlagFixSpatialUICaptures

return Service:register({
	initialAvailability = if not (v13 and (not v14 or not isSpatial())) then Service.AvailabilitySignal.Unavailable else Service.AvailabilitySignal.Available,
	id = "gallery",
	label = "Feature.Captures.Title.Gallery",
	sideSheetPlacement = SideSheetPlacement.Page,
	activated = function(_) --[[ activated ]] -- line: 32
		-- upvalues: InGameMenuIntegrationUtils (copy), v11 (copy)
		InGameMenuIntegrationUtils.toggleIGMPage("CapturesPage", v11:get())
	end,
	isActivated = function() --[[ isActivated ]] -- line: 35
		-- upvalues: v11 (copy)
		return v11:get()
	end,
	components = {
		Icon = function(_) --[[ Icon ]] -- line: 39
			-- upvalues: CommonIcon (copy), v11 (copy)
			return CommonIcon("icons/controls/cameraOff", "icons/controls/cameraOn", v11)
		end
	}
})

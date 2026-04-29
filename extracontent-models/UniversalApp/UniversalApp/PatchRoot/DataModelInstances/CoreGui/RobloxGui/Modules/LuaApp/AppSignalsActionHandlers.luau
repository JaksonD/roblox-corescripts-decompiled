local CorePackages = game:GetService("CorePackages")
local ActionHandlers = require(CorePackages.Workspace.Packages.SignalsMiddleware).ActionHandlers
local FFlagSduiExperienceDetailsSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSduiExperienceDetailsSupport
local v4 = ActionHandlers.create()

if FFlagSduiExperienceDetailsSupport then
	require(CorePackages.Workspace.Packages.DiscoverySignalsActionHandlers).registerDiscoverySignalsActionHandlers(v4)
end

return v4

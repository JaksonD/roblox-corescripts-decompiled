local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local Dash = require(CorePackages.Packages.Dash)
local useDeviceType = require(CorePackages.Workspace.Packages.RobloxAppHooks).useDeviceType
local DeviceType = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType
local GameDetailsPeekView = require(Modules.LuaApp.Components.GameDetails.GameDetailsPeekView)
local ExperienceDetailsContainer = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer)
local useNavigationProps = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps

require(CorePackages.Workspace.Packages.Navigation)

local FFlagLuaAppSduiEdpEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpEnabled
local FFlagLuaAppSduiEdpLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpLogExposure
local FStringLuaAppSduiEdpIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppSduiEdpIxpLayer

require(CorePackages.Workspace.Packages.SduiSharedUtilities)

local function renderGameDetailsPeekView(t1: {[any]: any}) -- line: 50
	-- upvalues: React (copy), GameDetailsPeekView (copy)
	return React.createElement(GameDetailsPeekView, t1)
end
local function renderExperienceDetailsPage(t2: {[any]: any}) -- line: 54
	-- upvalues: React (copy), ExperienceDetailsContainer (copy)
	return React.createElement(ExperienceDetailsContainer, t2)
end

return function(t3: {[any]: any}) --[[ ExperienceDetailsSelector ]] -- line: 58
	-- upvalues: useNavigationProps (copy), Dash (copy), FFlagLuaAppSduiEdpLogExposure (copy), React (copy), IXPService (copy), FStringLuaAppSduiEdpIxpLayer (copy), useDeviceType (copy), DeviceType (copy), FFlagLuaAppSduiEdpEnabled (copy), CorePackages (copy), renderGameDetailsPeekView (copy), renderExperienceDetailsPage (copy)
	local v19 = useNavigationProps(function(p1, p2) -- line: 59
		if p1 ~= nil then
			return {
				universeId = p1,
				source = p2.source,
				index = p2.index,
				onClose = p2.onClose,
				mountAsFullView = p2.mountAsFullView,
				mountAnimation = p2.mountAnimation,
				referralSource = p2.referralSource,
				onPeekViewClosed = p2.onPeekViewClosed,
				showBackButton = p2.showBackButton,
				experienceJoinData = p2.experienceJoinData,
				placeIdOverride = p2.placeIdOverride
			}
		end

		return nil
	end)
	local v20 = Dash.join(t3, v19)

	if FFlagLuaAppSduiEdpLogExposure then
		React.useEffect(function() -- line: 80
			-- upvalues: IXPService (copy), FStringLuaAppSduiEdpIxpLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppSduiEdpIxpLayer)
		end, {})
	end

	local v21 = if not v20.deviceType then useDeviceType() else v20.deviceType

	if v21 == DeviceType.Phone then
		if FFlagLuaAppSduiEdpEnabled then
			local ExperienceDetailsPeekView = require(CorePackages.Workspace.Packages.GameDetail).ExperienceDetailsPeekView

			return React.createElement(ExperienceDetailsPeekView, v20)
		end

		return renderGameDetailsPeekView(v20)
	end

	local v23 = Dash.join(v20, {
		deviceType = v21
	})

	if FFlagLuaAppSduiEdpEnabled then
		local ExperienceDetailsFullPage = require(CorePackages.Workspace.Packages.GameDetail).ExperienceDetailsFullPage

		return React.createElement(ExperienceDetailsFullPage, v23)
	end

	return renderExperienceDetailsPage(v23)
end

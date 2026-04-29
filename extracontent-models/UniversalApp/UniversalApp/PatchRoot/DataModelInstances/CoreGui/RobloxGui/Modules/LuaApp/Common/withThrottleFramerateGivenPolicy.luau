local RunService = game:GetService("RunService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local AppRunService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppRunService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local LuauPolyfill = require(CorePackages.Packages.LuauPolyfill)
local VideoPlaybackCoordinator = require(CorePackages.Workspace.Packages.VideoUtils).VideoPlaybackCoordinator
local Object = LuauPolyfill.Object
local FFlagLuaAppGameTileWideVideoThumbnail = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppGameTileWideVideoThumbnail
local FFlagLuaAppVideoPlaybackRefCount = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppVideoPlaybackRefCount

return function(p1) -- line: 24
	-- upvalues: React (copy), useRoactService (copy), AppRunService (copy), RunService (copy), RoactAppPolicy (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), Object (copy)
	return React.forwardRef(function(p2, p3) -- line: 25
		-- upvalues: useRoactService (copy), AppRunService (copy), RunService (copy), React (copy), RoactAppPolicy (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), p1 (copy), Object (copy)
		local v16 = useRoactService(AppRunService) or RunService
		local v17 = React.useMemo(function() -- line: 29
			-- upvalues: RoactAppPolicy (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), v16 (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy), p1 (copy)
			return RoactAppPolicy.connect(function(p4) -- line: 30
				-- upvalues: FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), v16 (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy)
				return {
					setThrottleFramerateEnabled = function(p5) --[[ setThrottleFramerateEnabled ]] -- line: 32
						-- upvalues: p4 (copy), FFlagLuaAppVideoPlaybackRefCount (copy), VideoPlaybackCoordinator (copy), v16 (copy), FFlagLuaAppGameTileWideVideoThumbnail (copy)
						if p4.getThrottleFramerate() then
							if not FFlagLuaAppVideoPlaybackRefCount or not VideoPlaybackCoordinator.isAnyPlaying() then
								v16:setThrottleFramerateEnabled(p5)
							end

							if FFlagLuaAppGameTileWideVideoThumbnail then
								VideoPlaybackCoordinator.default:setPreferredFramerateThrottling(p5)
							end
						end
					end
				}
			end)(p1)
		end, {
			p1,
			v16
		})

		return React.createElement(v17, Object.assign(p2, {
			ref = p3
		}))
	end)
end

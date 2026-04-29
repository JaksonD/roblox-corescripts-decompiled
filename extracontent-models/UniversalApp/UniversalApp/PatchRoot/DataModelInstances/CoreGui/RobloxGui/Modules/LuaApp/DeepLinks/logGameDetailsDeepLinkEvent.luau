local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local EventIngestService = game:GetService("EventIngestService")
local SessionService = game:GetService("SessionService")
local EventIngest = require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest
local gameDetailReferral = require(Modules.LuaApp.Analytics.Events.Games.gameDetailReferral)
local SetGamePlaySession = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableShareLinksInGameDetailEvent then
	return function(s1: string, p1, t1: {[any]: any}) --[[ logGameDetailsDeepLinkEvent ]] -- line: 26
		-- upvalues: EventIngest (copy), EventIngestService (copy), SetGamePlaySession (copy), SessionService (copy), SessionType (copy), gameDetailReferral (copy)
		local t2 = {
			universeId = s1,
			pg = "deepLink",
			shareLinkType = t1.linkType,
			shareLinkId = t1.linkId
		}
		local v13 = EventIngest.new(EventIngestService)

		SetGamePlaySession(SessionService, SessionType.StructuralIdentifier.GameDetailSource, false)
		gameDetailReferral(v13, p1, t2)
	end
end

return function(s2: string, p2) --[[ DEPRECATED_logGameDetailsDeepLinkEvent ]] -- line: 44
	-- upvalues: EventIngest (copy), EventIngestService (copy), gameDetailReferral (copy)
	local t3 = {
		universeId = s2,
		pg = "deepLink"
	}
	local v17 = EventIngest.new(EventIngestService)

	gameDetailReferral(v17, p2, t3)
end

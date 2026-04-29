local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local TelemetryService = game:GetService("TelemetryService")
local ExpChatShared = script:FindFirstAncestor("ExpChatShared")
local ExpChatSharedParent = ExpChatShared.Parent
local Dictionary = require(ExpChatSharedParent.llama).Dictionary
local v6 = require(ExpChatShared.Logger):new("ExpChat/" .. script.Name)
local t1 = {}
local u8 = RbxAnalyticsService

local function withDefaultArgs(p1) -- line: 16
	-- upvalues: Dictionary (copy)
	return Dictionary.join(p1, {
		gameId = tostring(game.GameId),
		placeId = tostring(game.PlaceId)
	})
end
local function setRbxEventStream(s1: string, s2: string, s3: string, p2) -- line: 23
	-- upvalues: u8 (ref), v6 (copy), withDefaultArgs (copy)
	if u8 then
		v6:debug("Event: {}", s3)
		u8:SetRBXEventStream(s1, s2, s3, withDefaultArgs(p2 or {}))
	end
end
local function sendEventDeferred(s4: string, s5: string, s6: string, p3) -- line: 30
	-- upvalues: u8 (ref), v6 (copy), withDefaultArgs (copy)
	if u8 then
		v6:debug("SendEventDeferred: {}", s6)
		u8:SendEventDeferred(s4, s5, s6, withDefaultArgs(p3 or {}))
	end
end

function t1.with(p4) -- line: 37
	-- upvalues: u8 (ref), RbxAnalyticsService (copy)
	u8 = p4 or RbxAnalyticsService
end
function t1.FireRccAnalyticsWithEventName(s7: string, p5) -- line: 41
	-- upvalues: setRbxEventStream (copy)
	setRbxEventStream("rcc", "experienceChat", s7, p5)
end
function t1.FireClientAnalyticsWithEventName(s8: string, p6) -- line: 45
	-- upvalues: setRbxEventStream (copy)
	setRbxEventStream("client", "experienceChat", s8, p6)
end
function t1.reportCounter(s9: string, n1: number?) -- line: 49
	-- upvalues: u8 (ref), v6 (copy)
	if u8 then
		v6:debug("Counter: {}", s9)
		u8:ReportCounter(s9, n1 or 1)
	end
end
function t1.FireLikelySpeakingBubbleAnalytics(s10: string, n2: number, n3: number, s11: string) -- line: 56
	-- upvalues: setRbxEventStream (copy)
	setRbxEventStream("client", "voiceChat", "likelySpeakingBubbleEvent", {
		eventType = s10,
		universe_id = n2,
		place_id = n3,
		play_session_id = s11
	})
end
function t1.FireRccAnalyticsDeferred(s12: string, p7) -- line: 70
	-- upvalues: sendEventDeferred (copy)
	sendEventDeferred("RCC", "experienceChat", s12, p7)
end
function t1.TelemetryLogEvent(_: {[any]: any}, t3: {[any]: any}, t4: {[any]: any}?, t5: {[any]: any}?) -- line: 74
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogEvent(t3, {
		customFields = t4,
		standardizedFields = t5
	})
end

t1.DefaultStandardizedFields = {
	"addOSInfo",
	"addSessionInfo",
	"addUniverseId",
	"addPlaceId"
}
t1.RewriteDropdownToggledConfig = {
	eventName = "RewriteDropdownToggled",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ExpChatRewriteDropdownToggledThrottlePerMyriad", 10000),
	lastUpdated = {
		26,
		4,
		21
	},
	description = "When a user activates the AI rewrite dropdown toggle on a rewritten chat message.",
	links = ""
}

return t1

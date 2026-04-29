local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local LocalPlayer = game:GetService("Players").LocalPlayer
local TelemetryService = game:GetService("TelemetryService")
local Dash = require(Parent.Dash)
local FFlagFixAnalyticsForDynamicReportV2 = require(Parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local t1 = {
	OpenDialog = "OpenDialog",
	EarlyClose = "EarlyClose",
	Close = "Close",
	Submit = "Submit",
	SubmitSuccess = "SubmitSuccess",
	SubmitFail = "SubmitFail",
	BackAction = "BackAction",
	NodeDone = "NodeDone",
	SelectItem = "SelectItem",
	IsUserBlockAvailable = "IsUserBlockAvailable",
	IsUserMuteAvailable = "IsUserMuteAvailable",
	DidBlockUser = "DidBlockUser",
	DidUnblockUser = "DidUnblockUser",
	DidMuteUser = "DidMuteUser",
	HelplineShown = "HelplineShown",
	HelplineOpened = "HelplineOpened",
	Error = "Error",
	CommentInput = "CommentInput",
	TextChannelSwitch = "TextChannelSwitch",
	EmptyState = "EmptyState",
	SceneCaptureResult = "SceneCaptureResult"
}

local function flattenForTelemetry(t2: {[any]: any}) -- line: 91
	local t3 = {}

	for v14, v15 in t2 do
		if type(v15) == "table" then
			local n1 = 0

			for _ in v15 do
				n1 += 1
			end

			if n1 == #v15 and n1 > 0 then
				local t4 = {}

				for _, v20 in v15 do
					table.insert(t4, (tostring(v20)))
				end

				t3[v14] = "[" .. table.concat(t4, ", ") .. "]"
			else
				for v21, v22 in v15 do
					t3[tostring(v21)] = tostring(v22)
				end
			end
		else
			t3[v14] = tostring(v15)
		end
	end

	return t3
end

local t5 = {
	eventName = "DynamicAbuseReportEventV2",
	description = "Event to track dynamic abuse report v2",
	lastUpdated = {
		2026,
		4,
		16
	},
	backends = {
		"EventIngest",
		"Points"
	},
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0),
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8782"
}

return {
	sendAnalyticsEvent = function(t6: {[any]: any}, t7: {[any]: any}) --[[ sendAnalyticsEvent ]] -- line: 127
		-- upvalues: FFlagFixAnalyticsForDynamicReportV2 (copy), Dash (copy), LocalPlayer (copy), TelemetryService (copy), t5 (copy), flattenForTelemetry (copy)
		if FFlagFixAnalyticsForDynamicReportV2 then
			local v25 = Dash.join(t6, t7, {
				user_id = LocalPlayer and LocalPlayer.UserId or nil
			})

			TelemetryService:LogEvent(t5, {
				customFields = flattenForTelemetry(v25),
				eventContext = t6.abuse_vector
			})

			return
		end

		TelemetryService:LogEvent(Dash.join(t5, {
			eventContext = t6.abuse_vector
		}), {
			customFields = Dash.join(t6, t7, {
				user_id = LocalPlayer and LocalPlayer.UserId or nil
			})
		})
	end,
	TelemetryEventType = t1
}

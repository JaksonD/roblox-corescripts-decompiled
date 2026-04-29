local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local GenericAbuseReportingParent = GenericAbuseReporting.Parent
local React = require(GenericAbuseReportingParent.React)
local AbuseReportAnalyticsContext = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsService = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local inExpSceneSelectionAdapter = require(script.Parent.inExpSceneSelectionAdapter)
local LayoutSlots = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local TextWithTranslation = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)

require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)

local TelemetryEventType = analyticsService.TelemetryEventType
local useAbuseReportAnalytics = AbuseReportAnalyticsContext.useAbuseReportAnalytics
local useLayoutSlots = LayoutSlots.useLayoutSlots

return React.memo(function(t1: {[any]: any}) --[[ InExpSceneSelectionNode ]] -- line: 30
	-- upvalues: React (copy), useAbuseReportAnalytics (copy), useLayoutSlots (copy), inExpSceneSelectionAdapter (copy), TelemetryEventType (copy), TextWithTranslation (copy)
	local v13, v14 = React.useState(t1.loadingText)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local Body = useLayoutSlots().Body
	local v17 = React.useRef(t1)

	v17.current = t1

	local v18 = React.useRef(sendEvent)

	v18.current = sendEvent
	React.useEffect(function() -- line: 44
		-- upvalues: inExpSceneSelectionAdapter (copy), v18 (copy), TelemetryEventType (copy), v17 (copy), v14 (copy)
		local u19 = nil

		u19 = inExpSceneSelectionAdapter.subscribeOnceToExitReason(function(p1) -- line: 46
			-- upvalues: u19 (ref), v18 (copy), TelemetryEventType (copy), v17 (copy)
			u19 = nil
			v18.current({
				sub_event_type = TelemetryEventType.SceneCaptureResult,
				scene_capture_detail = {
					exit_reason = p1.reason,
					success = p1.reason == "submit"
				}
			})

			local current = v17.current

			if p1.reason == "submit" then
				if current.onNext then
					current.onNext()

					return
				end
			elseif current.goBack then
				current.goBack()
			end
		end)

		if not pcall(inExpSceneSelectionAdapter.start) then
			v18.current({
				sub_event_type = TelemetryEventType.SceneCaptureResult,
				scene_capture_detail = {
					exit_reason = "start_failed",
					success = false
				}
			})
			v14(v17.current.errorText)

			if u19 then
				u19:Disconnect()
				u19 = nil
			end
		end

		return function() -- line: 83
			-- upvalues: u19 (ref)
			if u19 then
				u19:Disconnect()
				u19 = nil
			end
		end
	end, {})

	return React.createElement(Body, nil, {
		Title = React.createElement(TextWithTranslation, {
			input = t1.title,
			tag = "size-full-0 auto-y text-heading-medium",
			layoutOrder = 1
		}),
		Message = if not v13 then nil else React.createElement(TextWithTranslation, {
			input = v13,
			tag = "size-full-0 auto-y text-body-small",
			layoutOrder = 2
		})
	})
end)

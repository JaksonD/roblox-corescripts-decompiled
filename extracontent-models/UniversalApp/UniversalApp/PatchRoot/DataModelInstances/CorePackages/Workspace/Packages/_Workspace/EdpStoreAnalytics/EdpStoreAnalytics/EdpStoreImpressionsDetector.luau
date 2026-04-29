local EdpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local TelemetryService = game:GetService("TelemetryService")
local IXPService = game:GetService("IXPService")
local EdpStoreAnalyticsParent = EdpStoreAnalytics.Parent
local React = require(EdpStoreAnalyticsParent.React)
local AppCommonLib = require(EdpStoreAnalyticsParent.AppCommonLib)
local AppUserLayers = require(EdpStoreAnalyticsParent.ExperimentLayers).AppUserLayers
local Constants = require(EdpStoreAnalytics.Constants)
local Signal = AppCommonLib.Signal
local ScreenSizeImpressionsDetector = require(EdpStoreAnalyticsParent.Impressions).ScreenSizeImpressionsDetector
local v11 = game:DefineFastInt("EdpStoreImpressionsDetectorThrottlingHundredthsPercent", 0)

return function(t1: {[any]: any}) -- line: 25
	-- upvalues: React (copy), Signal (copy), Constants (copy), v11 (copy), TelemetryService (copy), IXPService (copy), AppUserLayers (copy), ScreenSizeImpressionsDetector (copy)
	local v13 = React.useRef(Signal.new())
	local v14 = React.useRef(false)

	React.useEffect(function() -- line: 29
		-- upvalues: t1 (copy), v13 (copy)
		if t1.scrollViewPositionChangedSignal.current then
			t1.scrollViewPositionChangedSignal.current:connect(function() -- line: 31
				-- upvalues: v13 (copy)
				v13.current:fire()
			end)
		end
	end, { t1.scrollViewPositionChangedSignal })

	local v15 = React.useCallback(function(t2: {[any]: any}) -- line: 37
		-- upvalues: v14 (copy), t1 (copy), Constants (copy), v11 (copy), TelemetryService (copy), IXPService (copy), AppUserLayers (copy)
		if #t2 == 0 or v14.current then
			return
		end

		if t1.parameters == nil then
			return
		end

		v14.current = true

		local v17 = t2[1]
		local t3 = {
			eventName = Constants.ExperienceStoreEventName,
			backends = { "EventIngest" },
			throttlingPercentage = v11,
			lastUpdated = {
				25,
				10,
				23
			},
			description = "Event fired from the lua app for every impression on the EDP store or preview"
		}
		local t4 = {
			universeId = tonumber(t1.parameters.universeId),
			productType = t1.parameters.productType,
			actionType = Constants.StoreEnums.ActionType.Impression,
			locationType = t1.parameters.locationType,
			layoutOrder = tonumber(v17)
		}

		TelemetryService:LogEvent(t3, {
			customFields = t4
		})
		IXPService:LogUserLayerExposure(AppUserLayers.EconomyDeveloperMonetizationEdpVirtualProductsRanking)
	end, { t1.parameters })

	return React.createElement(ScreenSizeImpressionsDetector, {
		parentRef = t1.parentRef,
		onRequestImpressionsSignal = v13.current,
		onImpressionsDetected = v15,
		impressionsTag = t1.impressionsTag
	})
end

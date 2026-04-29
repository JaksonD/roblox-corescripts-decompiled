local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local Cryo = require(SduiCoreSystemParent.Cryo)

require(SduiCoreSystemParent.Signals)
require(SduiCoreSystemParent.UnifiedLogging)
require(SduiCoreSystem.SduiBuilderTypes)

local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)

require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
require(SduiCoreSystem.SduiComponentType)

local FFlagSduiImprovedErrorDimensions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiImprovedErrorDimensions
local t1 = {}
local t2 = {
	__index = function(p1, p2) --[[ __index ]] -- line: 33
		if p2 == "analyticsData" then
			return p1.getAnalyticsDataSnapshot()
		end

		if p2 == "ancestorAnalyticsData" then
			return p1.getAncestorAnalyticsDataSnapshot()
		end

		return nil
	end
}

return function(p3, t3: {[any]: any}?, p4, p5) --[[ buildAnalyticsContextForClientBinding ]] -- line: 66
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), t1 (copy), SduiLogger (copy), SduiErrors (copy), Cryo (copy), t2 (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end

	local u17 = nil
	local t4 = {
		getAnalyticsDataSnapshot = function() --[[ getAnalyticsDataSnapshot ]] -- line: 91
			-- upvalues: p3 (copy), t1 (copy), t3 (copy), SduiLogger (copy), SduiErrors (copy), p5 (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), u17 (ref), Cryo (copy)
			local v19 = table.clone(p3 or t1)

			if t3 then
				xpcall(function() -- line: 94
					-- upvalues: t3 (copy), v19 (copy)
					for v23, v24 in t3 do
						v19[v23] = v24(false).data
					end
				end, function(err) -- line: 98
					-- upvalues: SduiLogger (copy), SduiErrors (copy), p5 (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToComputeAnalyticsData, {
						message = err,
						name = p5.debugName,
						componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
						parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
					}, p5.appPage)
				end)
			end

			if u17 then
				return (Cryo.Dictionary.join(v19, u17))
			end

			return v19
		end,
		getAncestorAnalyticsDataSnapshot = function() --[[ getAncestorAnalyticsDataSnapshot ]] -- line: 118
			-- upvalues: p4 (copy), t1 (copy), Cryo (copy)
			if p4 then
				local v20 = p4.ancestorAnalyticsData or t1
				local v21 = p4.analyticsData or t1

				return Cryo.Dictionary.join(v20, v21)
			end

			return t1
		end,
		setLocalAnalyticsData = function(p6) --[[ setLocalAnalyticsData ]] -- line: 135
			-- upvalues: u17 (ref)
			u17 = p6
		end,
		getCollectionData = function() --[[ getCollectionData ]] -- line: 147
			-- upvalues: p4 (copy)
			if p4 and p4.getCollectionData then
				return p4.getCollectionData()
			end

			return nil
		end
	}

	setmetatable(t4, t2)

	return t4
end

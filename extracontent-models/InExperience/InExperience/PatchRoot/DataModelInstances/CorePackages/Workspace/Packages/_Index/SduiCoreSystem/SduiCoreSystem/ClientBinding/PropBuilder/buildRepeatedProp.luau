local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local Signals = require(SduiCoreSystemParent.Signals)
local tutils = require(SduiCoreSystemParent.tutils)
local SduiClientBindingBuilder = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

require(SduiCoreSystem.SduiBuilderTypes)

local SduiPropUtils = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local SduiParseHelpers = require(SduiCoreSystem.SduiParseHelpers)

require(SduiCoreSystem.SduiComponentType)

local SharedFlags = require(SduiCoreSystemParent.SharedFlags)
local FFlagSduiExperienceDetailsSupport = SharedFlags.FFlagSduiExperienceDetailsSupport
local FFlagSduiImprovedErrorDimensions = SharedFlags.FFlagSduiImprovedErrorDimensions

local function buildRepeatedProp(p1, p2, p3, p4, p5, p6, p7: ((...any) -> ...any)?) -- line: 37
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), SduiPropUtils (copy), SduiClientBindingBuilder (copy), PropResultCategory (copy), FFlagSduiExperienceDetailsSupport (copy), Signals (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), tutils (copy), buildRepeatedProp (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end

	if p1 == "literal" then
		if typeof(p2) ~= "table" then
			error("buildRepeatedProp: propDefinitionValue must be a table for literal type")
		end

		local array = p2.array

		if array == nil then
			error("buildRepeatedProp: wrapper message must have 'array' field")
		end

		if typeof(array) ~= "table" then
			error("buildRepeatedProp: array field must be a table/array")
		end

		return SduiPropUtils.generateTablePropSignalValue(array, p3, p5, p6, p4, SduiClientBindingBuilder.buildPropTable, p7), PropResultCategory.PropSignal
	end

	if p1 == "binding_path" then
		return SduiPropUtils.generateDynamicBindingPropValue(p2, p3, p5, p4, function(t1: {[any]: any}, p8) --[[ evaluatePropArray ]] -- line: 81
			-- upvalues: SduiClientBindingBuilder (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), SduiPropUtils (copy)
			local v31, v32, v33 = SduiClientBindingBuilder.buildPropTable(t1, p3, p4, p5, p6)

			return SduiPropUtils.resolveTablePropValue(p8, v31, v32, v33, p3, p5, p6, p4, SduiClientBindingBuilder.buildPropTable)
		end), PropResultCategory.PropSignal
	end

	if FFlagSduiExperienceDetailsSupport and p1 == "array_map" then
		local v25 = p2.kind and p2.kind.type
		local v26 = p2.kind and p2.kind.value
		local item_hydration_specs = p2.item_hydration_specs
		local field_map = p2.field_map

		if field_map == nil then
			error("buildRepeatedProp array_map: missing field_map")
		end

		return Signals.createComputed(function(p9) -- line: 121
			-- upvalues: SduiPropUtils (copy), v25 (copy), v26 (copy), p3 (copy), p4 (copy), item_hydration_specs (copy), field_map (copy), p5 (copy), p6 (copy), SduiClientBindingBuilder (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
			local ok, result = pcall(function() -- line: 122
				-- upvalues: SduiPropUtils (copy), v25 (copy), v26 (copy), p9 (copy), p3 (copy), p4 (copy), item_hydration_specs (copy), field_map (copy), p5 (copy), p6 (copy), SduiClientBindingBuilder (copy)
				local v37 = SduiPropUtils.resolveSourceArray(v25, v26, p9, p3, p4)

				if v37 == nil then
					error("buildRepeatedProp array_map: source array resolved to nil")
				end

				return SduiPropUtils.mapArrayWithFieldMap(v37, item_hydration_specs or {}, field_map, p5, p6, p9, SduiClientBindingBuilder.buildPropTable)
			end)

			if ok then
				return {
					data = result
				}
			end

			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = `Failed to build array_map: { SduiParseHelpers.stringifyValue(result) }`,
				name = p5.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
			}, p5.appPage)

			return {
				data = {}
			}
		end, tutils.shallowEqual), PropResultCategory.PropSignal
	end

	if p1 == "conditional" then
		return SduiPropUtils.generateConditionalPropValue(p2, p3, p5, p6, p4, buildRepeatedProp, p7), PropResultCategory.PropSignal
	end

	return nil, PropResultCategory.Failed
end

return buildRepeatedProp

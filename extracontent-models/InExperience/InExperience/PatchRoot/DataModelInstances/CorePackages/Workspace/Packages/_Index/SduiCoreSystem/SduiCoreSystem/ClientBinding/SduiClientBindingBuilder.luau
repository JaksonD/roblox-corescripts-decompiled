local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local Signals = require(SduiCoreSystemParent.Signals)
local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local buildDataBindingSourcesForTemplate = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local buildAnalyticsContextForClientBinding = require(SduiCoreSystem.ClientBinding.buildAnalyticsContextForClientBinding)

require(SduiCoreSystem.SduiBuilderTypes)
require(SduiCoreSystem.SduiComponentType)

local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapper = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiParseHelpers = require(SduiCoreSystem.SduiParseHelpers)
local getSduiComponentRegistry = require(SduiCoreSystem.getSduiComponentRegistry)
local SharedFlags = require(SduiCoreSystemParent.SharedFlags)
local FFlagSduiOneofPropSupport = SharedFlags.FFlagSduiOneofPropSupport
local FFlagSduiPropMapping = SharedFlags.FFlagSduiPropMapping
local FFlagSduiNestedComponentListProp = SharedFlags.FFlagSduiNestedComponentListProp
local FFlagSduiImprovedErrorDimensions = SharedFlags.FFlagSduiImprovedErrorDimensions

local function buildProp(p1, p2, p3, p4, p5) -- line: 35
	-- upvalues: FFlagSduiOneofPropSupport (copy), buildProp (copy), FFlagSduiImprovedErrorDimensions (copy)
	if FFlagSduiOneofPropSupport and (p1.oneof_prop and p1.oneof_prop.value) then
		return buildProp(p1.oneof_prop.value, p2, p3, p4, p5)
	end

	local v25 = p1 and (p1.kind and p1.kind.type)

	if v25 == nil then
		error("No propDefinitionType provided")
	end

	if p1.descriptor == nil then
		error(`No propDefinitionType descriptor provided for { v25 }`)
	end

	local name = p1.descriptor.name

	if FFlagSduiImprovedErrorDimensions then
		p4.currentParserName = name
	end

	local v27 = p4.getPropBuilder(name)
	local v28 = p1.kind and p1.kind.value

	if FFlagSduiOneofPropSupport and v28 == nil then
		error(`No propDefinitionValue provided for { v25 }`)
	end

	local v29, v30, v31 = v27(v25, v28, p2, p3, p4, p5)

	return v29, v30, v31
end
local function buildPropTable(p6, p7, p8, p9, p10, t1: {[any]: any}?) -- line: 107
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiPropMapping (copy), ProtoVariableMapper (copy), buildProp (copy), PropResultCategory (copy), FFlagSduiNestedComponentListProp (copy), SduiLogger (copy), SduiErrors (copy)
	local t2 = {}

	if p6 == nil then
		error("Attempt to buildPropTable with nil")
	end

	local currentComponentType = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p9.currentComponentType
	end

	local t3 = nil
	local t4 = nil
	local t5 = nil

	for v45, v46 in p6 do
		local v47 = if not FFlagSduiPropMapping then ProtoVariableMapper.mapPropName(v45) else if not t1 or not t1[v45] then ProtoVariableMapper.mapPropName(v45) or v45 else t1[v45]
		local ok, result = pcall(function() -- line: 132
			-- upvalues: buildProp (copy), v46 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), PropResultCategory (copy), t3 (ref), v47 (copy), t4 (ref), FFlagSduiNestedComponentListProp (copy), t5 (ref), t2 (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref)
			local v79, v80, v81 = buildProp(v46, p7, p8, p9, p10)

			if v80 == PropResultCategory.PropSignal then
				if t3 == nil then
					t3 = {}
				end

				t3[v47] = v79

				return
			end

			if v80 == PropResultCategory.NestedComponentConfig then
				if t4 == nil then
					t4 = {}
				end

				t4[v47] = v79

				return
			end

			if FFlagSduiNestedComponentListProp and v80 == PropResultCategory.NestedComponentConfigListPropSignal then
				if t3 == nil then
					t3 = {}
				end

				t3[v47] = v79

				if t5 == nil then
					t5 = {}
				end

				t5[v47] = true

				return
			end

			if v80 == PropResultCategory.Failed then
				t2[v47] = v79
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `ClientBinding - failed to build prop { v47 }: { v79 }, { v81 }`,
					propName = `{ v47 }`,
					name = p9.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
					parserName = if not FFlagSduiImprovedErrorDimensions then nil else v46.descriptor.name,
					value = v46
				}, p9.appPage)

				return
			end

			if v80 == PropResultCategory.Literal then
				t2[v47] = v79

				return
			end

			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - unexpected propResultCategory: { v80 }. { v47 }: { v79 }, { v81 }`,
				propName = `{ v47 }`,
				name = p9.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else v46.descriptor.name,
				value = v46
			}, p9.appPage)
			t2[v47] = v79
		end)

		if not ok then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop { v47 }: { result }. { result }`,
				propName = `{ v47 }`,
				name = p9.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else v46.descriptor.name,
				value = v46
			}, p9.appPage)
		end
	end

	return t2, t3, t4, t5
end

local t6 = {
	__index = function(p11, p12) --[[ __index ]] -- line: 201
		if p12 == "analyticsData" then
			return p11.analyticsContext and p11.analyticsContext.analyticsData
		end

		return nil
	end
}

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p13, p14, p15, p16, _) --[[ buildConfigForComponent ]] -- line: 210
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), ProtoVariableMapper (copy), Signals (copy), buildDataBindingSourcesForTemplate (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), t6 (copy), buildPropTable (copy), buildAnalyticsContextForClientBinding (copy), FFlagSduiPropMapping (copy), getSduiComponentRegistry (copy), FFlagSduiNestedComponentListProp (copy), buildProp (copy), PropResultCategory (copy)
		if not p13 or not next(p13) then
			error("Attempt to buildConfigForComponent with nil template")
		end

		local value = p13.kind.value
		local u58 = nil

		if FFlagSduiImprovedErrorDimensions then
			local v59 = value.shared and value.shared.component_type

			if not v59 then
				error("Could not determine ui component type")
			end

			u58 = ProtoVariableMapper.mapUiComponentTypeToLua(v59)
			p15.currentComponentType = u58
		end

		local v60 = value.shared and value.shared.data or {}
		local v61 = Signals.createComputed(function(p18) -- line: 237
			-- upvalues: buildDataBindingSourcesForTemplate (copy), p14 (copy), v60 (copy), SduiLogger (copy), SduiErrors (copy), p15 (copy), FFlagSduiImprovedErrorDimensions (copy), u58 (ref), SduiParseHelpers (copy)
			local ok, result = pcall(function() -- line: 238
				-- upvalues: buildDataBindingSourcesForTemplate (copy), p14 (copy), p18 (copy), v60 (copy)
				return buildDataBindingSourcesForTemplate(p14(p18), v60)
			end)

			if not ok then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToBuildBindingSources, {
					name = p15.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else u58,
					message = SduiParseHelpers.stringifyValue(result)
				}, p15.appPage)

				return {}
			end

			return result
		end)

		if not FFlagSduiImprovedErrorDimensions then
			local v62 = value.shared and value.shared.component_type

			if not v62 then
				error("Could not determine ui component type")
			end

			u58 = ProtoVariableMapper.mapUiComponentTypeToLua(v62)
		end

		local t7 = {
			__processed = true,
			__isClientBinding = true,
			componentType = u58
		}

		setmetatable(t7, t6)

		local v64 = nil
		local v65 = nil

		if value.shared and value.shared.analytics_data then
			v64, v65 = buildPropTable(value.shared.analytics_data, v61, p14, p15, nil, nil)
		end

		t7.analyticsContext = buildAnalyticsContextForClientBinding(v64, v65, p16, p15)

		if value.props then
			local v66 = nil

			if FFlagSduiPropMapping then
				local v67 = getSduiComponentRegistry().getComponentDefinition(u58)

				v66 = v67 and v67.propMapping or nil
			end

			local v68, v69, v70, v71 = buildPropTable(value.props, v61, p14, p15, t7.analyticsContext, v66)

			t7.props = v68

			if v69 ~= nil and next(v69) then
				t7.propSignals = v69
			end

			if v70 ~= nil and next(v70) then
				t7.nestedComponentConfigs = v70
			end

			if FFlagSduiNestedComponentListProp and v71 ~= nil and next(v71) then
				t7.nestedComponentConfigListPropSignalNames = v71
			end
		end

		if value.shared and value.shared.is_component_filtered then
			local is_component_filtered = value.shared.is_component_filtered
			local ok, result, v75, v76 = pcall(function() -- line: 318
				-- upvalues: buildProp (copy), is_component_filtered (copy), v61 (copy), p14 (copy), p15 (copy), t7 (copy)
				return buildProp(is_component_filtered, v61, p14, p15, t7.analyticsContext)
			end)

			if not ok or v76 or v75 == PropResultCategory.Failed then
				local v77 = if not v76 then SduiParseHelpers.stringifyValue(result) else SduiParseHelpers.stringifyValue(v76)
				local v78 = SduiParseHelpers.stringifyValue(is_component_filtered)

				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: { v77 }`,
					name = p15.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else u58,
					value = v78
				}, p15.appPage)
			elseif v75 == PropResultCategory.PropSignal then
				t7.isComponentFilteredSignal = result
			elseif v75 == PropResultCategory.Literal then
				function t7.isComponentFilteredSignal() -- line: 343
					-- upvalues: result (copy)
					return {
						data = result
					}
				end
			end
		end

		return t7
	end
}

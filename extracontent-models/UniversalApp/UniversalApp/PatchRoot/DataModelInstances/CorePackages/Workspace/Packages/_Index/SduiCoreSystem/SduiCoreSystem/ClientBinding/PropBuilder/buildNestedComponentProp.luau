local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystemParent.ServiceContractsProto)

local Signals = require(SduiCoreSystemParent.Signals)

require(SduiCoreSystem.SduiBuilderTypes)

local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local buildConfigForComponent = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local buildInputsForNestedComponent = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local SduiPropUtils = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpers = require(SduiCoreSystem.SduiParseHelpers)

require(SduiCoreSystem.SduiComponentType)

local FFlagSduiLocalizedLiterals = require(SduiCoreSystemParent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiImprovedErrorDimensions

local function buildNestedComponentProp(p1, p2, p3, p4, p5, p6) -- line: 48
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), Signals (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), buildConfigForComponent (copy), PropResultCategory (copy), SduiPropUtils (copy), buildNestedComponentProp (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p5.currentComponentType
		currentParserName = p5.currentParserName
	end

	if p1 == "literal" then
		if p2.roblox_component == nil then
			error("Missing templateData.roblox_component")
		end

		local v22 = p5.getTemplateForRobloxComponent(p2.roblox_component)

		if v22 == nil then
			error(`Could not find template for roblox_component { p2.roblox_component }`)
		end

		local v23 = Signals.createComputed(function(p7) -- line: 73
			-- upvalues: buildInputsForNestedComponent (copy), p4 (copy), p2 (copy), p3 (copy), FFlagSduiLocalizedLiterals (copy), p5 (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
			local t1 = {}
			local ok, result = pcall(function() -- line: 75
				-- upvalues: buildInputsForNestedComponent (copy), p4 (copy), p2 (copy), p3 (copy), p7 (copy), t1 (copy), FFlagSduiLocalizedLiterals (copy), p5 (copy)
				buildInputsForNestedComponent(p4, p2.inputs, p3, p7, t1, if not FFlagSduiLocalizedLiterals then nil else p5)
			end)

			if not ok then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Failed to build inputs for nested component: { SduiParseHelpers.stringifyValue(result) }`,
					name = p5.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
					parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
				}, p5.appPage)
			end

			return t1
		end)

		return buildConfigForComponent(v22, v23, p5, p6), PropResultCategory.NestedComponentConfig
	end

	if p1 == "conditional" then
		return SduiPropUtils.generateConditionalPropValue(p2, p3, p5, p6, p4, buildNestedComponentProp, nil, true), PropResultCategory.PropSignal
	end

	error(`Could not build prop. Unknown propDefinitionType: { p1 }`)
end

return buildNestedComponentProp

local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystemParent.Signals)

local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local getSduiActionHandlerRegistry = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local getSduiServiceDependenciesStore = require(SduiCoreSystem.ClientBinding.getSduiServiceDependenciesStore)
local logActionTelemetry = require(SduiCoreSystem.Analytics.logActionTelemetry)
local reportUnifiedLoggingAction = require(SduiCoreSystem.Analytics.reportUnifiedLoggingAction)

require(SduiCoreSystem.SduiBuilderTypes)

local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local ProtoVariableMapper = require(SduiCoreSystem.ClientBinding.ProtoVariableMapper)
local SduiClientBindingBuilder = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder)
local buildPropTable = SduiClientBindingBuilder.buildPropTable

require(SduiCoreSystem.SduiActionType)

local SduiPropUtils = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)

require(SduiCoreSystem.SduiConfigTypes)
require(SduiCoreSystem.SduiComponentType)

local FFlagSduiActionsShouldTakeOverrides = require(SduiCoreSystemParent.SharedFlags).FFlagSduiActionsShouldTakeOverrides
local FFlagSduiChartsSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiActionTelemetryHandler = require(SduiCoreSystemParent.SharedFlags).FFlagSduiActionTelemetryHandler
local FFlagSduiImprovedErrorDimensions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiImprovedErrorDimensions

local function mergeTemplateParamsWithOverrides(t1: {[any]: any}?, p1) -- line: 42
	if typeof(p1) ~= "table" then
		return t1
	end

	local v22 = if not t1 then {} else table.clone(t1)

	for v23, v24 in p1 do
		v22[v23] = v24
	end

	return v22
end
local function buildActionProp(p2, p3, p4, p5, p6, p7) -- line: 56
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), ProtoVariableMapper (copy), getSduiActionHandlerRegistry (copy), getSduiServiceDependenciesStore (copy), FFlagSduiActionTelemetryHandler (copy), SduiClientBindingBuilder (copy), PropResultCategory (copy), buildPropTable (copy), FFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetry (copy), SduiLogger (copy), SduiErrors (copy), reportUnifiedLoggingAction (copy), FFlagSduiChartsSupport (copy), SduiPropUtils (copy), buildActionProp (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p6.currentComponentType
		currentParserName = p6.currentParserName
	end

	if p2 == "value" then
		local u33 = nil
		local ok, result = pcall(function() -- line: 73
			-- upvalues: p6 (copy), p3 (copy), u33 (ref), ProtoVariableMapper (copy), getSduiActionHandlerRegistry (copy), getSduiServiceDependenciesStore (copy), FFlagSduiActionTelemetryHandler (copy), SduiClientBindingBuilder (copy), p4 (copy), p5 (copy), p7 (copy), PropResultCategory (copy), buildPropTable (copy), FFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetry (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), reportUnifiedLoggingAction (copy), FFlagSduiChartsSupport (copy)
			local appPage = p6.appPage
			local v37 = typeof(p3) == "table" and (not not p3.kind and p3.kind.value) or nil

			u33 = if not v37 or not v37.action_type then nil else ProtoVariableMapper.mapActionTypeToLua(v37.action_type)

			if not u33 then
				error(`Could not map actionType: { v37 and v37.action_type }`)
			end

			local v38 = getSduiActionHandlerRegistry().getActionHandlerConfig(u33)

			if not v38 then
				error(`Could not find action for actionType: { u33 }`)
			end

			return function(_, p9, p10) -- line: 96
				-- upvalues: getSduiServiceDependenciesStore (copy), appPage (copy), FFlagSduiActionTelemetryHandler (copy), p3 (copy), SduiClientBindingBuilder (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), PropResultCategory (copy), v37 (copy), u33 (ref), buildPropTable (copy), FFlagSduiActionsShouldTakeOverrides (copy), mergeTemplateParamsWithOverrides (copy), logActionTelemetry (copy), v38 (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), reportUnifiedLoggingAction (copy), FFlagSduiChartsSupport (copy)
				local t2 = {
					dependencies = getSduiServiceDependenciesStore().getDependencies(appPage),
					appPage = appPage
				}
				local v46 = nil

				if FFlagSduiActionTelemetryHandler and (p3 and p3.telemetry_handler) then
					local telemetry_handler = p3.telemetry_handler

					if telemetry_handler.kind and telemetry_handler.kind.type then
						local v48, v49 = SduiClientBindingBuilder.buildProp(telemetry_handler, p4, p5, p6, p7)

						v46 = if v49 ~= PropResultCategory.PropSignal then v48 else v48(false).data
					end
				end

				local v50 = v37 and v37.action_params
				local t3 = {
					actionType = u33,
					telemetryHandler = v46
				}
				local v52 = nil

				if v50 and next(v50) then
					local v53, v54 = buildPropTable(v50, p4, p5, p6, p7, nil)

					if v54 then
						for v55, v56 in v54 do
							v53[v55] = v56(false).data
						end
					end

					if FFlagSduiActionsShouldTakeOverrides then
						v52 = v53
					else
						t3.actionParams = v53
					end
				end

				if FFlagSduiActionsShouldTakeOverrides then
					t3.actionParams = mergeTemplateParamsWithOverrides(v52, p10)
				end

				if FFlagSduiActionTelemetryHandler then
					logActionTelemetry(v46, v38, t3, p7, t2)
				elseif not v38.firesOwnTelemetry then
					if p7 == nil then
						SduiLogger.reportError(SduiErrors.SduiErrorType.NilAnalyticsContext, {
							message = `Could not reportUnifiedLoggingAction. Missing analyticsContext { u33 }`,
							name = u33,
							componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
							parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
						}, appPage)
					else
						reportUnifiedLoggingAction(t2, t3, p7)
					end
				end

				if v38.handler then
					if FFlagSduiChartsSupport then
						return v38.handler(t3, p7, t2, p9)
					end

					v38.handler(t3, p7, t2, p9)
				end
			end
		end)

		if ok then
			return result, PropResultCategory.Literal
		end

		return function(_, _, _) -- line: 194
			-- upvalues: SduiLogger (copy), SduiErrors (copy), u33 (ref), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
			SduiLogger.reportCounter(SduiErrors.SduiCounterName.ExecutedInvalidAction, {
				name = u33,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = not FFlagSduiImprovedErrorDimensions and "buildActionProp" or currentParserName
			})
		end, PropResultCategory.Failed, result
	end

	if p2 == "conditional" then
		return SduiPropUtils.generateConditionalPropValue(p3, p4, p6, p7, p5, buildActionProp), PropResultCategory.PropSignal
	end

	error(`Could not build prop. Unknown propDefinitionType: { p2 }`)
end

return buildActionProp

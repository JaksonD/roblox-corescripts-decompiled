local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent
local DataHydration = require(SduiCoreSystemParent.DataHydration)
local Signals = require(SduiCoreSystemParent.Signals)
local Cryo = require(SduiCoreSystemParent.Cryo)
local tutils = require(SduiCoreSystemParent.tutils)
local SduiDataBinder = require(SduiCoreSystem.ClientBinding.SduiDataBinder)
local tryGetPathFromData = require(SduiCoreSystem.ClientBinding.tryGetPathFromData)
local buildDataBindingSourcesForTemplate = require(SduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local SduiClientBindingTypes = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)

require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)

local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiLogger = require(SduiCoreSystem.SduiLogger)

require(SduiCoreSystem.SduiBuilderTypes)

local getSduiTokensStore = require(SduiCoreSystem.ClientBinding.getSduiTokensStore)
local SduiParseHelpers = require(SduiCoreSystem.SduiParseHelpers)
local SduiParsers = require(SduiCoreSystem.SduiParsers)

require(SduiCoreSystem.SduiComponentType)

local PropResultCategory = SduiClientBindingTypes.PropResultCategory
local applyFormatArgFormatter = require(SduiCoreSystem.ClientBinding.PropBuilder.applyFormatArgFormatter).applyFormatArgFormatter
local DataStatus = DataHydration.DataHydrationTypes.DataStatus
local FFlagSduiCoreBadgeDetailsSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiCoreBadgeDetailsSupport
local FFlagSduiLocalizedLiterals = require(SduiCoreSystemParent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiFormatArgFormatters = require(SduiCoreSystemParent.SharedFlags).FFlagSduiFormatArgFormatters
local FFlagSduiIsEmptyConditions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiIsEmptyConditions
local v24 = table.freeze({
	status = DataStatus.Failed
})

local function resolveHydrationBinding(t1: {[any]: any}, p1, p2, b1: boolean?) -- line: 74
	-- upvalues: SduiDataBinder (copy)
	local v37 = table.concat(t1, ".")
	local v38 = t1[1]
	local v39 = p1 and p1[v38]

	if v39 == nil then
		error(`Could not find data bindingSource for key { v38 }, bindingPath: { v37 }`)
	end

	local contentType = v39.contentType
	local id = v39.id

	if #t1 < 2 then
		error(`Unsupported path for contentType { contentType }, bindingPath: { v37 }`)
	end

	local v42, v43 = SduiDataBinder.getFieldValue(contentType, t1, id, p2, b1)

	return v42, v43
end
local function resolveBindingPathValue(p3, t2: {[any]: any}, p4, p5, p6: ((...any) -> ...any)?, b2: boolean?) -- line: 118
	-- upvalues: tryGetPathFromData (copy), FFlagSduiCoreBadgeDetailsSupport (copy), SduiDataBinder (copy), resolveHydrationBinding (copy), SduiParseHelpers (copy)
	local v50, v51 = tryGetPathFromData(p5(p3), t2)

	if v50 and v51 ~= nil then
		if p6 then
			return p6(v51, p3)
		end

		return v51
	end

	if FFlagSduiCoreBadgeDetailsSupport then
		local v52 = t2 and t2[1]

		if SduiDataBinder.isClientContentType(v52) then
			local v53 = SduiDataBinder.getFieldValueForClientContentType(v52, t2, p3)

			if p6 and v53 ~= nil then
				return p6(v53, p3)
			end

			return v53
		end
	end

	local v54 = p4(p3)
	local u55, v56 = resolveHydrationBinding(t2, v54, p3, b2)

	if p6 and u55 ~= nil then
		local ok, result = pcall(function() -- line: 155
			-- upvalues: p6 (copy), u55 (ref), p3 (copy)
			return p6(u55, p3)
		end)

		if not ok then
			local v59 = SduiParseHelpers.stringifyValue(result)
			local v60 = table.concat(t2, ".")

			error(`Parser failed for bindingPath: { v60 }. err{ v59 }`)
		end

		u55 = result
	end

	return u55, v56
end
local function generateDynamicBindingPropValue(s1: string, p7, p8, p9, p10: ((...any) -> ...any)?, b3: boolean?) -- line: 200
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), Signals (copy), resolveBindingPathValue (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), v24 (copy), tutils (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p8.currentComponentType
		currentParserName = p8.currentParserName
	end

	local parts = string.split(s1, ".")

	if not parts or #parts == 0 then
		error(`Invalid bindingPath: { s1 }`)
	end

	return Signals.createComputed(function(p11) -- line: 220
		-- upvalues: resolveBindingPathValue (copy), parts (copy), p7 (copy), p9 (copy), p10 (copy), b3 (copy), SduiLogger (copy), SduiErrors (copy), s1 (copy), SduiParseHelpers (copy), p8 (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), v24 (copy)
		local ok, result, v237 = pcall(function() -- line: 221
			-- upvalues: resolveBindingPathValue (copy), p11 (copy), parts (copy), p7 (copy), p9 (copy), p10 (copy), b3 (copy)
			local v272, v273 = resolveBindingPathValue(p11, parts, p7, p9, p10, b3)

			return v272, v273
		end)

		if ok then
			return {
				data = result,
				status = v237
			}
		end

		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToComputeDynamicBinding, {
			value = s1,
			message = SduiParseHelpers.stringifyValue(result),
			name = p8.debugName,
			componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
			parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
		}, p8.appPage)

		return v24
	end, tutils.shallowEqual)
end
local function validateNumbers(p12, p13, p14) -- line: 438
	if typeof(p13) ~= "number" then
		p13 = tonumber(p13)
	end

	if typeof(p14) ~= "number" then
		p14 = tonumber(p14)
	end

	if typeof(p13) ~= "number" or typeof(p14) ~= "number" then
		error(`{ p12 } without numbers, { p13 }: { typeof(p13) }, { p14 }: { typeof(p14) }`)
	end

	return p13, p14
end
local function isSame(p15, p16) -- line: 482
	-- upvalues: SduiParsers (copy)
	if p15 == p16 then
		return true
	end

	if p15 == nil then
		return false
	end

	local v102 = typeof(p16)

	if v102 ~= typeof(p15) then
		if v102 == "string" then
			p15 = tostring(p15)
		elseif v102 == "number" then
			p15 = tonumber(p15)
		elseif v102 == "boolean" then
			p15 = SduiParsers.parseBooleanProp_(p15, nil, nil)
		end
	end

	return p15 == p16
end
local function evaluateCondition(p17, t3: {[any]: any}, p18, p19, p20) -- line: 526
	-- upvalues: resolveBindingPathValue (copy), DataStatus (copy), validateNumbers (copy), isSame (copy), FFlagSduiIsEmptyConditions (copy), evaluateCondition (copy)
	if t3 == nil then
		return true
	end

	local v108 = t3 and (t3.kind and t3.kind.type)
	local v109 = t3 and (t3.kind and t3.kind.value)

	if v108 == nil then
		error("nil conditionType in condition")
	end

	if v109 == nil then
		error("nil conditionValue in condition")
	end

	if v108 == "comparison" then
		local field = v109.field
		local parts = string.split(field, ".")
		local ok, result, v114 = pcall(function() -- line: 550
			-- upvalues: resolveBindingPathValue (copy), p17 (copy), parts (copy), p18 (copy), p20 (copy)
			return resolveBindingPathValue(p17, parts, p18, p20, nil, true)
		end)

		if ok then
		else
			result = nil
		end

		if result == nil or v114 and v114 ~= DataStatus.Ready then
			return nil, v114
		end

		local value = v109.kind.value
		local op = v109.op

		if op == "OP_LT" then
			local v117, v118 = validateNumbers(op, result, value)

			return v117 < v118
		end

		if op == "OP_LTE" then
			local v119, v120 = validateNumbers(op, result, value)

			return v119 <= v120
		end

		if op == "OP_GT" then
			local v121, v122 = validateNumbers(op, result, value)

			return v122 < v121
		end

		if op == "OP_GTE" then
			local v123, v124 = validateNumbers(op, result, value)

			return v124 <= v123
		end

		if op == "OP_E" then
			return (isSame(result, value))
		end

		if op == "OP_NE" then
			return not isSame(result, value)
		end

		error(`Unknown operator for comparison { op }`)
	else
		if v108 == "is_null" then
			local field = v109.field
			local parts = string.split(field, ".")
			local ok, result, v129 = pcall(function() -- line: 550
				-- upvalues: resolveBindingPathValue (copy), p17 (copy), parts (copy), p18 (copy), p20 (copy)
				return resolveBindingPathValue(p17, parts, p18, p20, nil, true)
			end)

			if ok then
			else
				result = nil
			end

			if v129 and v129 ~= DataStatus.Ready then
				return nil, v129
			end

			return result == nil
		end

		if v108 == "is_not_null" then
			local field = v109.field
			local parts = string.split(field, ".")
			local ok, result, v134 = pcall(function() -- line: 550
				-- upvalues: resolveBindingPathValue (copy), p17 (copy), parts (copy), p18 (copy), p20 (copy)
				return resolveBindingPathValue(p17, parts, p18, p20, nil, true)
			end)

			if ok then
			else
				result = nil
			end

			if v134 and v134 ~= DataStatus.Ready then
				return nil, v134
			end

			return result ~= nil
		end

		if FFlagSduiIsEmptyConditions and v108 == "is_empty" then
			local field = v109.field
			local parts = string.split(field, ".")
			local ok, result, v139 = pcall(function() -- line: 550
				-- upvalues: resolveBindingPathValue (copy), p17 (copy), parts (copy), p18 (copy), p20 (copy)
				return resolveBindingPathValue(p17, parts, p18, p20, nil, true)
			end)

			if ok then
			else
				result = nil
			end

			if v139 and v139 ~= DataStatus.Ready then
				return nil, v139
			end

			if result == nil then
				return true
			end

			if type(result) == "string" then
				return result == ""
			end

			if type(result) == "table" then
				return next(result) == nil
			end

			return false
		end

		if FFlagSduiIsEmptyConditions and v108 == "is_not_empty" then
			local field = v109.field
			local parts = string.split(field, ".")
			local ok, result, v144 = pcall(function() -- line: 550
				-- upvalues: resolveBindingPathValue (copy), p17 (copy), parts (copy), p18 (copy), p20 (copy)
				return resolveBindingPathValue(p17, parts, p18, p20, nil, true)
			end)

			if ok then
			else
				result = nil
			end

			if v144 and v144 ~= DataStatus.Ready then
				return nil, v144
			end

			return not (result == nil or if type(result) ~= "string" then type(result) == "table" and next(result) == nil else result == "")
		end

		if v108 == "and_condition" then
			for _, v146 in v109.conditions do
				local v147, v148 = evaluateCondition(p17, v146, p18, p19, p20)

				if v148 and v148 ~= DataStatus.Ready then
					return v147, v148
				end

				if not v147 then
					return v147
				end
			end

			return true
		end

		if v108 == "or_condition" then
			for _, v150 in v109.conditions do
				local v151, v152 = evaluateCondition(p17, v150, p18, p19, p20)

				if v152 and v152 ~= DataStatus.Ready then
					return v151, v152
				end

				if v151 or v151 == nil then
					return v151, v152
				end
			end

			return false
		end
	end

	return nil
end
local function selectConditionalOption(p21, t4: {[any]: any}, p22, p23, p24) -- line: 663
	-- upvalues: evaluateCondition (copy), DataStatus (copy)
	for _, v159 in t4 do
		local v160, v161 = evaluateCondition(p21, v159.condition, p22, p23, p24)

		if v160 then
			return v159, v161
		end

		if v161 and v161 ~= DataStatus.Ready then
			return v160, v161
		end
	end

	return nil
end
local function resolveTablePropValue(p25, t5: {[any]: any}, t6: {[any]: any}?, t7: {[any]: any}?, _, _, _, _, _: ((...any) -> ...any)?) -- line: 768
	-- upvalues: Cryo (copy), DataStatus (copy)
	local v182 = Cryo.Dictionary.join(t7 or {}, t5 or {})
	local v183 = nil

	if t6 then
		for v184, v185 in t6 do
			v182[v184] = v185(p25).data

			local status = v185(p25).status

			if status and status ~= DataStatus.Ready then
				v183 = status
			end
		end
	end

	return v182, v183
end

return {
	generateStaticPropValue = function(p31, p32: ((...any) -> ...any)?) --[[ generateStaticPropValue ]] -- line: 176
		if p32 then
			return p32(p31)
		end

		return p31
	end,
	generateDynamicBindingPropValue = generateDynamicBindingPropValue,
	generateTokenBindingPropValue = function(s2: string, p33, _: ((...any) -> ...any)?) --[[ generateTokenBindingPropValue ]] -- line: 259
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), Signals (copy), getSduiTokensStore (copy), tryGetPathFromData (copy), SduiLogger (copy), SduiErrors (copy), v24 (copy), DataStatus (copy), tutils (copy)
		local currentComponentType = nil
		local currentParserName = nil

		if FFlagSduiImprovedErrorDimensions then
			currentComponentType = p33.currentComponentType
			currentParserName = p33.currentParserName
		end

		local parts = string.split(s2, ".")

		return Signals.createComputed(function(p35) -- line: 273
			-- upvalues: getSduiTokensStore (copy), p33 (copy), tryGetPathFromData (copy), parts (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), v24 (copy), DataStatus (copy)
			local v239 = getSduiTokensStore().getTokens(p35, p33.appPage)
			local v240, v241 = tryGetPathFromData(v239, parts)

			if not v240 then
				local v242 = table.concat(parts, ".")

				SduiLogger.reportError(SduiErrors.SduiErrorType.TokenBindingFailed, {
					message = `Could not find token with tokenPath { v242 }`,
					name = p33.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
					parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
				}, p33.appPage)

				return v24
			end

			return {
				data = v241,
				status = DataStatus.Ready
			}
		end, tutils.shallowEqual)
	end,
	generateFormatStringPropValue = function(t8: {[any]: any}, p36, p37, p38, p39: ((...any) -> ...any)?) --[[ generateFormatStringPropValue ]] -- line: 316
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiLocalizedLiterals (copy), FFlagSduiFormatArgFormatters (copy), applyFormatArgFormatter (copy), v24 (copy), generateDynamicBindingPropValue (copy), Signals (copy), SduiLogger (copy), SduiErrors (copy), tutils (copy)
		local currentComponentType = nil
		local currentParserName = nil

		if FFlagSduiImprovedErrorDimensions then
			currentComponentType = p37.currentComponentType
			currentParserName = p37.currentParserName
		end

		if typeof(t8) ~= "table" then
			error(`Unexpected type for stringFormat { typeof(t8) }`)
		end

		local str = t8.str

		if FFlagSduiLocalizedLiterals and ((not str or str == "") and t8.translation) then
			str = p37.resolveLocalizedLiteral(t8.translation)
		end

		if not str or str == "" then
			error("No format string for prop")
		end

		if not t8.args then
			error(`No args found for format. If no args needed, use literal. { str }`)
		end

		local t9 = {}
		local t10 = {}

		for v88, v89 in t8.args do
			local type2 = v89.kind.type
			local value = v89.kind.value

			if type2 ~= "literal" then
				if type2 == "binding_path" then
					t9[v88] = generateDynamicBindingPropValue(value, p36, p37, p38)

					if FFlagSduiFormatArgFormatters and v89.formatter then
						t10[v88] = v89.formatter
					end
				else
					warn(`Unrecognized argType in buildFormatString { type2 }`)
				end

				continue
			end

			if FFlagSduiFormatArgFormatters and v89.formatter then
				local v92 = applyFormatArgFormatter(value, v89.formatter, p37.appPage)

				if v92 == nil then
					return function() -- line: 364
						-- upvalues: v24 (copy)
						return v24
					end
				end

				local v93 = "{" .. v88 .. "}"

				str = str:gsub(v93, v92)

				continue
			end

			local v94 = "{" .. v88 .. "}"
			local str2 = tostring(value)

			str = str:gsub(v94, str2)
		end

		return Signals.createComputed(function(p40) -- line: 382
			-- upvalues: str (ref), t9 (copy), FFlagSduiFormatArgFormatters (copy), t10 (copy), applyFormatArgFormatter (copy), p37 (copy), v24 (copy), p39 (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
			local u244 = str

			for v245, v246 in t9 do
				local v247 = v246(p40)
				local data = v247.data
				local status = v247.status

				if data == nil then
					return {
						status = status
					}
				end

				local v250 = if not FFlagSduiFormatArgFormatters or not t10 then nil else t10[v245]

				if not v250 then
					local v251 = u244

					if v251 then
						local v252 = "{" .. v245 .. "}"
						local str3 = tostring(data)

						v251 = u244:gsub(v252, str3)
					end

					u244 = v251

					continue
				end

				local v254 = applyFormatArgFormatter(data, v250, p37.appPage)

				if v254 == nil then
					return v24
				end

				local v255 = u244

				if v255 then
					local v256 = "{" .. v245 .. "}"

					v255 = u244:gsub(v256, v254)
				end

				u244 = v255
			end

			if p39 then
				local ok, result = pcall(function() -- line: 409
					-- upvalues: p39 (copy), u244 (ref)
					return p39(u244)
				end)

				if not ok then
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
						value = u244,
						message = `Parser in formatString for str { str }`,
						name = p37.debugName,
						componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
						parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
					}, p37.appPage)

					return v24
				end

				return {
					data = result
				}
			end

			return {
				data = u244
			}
		end, tutils.shallowEqual)
	end,
	generateConditionalPropValue = function(t11: {[any]: any}, p41, p42, p43, p44, p45: ((...any) -> ...any), p46: ((...any) -> ...any)?, b4: boolean?) --[[ generateConditionalPropValue ]] -- line: 699
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), Signals (copy), selectConditionalOption (copy), PropResultCategory (copy), DataStatus (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), v24 (copy), tutils (copy)
		local currentComponentType = nil
		local currentParserName = nil

		if FFlagSduiImprovedErrorDimensions then
			currentComponentType = p42.currentComponentType
			currentParserName = p42.currentParserName
		end

		local options = t11.options

		return Signals.createComputed(function(p47) -- line: 718
			-- upvalues: selectConditionalOption (copy), options (copy), p41 (copy), p42 (copy), p44 (copy), p45 (copy), p43 (copy), p46 (copy), PropResultCategory (copy), DataStatus (copy), b4 (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), v24 (copy)
			local ok, result, v267 = pcall(function() -- line: 719
				-- upvalues: selectConditionalOption (copy), p47 (copy), options (copy), p41 (copy), p42 (copy), p44 (copy), p45 (copy), p43 (copy), p46 (copy), PropResultCategory (copy), DataStatus (copy)
				local v274, v275 = selectConditionalOption(p47, options, p41, p42, p44)

				if v274 == nil then
					return nil, v275
				end

				local v276 = v274 and (v274.kind and v274.kind.type)
				local v277 = v274 and (v274.kind and v274.kind.value)
				local v278, v279 = p45(v276, v277, p41, p44, p42, p43, p46)

				if v279 == PropResultCategory.PropSignal then
					local v280 = v278(p47)

					v278 = v280.data

					if v280.status and v280.status ~= DataStatus.Ready then
						v275 = v280.status
					end
				end

				return v278, v275
			end)

			if ok then
				return {
					data = result,
					status = v267,
					isNestedComponentConfig = b4
				}
			end

			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToEvaluateConditionalProp, {
				message = SduiParseHelpers.stringifyValue(result),
				name = p42.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
			}, p42.appPage)

			return v24
		end, tutils.shallowEqual)
	end,
	generateTablePropSignalValue = function(t12: {[any]: any}, p48, p49, p50, p51, p52: ((...any) -> ...any), _: ((...any) -> ...any)?) --[[ generateTablePropSignalValue ]] -- line: 796
		-- upvalues: FFlagSduiImprovedErrorDimensions (copy), Signals (copy), resolveTablePropValue (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), v24 (copy), tutils (copy)
		local currentComponentType = nil
		local currentParserName = nil

		if FFlagSduiImprovedErrorDimensions then
			currentComponentType = p49.currentComponentType
			currentParserName = p49.currentParserName
		end

		local v196, v197, v198 = p52(t12, p48, p51, p49, p50)

		return Signals.createComputed(function(p54) -- line: 819
			-- upvalues: resolveTablePropValue (copy), v196 (copy), v197 (copy), v198 (copy), p48 (copy), p49 (copy), p50 (copy), p51 (copy), p52 (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), v24 (copy)
			local ok, result, v271 = pcall(function() -- line: 820
				-- upvalues: resolveTablePropValue (copy), p54 (copy), v196 (copy), v197 (copy), v198 (copy), p48 (copy), p49 (copy), p50 (copy), p51 (copy), p52 (copy)
				local v281, v282 = resolveTablePropValue(p54, v196, v197, v198, p48, p49, p50, p51, p52)

				return v281, v282
			end)

			if ok then
				return {
					data = result,
					status = v271
				}
			end

			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = SduiParseHelpers.stringifyValue(result),
				name = p49.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
			}, p49.appPage)

			return v24
		end, tutils.shallowEqual)
	end,
	selectConditionalOption = selectConditionalOption,
	evaluateCondition = evaluateCondition,
	resolveHydrationBinding = resolveHydrationBinding,
	resolveBindingPathValue = resolveBindingPathValue,
	resolveTablePropValue = resolveTablePropValue,
	resolveSourceArray = function(s3: string?, p55, p56, p57, p58) --[[ resolveSourceArray ]] -- line: 863
		-- upvalues: resolveBindingPathValue (copy)
		if s3 == "binding_path" then
			local parts = string.split(p55, ".")

			return resolveBindingPathValue(p56, parts, p57, p58)
		end

		if s3 == "literal" then
			return p55 and p55.items
		end

		return nil
	end,
	resolveFieldMap = function(t13: {[any]: any}, p59, p60, p61, p62, p63, p64: ((...any) -> ...any)) --[[ resolveFieldMap ]] -- line: 895
		-- upvalues: resolveTablePropValue (copy)
		local v212, v213 = p64(t13, p59, p60, p61, p62)

		return resolveTablePropValue(p63, v212, v213, nil, p59, p61, p62, p60, nil)
	end,
	mapArrayWithFieldMap = function(t14: {[any]: any}, t15: {[any]: any}, t16: {[any]: any}, p65, p66, p67, p68: ((...any) -> ...any)) --[[ mapArrayWithFieldMap ]] -- line: 935
		-- upvalues: buildDataBindingSourcesForTemplate (copy), resolveTablePropValue (copy)
		local t17 = {}

		for _, v223 in t14 do
			local v224 = buildDataBindingSourcesForTemplate(v223, t15)

			local function v225() -- line: 947
				-- upvalues: v224 (copy)
				return v224
			end
			local function v226() -- line: 950
				-- upvalues: v223 (copy)
				return v223
			end

			local v227, v228 = p68(t16, v225, v226, p65, p66)

			table.insert(t17, (resolveTablePropValue(p67, v227, v228, nil, v225, p65, p66, v226, nil)))
		end

		return t17
	end,
	isComponentVisible = function(p69, p70) --[[ isComponentVisible ]] -- line: 967
		if p69.isComponentFilteredSignal == nil then
			return true
		end

		return p69.isComponentFilteredSignal(p70).data ~= true
	end,
	resolveTemplate = function(s4: string?, p71) --[[ resolveTemplate ]] -- line: 974
		if s4 == nil then
			error("Missing roblox_component")
		end

		local v233 = p71.getTemplateForRobloxComponent(s4)

		if v233 == nil then
			error(`Could not find template for roblox_component { s4 }`)
		end

		return v233
	end
}

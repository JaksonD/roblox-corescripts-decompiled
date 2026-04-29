local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local SduiCoreSystemParent = SduiCoreSystem.Parent

require(SduiCoreSystemParent.ServiceContractsProto)

local Signals = require(SduiCoreSystemParent.Signals)
local buildInputsForNestedComponent = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)

require(SduiCoreSystem.SduiBuilderTypes)

local SduiClientBindingTypes = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local buildConfigForComponent = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent

require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)

local PropResultCategory = SduiClientBindingTypes.PropResultCategory
local SduiPropUtils = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLogger = require(SduiCoreSystem.SduiLogger)
local SduiErrors = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpers = require(SduiCoreSystem.SduiParseHelpers)

require(SduiCoreSystem.SduiComponentType)

local FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport
local FFlagSduiOrderedTemplateDataSupport = require(SduiCoreSystemParent.SharedFlags).FFlagSduiOrderedTemplateDataSupport
local FFlagSduiLocalizedLiterals = require(SduiCoreSystemParent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(SduiCoreSystemParent.SharedFlags).FFlagSduiImprovedErrorDimensions

local function buildItemList(p1, t1: {[any]: any}, t2: {[any]: any}?, p2, p3, p4, t3: {[any]: any}?, p5, p6) -- line: 38
	-- upvalues: FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport (copy), FFlagSduiOrderedTemplateDataSupport (copy), SduiPropUtils (copy), Signals (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy), buildConfigForComponent (copy)
	local t4 = {}

	for v29, v30 in t1 do
		local v31 = if not FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport or (not v30 or not v30.roblox_component) then p1 else p3.getTemplateForRobloxComponent(v30.roblox_component) or p1

		if t3 and t3[v29] then
			local v32 = t3[v29]

			if FFlagSduiOrderedTemplateDataSupport then
				if SduiPropUtils.isComponentVisible(v32, p6) then
					table.insert(t4, v32)
				end
			elseif v32.isComponentFilteredSignal == nil or not v32.isComponentFilteredSignal(p6).data then
				table.insert(t4, v32)
			end
		else
			local v33 = Signals.createComputed(function(p7) -- line: 73
				-- upvalues: t2 (copy), v30 (copy), buildInputsForNestedComponent (copy), p2 (copy), p5 (copy), FFlagSduiLocalizedLiterals (copy), p3 (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), FFlagSduiImprovedErrorDimensions (copy)
				local u60

				if t2 then
					u60 = table.clone(v30)

					local ok, result = pcall(function() -- line: 77
						-- upvalues: buildInputsForNestedComponent (copy), p2 (copy), t2 (copy), p5 (copy), p7 (copy), u60 (ref), FFlagSduiLocalizedLiterals (copy), p3 (copy)
						buildInputsForNestedComponent(p2, t2, p5, p7, u60, if not FFlagSduiLocalizedLiterals then nil else p3)
					end)

					if not ok then
						SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
							message = `Failed to build inputs for nested component in list: { SduiParseHelpers.stringifyValue(result) }`,
							name = p3.debugName,
							componentType = if not FFlagSduiImprovedErrorDimensions then nil else p3.currentComponentType,
							parserName = if not FFlagSduiImprovedErrorDimensions then nil else p3.currentParserName
						}, p3.appPage)
					end
				else
					u60 = v30
				end

				return u60
			end)
			local v34 = buildConfigForComponent(v31, v33, p3, p4)

			if v34 then
				if FFlagSduiOrderedTemplateDataSupport then
					if SduiPropUtils.isComponentVisible(v34, p6) then
						table.insert(t4, v34)
					end
				elseif v34.isComponentFilteredSignal == nil or not v34.isComponentFilteredSignal(p6).data then
					table.insert(t4, v34)
				end
			end
		end
	end

	return t4
end
local function buildOrderedTemplateDataList(p8, p9, p10, p11, p12) -- line: 127
	-- upvalues: Signals (copy), SduiPropUtils (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), buildConfigForComponent (copy), SduiParseHelpers (copy), PropResultCategory (copy)
	local entry_map_path = p8.entry_map_path
	local entry_order = p8.entry_order
	local template_data_map = p8.template_data_map

	if entry_order == nil then
		error("Missing entry_order in ordered_template_data")
	end

	if template_data_map == nil or typeof(template_data_map) ~= "table" then
		error("Missing or invalid template_data_map in ordered_template_data")
	end

	local v43 = if not entry_map_path or entry_map_path == "" then nil else string.split(entry_map_path, ".")
	local v44 = if not entry_order then nil else entry_order.kind
	local v45 = if not v44 or v44.type ~= "binding_path" then nil else string.split(v44.value, ".")

	return Signals.createComputed(function(p13) -- line: 152
		-- upvalues: v45 (copy), SduiPropUtils (copy), p9 (copy), p10 (copy), v44 (copy), v43 (copy), template_data_map (copy), SduiLogger (copy), SduiErrors (copy), p11 (copy), FFlagSduiImprovedErrorDimensions (copy), Signals (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), buildConfigForComponent (copy), p12 (copy), SduiParseHelpers (copy)
		local ok, result = pcall(function() -- line: 153
			-- upvalues: v45 (copy), SduiPropUtils (copy), p13 (copy), p9 (copy), p10 (copy), v44 (copy), v43 (copy), template_data_map (copy), SduiLogger (copy), SduiErrors (copy), p11 (copy), FFlagSduiImprovedErrorDimensions (copy), Signals (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), buildConfigForComponent (copy), p12 (copy), SduiParseHelpers (copy)
			local v73 = nil

			if v45 then
				v73 = SduiPropUtils.resolveBindingPathValue(p13, v45, p9, p10)
			elseif v44 and v44.type == "literal" then
				v73 = v44.value and v44.value.items
			end

			if v73 == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end

			local v74 = if not v43 then nil else SduiPropUtils.resolveBindingPathValue(p13, v43, p9, p10)
			local t5 = {}

			for _, v77 in v73 do
				local v78 = if typeof(v77) ~= "table" then v77 else v77.identifier

				if v78 ~= nil and v78 ~= "" then
					local v79 = template_data_map[v78]
					local v80 = if not v74 then nil else v74[v78]
					local v81 = if not v80 or (not v80.roblox_component or v80.roblox_component == "") then if not v79 or not v79.roblox_component then nil else v79.roblox_component else v80.roblox_component

					if v81 == nil then
						SduiLogger.reportError(SduiErrors.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = `No roblox_component for identifier "{ v78 }" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p11.debugName,
							componentType = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentComponentType,
							parserName = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentParserName
						}, p11.appPage)
					else
						local ok, result = pcall(function() -- line: 200
							-- upvalues: SduiPropUtils (copy), v81 (copy), p11 (copy), v79 (copy), Signals (copy), buildInputsForNestedComponent (copy), p10 (copy), p9 (copy), FFlagSduiLocalizedLiterals (copy), v80 (copy), buildConfigForComponent (copy), p12 (copy)
							local v92 = SduiPropUtils.resolveTemplate(v81, p11)
							local v93 = if not v79 then nil else v79.inputs
							local v94 = Signals.createComputed(function(p14) -- line: 204
								-- upvalues: v93 (copy), buildInputsForNestedComponent (copy), p10 (copy), p9 (copy), FFlagSduiLocalizedLiterals (copy), p11 (copy), v80 (copy)
								local t6 = {}

								if v93 then
									buildInputsForNestedComponent(p10, v93, p9, p14, t6, if not FFlagSduiLocalizedLiterals then nil else p11)
								end

								if v80 then
									local v102 = if not v80.input_data or (not v80.input_data.kind or not v80.input_data.kind.value) then nil else v80.input_data.kind.value

									if typeof(v102) == "table" then
										for v103, v104 in v102 do
											t6[v103] = v104
										end
									end
								end

								return t6
							end)

							return buildConfigForComponent(v92, v94, p11, p12)
						end)

						if not ok then
							local v84 = SduiParseHelpers.stringifyValue(result)

							SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier { v78 }: { v84 }`,
								name = p11.debugName,
								componentType = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentComponentType,
								parserName = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentParserName
							}, p11.appPage)
						elseif result and SduiPropUtils.isComponentVisible(result, p13) then
							table.insert(t5, result)
						end
					end
				end
			end

			return t5
		end)

		if not ok then
			local v66 = SduiParseHelpers.stringifyValue(result)

			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
				message = `Failed to build ordered_template_data component list: { v66 }`,
				name = p11.debugName,
				componentType = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentComponentType,
				parserName = if not FFlagSduiImprovedErrorDimensions then nil else p11.currentParserName
			}, p11.appPage)

			return {
				data = {}
			}
		end

		return {
			data = result
		}
	end), PropResultCategory.PropSignal
end
local function buildLazyNestedComponentListProp(p15, p16, p17, p18, p19, p20) -- line: 304
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiOrderedTemplateDataSupport (copy), SduiPropUtils (copy), buildItemList (copy), PropResultCategory (copy), Signals (copy), buildInputsForNestedComponent (copy), FFlagSduiLocalizedLiterals (copy), SduiParseHelpers (copy), SduiLogger (copy), SduiErrors (copy), buildConfigForComponent (copy), buildOrderedTemplateDataList (copy), buildLazyNestedComponentListProp (copy)
	local currentComponentType = nil
	local currentParserName = nil

	if FFlagSduiImprovedErrorDimensions then
		currentComponentType = p19.currentComponentType
		currentParserName = p19.currentParserName
	end

	if p15 == "array_map" then
		local u54

		if FFlagSduiOrderedTemplateDataSupport then
			u54 = SduiPropUtils.resolveTemplate(p16.roblox_component, p19)
		else
			if p16.roblox_component == nil then
				error("Missing templateData.roblox_component")
			end

			local v55 = p19.getTemplateForRobloxComponent(p16.roblox_component)

			if v55 == nil then
				error(`Could not find template for roblox_component { p16.roblox_component }`)
			end

			u54 = v55
		end

		local binding_path = p16.binding_path

		if binding_path == nil or binding_path == "" then
			error(`No bindingPath specified for roblox_component { p16.roblox_component }`)
		end

		local u57 = nil

		return SduiPropUtils.generateDynamicBindingPropValue(binding_path, p17, p19, p18, function(p21, p22) -- line: 349
			-- upvalues: u57 (ref), buildItemList (copy), u54 (ref), p16 (copy), p18 (copy), p19 (copy), p20 (copy), p17 (copy)
			u57 = buildItemList(u54, p21, p16.inputs, p18, p19, p20, u57, p17, p22)

			return u57
		end), PropResultCategory.PropSignal
	end

	if p15 == "item_list" then
		if typeof(p16) ~= "table" then
			error(`Missing or invalid templateDataList { typeof(p16) }`)
		end

		local items = p16.items

		if typeof(items) ~= "table" then
			error(`Missing or invalid templateDataList.items { typeof(p16) }`)
		end

		return Signals.createComputed(function(p23) -- line: 378
			-- upvalues: items (copy), FFlagSduiOrderedTemplateDataSupport (copy), SduiPropUtils (copy), p19 (copy), Signals (copy), buildInputsForNestedComponent (copy), p18 (copy), p17 (copy), FFlagSduiLocalizedLiterals (copy), SduiParseHelpers (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), buildConfigForComponent (copy), p20 (copy)
			local ok, result = pcall(function() -- line: 379
				-- upvalues: items (copy), FFlagSduiOrderedTemplateDataSupport (copy), SduiPropUtils (copy), p19 (copy), Signals (copy), buildInputsForNestedComponent (copy), p18 (copy), p17 (copy), FFlagSduiLocalizedLiterals (copy), SduiParseHelpers (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref), buildConfigForComponent (copy), p20 (copy), p23 (copy)
				local t7 = {}

				for _, v87 in items do
					local v88

					if FFlagSduiOrderedTemplateDataSupport then
						v88 = SduiPropUtils.resolveTemplate(v87.roblox_component, p19)
					else
						if v87.roblox_component == nil then
							error("Missing templateData.roblox_component")
						end

						v88 = p19.getTemplateForRobloxComponent(v87.roblox_component)

						if v88 == nil then
							error(`Could not find template for roblox_component { v87.roblox_component }`)
						end
					end

					local inputs = v87.inputs
					local v90 = Signals.createComputed(function(p24) -- line: 397
						-- upvalues: inputs (copy), buildInputsForNestedComponent (copy), p18 (copy), p17 (copy), FFlagSduiLocalizedLiterals (copy), p19 (copy), SduiParseHelpers (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), currentComponentType (ref), currentParserName (ref)
						local t8 = {}

						if inputs then
							local ok, result = pcall(function() -- line: 400
								-- upvalues: buildInputsForNestedComponent (copy), p18 (copy), inputs (copy), p17 (copy), p24 (copy), t8 (copy), FFlagSduiLocalizedLiterals (copy), p19 (copy)
								buildInputsForNestedComponent(p18, inputs, p17, p24, t8, if not FFlagSduiLocalizedLiterals then nil else p19)
							end)

							if not ok then
								local v99 = SduiParseHelpers.stringifyValue(result)

								SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
									message = `Failed to build inputs for nested component in item_list: { v99 }`,
									name = p19.debugName,
									componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
									parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
								}, p19.appPage)
							end
						end

						return t8
					end)
					local v91 = buildConfigForComponent(v88, v90, p19, p20)

					if v91 then
						if FFlagSduiOrderedTemplateDataSupport then
							if SduiPropUtils.isComponentVisible(v91, p23) then
								table.insert(t7, v91)
							end
						elseif v91.isComponentFilteredSignal == nil or not v91.isComponentFilteredSignal(p23).data then
							table.insert(t7, v91)
						end
					end
				end

				return t7
			end)

			if not ok then
				local v72 = SduiParseHelpers.stringifyValue(result)

				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToParseProp, {
					message = `Failed to build item_list component list: { v72 }`,
					name = p19.debugName,
					componentType = if not FFlagSduiImprovedErrorDimensions then nil else currentComponentType,
					parserName = if not FFlagSduiImprovedErrorDimensions then nil else currentParserName
				}, p19.appPage)

				return {
					data = {}
				}
			end

			return {
				data = result
			}
		end), PropResultCategory.PropSignal
	end

	if FFlagSduiOrderedTemplateDataSupport and p15 == "ordered_template_data" then
		return buildOrderedTemplateDataList(p16, p17, p18, p19, p20)
	end

	if p15 == "conditional" then
		return SduiPropUtils.generateConditionalPropValue(p16, p17, p19, p20, p18, buildLazyNestedComponentListProp), PropResultCategory.PropSignal
	end

	error(`Could not build prop. Unknown propDefinitionType: { p15 }`)
end

return buildLazyNestedComponentListProp

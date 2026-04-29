local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SduiSharedUtilitiesParent = SduiSharedUtilities.Parent

require(SduiSharedUtilitiesParent.Signals)

local SduiCoreSystem = require(SduiSharedUtilitiesParent.SduiCoreSystem)
local SduiErrors = SduiCoreSystem.SduiErrors
local SduiLogger = SduiCoreSystem.SduiLogger
local getSduiTemplateStore = require(SduiSharedUtilities.getSduiTemplateStore)
local SduiProtobufResponseHelpers = require(SduiSharedUtilities.SduiProtobufResponseHelpers)

require(SduiSharedUtilities.SduiLoadTimer)

local SduiRequestStatus = require(SduiSharedUtilities.SduiIntegrationTypes).SduiRequestStatus
local getSduiClientBindingBuilder = SduiCoreSystem.getSduiClientBindingBuilder
local createBuilderConfig = SduiCoreSystem.createBuilderConfig
local getSduiDataBinder = SduiCoreSystem.getSduiDataBinder
local FFlagSduiAllowNoConfigsBuilt = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiLocalizedLiterals = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiChartsSupport = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiChartsSupport
local FFlagEnableSduiV2HomepagePrompts = require(SduiSharedUtilitiesParent.SharedFlags).FFlagEnableSduiV2HomepagePrompts
local FFlagSduiImprovedErrorDimensions = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiImprovedErrorDimensions

local function mergeTables(t1: {[any]: any}, t2: {[any]: any}) -- line: 36
	-- upvalues: mergeTables (copy)
	for v20, v21 in t2 do
		if typeof(v21) == "table" then
			if t1[v20] == nil then
				t1[v20] = {}
			end

			if #v21 > 0 then
				for _, v23 in v21 do
					table.insert(t1[v20], v23)
				end
			else
				mergeTables(t1[v20], v21)
			end
		else
			t1[v20] = v21
		end
	end
end

return function(t3: {[any]: any}) --[[ handleSduiApiResponse ]] -- line: 75
	-- upvalues: FFlagSduiAllowNoConfigsBuilt (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiImprovedErrorDimensions (copy), getSduiDataBinder (copy), getSduiTemplateStore (copy), FFlagSduiLocalizedLiterals (copy), SduiProtobufResponseHelpers (copy), mergeTables (copy), createBuilderConfig (copy), getSduiClientBindingBuilder (copy), FFlagSduiChartsSupport (copy), FFlagEnableSduiV2HomepagePrompts (copy)
	local response = t3.response
	local decodeResponse = t3.decodeResponse
	local parsePageEntriesFromResponse = t3.parsePageEntriesFromResponse
	local parseHydrationDataFromResponse = t3.parseHydrationDataFromResponse
	local parseTemplateEntriesFromResponse = t3.parseTemplateEntriesFromResponse
	local getInputDataSignalsForRequest = t3.getInputDataSignalsForRequest
	local loadTimer = t3.loadTimer
	local surfaceKey = t3.surfaceKey
	local v36 = t3.configCacheKey or t3.surfaceKey
	local paginateResponse = t3.paginateResponse
	local buildNextPageUrl = t3.buildNextPageUrl
	local v39 = if not FFlagSduiAllowNoConfigsBuilt then nil else t3.allowNoConfigsBuilt

	assert(v36, "configCacheKey must exist")
	loadTimer.logNetRequestStats(response.Stats)
	loadTimer.logResponseDecodeBegin()

	local ok, result = pcall(function() -- line: 113
		-- upvalues: decodeResponse (copy), response (copy)
		return (decodeResponse(response.Body))
	end)

	loadTimer.logResponseDecodeEnd()

	local g60 = nil
	local g61 = nil

	if not ok then
		loadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToDecodeResponse, {
			debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
			name = if not FFlagSduiImprovedErrorDimensions then nil else v36,
			message = result
		}, surfaceKey)
		error("Failed to decode")
	end

	loadTimer.logResponseDataUpdateBegin()

	if parseHydrationDataFromResponse then
		local ok2, result2 = pcall(function() -- line: 137
			-- upvalues: parseHydrationDataFromResponse (copy), result (copy), getSduiDataBinder (copy)
			local v66 = parseHydrationDataFromResponse(result)

			getSduiDataBinder().updateDataStores(v66)
		end)

		if not ok2 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToUpdateDataStores, {
				debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
				name = if not FFlagSduiImprovedErrorDimensions then nil else v36,
				message = result2
			}, surfaceKey)
		end
	end

	local t4 = {}

	if parseTemplateEntriesFromResponse then
		local ok3, result3 = pcall(function() -- line: 154
			-- upvalues: t4 (ref), parseTemplateEntriesFromResponse (copy), result (copy), getSduiTemplateStore (copy)
			local v67, v68 = parseTemplateEntriesFromResponse(result)

			t4 = v68
			getSduiTemplateStore().addTemplates(v67)
		end)

		if not ok3 then
			SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, {
				debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
				name = if not FFlagSduiImprovedErrorDimensions then nil else v36,
				message = result3
			}, surfaceKey)
		end
	end

	loadTimer.logResponseDataUpdateEnd()
	loadTimer.logSduiTreeBuildBegin()

	local v47 = if not parsePageEntriesFromResponse then {} else parsePageEntriesFromResponse(result)
	local v48 = if not FFlagSduiLocalizedLiterals then nil else SduiProtobufResponseHelpers.parseLocalizedLiteralsFromResponse(result)
	local t5 = {}
	local v50 = #v47 > 1

	for _, v52 in v47 do
		local identifier = v52.identifier
		local v54 = if not v50 or (not identifier or identifier == "") then v36 else `{ v36 }_{ identifier }`
		local componentInputData = v52.componentInputData
		local v56 = getInputDataSignalsForRequest(v54)
		local v57 = v56.get(false)

		if paginateResponse and v57 then
			if componentInputData then
				local v58 = v56.get(false)
				local v59 = table.clone(v58)

				mergeTables(v59, componentInputData)
				v56.set(v59)
			end
		else
			v56.set(componentInputData)
		end

		repeat
			if g60 or not not (paginateResponse and v57) then
				g60 = false
				t5[v54] = t5[v54] or {}

				if buildNextPageUrl then
					t5[v54].nextPageUrl = buildNextPageUrl(result) or ""
				else
					t5[v54].nextPageUrl = ""
				end

				g61 = true

				break
			end

			local robloxComponentType = v52.robloxComponentType

			if robloxComponentType then
				local v63 = t4[robloxComponentType]

				if not v63 then
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToMapRobloxComponentToTemplate, {
						debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
						name = robloxComponentType,
						message = `Missing template for robloxComponentType { robloxComponentType }`
					}, surfaceKey)
					g61 = true

					break
				end

				local ok4, result4 = pcall(function() -- line: 232
					-- upvalues: createBuilderConfig (copy), surfaceKey (copy), v36 (copy), t4 (ref), v48 (copy), getSduiClientBindingBuilder (copy), v63 (copy), v56 (copy)
					local v69 = createBuilderConfig({
						appPage = surfaceKey,
						debugName = v36,
						getTemplateForRobloxComponent = function(p1) --[[ getTemplateForRobloxComponent ]] -- line: 236
							-- upvalues: t4 (ref)
							return t4[p1]
						end,
						localizedLiterals = v48
					})

					return (getSduiClientBindingBuilder().buildConfigForComponent(v63, v56.get, v69))
				end)

				if ok4 then
					if t5[v54] then
						SduiLogger.reportError(SduiErrors.SduiErrorType.DuplicateOrMissingIdentifier, {
							debugName = if not FFlagSduiImprovedErrorDimensions then v54 else nil,
							name = robloxComponentType,
							message = `Existing config found for cacheKey { v54 }. Need to specify identifer in page entry for multiple configs`
						}, surfaceKey)
					end

					t5[v54] = {
						config = result4,
						dataUpdatedTimestamp = if not FFlagSduiChartsSupport then nil else os.clock(),
						identifier = if not FFlagEnableSduiV2HomepagePrompts then nil else identifier,
						robloxComponentType = if not FFlagEnableSduiV2HomepagePrompts then nil else robloxComponentType
					}
				else
					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToBuildClientBindingConfig, {
						debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
						name = robloxComponentType,
						message = `{ result4 }`
					}, surfaceKey)
				end

				if v52.title and t5[v54] then
					t5[v54].title = v52.title
				end

				g60 = true
			end
		until not g60

		if g61 then
			g61 = false

			continue
		end

		SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToAddTemplates, {
			debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
			name = if not FFlagSduiImprovedErrorDimensions then nil else v36,
			message = "Page entry missing robloxComponentType"
		}, surfaceKey)
	end

	if not next(t5) and not paginateResponse and (not FFlagSduiAllowNoConfigsBuilt or not v39) then
		SduiLogger.reportError(SduiErrors.SduiErrorType.NoComponentConfigsBuilt, {
			debugName = if not FFlagSduiImprovedErrorDimensions then v36 else nil,
			name = if not FFlagSduiImprovedErrorDimensions then nil else v36,
			message = `No configs built when handling proto response for { v36 }`
		}, surfaceKey)
	end

	loadTimer.logSduiTreeBuildEnd()

	return t5
end

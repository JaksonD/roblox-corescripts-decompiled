local HttpService = game:GetService("HttpService")
local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SduiSharedUtilitiesParent = SduiSharedUtilities.Parent
local Cryo = require(SduiSharedUtilitiesParent.Cryo)
local Signals = require(SduiSharedUtilitiesParent.Signals)
local SduiCoreSystem = require(SduiSharedUtilitiesParent.SduiCoreSystem)
local SduiErrors = SduiCoreSystem.SduiErrors
local SduiLogger = SduiCoreSystem.SduiLogger
local SduiParseHelpers = SduiCoreSystem.SduiParseHelpers
local Promise = require(SduiSharedUtilitiesParent.Promise)
local DataHydration = require(SduiSharedUtilitiesParent.DataHydration)
local createDataCache = DataHydration.createDataCache
local createDataResolver = DataHydration.createDataResolver
local SduiIntegrationTypes = require(SduiSharedUtilities.SduiIntegrationTypes)
local SduiRequestStatus = SduiIntegrationTypes.SduiRequestStatus

require(SduiSharedUtilities.SduiLoadTimer)

local SduiProtobufResponseHelpers = require(SduiSharedUtilities.SduiProtobufResponseHelpers)
local makeProtoResponseDecoder = SduiProtobufResponseHelpers.makeProtoResponseDecoder
local makeProtobufJsonResponseDecoder = SduiProtobufResponseHelpers.makeProtobufJsonResponseDecoder
local SduiResponseType = SduiIntegrationTypes.SduiResponseType
local handleSduiApiResponse = require(SduiSharedUtilities.handleSduiApiResponse)
local SduiPageAnalytics = require(SduiSharedUtilities.SduiPageAnalytics)
local SduiApiStorePostConfig = require(SduiSharedUtilities.SduiApiStorePostConfig)
local FFlagSduiProtobufJsonDecode = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiProtobufJsonDecode
local v24 = game:DefineFastFlag("SduiEnableClearOnEmptyResponse", false)
local FFlagSduiAllowNoConfigsBuilt = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiAllowNoConfigsBuilt
local FFlagSduiChartsSupport = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiConfigFetchTakesPostBody = require(SduiSharedUtilitiesParent.SharedFlags).FFlagSduiConfigFetchTakesPostBody

return function() --[[ createSduiApiStore ]] -- line: 82
	-- upvalues: createDataCache (copy), Signals (copy), Promise (copy), FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), FFlagSduiConfigFetchTakesPostBody (copy), HttpService (copy), SduiApiStorePostConfig (copy), SduiPageAnalytics (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiChartsSupport (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponse (copy), SduiProtobufResponseHelpers (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiParseHelpers (copy), v24 (copy), Cryo (copy), createDataResolver (copy)
	local v28 = createDataCache()
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}

	local function getInputDataSignals(s1: string) -- line: 114
		-- upvalues: t4 (copy), Signals (copy)
		local v41 = t4[s1]

		if v41 == nil then
			local v42, v43 = Signals.createSignal(nil)

			v41 = {
				get = v42,
				set = v43
			}
			t4[s1] = v41
		end

		return v41
	end

	local v34 = createDataResolver({
		cache = v28,
		fetchFn = function(s2: string, p1) --[[ fetchFunction ]] -- line: 130
			-- upvalues: t1 (copy), Promise (copy), FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), FFlagSduiConfigFetchTakesPostBody (copy), HttpService (copy), SduiApiStorePostConfig (copy), t2 (copy), SduiPageAnalytics (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiChartsSupport (copy), t3 (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), handleSduiApiResponse (copy), SduiProtobufResponseHelpers (copy), getInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiParseHelpers (copy), v24 (copy), Cryo (copy)
			local v46 = t1[s2]

			if not v46 then
				return Promise.reject("No request config for key", s2)
			end

			local url = v46.url
			local loadTimer = v46.loadTimer

			loadTimer.logUiRequestSent()

			local v49 = FFlagSduiProtobufJsonDecode and v46.responseType == SduiResponseType.ProtobufJson
			local postConfig = v46.postConfig
			local v51 = (not FFlagSduiConfigFetchTakesPostBody or not postConfig) and "GET" or "POST"
			local v52 = HttpService:RequestInternal({
				Url = url,
				Method = v51,
				Headers = {
					Accept = not v49 and "application/x-protobuf" or "application/json",
					["Content-Type"] = if not FFlagSduiConfigFetchTakesPostBody or not postConfig then nil else SduiApiStorePostConfig.getContentTypeHeaderFromPostConfig(postConfig)
				},
				Body = if not FFlagSduiConfigFetchTakesPostBody or not postConfig then nil else SduiApiStorePostConfig.getBodyFromPostConfig(postConfig)
			})

			return Promise.new(function(p2, p3) -- line: 162
				-- upvalues: v52 (copy), loadTimer (copy), t2 (copy), s2 (copy), SduiPageAnalytics (copy), v46 (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), url (copy), FFlagSduiChartsSupport (copy), t3 (copy), v49 (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), p1 (copy), handleSduiApiResponse (copy), SduiProtobufResponseHelpers (copy), getInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiParseHelpers (copy), v24 (copy), Cryo (copy)
				v52:Start(function(p4, p5) -- line: 163
					-- upvalues: loadTimer (copy), t2 (copy), s2 (copy), SduiPageAnalytics (copy), v46 (copy), SduiRequestStatus (copy), SduiLogger (copy), SduiErrors (copy), url (copy), FFlagSduiChartsSupport (copy), t3 (copy), p3 (copy), v49 (copy), makeProtobufJsonResponseDecoder (copy), makeProtoResponseDecoder (copy), p1 (copy), handleSduiApiResponse (copy), SduiProtobufResponseHelpers (copy), getInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (copy), SduiParseHelpers (copy), v24 (copy), Cryo (copy), p2 (copy)
					loadTimer.logUiResponseReceived()
					t2[s2] = false
					SduiPageAnalytics.sendPageStatusEvent(v46.surfaceKey, p5.StatusCode, p5.HttpError)

					if p4 then
						local v91 = if not p5.StatusCode then nil else tonumber(p5.StatusCode)

						if v91 and v91 >= 400 or p5.HttpError and p5.HttpError ~= Enum.HttpError.OK then
							loadTimer.updateRequestStatus(SduiRequestStatus.FailedToLoad)
							SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
								message = `Http request not successful for { url } StatusCode { p5.StatusCode } HttpError { p5.HttpError }`,
								name = v46.surfaceKey
							}, v46.surfaceKey)

							if FFlagSduiChartsSupport then
								local v92 = s2
								local v93 = t3[v92]

								if v93 then
									t3[v92] = nil
									v93.reject(p5)
								end
							end

							return p3(p5)
						end

						loadTimer.updateRequestStatus(SduiRequestStatus.LoadedFromNetwork)
						SduiPageAnalytics.sendPagePayloadSizeEvent(v46.surfaceKey, p5.Body)

						local v94 = if not v49 then makeProtoResponseDecoder(v46.apiProto) else makeProtobufJsonResponseDecoder(v46.apiProto)
						local ok, result = pcall(function() -- line: 203
							-- upvalues: v46 (copy), p1 (copy), handleSduiApiResponse (copy), p5 (copy), loadTimer (copy), v94 (copy), SduiProtobufResponseHelpers (copy), getInputDataSignals (copy), FFlagSduiAllowNoConfigsBuilt (copy)
							local v114 = v46.isPaginated and p1.data(false) ~= nil

							return handleSduiApiResponse({
								response = p5,
								loadTimer = loadTimer,
								surfaceKey = v46.surfaceKey,
								configCacheKey = v46.configKey,
								decodeResponse = v94,
								parseHydrationDataFromResponse = SduiProtobufResponseHelpers.parseHydrationDataFromResponse,
								parseTemplateEntriesFromResponse = SduiProtobufResponseHelpers.parseTemplateEntriesFromResponse,
								parsePageEntriesFromResponse = SduiProtobufResponseHelpers.parsePageEntriesFromResponse,
								getInputDataSignalsForRequest = getInputDataSignals,
								paginateResponse = v114,
								buildNextPageUrl = v46.buildNextPageUrl,
								allowNoConfigsBuilt = if not FFlagSduiAllowNoConfigsBuilt then nil else v46.allowNoConfigsBuilt
							})
						end)

						if not ok then
							local v97 = SduiParseHelpers.stringifyValue(result)

							SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
								message = `handleSduiApiResponse not successful for { url } err { v97 }`,
								name = v46.surfaceKey
							}, v46.surfaceKey)

							if FFlagSduiChartsSupport then
								local v98 = s2
								local v99 = t3[v98]

								if v99 then
									t3[v98] = nil
									v99.reject(result)
								end
							end

							return p3(p1)
						end

						local t5 = {}

						if v24 then
							if next(result) then
								local v101 = p1.data(false)

								for v102, v103 in result do
									local v104 = v101 and v101[v102]

									t5[v102] = if not v104 then v103 else Cryo.Dictionary.join(v104, v103)
								end
							elseif v46.clearOnEmptyResponse and v46.configKey then
								t5[v46.configKey] = {}
							end
						else
							local v105 = p1.data(false)

							for v106, v107 in result do
								local v108 = v105 and v105[v106]

								t5[v106] = if not v108 then v107 else Cryo.Dictionary.join(v108, v107)
							end
						end

						if FFlagSduiChartsSupport then
							local v109 = s2
							local v110 = t3[v109]

							if v110 then
								t3[v109] = nil
								v110.resolve(t5)
							end
						end

						return p2(t5)
					end

					local v111 = SduiParseHelpers.stringifyValue(p5)

					SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
						message = `Http request not successful for { url } err { v111 }`,
						name = v46.surfaceKey
					}, v46.surfaceKey)

					if FFlagSduiChartsSupport then
						local v112 = s2
						local v113 = t3[v112]

						if v113 then
							t3[v112] = nil
							v113.reject(p5)
						end
					end

					return p3(p5)
				end)
			end)
		end,
		queueProcessDelaySec = 0,
		supportsMultiGet = false
	})

	local function fetchIfNeeded(t6: {[any]: any}, b1: boolean?) -- line: 290
		-- upvalues: FFlagSduiProtobufJsonDecode (copy), SduiResponseType (copy), FFlagSduiChartsSupport (copy), t1 (copy), v34 (copy), t3 (copy), Promise (copy), SduiLogger (copy), SduiErrors (copy), SduiParseHelpers (copy), t2 (copy)
		if FFlagSduiProtobufJsonDecode and t6.responseType == nil then
			t6.responseType = SduiResponseType.Protobuf
		end

		local v55 = t6.configKey or t6.url

		t6.configKey = v55

		if FFlagSduiChartsSupport then
			t6.loadTimer.logUiRequestQueued()
			t1[v55] = t6

			local _, v57 = v34.getAndFetchItem(v55, if not b1 then nil else function() -- line: 306
				return true
			end)

			if v57 then
				if not t3[v55] then
					local u58 = nil
					local u59 = nil
					local v60 = Promise.new(function(p6, p7) -- line: 315
						-- upvalues: u58 (ref), u59 (ref)
						u58 = p6
						u59 = p7
					end)

					v60:catch(function(p8) -- line: 319
						-- upvalues: SduiLogger (copy), SduiErrors (copy), v55 (copy), SduiParseHelpers (copy), t6 (copy)
						SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
							message = `fetchIfNeeded promise rejected for { v55 }: { SduiParseHelpers.stringifyValue(p8) }`
						}, t6.surfaceKey)
					end)
					t3[v55] = {
						promise = v60,
						resolve = u58,
						reject = u59
					}
				end

				return t3[v55].promise
			end

			return Promise.resolve()
		end

		if t2[v55] then
			return nil
		end

		t2[v55] = true
		t6.loadTimer.logUiRequestQueued()
		t1[v55] = t6

		return v34.getAndFetchItem(v55, if not b1 then nil else function() -- line: 354
			return true
		end)
	end

	return {
		fetchIfNeeded = fetchIfNeeded,
		getData = v34.getCachedItem,
		getRootConfig = function(s3: string, p9, s4: string?) --[[ getRootConfig ]] -- line: 366
			-- upvalues: v34 (copy)
			local v64 = v34.getCachedItem(s3).data(p9)
			local v65 = v64 and v64[s4 or s3]

			if v65 then
				return v65.config
			end

			return nil
		end,
		getTitle = function(s5: string, p10, s6: string?) --[[ getTitle ]] -- line: 382
			-- upvalues: v34 (copy)
			local v69 = v34.getCachedItem(s5).data(p10)
			local v70 = v69 and v69[s6 or s5]

			if v70 and v70.title ~= "" then
				return v70.title
			end

			return nil
		end,
		getDataUpdatedTimestamp = function(s7: string, p11, s8: string?) --[[ getDataUpdatedTimestamp ]] -- line: 396
			-- upvalues: v34 (copy)
			local v74 = v34.getCachedItem(s7).data(p11)
			local v75 = v74 and v74[s8 or s7]

			if v75 then
				return v75.dataUpdatedTimestamp
			end

			return nil
		end,
		loadMoreFromApi = function(t7: {[any]: any}) --[[ loadMoreFromApi ]] -- line: 407
			-- upvalues: FFlagSduiChartsSupport (copy), t2 (copy), t1 (copy), SduiLogger (copy), SduiErrors (copy), Promise (copy), v34 (copy), fetchIfNeeded (copy), Cryo (copy)
			if not FFlagSduiChartsSupport and t2[t7.configKey] then
				return nil
			end

			local v77 = t1[t7.configKey]

			if not v77 then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No requestData for { t7.configKey }`
				}, "unknown")

				if FFlagSduiChartsSupport then
					return Promise.resolve()
				end

				return nil
			end

			local v78 = v34.getCachedItem(t7.configKey).data(false)
			local v79 = v78 and v78[t7.identifier or t7.configKey]

			if not v79 then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToPaginateRequest, {
					message = `No entry data for { t7.configKey }`,
					name = v77.surfaceKey
				}, v77.surfaceKey)

				if FFlagSduiChartsSupport then
					return Promise.resolve()
				end

				return nil
			end

			local nextPageUrl = v79.nextPageUrl

			if not nextPageUrl or nextPageUrl == "" then
				if FFlagSduiChartsSupport then
					return Promise.resolve()
				end

				return nil
			end

			if FFlagSduiChartsSupport then
				return fetchIfNeeded(Cryo.Dictionary.join(v77, {
					url = nextPageUrl,
					loadTimer = t7.loadTimer,
					isPaginated = true
				}), true)
			end

			fetchIfNeeded(Cryo.Dictionary.join(v77, {
				url = nextPageUrl,
				loadTimer = t7.loadTimer,
				isPaginated = true
			}), true)

			return nil
		end,
		refreshFromApi = function(t8: {[any]: any}) --[[ refreshFromApi ]] -- line: 469
			-- upvalues: t1 (copy), SduiLogger (copy), SduiErrors (copy), FFlagSduiChartsSupport (copy), Promise (copy), fetchIfNeeded (copy), Cryo (copy)
			local v82 = t1[t8.configKey]

			if not v82 then
				SduiLogger.reportError(SduiErrors.SduiErrorType.FailedToFetchPage, {
					message = `No requestData for refresh: { t8.configKey }`
				}, "unknown")

				if FFlagSduiChartsSupport then
					return Promise.resolve()
				end

				return nil
			end

			if FFlagSduiChartsSupport then
				local v83 = if not v82.buildRefreshUrl then nil else v82.buildRefreshUrl()

				return fetchIfNeeded(Cryo.Dictionary.join(v82, {
					url = v83 or v82.url,
					loadTimer = t8.loadTimer,
					isPaginated = Cryo.None
				}), true)
			end

			return fetchIfNeeded(Cryo.Dictionary.join(v82, {
				loadTimer = t8.loadTimer
			}), true)
		end
	}
end

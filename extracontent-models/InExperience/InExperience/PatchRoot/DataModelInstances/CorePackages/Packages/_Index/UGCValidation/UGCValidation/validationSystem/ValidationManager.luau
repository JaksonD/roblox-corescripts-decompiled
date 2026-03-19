local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationEnums);
local v3 = require(l_Parent_0.validationSystem.ValidationModuleLoader);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.validationSystem.ValidationTestWrapper);
local v6 = require(l_Parent_0.validationSystem.dataFetchModules.FetchAllDesiredData);
local v7 = require(l_Parent_0.util.getUploadCategory);
local v8 = require(l_Parent_0.util.RecreateSceneFromEditables);
local v9 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v10 = require(l_Parent_0.flags.getEngineFeatureEngineAQSJsonParsingInLua);
local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_RunService_0 = game:GetService("RunService");
local l_AssetQualityService_0 = game:GetService("AssetQualityService");
game:DefineFastInt("FullValidationTelemetryThrottleHundrethsPercent", 10000);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v16 = {
    eventName = "UgcFullValidationFinished", 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = game:GetFastInt("FullValidationTelemetryThrottleHundrethsPercent"), 
    lastUpdated = {
        25, 
        11, 
        18
    }, 
    description = "Report result of ugc validation suite", 
    links = "https://create.roblox.com/docs/art/validation-errors"
};
local v17 = require(l_Parent_0.flags.getFFlagDebugUGCValidationPrintNewStructureResults);
local v18 = require(l_Parent_0.flags.getEngineFeatureEngineAssetQualityEngineService);
local v19 = require(l_Parent_0.flags.getFIntUGCValidationFetchQualityMaxRetry);
local v20 = {};
local v21 = {
    Backend = true
};
local v22 = {
    InExpClient = true, 
    InExpServer = true
};
local function v45(v23, _) --[[ Line: 73 ]] --[[ Name: initRunVariables ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v25 = {};
    local v26 = {};
    local v27 = {};
    for v28, v29 in v2.ValidationModule do
        assert(v28 == v29);
        local v30 = v3.getValidationModule(v29);
        local l_categories_0 = v30.categories;
        if table.find(l_categories_0, v23) and (v30.fflag() or v30.shadowFlag()) then
            local v32 = v30.shadowFlag() and not v30.fflag();
            for _, v34 in v30.requiredData do
                v27[v34] = true;
            end;
            for _, v36 in v30.conditionalData do
                v27[v36] = true;
            end;
            local v37 = next(v30.expectedAqsData) ~= nil;
            if v37 then
                table.insert(v25, v29);
            end;
            local v38 = {};
            for _, v40 in v30.prereqTests do
                v38[v40] = true;
            end;
            v26[v29] = {
                name = v29, 
                prereqs = v38, 
                postreqs = {}, 
                isQuality = v37, 
                isShadow = v32
            };
        end;
    end;
    for v41, v42 in v26 do
        for v43, _ in v42.prereqs do
            if v26[v43] == nil then
                error(string.format("%s is needed for %s to run, but is not an included test", v43, v41));
            end;
            table.insert(v26[v43].postreqs, v41);
        end;
    end;
    return v25, v26, v27;
end;
local function v60(v46, v47) --[[ Line: 135 ]] --[[ Name: fetchQualityResults ]]
    -- upvalues: v18 (copy), l_AssetQualityService_0 (copy), v8 (copy), v19 (copy), v10 (copy), l_HttpService_0 (copy), v6 (copy), v17 (copy)
    if not v18() or not l_AssetQualityService_0 then
        v46.aqsFetchMetrics.fetchStatus = "assetQualityFetchFailure";
        v46.aqsFetchMetrics.fetchFailureReason = "Not enabled";
        return;
    else
        local v48 = v8.createModelForGltfExport(v46);
        local v49 = nil;
        local v50 = nil;
        local v51 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 144 ]]
            -- upvalues: v51 (ref), l_AssetQualityService_0 (ref), v48 (copy)
            v51 = l_AssetQualityService_0:GenerateAssetQualityGltfFromInstanceAsync(v48);
        end);
        v49 = l_status_0;
        v50 = l_result_0;
        if v49 then
            for v54 = 1, 1 + v19() do
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 151 ]]
                    -- upvalues: v46 (copy), v54 (copy), l_AssetQualityService_0 (ref), v51 (ref), v47 (copy), v10 (ref), l_HttpService_0 (ref)
                    v46.aqsFetchMetrics.fetchAttemptCount = v54;
                    local v55 = os.clock();
                    local v56 = l_AssetQualityService_0:FetchAssetQualitySummaryFromGltfAsync(v51, v47);
                    local v57 = 1000 * (os.clock() - v55);
                    v46.aqsFetchMetrics.visualizationUrl = v56.visualizationUrl;
                    v46.aqsFetchMetrics.fetchTimeMs = v57;
                    if v10() then
                        v46.aqsSummaryData = l_HttpService_0:JSONDecode(v56.rawJson);
                        return;
                    else
                        v46.aqsFetchMetrics.returnVersion = v56.version;
                        v46.aqsSummaryData = v56;
                        return;
                    end;
                end);
                v49 = l_status_1;
                v50 = l_result_1;
                if v49 then
                    break;
                end;
            end;
        end;
        if v49 then
            v46.aqsFetchMetrics.fetchStatus = "assetQualityFetchSuccess";
        else
            v46.aqsFetchMetrics.fetchFailureReason = v50;
            v46.aqsSummaryData = v6.DATA_FETCH_FAILURE;
            v46.aqsFetchMetrics.fetchStatus = "assetQualityFetchFailure";
            if v17() then
                print("Logged AQS fetch failure:", v50);
            end;
        end;
        v48:Destroy();
        return;
    end;
end;
local function v66(v61, v62) --[[ Line: 186 ]] --[[ Name: getNextLayer ]]
    local v63 = {};
    for v64, v65 in v61 do
        if next(v65.prereqs) == nil and (v62 or not v65.isQuality) then
            table.insert(v63, v64);
        end;
    end;
    return v63;
end;
local function v72(v67, v68, v69) --[[ Line: 201 ]] --[[ Name: reportFullResult ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy), v16 (copy), v17 (copy)
    local v70 = v68.aqsFetchMetrics.fetchStatus ~= "assetQualityFetchNA";
    local v71 = {
        validationJobId = v68.jobId, 
        bundleJobId = v68.consumerConfig.telemetryBundleId, 
        rootInstanceId = v68.consumerConfig.telemetryRootId, 
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        validationSource = v68.consumerConfig.source, 
        assetType = v68.uploadEnum.assetType and v68.uploadEnum.assetType.Value or 0, 
        bundleType = v68.uploadEnum.bundleType and v68.uploadEnum.bundleType.Value or 0, 
        numFailures = v67.numFailures, 
        passed = v67.pass, 
        durationMs = v69, 
        uploadCategory = v68.uploadCategory, 
        aqFetchStatus = v68.aqsFetchMetrics.fetchStatus, 
        aqFetchAttemptCount = v70 and v68.aqsFetchMetrics.fetchAttemptCount or 0, 
        aqFetchTimeMs = v70 and v68.aqsFetchMetrics.fetchTimeMs or 0, 
        aqFetchFailureReason = v70 and v68.aqsFetchMetrics.fetchFailureReason or ""
    };
    l_TelemetryService_0:LogEvent(v16, {
        customFields = v71
    });
    if v17() then
        print(v67);
    end;
end;
local function v81(v73, v74, v75, v76, v77) --[[ Line: 230 ]] --[[ Name: updateResultData ]]
    -- upvalues: v2 (copy), v9 (copy)
    local l_validationEnum_0 = v75.validationEnum;
    if v77 or not v74[l_validationEnum_0].isShadow then
        v73.states[l_validationEnum_0] = v75.status;
        v73.internalData[l_validationEnum_0] = v75.internalData;
        if #v75.errorTranslationContexts > 0 then
            table.move(v75.errorTranslationContexts, 1, #v75.errorTranslationContexts, #v73.errorTranslationContexts + 1, v73.errorTranslationContexts);
        end;
        if v75.status ~= v2.Status.PASS then
            v73.pass = false;
            v73.numFailures = v73.numFailures + 1;
            if v75.status == v2.Status.ERROR and not v73.ranIntoInternalError then
                v73.ranIntoInternalError = true;
                table.insert(v73.errorTranslationContexts, {
                    key = v9.Keys.InternalError, 
                    params = {
                        ValidationJobId = v76
                    }
                });
            end;
        end;
    end;
    for _, v80 in v74[l_validationEnum_0].postreqs do
        v74[v80].prereqs[l_validationEnum_0] = nil;
    end;
    v74[l_validationEnum_0] = nil;
end;
local function v84(v82) --[[ Line: 274 ]] --[[ Name: createConsumerConfigWithDefaults ]]
    local v83 = table.clone(v82);
    if v83.enforceR15FolderStructure == nil then
        v83.enforceR15FolderStructure = true;
    end;
    if v83.enforceShadowValidations == nil then
        v83.enforceShadowValidations = false;
    end;
    v83.telemetryBundleId = v83.telemetryBundleId or "";
    v83.telemetryRootId = v83.telemetryRootId or "";
    v83.preloadedEditableMeshes = v83.preloadedEditableMeshes or {};
    v83.preloadedEditableImages = v83.preloadedEditableImages or {};
    return v83;
end;
local function v102(v85) --[[ Line: 294 ]] --[[ Name: runValidationOnRootInstance ]]
    -- upvalues: v7 (copy), v45 (copy), v5 (copy), v2 (copy), v81 (copy), v72 (copy), v6 (copy), v21 (copy), l_RunService_0 (copy), v60 (copy), v66 (copy), v22 (copy)
    local v86 = os.clock();
    local l_rootInstance_0 = v85.rootInstance;
    local l_assetType_0 = v85.uploadEnum.assetType;
    local l_bundleType_0 = v85.uploadEnum.bundleType;
    local l_consumerConfig_0 = v85.consumerConfig;
    local v91 = {
        pass = true, 
        numFailures = 0, 
        states = {}, 
        errorTranslationContexts = {}, 
        internalData = {}, 
        ranIntoInternalError = false
    };
    local v92 = v7(l_rootInstance_0, l_assetType_0, l_bundleType_0);
    local v93, v94, v95 = v45(v92, l_consumerConfig_0);
    v85.uploadCategory = v92;
    v85.aqsFetchMetrics = {
        fetchStatus = "assetQualityFetchNA"
    };
    local v96 = v5(v2.ValidationModule.ExpectedRootSchema, v85, v91.states);
    v81(v91, v94, v96, v85.jobId, l_consumerConfig_0.enforceShadowValidations);
    if v91.states[v2.ValidationModule.ExpectedRootSchema] ~= v2.Status.PASS then
        v72(v91, v85, -1);
        return v91;
    else
        v6.storeDesiredData(v85, v95);
        if #v93 > 0 then
            v85.aqsFetchMetrics.fetchStatus = "assetQualityFetchInProgress";
            if v21[l_consumerConfig_0.source] then
                l_RunService_0:Run();
                v60(v85, v93);
                l_RunService_0:Pause();
            else
                task.spawn(v60, v85, v93);
            end;
        end;
        while next(v94) ~= nil do
            local v97 = v85.aqsFetchMetrics.fetchStatus == "assetQualityFetchInProgress";
            local v98 = v66(v94, not v97);
            if #v98 == 0 and not v97 then
                error("Impossible to complete all layers");
            end;
            for _, v100 in v98 do
                local v101 = v5(v100, v85, v91.states);
                v81(v91, v94, v101, v85.jobId, l_consumerConfig_0.enforceShadowValidations);
                if v22[l_consumerConfig_0.source] then
                    task.wait();
                end;
            end;
            if v97 and not v21[l_consumerConfig_0.source] then
                task.wait();
            end;
        end;
        v72(v91, v85, 1000 * (os.clock() - v86));
        return v91;
    end;
end;
local _ = function(v103) --[[ Line: 378 ]] --[[ Name: getRootInstance ]]
    -- upvalues: v4 (copy)
    if #v103 == 0 then
        return nil;
    else
        for _, v105 in v103 do
            if v105.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                return v105;
            end;
        end;
        return v103[1];
    end;
end;
v20.ValidateAsset = function(v107, v108, v109) --[[ Line: 395 ]] --[[ Name: ValidateAsset ]]
    -- upvalues: v17 (copy), l_HttpService_0 (copy), v4 (copy), v84 (copy), v102 (copy)
    local v110 = false;
    if v17() then
        print((("==== %* Validation begin ===="):format(v108.Name)));
    end;
    local v111 = {
        jobId = l_HttpService_0:GenerateGUID(), 
        entrypointInput = v107
    };
    local v112;
    if #v107 == 0 then
        v112 = nil;
    else
        for _, v114 in v107 do
            if v114.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                v112 = v114;
                v110 = true;
            end;
            if v110 then
                break;
            end;
        end;
        if not v110 then
            v112 = v107[1];
        end;
    end;
    v110 = false;
    v111.rootInstance = v112;
    v111.uploadEnum = {
        assetType = v108
    };
    v111.consumerConfig = v84(v109);
    return (v102(v111));
end;
v20.ValidateFinalizedBundle = function(v115, v116, v117) --[[ Line: 417 ]] --[[ Name: ValidateFinalizedBundle ]]
    -- upvalues: v17 (copy), v4 (copy), l_HttpService_0 (copy), v84 (copy), v102 (copy)
    local v118 = false;
    if v17() then
        print((("==== %* Validation begin ===="):format(v116.Name)));
    end;
    local l_Folder_0 = Instance.new("Folder");
    for _, v121 in v115 do
        local l_allSelectedInstances_0 = v121.allSelectedInstances;
        local v123;
        if #l_allSelectedInstances_0 == 0 then
            v123 = nil;
        else
            for _, v125 in l_allSelectedInstances_0 do
                if v125.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                    v123 = v125;
                    v118 = true;
                end;
                if v118 then
                    break;
                end;
            end;
            if not v118 then
                v123 = l_allSelectedInstances_0[1];
            end;
        end;
        v118 = false;
        if v123 ~= nil then
            if v123:IsA("Folder") or v123:IsA("Model") then
                for _, v127 in v123:GetChildren() do
                    v127:Clone().Parent = l_Folder_0;
                end;
            else
                v123:Clone().Parent = l_Folder_0;
            end;
        end;
    end;
    local v128 = {
        jobId = l_HttpService_0:GenerateGUID(), 
        entrypointInput = v115, 
        rootInstance = l_Folder_0, 
        uploadEnum = {
            bundleType = v116
        }, 
        consumerConfig = v84(v117)
    };
    return (v102(v128));
end;
return v20;
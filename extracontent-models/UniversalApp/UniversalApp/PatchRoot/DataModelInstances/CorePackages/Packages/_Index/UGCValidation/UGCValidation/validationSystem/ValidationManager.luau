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
local v11 = require(l_Parent_0.util.R15plusUtils);
local v12 = require(l_Parent_0.flags.getFFlagDebugAllowHRDUploadOnBundleBackend);
local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_RunService_0 = game:GetService("RunService");
local l_AssetQualityService_0 = game:GetService("AssetQualityService");
game:DefineFastInt("FullValidationTelemetryThrottleHundrethsPercent", 10000);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v18 = {
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
local v19 = require(l_Parent_0.flags.getFFlagDebugUGCValidationPrintNewStructureResults);
local v20 = require(l_Parent_0.flags.getEngineFeatureEngineAssetQualityEngineService);
local v21 = require(l_Parent_0.flags.getFIntUGCValidationFetchQualityMaxRetry);
local v22 = {};
local v23 = {
    Backend = true
};
local v24 = {
    InExpClient = true, 
    InExpServer = true
};
local function v47(v25, _) --[[ Line: 75 ]] --[[ Name: initRunVariables ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v27 = {};
    local v28 = {};
    local v29 = {};
    for v30, v31 in v2.ValidationModule do
        assert(v30 == v31);
        local v32 = v3.getValidationModule(v31);
        local l_categories_0 = v32.categories;
        if table.find(l_categories_0, v25) and (v32.fflag() or v32.shadowFlag()) then
            local v34 = v32.shadowFlag() and not v32.fflag();
            for _, v36 in v32.requiredData do
                v29[v36] = true;
            end;
            for _, v38 in v32.conditionalData do
                v29[v38] = true;
            end;
            local v39 = next(v32.expectedAqsData) ~= nil;
            if v39 then
                table.insert(v27, v31);
            end;
            local v40 = {};
            for _, v42 in v32.prereqTests do
                v40[v42] = true;
            end;
            v28[v31] = {
                name = v31, 
                prereqs = v40, 
                postreqs = {}, 
                isQuality = v39, 
                isShadow = v34
            };
        end;
    end;
    for v43, v44 in v28 do
        for v45, _ in v44.prereqs do
            if v28[v45] == nil then
                error(string.format("%s is needed for %s to run, but is not an included test", v45, v43));
            end;
            table.insert(v28[v45].postreqs, v43);
        end;
    end;
    return v27, v28, v29;
end;
local function v62(v48, v49) --[[ Line: 138 ]] --[[ Name: fetchQualityResults ]]
    -- upvalues: v20 (copy), l_AssetQualityService_0 (copy), v8 (copy), v21 (copy), v10 (copy), l_HttpService_0 (copy), v19 (copy), v6 (copy)
    if not v20() or not l_AssetQualityService_0 then
        v48.aqsFetchMetrics.fetchStatus = "assetQualityFetchFailure";
        v48.aqsFetchMetrics.fetchFailureReason = "Not enabled";
        return;
    else
        local v50 = v8.createModelForGltfExport(v48);
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 147 ]]
            -- upvalues: v53 (ref), l_AssetQualityService_0 (ref), v50 (copy)
            v53 = l_AssetQualityService_0:GenerateAssetQualityGltfFromInstanceAsync(v50);
        end);
        v51 = l_status_0;
        v52 = l_result_0;
        if v51 then
            for v56 = 1, 1 + v21() do
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 154 ]]
                    -- upvalues: v48 (copy), v56 (copy), l_AssetQualityService_0 (ref), v53 (ref), v49 (copy), v10 (ref), l_HttpService_0 (ref)
                    v48.aqsFetchMetrics.fetchAttemptCount = v56;
                    local v57 = os.clock();
                    local v58 = l_AssetQualityService_0:FetchAssetQualitySummaryFromGltfAsync(v53, v49);
                    local v59 = 1000 * (os.clock() - v57);
                    v48.aqsFetchMetrics.visualizationUrl = v58.visualizationUrl;
                    v48.aqsFetchMetrics.fetchTimeMs = v59;
                    if v10() then
                        v48.aqsSummaryData = l_HttpService_0:JSONDecode(v58.rawJson);
                        return;
                    else
                        v48.aqsFetchMetrics.returnVersion = v58.version;
                        v48.aqsSummaryData = v58;
                        return;
                    end;
                end);
                v51 = l_status_1;
                v52 = l_result_1;
                if v51 then
                    break;
                end;
            end;
        end;
        if v51 then
            if v19() then
                print("AQS Fetch Sucess:", v48.aqsSummaryData);
            end;
            v48.aqsFetchMetrics.fetchStatus = "assetQualityFetchSuccess";
        else
            v48.aqsFetchMetrics.fetchFailureReason = v52;
            v48.aqsSummaryData = v6.DATA_FETCH_FAILURE;
            v48.aqsFetchMetrics.fetchStatus = "assetQualityFetchFailure";
            if v19() then
                print("Logged AQS fetch failure:", v52);
            end;
        end;
        v50:Destroy();
        return;
    end;
end;
local function v68(v63, v64) --[[ Line: 192 ]] --[[ Name: getNextLayer ]]
    local v65 = {};
    for v66, v67 in v63 do
        if next(v67.prereqs) == nil and (v64 or not v67.isQuality) then
            table.insert(v65, v66);
        end;
    end;
    return v65;
end;
local function v74(v69, v70, v71) --[[ Line: 207 ]] --[[ Name: reportFullResult ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_TelemetryService_0 (copy), v18 (copy), v19 (copy)
    local v72 = v70.aqsFetchMetrics.fetchStatus ~= "assetQualityFetchNA";
    local v73 = {
        validationJobId = v70.jobId, 
        bundleJobId = v70.consumerConfig.telemetryBundleId, 
        rootInstanceId = v70.consumerConfig.telemetryRootId, 
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        validationSource = v70.consumerConfig.source, 
        assetType = v70.uploadEnum.assetType and v70.uploadEnum.assetType.Value or 0, 
        bundleType = v70.uploadEnum.bundleType and v70.uploadEnum.bundleType.Value or 0, 
        numFailures = v69.numFailures, 
        passed = v69.pass, 
        durationMs = v71, 
        uploadCategory = v70.uploadCategory, 
        aqFetchStatus = v70.aqsFetchMetrics.fetchStatus, 
        aqFetchAttemptCount = v72 and v70.aqsFetchMetrics.fetchAttemptCount or 0, 
        aqFetchTimeMs = v72 and v70.aqsFetchMetrics.fetchTimeMs or 0, 
        aqFetchFailureReason = v72 and v70.aqsFetchMetrics.fetchFailureReason or ""
    };
    l_TelemetryService_0:LogEvent(v18, {
        customFields = v73
    });
    if v19() then
        print(v69);
    end;
end;
local function v83(v75, v76, v77, v78, v79) --[[ Line: 236 ]] --[[ Name: updateResultData ]]
    -- upvalues: v2 (copy), v9 (copy)
    local l_validationEnum_0 = v77.validationEnum;
    if v79 or not v76[l_validationEnum_0].isShadow then
        v75.states[l_validationEnum_0] = v77.status;
        v75.internalData[l_validationEnum_0] = v77.internalData;
        if #v77.errorTranslationContexts > 0 then
            table.move(v77.errorTranslationContexts, 1, #v77.errorTranslationContexts, #v75.errorTranslationContexts + 1, v75.errorTranslationContexts);
        end;
        if v77.status ~= v2.Status.PASS then
            v75.pass = false;
            v75.numFailures = v75.numFailures + 1;
            if v77.status == v2.Status.ERROR and not v75.ranIntoInternalError then
                v75.ranIntoInternalError = true;
                table.insert(v75.errorTranslationContexts, {
                    key = v9.Keys.InternalError, 
                    params = {
                        ValidationJobId = v78
                    }
                });
            end;
        end;
    end;
    for _, v82 in v76[l_validationEnum_0].postreqs do
        v76[v82].prereqs[l_validationEnum_0] = nil;
    end;
    v76[l_validationEnum_0] = nil;
end;
local function v86(v84) --[[ Line: 280 ]] --[[ Name: createConsumerConfigWithDefaults ]]
    local v85 = table.clone(v84);
    if v85.enforceR15FolderStructure == nil then
        v85.enforceR15FolderStructure = true;
    end;
    if v85.enforceShadowValidations == nil then
        v85.enforceShadowValidations = false;
    end;
    v85.telemetryBundleId = v85.telemetryBundleId or "";
    v85.telemetryRootId = v85.telemetryRootId or "";
    v85.preloadedEditableMeshes = v85.preloadedEditableMeshes or {};
    v85.preloadedEditableImages = v85.preloadedEditableImages or {};
    return v85;
end;
local function v104(v87) --[[ Line: 300 ]] --[[ Name: runValidationOnRootInstance ]]
    -- upvalues: v7 (copy), v47 (copy), v5 (copy), v2 (copy), v83 (copy), v74 (copy), v6 (copy), v23 (copy), l_RunService_0 (copy), v62 (copy), v68 (copy), v24 (copy)
    local v88 = os.clock();
    local l_rootInstance_0 = v87.rootInstance;
    local l_assetType_0 = v87.uploadEnum.assetType;
    local l_bundleType_0 = v87.uploadEnum.bundleType;
    local l_consumerConfig_0 = v87.consumerConfig;
    local v93 = {
        pass = true, 
        numFailures = 0, 
        states = {}, 
        errorTranslationContexts = {}, 
        internalData = {}, 
        ranIntoInternalError = false
    };
    local v94 = v7(l_rootInstance_0, l_assetType_0, l_bundleType_0);
    local v95, v96, v97 = v47(v94, l_consumerConfig_0);
    v87.uploadCategory = v94;
    v87.aqsFetchMetrics = {
        fetchStatus = "assetQualityFetchNA"
    };
    local v98 = v5(v2.ValidationModule.ExpectedRootSchema, v87, v93.states);
    v83(v93, v96, v98, v87.jobId, l_consumerConfig_0.enforceShadowValidations);
    if v93.states[v2.ValidationModule.ExpectedRootSchema] ~= v2.Status.PASS then
        v74(v93, v87, -1);
        return v93;
    else
        v6.storeDesiredData(v87, v97);
        if #v95 > 0 then
            v87.aqsFetchMetrics.fetchStatus = "assetQualityFetchInProgress";
            if v23[l_consumerConfig_0.source] then
                l_RunService_0:Run();
                v62(v87, v95);
                l_RunService_0:Pause();
            else
                task.spawn(v62, v87, v95);
            end;
        end;
        while next(v96) ~= nil do
            local v99 = v87.aqsFetchMetrics.fetchStatus == "assetQualityFetchInProgress";
            local v100 = v68(v96, not v99);
            if #v100 == 0 and not v99 then
                error("Impossible to complete all layers");
            end;
            for _, v102 in v100 do
                local v103 = v5(v102, v87, v93.states);
                v83(v93, v96, v103, v87.jobId, l_consumerConfig_0.enforceShadowValidations);
                if v24[l_consumerConfig_0.source] then
                    task.wait();
                end;
            end;
            if v99 and not v23[l_consumerConfig_0.source] then
                task.wait();
            end;
        end;
        v74(v93, v87, 1000 * (os.clock() - v88));
        return v93;
    end;
end;
local _ = function(v105) --[[ Line: 384 ]] --[[ Name: getRootInstance ]]
    -- upvalues: v4 (copy)
    if #v105 == 0 then
        return nil;
    else
        for _, v107 in v105 do
            if v107.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                return v107;
            end;
        end;
        return v105[1];
    end;
end;
v22.ValidateAsset = function(v109, v110, v111) --[[ Line: 401 ]] --[[ Name: ValidateAsset ]]
    -- upvalues: v19 (copy), l_HttpService_0 (copy), v4 (copy), v86 (copy), v104 (copy)
    local v112 = false;
    if v19() then
        print((("==== %* Validation begin ===="):format(v110.Name)));
    end;
    local v113 = {
        jobId = l_HttpService_0:GenerateGUID(), 
        entrypointInput = v109
    };
    local v114;
    if #v109 == 0 then
        v114 = nil;
    else
        for _, v116 in v109 do
            if v116.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                v114 = v116;
                v112 = true;
            end;
            if v112 then
                break;
            end;
        end;
        if not v112 then
            v114 = v109[1];
        end;
    end;
    v112 = false;
    v113.rootInstance = v114;
    v113.uploadEnum = {
        assetType = v110
    };
    v113.consumerConfig = v86(v111);
    return (v104(v113));
end;
v22.ValidateFinalizedBundle = function(v117, v118, v119) --[[ Line: 423 ]] --[[ Name: ValidateFinalizedBundle ]]
    -- upvalues: v12 (copy), v11 (copy), v19 (copy), v4 (copy), l_HttpService_0 (copy), v86 (copy), v104 (copy)
    local v120 = false;
    if v12() then
        v11.setIsBackendBundleUpload(v119.source == "Backend");
    end;
    if v19() then
        print((("==== %* Validation begin ===="):format(v118.Name)));
    end;
    local l_Folder_0 = Instance.new("Folder");
    for _, v123 in v117 do
        local l_allSelectedInstances_0 = v123.allSelectedInstances;
        local v125;
        if #l_allSelectedInstances_0 == 0 then
            v125 = nil;
        else
            for _, v127 in l_allSelectedInstances_0 do
                if v127.Name == v4.FOLDER_NAMES.R15ArtistIntent then
                    v125 = v127;
                    v120 = true;
                end;
                if v120 then
                    break;
                end;
            end;
            if not v120 then
                v125 = l_allSelectedInstances_0[1];
            end;
        end;
        v120 = false;
        if v125 ~= nil then
            if v125:IsA("Folder") or v125:IsA("Model") then
                for _, v129 in v125:GetChildren() do
                    v129:Clone().Parent = l_Folder_0;
                end;
            else
                v125:Clone().Parent = l_Folder_0;
            end;
        end;
    end;
    local v130 = {
        jobId = l_HttpService_0:GenerateGUID(), 
        entrypointInput = v117, 
        rootInstance = l_Folder_0, 
        uploadEnum = {
            bundleType = v118
        }, 
        consumerConfig = v86(v119)
    };
    local v131 = v104(v130);
    if v12() then
        v11.setIsBackendBundleUpload(false);
    end;
    return v131;
end;
return v22;
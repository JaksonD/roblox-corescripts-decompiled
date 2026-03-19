local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local l_AvatarExperienceScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AvatarExperienceScreenSizeImpressionsDetector;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.AvatarExperiencePointsTelemetry);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.AnalyticsMetadata);
local v12 = game:DefineFastFlag("EnableImpressionReporterCounter3", false);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AnalyticsService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).AnalyticsService;
local v16 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v17 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileThumbnailLatencyTracker);
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v19 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 = v19.FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled;
local v21 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v22 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local v23 = game:DefineFastFlag("AXImpressionReporterConditionalHookBacktraceError", false);
local v24 = game:DefineFastFlag("AXConditionalHookForOrganicImpressionReporter", false);
local v25 = require(l_Modules_0.AvatarExperience.Common.Hooks.useCategoryInfo);
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v19.FFlagAXMoveAllTabToWidgetOnly;
local l_ITEM_IMPRESSION_0 = l_ImpressionEnums_0.ActionType.ITEM_IMPRESSION;
local v28 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v29 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getUseSelectorDeepEquals_0 = v28.Utils.getUseSelectorDeepEquals;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getShouldPageUseWidgetOnlyFetcher_0 = v29.Utils.getShouldPageUseWidgetOnlyFetcher;
return function(v35) --[[ Line: 78 ]] --[[ Name: ImpressionsReporter ]]
    -- upvalues: l_AnalyticsService_0 (copy), v12 (copy), v16 (copy), v10 (copy), v3 (copy), l_useDispatch_0 (copy), v22 (copy), v21 (copy), v23 (copy), v25 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v31 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), v24 (copy), v18 (copy), v17 (copy), v4 (copy), l_CollectionService_0 (copy), v6 (copy), v5 (copy), v13 (copy), l_ITEM_IMPRESSION_0 (copy), v9 (copy), l_ImpressionEnums_0 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy)
    local l_EventStream_0 = l_AnalyticsService_0.EventStream;
    local v37 = if v12 then v16(v10) else nil;
    local v38, v39 = v3.useState(0);
    local v40 = v3.useState({});
    local v41 = v3.useRef({});
    local v42 = l_useDispatch_0();
    local v43 = if v22.isEnabled() then v21.readTestVariable(v22.EnabledForUser) else nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if v23 and v22.isEnabled() then
        v44 = v25();
        local v47, v48 = v3.useState(if v44 then v44.Name else "");
        v45 = v47;
        v46 = v48;
    else
        if v43 then
            v44 = v25();
        end;
        local v49, v50 = v3.useState(if v43 and v44 then v44.Name else "");
        v45 = v49;
        v46 = v50;
    end;
    local v51 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 then
        local v53 = l_useSelector_0(function(v52) --[[ Line: 106 ]]
            -- upvalues: v35 (copy)
            if v35.searchUuid then
                return v52.SearchesParameters[v35.searchUuid];
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
        local v54 = l_useSelector_0(v31);
        v51 = not l_getShouldPageUseWidgetOnlyFetcher_0(v44, v54, v53 and v53.searchKeyword);
    end;
    if v24 and v18() then
        v17(v35.searchUuid, v51);
    elseif v18() and v35.searchUuid then
        v17(v35.searchUuid);
    end;
    v3.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v39 (copy), v38 (copy), v4 (ref)
        task.delay(1, function() --[[ Line: 129 ]]
            -- upvalues: v39 (ref), v38 (ref), v4 (ref)
            v39(v38 + v4.ImpressionsDetectionInterval);
        end);
    end, {
        v38
    });
    local function v56(_) --[[ Line: 134 ]] --[[ Name: collect ]]
        -- upvalues: l_CollectionService_0 (ref), v35 (copy)
        return l_CollectionService_0:GetTagged(v35.impressionsTag);
    end;
    local v57 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v43 (copy), v44 (ref), v45 (ref), v46 (ref), v57 (copy)
        if v43 and v44 and v44.Name and v44.Name ~= v45 then
            v46(v44.Name);
            v57.current = false;
        end;
    end, {
        v44, 
        v45, 
        v43
    });
    local function v73(v58) --[[ Line: 153 ]] --[[ Name: impressionsDetected ]]
        -- upvalues: v35 (copy), v43 (copy), v41 (copy), v40 (copy), v6 (ref), v5 (ref), v57 (copy), v42 (copy), v13 (ref), v18 (ref), l_ITEM_IMPRESSION_0 (ref), v12 (ref), v37 (copy), v9 (ref), l_ImpressionEnums_0 (ref), l_EventStream_0 (copy)
        for _, v60 in v58 do
            local l_v60_Attribute_0 = v60:GetAttribute(v35.impressionsTag);
            if v43 then
                v41.current[l_v60_Attribute_0] = true;
            else
                v40[l_v60_Attribute_0] = true;
            end;
        end;
        local v62 = v6[v35.impressionsSchema];
        local v63 = v5.packEvents(v62, v58);
        if v43 and v35.searchUuid and not v57.current and v41.current then
            v57.current = true;
            local v64 = {};
            for v65 in v41.current do
                table.insert(v64, v65);
            end;
            if #v64 > 0 then
                v42(v13.SetLoadedThumbnails(v35.searchUuid, v64));
            end;
        elseif v18() and v35.searchUuid and v40 then
            for v66 in pairs(v40) do
                v42(v13.SetLoadedThumbnail(v35.searchUuid, v66));
            end;
        end;
        if v63 then
            for _, v68 in v63 do
                local v69 = nil;
                v69 = if v35.eventNamePrefix then v35.eventNamePrefix .. v35.eventName else v35.eventName;
                v68.surface = v35.surface;
                if v35.surface and v35.analyticsMetadata and v62.surfaceSpecificAnalyticsMetadata then
                    local v70 = v62.surfaceSpecificAnalyticsMetadata[v35.surface];
                    if v70 then
                        for _, v72 in v70 do
                            v68[v72.out] = v35.analyticsMetadata[v72.prop];
                        end;
                    end;
                end;
                v68.requestId = v35.requestId;
                v68.actionType = l_ITEM_IMPRESSION_0;
                if v12 then
                    v37.sendCounter("AvatarCatalogImpressionReported");
                    v9.sendTelemetryEvent("Impression", {
                        id = v35.requestId
                    });
                end;
                v68.event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT;
                l_EventStream_0:sendTelemetryEvent(v35.eventContext, v69, v68);
            end;
        end;
    end;
    return v3.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
        parentRef = v35.parentRef, 
        pageFilter = v35.pageFilter, 
        onRequestImpressionsSignal = v35.onRequestImpressionsSignal, 
        collectObjectsFunc = v56, 
        filterImpressionFunc = function(v74) --[[ Line: 227 ]] --[[ Name: filterImpression ]]
            -- upvalues: v35 (copy), v43 (copy), v41 (copy), v40 (copy)
            local l_v74_Attribute_0 = v74:GetAttribute(v35.impressionsTag);
            if v43 then
                return l_v74_Attribute_0 and not v41.current[l_v74_Attribute_0];
            else
                return l_v74_Attribute_0 and not v40[l_v74_Attribute_0];
            end;
        end, 
        onImpressionsDetected = v73
    });
end;
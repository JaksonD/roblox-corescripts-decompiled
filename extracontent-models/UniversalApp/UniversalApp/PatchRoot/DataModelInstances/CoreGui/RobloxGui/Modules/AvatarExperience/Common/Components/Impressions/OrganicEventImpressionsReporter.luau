local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CollectionService_0 = game:GetService("CollectionService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_ImpressionEnums_0 = v7.Enums.ImpressionEnums;
local l_AvatarExperienceScreenSizeImpressionsDetector_0 = v7.AvatarExperienceScreenSizeImpressionsDetector;
local l_AnalyticsService_0 = v7.AnalyticsService;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.AvatarExperiencePointsTelemetry);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v14 = game:DefineFastFlag("EnableImpressionReporterCounter3", false);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Actions.CatalogTilesLatencyTracker);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v17 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v18 = require(l_Modules_0.AvatarExperience.Common.Hooks.TileLatency.useTileThumbnailLatencyTracker);
local v19 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableCatalogTileLoadingLatency);
local v20 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 = v20.FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled;
local v22 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v23 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP);
local v24 = game:DefineFastFlag("AXImpressionReporterConditionalHookBacktraceError", false);
local v25 = game:DefineFastFlag("AXConditionalHookForOrganicImpressionReporter", false);
local v26 = require(l_Modules_0.AvatarExperience.Common.Hooks.useCategoryInfo);
local l_FFlagAXMoveAllTabToWidgetOnly_0 = v20.FFlagAXMoveAllTabToWidgetOnly;
local l_ITEM_IMPRESSION_0 = l_ImpressionEnums_0.ActionType.ITEM_IMPRESSION;
local v29 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v30 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Selectors.selectFilterCount);
local l_getUseSelectorDeepEquals_0 = v29.Utils.getUseSelectorDeepEquals;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_getShouldPageUseWidgetOnlyFetcher_0 = v30.Utils.getShouldPageUseWidgetOnlyFetcher;
return function(v36) --[[ Line: 81 ]] --[[ Name: ImpressionsReporter ]]
    -- upvalues: l_AnalyticsService_0 (copy), v14 (copy), v17 (copy), v12 (copy), v3 (copy), l_useDispatch_0 (copy), v23 (copy), v22 (copy), v24 (copy), v26 (copy), l_FFlagAXMoveAllTabToWidgetOnly_0 (copy), l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v32 (copy), l_getShouldPageUseWidgetOnlyFetcher_0 (copy), v25 (copy), v19 (copy), v18 (copy), v4 (copy), l_CollectionService_0 (copy), v6 (copy), v5 (copy), v15 (copy), l_ITEM_IMPRESSION_0 (copy), v11 (copy), l_ImpressionEnums_0 (copy), l_AvatarExperienceScreenSizeImpressionsDetector_0 (copy)
    local l_EventStream_0 = l_AnalyticsService_0.EventStream;
    local v38 = if v14 then v17(v12) else nil;
    local v39, v40 = v3.useState(0);
    local v41 = v3.useState({});
    local v42 = v3.useRef({});
    local v43 = l_useDispatch_0();
    local v44 = if v23.isEnabled() then v22.readTestVariable(v23.EnabledForUser) else nil;
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    if v24 and v23.isEnabled() then
        v45 = v26();
        local v48, v49 = v3.useState(if v45 then v45.Name else "");
        v46 = v48;
        v47 = v49;
    else
        if v44 then
            v45 = v26();
        end;
        local v50, v51 = v3.useState(if v44 and v45 then v45.Name else "");
        v46 = v50;
        v47 = v51;
    end;
    local v52 = nil;
    if l_FFlagAXMoveAllTabToWidgetOnly_0 and l_FFlagAXDisableOrganicThumbnailLatencyWhenWidgetsEnabled_0 then
        local v54 = l_useSelector_0(function(v53) --[[ Line: 109 ]]
            -- upvalues: v36 (copy)
            if v36.searchUuid then
                return v53.SearchesParameters[v36.searchUuid];
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
        local v55 = l_useSelector_0(v32);
        v52 = not l_getShouldPageUseWidgetOnlyFetcher_0(v45, v55, v54 and v54.searchKeyword);
    end;
    if v25 and v19() then
        v18(v36.searchUuid, v52);
    elseif v19() and v36.searchUuid then
        v18(v36.searchUuid);
    end;
    v3.useEffect(function() --[[ Line: 131 ]]
        -- upvalues: v40 (copy), v39 (copy), v4 (ref)
        task.delay(1, function() --[[ Line: 132 ]]
            -- upvalues: v40 (ref), v39 (ref), v4 (ref)
            v40(v39 + v4.ImpressionsDetectionInterval);
        end);
    end, {
        v39
    });
    local function v57(_) --[[ Line: 137 ]] --[[ Name: collect ]]
        -- upvalues: l_CollectionService_0 (ref), v36 (copy)
        return l_CollectionService_0:GetTagged(v36.impressionsTag);
    end;
    local v58 = v3.useRef(false);
    v3.useEffect(function() --[[ Line: 144 ]]
        -- upvalues: v44 (copy), v45 (ref), v46 (ref), v47 (ref), v58 (copy)
        if v44 and v45 and v45.Name and v45.Name ~= v46 then
            v47(v45.Name);
            v58.current = false;
        end;
    end, {
        v45, 
        v46, 
        v44
    });
    local function v74(v59) --[[ Line: 156 ]] --[[ Name: impressionsDetected ]]
        -- upvalues: v36 (copy), v44 (copy), v42 (copy), v41 (copy), v6 (ref), v5 (ref), v58 (copy), v43 (copy), v15 (ref), v19 (ref), l_ITEM_IMPRESSION_0 (ref), v14 (ref), v38 (copy), v11 (ref), l_ImpressionEnums_0 (ref), l_EventStream_0 (copy)
        for _, v61 in v59 do
            local l_v61_Attribute_0 = v61:GetAttribute(v36.impressionsTag);
            if v44 then
                v42.current[l_v61_Attribute_0] = true;
            else
                v41[l_v61_Attribute_0] = true;
            end;
        end;
        local v63 = v6[v36.impressionsSchema];
        local v64 = v5.packEvents(v63, v59);
        if v44 and v36.searchUuid and not v58.current and v42.current then
            v58.current = true;
            local v65 = {};
            for v66 in v42.current do
                table.insert(v65, v66);
            end;
            if #v65 > 0 then
                v43(v15.SetLoadedThumbnails(v36.searchUuid, v65));
            end;
        elseif v19() and v36.searchUuid and v41 then
            for v67 in pairs(v41) do
                v43(v15.SetLoadedThumbnail(v36.searchUuid, v67));
            end;
        end;
        if v64 then
            for _, v69 in v64 do
                local v70 = nil;
                v70 = if v36.eventNamePrefix then v36.eventNamePrefix .. v36.eventName else v36.eventName;
                v69.surface = v36.surface;
                if v36.surface and v36.analyticsMetadata and v63.surfaceSpecificAnalyticsMetadata then
                    local v71 = v63.surfaceSpecificAnalyticsMetadata[v36.surface];
                    if v71 then
                        for _, v73 in v71 do
                            v69[v73.out] = v36.analyticsMetadata[v73.prop];
                        end;
                    end;
                end;
                v69.requestId = v36.requestId;
                v69.actionType = l_ITEM_IMPRESSION_0;
                if v14 then
                    v38.sendCounter("AvatarCatalogImpressionReported");
                    v11.sendTelemetryEvent("Impression", {
                        id = v36.requestId
                    });
                end;
                v69.event_sender_api = l_ImpressionEnums_0.MarketplaceEventSenderAPI.SEND_ROBLOX_TELEMETRY_EVENT;
                l_EventStream_0:sendTelemetryEvent(v36.eventContext, v70, v69);
            end;
        end;
    end;
    return v3.createElement(l_AvatarExperienceScreenSizeImpressionsDetector_0, {
        parentRef = v36.parentRef, 
        pageFilter = v36.pageFilter, 
        onRequestImpressionsSignal = v36.onRequestImpressionsSignal, 
        collectObjectsFunc = v57, 
        filterImpressionFunc = function(v75) --[[ Line: 230 ]] --[[ Name: filterImpression ]]
            -- upvalues: v36 (copy), v44 (copy), v42 (copy), v41 (copy)
            local l_v75_Attribute_0 = v75:GetAttribute(v36.impressionsTag);
            if v44 then
                return l_v75_Attribute_0 and not v42.current[l_v75_Attribute_0];
            else
                return l_v75_Attribute_0 and not v41[l_v75_Attribute_0];
            end;
        end, 
        onImpressionsDetected = v74
    });
end;
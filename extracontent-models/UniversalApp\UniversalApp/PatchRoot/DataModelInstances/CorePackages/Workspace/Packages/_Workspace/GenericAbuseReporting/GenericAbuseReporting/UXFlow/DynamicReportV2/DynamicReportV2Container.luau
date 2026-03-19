local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v8 = require(l_Parent_0.Style);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_DialogSize_0 = v5.Enums.DialogSize;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v4.FocusNavigableSurfaceIdentifierEnum;
local l_FoundationProvider_0 = v5.FoundationProvider;
local l_OverlayProvider_0 = v5.OverlayProvider;
local l_Sheet_0 = v5.Sheet;
local l_ThemeContext_0 = v8.ThemeContext;
local l_AbuseReportAnalyticsProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportDialog);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local v20 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.analyticsService);
local l_ArTranslationProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider;
local v22 = require(script.Parent.DynamicReportV2Error);
local v23 = require(script.Parent.DynamicReportV2Loading);
local v24 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.fetchConfig);
local l_getNewRunId_0 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId;
local v26 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v27 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow);
local v28 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs);
local l_LayoutSlotsProvider_0 = v26.LayoutSlotsProvider;
local l_sheetSlots_0 = v26.sheetSlots;
local l_sendAnalyticsEvent_0 = v20.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v20.TelemetryEventType;
local v33 = game:DefineFastFlag("FixDynamicReportV2VR", false);
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
local l_FFlagAddLayoutSlotsToReport_0 = require(l_Parent_0.SharedFlags).FFlagAddLayoutSlotsToReport;
return v6.memo(function(v36) --[[ Line: 56 ]] --[[ Name: DynamicReportV2Container ]]
    -- upvalues: v6 (copy), l_ThemeContext_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v24 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), v3 (copy), l_sendAnalyticsEvent_0 (copy), l_getNewRunId_0 (copy), l_TelemetryEventType_0 (copy), v27 (copy), v28 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v33 (copy), l_CoreGui_0 (copy), l_OverlayProvider_0 (copy), l_Sheet_0 (copy), l_DialogSize_0 (copy), l_ArTranslationProvider_0 (copy), l_AbuseReportAnalyticsProvider_0 (copy), l_FFlagAddLayoutSlotsToReport_0 (copy), l_LayoutSlotsProvider_0 (copy), l_sheetSlots_0 (copy), v18 (copy), v23 (copy), v22 (copy), l_FoundationProvider_0 (copy), v5 (copy)
    local v37 = v6.useContext(l_ThemeContext_0);
    local v38 = l_useRoactService_0(l_RoactNetworking_0);
    local v39, v40 = v6.useState(nil);
    local v41, v42 = v6.useState(false);
    local v43, v44 = v6.useState(true);
    v6.useEffect(function() --[[ Line: 63 ]]
        -- upvalues: v24 (ref), v38 (copy), v36 (copy), v40 (copy), v42 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v3 (ref), l_sendAnalyticsEvent_0 (ref), l_getNewRunId_0 (ref), l_TelemetryEventType_0 (ref)
        v24(v38, v36.abuseVector, v36.targetId):andThen(function(v45) --[[ Line: 65 ]]
            -- upvalues: v40 (ref)
            v40(v45.responseBody);
        end):catch(function(v46) --[[ Line: 68 ]]
            -- upvalues: v42 (ref), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v3 (ref), l_sendAnalyticsEvent_0 (ref), v36 (ref), l_getNewRunId_0 (ref), l_TelemetryEventType_0 (ref)
            warn("Failed to fetch Dynamic Report V2 config:", v46);
            v42(true);
            local v47 = nil;
            if l_FFlagFixAnalyticsForDynamicReportV2_0 then
                v47 = v3.pretty(v46, {
                    depth = 10, 
                    multiline = true
                });
            end;
            l_sendAnalyticsEvent_0({
                abuse_vector = v36.abuseVector, 
                target_id = v36.targetId, 
                run_id = l_getNewRunId_0(), 
                total_duration = 0, 
                path = {}
            }, {
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = if l_FFlagFixAnalyticsForDynamicReportV2_0 then ("Failed to fetch config: $%*"):format(v47) else ("Failed to fetch config: $%*"):format((tostring(v46)))
                }
            });
        end);
    end, {
        v38, 
        v36.abuseVector, 
        v36.targetId
    });
    local v48 = v27(v39, {
        abuseVector = v36.abuseVector, 
        targetId = v36.targetId, 
        onClose = v36.onClose, 
        open = v43
    });
    if not v48 and v39 then
        v41 = true;
    end;
    local v49 = v6.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v48 (copy), v44 (copy), v36 (copy)
        if v48 then
            v48.onClose();
        end;
        v44(false);
        v36.onClose();
    end, {
        v48, 
        v36.onClose
    });
    local v50 = v28(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, function() --[[ Line: 115 ]]
        -- upvalues: v49 (copy)
        v49();
    end);
    local v51, v52 = v6.useState(true);
    local v54 = v6.useCallback(function(v53) --[[ Line: 120 ]]
        -- upvalues: v52 (copy)
        v52(not v53);
    end, {});
    local v57 = v6.useCallback(function(v55) --[[ Line: 124 ]]
        -- upvalues: v51 (copy), v50 (copy)
        local v56 = if v51 then v55 else nil;
        if typeof(v50) == "function" then
            v50(v56);
            return;
        else
            if v50 and typeof(v50) == "table" then
                v50.current = v56;
            end;
            return;
        end;
    end, {
        v51, 
        v50
    });
    local v58 = nil;
    local _ = nil;
    local v60 = nil;
    if v33 then
        v58 = l_CoreGui_0:FindFirstChild("VRCentralOverlay");
        v60 = if v58 then v58:FindFirstChild("CentralOverlay_SurfaceGui") else nil;
    end;
    if v33 then
        return (v6.createElement(l_OverlayProvider_0, {
            gui = v60
        }, {
            Sheet = v6.createElement(l_Sheet_0.Root, {
                centerSheetHeight = 1, 
                isOpen = v43, 
                onClose = v49, 
                preferCenterSheet = true, 
                snapPoints = {
                    0.9
                }, 
                size = l_DialogSize_0.Medium, 
                ref = v57
            }, {
                AbuseReportDialog = if not (not v39 or v41) and v48 then v6.createElement(l_ArTranslationProvider_0, {
                    translations = v48.config.translations
                }, v6.createElement(l_AbuseReportAnalyticsProvider_0, {
                    analytics = v48.analytics
                }, if l_FFlagAddLayoutSlotsToReport_0 then v6.createElement(l_LayoutSlotsProvider_0, {
                    slots = l_sheetSlots_0
                }, v6.createElement(v18, {
                    abuseVector = v36.abuseVector, 
                    targetId = v36.targetId, 
                    onClose = v49, 
                    abuseReportFlow = v48, 
                    takeoverFocus = v54
                })) else v6.createElement(v18, {
                    abuseVector = v36.abuseVector, 
                    targetId = v36.targetId, 
                    onClose = v49, 
                    abuseReportFlow = v48, 
                    takeoverFocus = v54
                }))) else nil, 
                LoadingDialog = if not not v39 or v41 then nil else v6.createElement(v23, nil), 
                ErrorDialog = if v41 then v6.createElement(v22, nil) else nil
            })
        }));
    else
        return (v6.createElement(l_FoundationProvider_0, {
            theme = if v37.theme == "light" then v5.Enums.Theme.Light else v5.Enums.Theme.Dark
        }, v6.createElement(l_Sheet_0.Root, {
            centerSheetHeight = 1, 
            isOpen = v43, 
            onClose = v49, 
            preferCenterSheet = true, 
            snapPoints = {
                0.9
            }, 
            size = l_DialogSize_0.Medium, 
            ref = v57
        }, {
            AbuseReportDialog = if not (not v39 or v41) and v48 then v6.createElement(l_ArTranslationProvider_0, {
                translations = v48.config.translations
            }, v6.createElement(l_AbuseReportAnalyticsProvider_0, {
                analytics = v48.analytics
            }, v6.createElement(v18, {
                abuseVector = v36.abuseVector, 
                targetId = v36.targetId, 
                onClose = v49, 
                abuseReportFlow = v48, 
                takeoverFocus = v54
            }))) else nil, 
            LoadingDialog = if not not v39 or v41 then nil else v6.createElement(v23, nil), 
            ErrorDialog = if v41 then v6.createElement(v22, nil) else nil
        })));
    end;
end);
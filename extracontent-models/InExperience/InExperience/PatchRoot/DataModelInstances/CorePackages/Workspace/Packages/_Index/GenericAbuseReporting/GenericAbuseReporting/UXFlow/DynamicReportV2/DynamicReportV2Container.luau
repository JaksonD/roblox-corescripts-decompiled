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
local v26 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow);
local v27 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.FocusNavigation.useFocusNavigationRefs);
local l_sendAnalyticsEvent_0 = v20.sendAnalyticsEvent;
local l_TelemetryEventType_0 = v20.TelemetryEventType;
local v30 = game:DefineFastFlag("FixDynamicReportV2VR", false);
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
return v6.memo(function(v32) --[[ Line: 52 ]] --[[ Name: DynamicReportV2Container ]]
    -- upvalues: v6 (copy), l_ThemeContext_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v24 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), v3 (copy), l_sendAnalyticsEvent_0 (copy), l_getNewRunId_0 (copy), l_TelemetryEventType_0 (copy), v26 (copy), v27 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v30 (copy), l_CoreGui_0 (copy), l_OverlayProvider_0 (copy), l_Sheet_0 (copy), l_DialogSize_0 (copy), l_ArTranslationProvider_0 (copy), l_AbuseReportAnalyticsProvider_0 (copy), v18 (copy), v23 (copy), v22 (copy), l_FoundationProvider_0 (copy), v5 (copy)
    local v33 = v6.useContext(l_ThemeContext_0);
    local v34 = l_useRoactService_0(l_RoactNetworking_0);
    local v35, v36 = v6.useState(nil);
    local v37, v38 = v6.useState(false);
    local v39, v40 = v6.useState(true);
    v6.useEffect(function() --[[ Line: 59 ]]
        -- upvalues: v24 (ref), v34 (copy), v32 (copy), v36 (copy), v38 (copy), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v3 (ref), l_sendAnalyticsEvent_0 (ref), l_getNewRunId_0 (ref), l_TelemetryEventType_0 (ref)
        v24(v34, v32.abuseVector, v32.targetId):andThen(function(v41) --[[ Line: 61 ]]
            -- upvalues: v36 (ref)
            v36(v41.responseBody);
        end):catch(function(v42) --[[ Line: 64 ]]
            -- upvalues: v38 (ref), l_FFlagFixAnalyticsForDynamicReportV2_0 (ref), v3 (ref), l_sendAnalyticsEvent_0 (ref), v32 (ref), l_getNewRunId_0 (ref), l_TelemetryEventType_0 (ref)
            warn("Failed to fetch Dynamic Report V2 config:", v42);
            v38(true);
            local v43 = nil;
            if l_FFlagFixAnalyticsForDynamicReportV2_0 then
                v43 = v3.pretty(v42, {
                    depth = 10, 
                    multiline = true
                });
            end;
            l_sendAnalyticsEvent_0({
                abuse_vector = v32.abuseVector, 
                target_id = v32.targetId, 
                run_id = l_getNewRunId_0(), 
                total_duration = 0, 
                path = {}
            }, {
                sub_event_type = l_TelemetryEventType_0.Error, 
                error_detail = {
                    error_message = if l_FFlagFixAnalyticsForDynamicReportV2_0 then ("Failed to fetch config: $%*"):format(v43) else ("Failed to fetch config: $%*"):format((tostring(v42)))
                }
            });
        end);
    end, {
        v34, 
        v32.abuseVector, 
        v32.targetId
    });
    local v44 = v26(v35, {
        abuseVector = v32.abuseVector, 
        targetId = v32.targetId, 
        onClose = v32.onClose, 
        open = v39
    });
    if not v44 and v35 then
        v37 = true;
    end;
    local v45 = v6.useCallback(function() --[[ Line: 97 ]]
        -- upvalues: v44 (copy), v40 (copy), v32 (copy)
        if v44 then
            v44.onClose();
        end;
        v40(false);
        v32.onClose();
    end, {
        v44, 
        v32.onClose
    });
    local v46 = v27(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, function() --[[ Line: 111 ]]
        -- upvalues: v45 (copy)
        v45();
    end);
    local v47, v48 = v6.useState(true);
    local v50 = v6.useCallback(function(v49) --[[ Line: 116 ]]
        -- upvalues: v48 (copy)
        v48(not v49);
    end, {});
    local v53 = v6.useCallback(function(v51) --[[ Line: 120 ]]
        -- upvalues: v47 (copy), v46 (copy)
        local v52 = if v47 then v51 else nil;
        if typeof(v46) == "function" then
            v46(v52);
            return;
        else
            if v46 and typeof(v46) == "table" then
                v46.current = v52;
            end;
            return;
        end;
    end, {
        v47, 
        v46
    });
    local v54 = nil;
    local _ = nil;
    local v56 = nil;
    if v30 then
        v54 = l_CoreGui_0:FindFirstChild("VRCentralOverlay");
        v56 = if v54 then v54:FindFirstChild("CentralOverlay_SurfaceGui") else nil;
    end;
    if v30 then
        return (v6.createElement(l_OverlayProvider_0, {
            gui = v56
        }, {
            Sheet = v6.createElement(l_Sheet_0.Root, {
                centerSheetHeight = 1, 
                isOpen = v39, 
                onClose = v45, 
                preferCenterSheet = true, 
                snapPoints = {
                    0.9
                }, 
                size = l_DialogSize_0.Medium, 
                ref = v53
            }, {
                AbuseReportDialog = if not (not v35 or v37) and v44 then v6.createElement(l_ArTranslationProvider_0, {
                    translations = v44.config.translations
                }, v6.createElement(l_AbuseReportAnalyticsProvider_0, {
                    analytics = v44.analytics
                }, v6.createElement(v18, {
                    abuseVector = v32.abuseVector, 
                    targetId = v32.targetId, 
                    onClose = v45, 
                    abuseReportFlow = v44, 
                    takeoverFocus = v50
                }))) else nil, 
                LoadingDialog = if not not v35 or v37 then nil else v6.createElement(v23, nil), 
                ErrorDialog = if v37 then v6.createElement(v22, nil) else nil
            })
        }));
    else
        return (v6.createElement(l_FoundationProvider_0, {
            theme = if v33.theme == "light" then v5.Enums.Theme.Light else v5.Enums.Theme.Dark
        }, v6.createElement(l_Sheet_0.Root, {
            centerSheetHeight = 1, 
            isOpen = v39, 
            onClose = v45, 
            preferCenterSheet = true, 
            snapPoints = {
                0.9
            }, 
            size = l_DialogSize_0.Medium, 
            ref = v53
        }, {
            AbuseReportDialog = if not (not v35 or v37) and v44 then v6.createElement(l_ArTranslationProvider_0, {
                translations = v44.config.translations
            }, v6.createElement(l_AbuseReportAnalyticsProvider_0, {
                analytics = v44.analytics
            }, v6.createElement(v18, {
                abuseVector = v32.abuseVector, 
                targetId = v32.targetId, 
                onClose = v45, 
                abuseReportFlow = v44, 
                takeoverFocus = v50
            }))) else nil, 
            LoadingDialog = if not not v35 or v37 then nil else v6.createElement(v23, nil), 
            ErrorDialog = if v37 then v6.createElement(v22, nil) else nil
        })));
    end;
end);
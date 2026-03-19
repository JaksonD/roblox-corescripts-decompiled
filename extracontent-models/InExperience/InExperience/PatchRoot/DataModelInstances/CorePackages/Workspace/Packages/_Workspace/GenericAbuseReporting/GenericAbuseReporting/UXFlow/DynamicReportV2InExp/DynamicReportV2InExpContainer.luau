local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AbuseReportAnalyticsProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider;
local v6 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportInline);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local l_ArTranslationProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.fetchConfig);
local v11 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v12 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow);
local l_inlineSlots_0 = v11.inlineSlots;
local l_LayoutSlotsProvider_0 = v11.LayoutSlotsProvider;
return v2.memo(function(v15) --[[ Line: 33 ]] --[[ Name: DynamicReportV2InExpContainer ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v2 (copy), l_script_FirstAncestor_0 (copy), v12 (copy), l_ArTranslationProvider_0 (copy), l_AbuseReportAnalyticsProvider_0 (copy), l_LayoutSlotsProvider_0 (copy), l_inlineSlots_0 (copy), v6 (copy)
    local v16 = l_useRoactService_0(l_RoactNetworking_0);
    local v17, v18 = v2.useState(nil);
    local v19, v20 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 38 ]]
        -- upvalues: v18 (copy), l_script_FirstAncestor_0 (ref)
        v18((require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)));
    end, {
        v16
    });
    local v21 = v12(v17, {
        abuseVector = "in-experience", 
        targetId = "", 
        onClose = v15.onClose, 
        open = true
    });
    if not v21 and v17 then
        v20(true);
    end;
    if v21 and not v19 then
        return (v2.createElement(l_ArTranslationProvider_0, {
            translations = v21.config.translations
        }, v2.createElement(l_AbuseReportAnalyticsProvider_0, {
            analytics = v21.analytics
        }, v2.createElement(l_LayoutSlotsProvider_0, {
            slots = l_inlineSlots_0
        }, v2.createElement(v6, {
            abuseReportFlow = v21
        })))));
    else
        return nil;
    end;
end);
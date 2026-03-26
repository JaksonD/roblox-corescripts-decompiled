local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_Parent_0.React);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local _ = require(l_Parent_0.RobloxAppEnums);
local v6 = require(l_Parent_0.RobloxAppHooks);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useDeviceOrientation_0 = v6.useDeviceOrientation;
local l_AbuseReportAnalyticsProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider;
local v10 = require(l_script_FirstAncestor_0.BeduiV2.Components.AbuseReportInline);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local _ = require(l_script_FirstAncestor_0.Enums.AbuseVector);
local l_ArTranslationProvider_0 = require(l_script_FirstAncestor_0.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider;
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.fetchConfig);
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.LoaderContext);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow);
local l_inlineLandscapeSlots_0 = v15.inlineLandscapeSlots;
local l_inlinePortraitSlots_0 = v15.inlinePortraitSlots;
local l_LayoutSlotsProvider_0 = v15.LayoutSlotsProvider;
local l_LoaderProvider_0 = v16.LoaderProvider;
local v22 = {};
return v3.memo(function(v23) --[[ Line: 45 ]] --[[ Name: DynamicReportV2InExpContainer ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v3 (copy), l_useDeviceOrientation_0 (copy), l_GuiService_0 (copy), l_script_FirstAncestor_0 (copy), v17 (copy), l_ArTranslationProvider_0 (copy), l_AbuseReportAnalyticsProvider_0 (copy), l_LayoutSlotsProvider_0 (copy), l_inlineLandscapeSlots_0 (copy), l_inlinePortraitSlots_0 (copy), l_LoaderProvider_0 (copy), v22 (copy), v10 (copy)
    local v24 = l_useRoactService_0(l_RoactNetworking_0);
    local v25, v26 = v3.useState(nil);
    local v27, v28 = v3.useState(false);
    local v29 = l_useDeviceOrientation_0();
    local v30 = l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small;
    local v31 = true;
    if v29 ~= "Landscape" then
        v31 = not v30;
    end;
    v3.useEffect(function() --[[ Line: 54 ]]
        -- upvalues: v26 (copy), l_script_FirstAncestor_0 (ref)
        v26((require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)));
    end, {
        v24
    });
    local v32 = v17(v25, {
        abuseVector = "in-experience", 
        targetId = "", 
        onClose = v23.onClose, 
        open = true
    });
    if not v32 and v25 then
        v28(true);
    end;
    if v32 and not v27 then
        return (v3.createElement(l_ArTranslationProvider_0, {
            translations = v32.config.translations
        }, v3.createElement(l_AbuseReportAnalyticsProvider_0, {
            analytics = v32.analytics
        }, v3.createElement(l_LayoutSlotsProvider_0, {
            slots = if v31 then l_inlineLandscapeSlots_0 else l_inlinePortraitSlots_0
        }, v3.createElement(l_LoaderProvider_0, {
            loaders = v23.loaders or v22, 
            open = true
        }, {
            AbuseReportInline = v3.createElement(v10, {
                abuseReportFlow = v32, 
                shouldUseOverlaidControls = v31
            })
        })))));
    else
        return nil;
    end;
end);
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
local v15 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.getUsers);
local v16 = require(l_script_FirstAncestor_0.BeduiV2.Components.LayoutSlots);
local v17 = require(l_script_FirstAncestor_0.BeduiV2.Loaders.LoaderContext);
local v18 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow);
local v19 = require(l_script_FirstAncestor_0.BeduiV2.Hooks.useInExpCustomSubmit);
local l_inlineLandscapeSlots_0 = v16.inlineLandscapeSlots;
local l_inlinePortraitSlots_0 = v16.inlinePortraitSlots;
local l_LayoutSlotsProvider_0 = v16.LayoutSlotsProvider;
local l_LoaderProvider_0 = v17.LoaderProvider;
return v3.memo(function(v24) --[[ Line: 55 ]] --[[ Name: DynamicReportV2InExpContainer ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v3 (copy), l_useDeviceOrientation_0 (copy), l_GuiService_0 (copy), v15 (copy), l_script_FirstAncestor_0 (copy), v19 (copy), v18 (copy), l_ArTranslationProvider_0 (copy), l_AbuseReportAnalyticsProvider_0 (copy), l_LayoutSlotsProvider_0 (copy), l_inlineLandscapeSlots_0 (copy), l_inlinePortraitSlots_0 (copy), l_LoaderProvider_0 (copy), v10 (copy)
    local v25 = l_useRoactService_0(l_RoactNetworking_0);
    local v26, v27 = v3.useState(nil);
    local v28, v29 = v3.useState(false);
    local v30 = l_useDeviceOrientation_0();
    local v31 = l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small;
    local v32 = true;
    if v30 ~= "Landscape" then
        v32 = not v31;
    end;
    local v34 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v15 (ref), v24 (copy)
        local v33 = {
            users = {
                type = "listItem", 
                fetch = v15
            }
        };
        if v24.inExpChatMessagesLoader then
            v33.inExpChatMessages = v24.inExpChatMessagesLoader;
        end;
        if v24.inExpVoiceUsersLoader then
            v33.voiceUsers = v24.inExpVoiceUsersLoader;
        end;
        return v33;
    end, {
        v24.inExpChatMessagesLoader, 
        v24.inExpVoiceUsersLoader
    });
    v3.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v27 (copy), l_script_FirstAncestor_0 (ref)
        v27((require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)));
    end, {
        v25
    });
    local v35 = v3.useRef(DateTime.now().UnixTimestampMillis);
    v3.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: v24 (copy), v35 (copy)
        if v24.isReportTabVisible then
            v35.current = DateTime.now().UnixTimestampMillis;
        end;
    end, {
        v24.isReportTabVisible
    });
    local v36 = v19({
        voiceChatServiceManager = v24.voiceChatServiceManager, 
        inExpChatMessagesLoader = v24.inExpChatMessagesLoader, 
        menuOpenTimeRef = v35
    });
    local v37 = v18(v26, {
        abuseVector = "in-experience", 
        targetId = "", 
        onClose = v24.onClose, 
        open = true, 
        onCustomSubmit = v36
    });
    local v38 = v3.useRef(v37);
    v38.current = v37;
    v3.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v24 (copy), v38 (copy)
        v24.registerOnInGameMenuClosed(function() --[[ Line: 125 ]]
            -- upvalues: v38 (ref)
            if v38.current then
                v38.current.reset();
            end;
        end);
    end, {
        v24.registerOnInGameMenuClosed
    });
    v3.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v26 (copy), v37 (copy), v29 (copy)
        if v26 and not v37 then
            v29(true);
        end;
    end, {
        v26, 
        v37
    });
    if v37 and not v28 then
        return (v3.createElement(l_ArTranslationProvider_0, {
            translations = v37.config.translations
        }, v3.createElement(l_AbuseReportAnalyticsProvider_0, {
            analytics = v37.analytics
        }, v3.createElement(l_LayoutSlotsProvider_0, {
            slots = if v32 then l_inlineLandscapeSlots_0 else l_inlinePortraitSlots_0
        }, v3.createElement(l_LoaderProvider_0, {
            loaders = v34, 
            open = v24.isReportTabVisible
        }, {
            AbuseReportInline = if v24.isReportTabVisible then v3.createElement(v10, {
                abuseReportFlow = v37, 
                shouldUseOverlaidControls = v32
            }) else nil
        })))));
    else
        return nil;
    end;
end);
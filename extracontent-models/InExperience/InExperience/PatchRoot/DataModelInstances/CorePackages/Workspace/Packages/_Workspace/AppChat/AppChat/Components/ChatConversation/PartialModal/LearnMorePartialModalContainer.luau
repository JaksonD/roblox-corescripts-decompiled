local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_memo_0 = v4.memo;
local v6 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local l_useCallback_0 = v4.useCallback;
local l_useEffectOnMount_0 = require(l_Parent_0.RoactUtils).Hooks.useEffectOnMount;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local v11 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v12 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v12.Core.Style.useStyle;
local l_useLayerCollector_0 = v12.Core.Layout.LayerCollector.useLayerCollector;
local v15 = require(script.Parent.PartialModal);
local v16 = {
    conversationId = "", 
    onDismissed = function() --[[ Line: 33 ]] --[[ Name: onDismissed ]]

    end, 
    titleKey = "Feature.Chat.Heading.ExpressiveChat", 
    bodyKey = "Feature.Chat.Description.ExpressiveChatLearnMore", 
    cancelAlertKey = "CommonUI.Features.Action.Close"
};
return l_memo_0(function(v17) --[[ Line: 40 ]] --[[ Name: LearnMorePartialModalContainer ]]
    -- upvalues: v3 (copy), v16 (copy), l_useStyle_0 (copy), l_useScreenSize_0 (copy), l_useLayerCollector_0 (copy), v6 (copy), l_useEffectOnMount_0 (copy), v11 (copy), l_useCallback_0 (copy), l_useLocalization_0 (copy), v4 (copy), v15 (copy)
    local v18 = v3.Dictionary.union(v16, v17);
    local v19 = l_useStyle_0();
    local v20 = l_useScreenSize_0();
    local v21 = l_useLayerCollector_0();
    if v21 and v21.absoluteSize then
        v20 = v21.absoluteSize;
    end;
    local v22 = v6();
    l_useEffectOnMount_0(function() --[[ Line: 50 ]]
        -- upvalues: v22 (copy), v11 (ref), v18 (copy)
        if v22 then
            v22.fireAnalyticsEvent(v11.ConversationLearnMoreDialogRendered, {
                conversationId = v18.conversationId
            });
        end;
    end);
    local v23 = l_useCallback_0(function() --[[ Line: 58 ]]
        -- upvalues: v22 (copy), v11 (ref), v18 (copy)
        if v22 then
            v22.fireAnalyticsEvent(v11.ConversationLearnMoreDialogDismissed, {
                conversationId = v18.conversationId
            });
        end;
        v18.onDismissed();
    end, {
        v22, 
        v18.conversationId, 
        v18.onDismissed
    });
    local v24 = l_useLocalization_0({
        titleText = v18.titleKey, 
        bodyText = v18.bodyKey, 
        cancelAlertText = v18.cancelAlertKey
    });
    return v4.createElement(v15, {
        titleText = v24.titleText, 
        bodyText = v24.bodyText, 
        cancelAlertText = v24.cancelAlertText, 
        screenSize = v20, 
        onDismissed = v23, 
        style = v19
    });
end);
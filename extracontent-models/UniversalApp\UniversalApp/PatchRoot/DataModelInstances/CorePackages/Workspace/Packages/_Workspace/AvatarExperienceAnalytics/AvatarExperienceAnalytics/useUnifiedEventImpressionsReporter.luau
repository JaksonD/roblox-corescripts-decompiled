local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(script.Parent.UnifiedEventLogEnums);
local v5 = require(l_Parent_0.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v5.AvatarRoute.Hooks.useAvatarRoute;
local l_AvatarScreenProperties_0 = v5.AvatarRoute.AvatarScreenProperties;
local v8 = require(script.Parent.sendUnifiedEventLogForInstance);
local v9 = require(l_Parent_0.AvatarExperienceCommon);
local l_useSelectorSignal_0 = v9.Hooks.useSelectorSignal;
local l_selectSearchKeyword_0 = v9.State.Selectors.selectSearchKeyword;
local v12 = require(l_script_FirstAncestor_0.Utils.UnifiedEventLoggingUtils);
local function v14(v13) --[[ Line: 16 ]] --[[ Name: selectAnalyticsMetadata ]]
    return v13.AvatarExperience.AnalyticsMetadata;
end;
return function() --[[ Line: 20 ]] --[[ Name: useUnifiedEventImpressionsReporter ]]
    -- upvalues: l_useAvatarRoute_0 (copy), l_useSelectorSignal_0 (copy), l_selectSearchKeyword_0 (copy), v14 (copy), v3 (copy), l_AvatarScreenProperties_0 (copy), v12 (copy), v4 (copy), v8 (copy), v2 (copy)
    local v15 = l_useAvatarRoute_0();
    local v16 = l_useSelectorSignal_0(l_selectSearchKeyword_0);
    local v17 = l_useSelectorSignal_0(v14);
    return v3.useCallback(function(v18) --[[ Line: 25 ]]
        -- upvalues: l_AvatarScreenProperties_0 (ref), v15 (copy), v12 (ref), v4 (ref), v8 (ref), v2 (ref), v17 (copy), v16 (copy)
        local l_visibleInstance_0 = v18.visibleInstance;
        local v20 = l_AvatarScreenProperties_0[v15.opaque.name];
        local v21 = nil;
        for v22, v23 in (l_visibleInstance_0:GetAttributes()) do
            if v12.isUnifiedLoggingAttribute(v22) and v12.getUnifiedLoggingFieldName(v22) == "action" then
                if v23 == v4.MarketplaceUnifiedAction.WIDGET_IMPRESSION then
                    v21 = true;
                end;
                if v23 == v4.MarketplaceUnifiedAction.PURCHASE_ATTEMPT or v23 == v4.MarketplaceUnifiedAction.UI_ELEMENT_CLICK then
                    return;
                end;
            end;
        end;
        v8(l_visibleInstance_0, v2.Dictionary.join(v17(false), {
            action = if v21 then v4.MarketplaceUnifiedAction.WIDGET_IMPRESSION else v4.MarketplaceUnifiedAction.ITEM_IMPRESSION, 
            surface = if v20 and v20.analyticsData then v20.analyticsData.unifiedLoggingSurface else nil, 
            keyword = v16(false)
        }), {
            includeScreenSize = true, 
            includeElementSizeAndPosition = true
        });
    end, {
        v15, 
        v16, 
        v17
    });
end;
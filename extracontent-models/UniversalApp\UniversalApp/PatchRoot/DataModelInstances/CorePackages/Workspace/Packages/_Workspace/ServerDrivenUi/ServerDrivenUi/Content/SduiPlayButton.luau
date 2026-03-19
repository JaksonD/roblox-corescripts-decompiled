local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_PlayButton_0 = require(l_Parent_0.GamePlayButton).PlayButton;
local v5 = require(l_Parent_0.SduiCoreSystem);
local l_executeAction_0 = v5.executeAction;
local l_findAnalyticsField_0 = v5.findAnalyticsField;
local l_SduiActionType_0 = v5.SduiActionType;
local l_getSduiActionHandlerRegistry_0 = v5.getSduiActionHandlerRegistry;
local v10 = require(l_script_FirstAncestor_0.Analytics.useSduiReportExperienceLaunched);
local l_FFlagSduiActionHandlerSharedRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionHandlerSharedRegistry;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v3.memo(function(v13) --[[ Line: 69 ]] --[[ Name: SduiPlayButton ]]
    -- upvalues: v3 (copy), l_FFlagSduiActionHandlerSharedRegistry_0 (copy), l_getSduiActionHandlerRegistry_0 (copy), l_SduiActionType_0 (copy), l_findAnalyticsField_0 (copy), v10 (copy), l_executeAction_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_PlayButton_0 (copy), v2 (copy)
    local l_analyticsContext_0 = v13.analyticsContext;
    local v16 = v3.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: l_FFlagSduiActionHandlerSharedRegistry_0 (ref), l_getSduiActionHandlerRegistry_0 (ref), l_SduiActionType_0 (ref), v13 (copy)
        local v15 = if l_FFlagSduiActionHandlerSharedRegistry_0 then l_getSduiActionHandlerRegistry_0().getActionHandlerConfig(l_SduiActionType_0.OpenGameDetails) else v13.sduiContext.actionHandlerRegistry:getActionHandlerConfig(l_SduiActionType_0.OpenGameDetails);
        if v15 and v15.handler then
            v15.handler(nil, v13.analyticsContext, v13.sduiContext);
        end;
    end, {
        v13.sduiContext, 
        v13.analyticsContext
    });
    local v17 = v13.placeId or v13.rootPlaceId;
    local v18 = v13.rootPlaceId or v17;
    local l_universeId_0 = v13.universeId;
    local v20 = l_findAnalyticsField_0("eventContext", l_analyticsContext_0.analyticsData, "ExperienceTile");
    local v21 = l_findAnalyticsField_0("referralSource", l_analyticsContext_0.analyticsData);
    local v22 = v10(v13.sduiContext, v13.analyticsContext, l_universeId_0, v17, v18, v13.appliedFilters);
    local v24 = v3.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: l_SduiActionType_0 (ref), l_executeAction_0 (ref), l_analyticsContext_0 (copy), v13 (copy)
        local v23 = {
            actionType = l_SduiActionType_0.PlayButtonClick
        };
        l_executeAction_0(v23, l_analyticsContext_0, v13.sduiContext);
    end, {
        l_analyticsContext_0, 
        v13.sduiContext
    });
    local v25 = if l_FFlagSduiServerCompat_0 then v13.anchorPoint else v13.AnchorPoint;
    local v26 = if l_FFlagSduiServerCompat_0 then v13.layoutOrder else v13.LayoutOrder;
    local v27 = if l_FFlagSduiServerCompat_0 then v13.position else v13.Position;
    local v28 = v13.fetchDelayInSeconds or 0.1;
    return v3.createElement(l_PlayButton_0, v2.Dictionary.join(v13, {
        AnchorPoint = v25, 
        LayoutOrder = v26, 
        Position = v27, 
        fetchDelayInSeconds = v28, 
        universeId = v13.universeId, 
        placeId = v13.placeId, 
        reportExperienceLaunched = v22, 
        onPurchaseRequiredCallback = if v13.openGameDetailsOnPurchaseRequired then v16 else nil, 
        onActivated = v24, 
        referralSource = v21, 
        eventContext = v20
    }));
end);
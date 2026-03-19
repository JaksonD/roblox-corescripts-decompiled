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
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v3.memo(function(v12) --[[ Line: 68 ]] --[[ Name: SduiPlayButton ]]
    -- upvalues: v3 (copy), l_getSduiActionHandlerRegistry_0 (copy), l_SduiActionType_0 (copy), l_findAnalyticsField_0 (copy), v10 (copy), l_executeAction_0 (copy), l_FFlagSduiServerCompat_0 (copy), l_PlayButton_0 (copy), v2 (copy)
    local l_analyticsContext_0 = v12.analyticsContext;
    local v15 = v3.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: l_getSduiActionHandlerRegistry_0 (ref), l_SduiActionType_0 (ref), v12 (copy)
        local v14 = l_getSduiActionHandlerRegistry_0().getActionHandlerConfig(l_SduiActionType_0.OpenGameDetails);
        if v14 and v14.handler then
            v14.handler(nil, v12.analyticsContext, v12.sduiContext);
        end;
    end, {
        v12.sduiContext, 
        v12.analyticsContext
    });
    local v16 = v12.placeId or v12.rootPlaceId;
    local v17 = v12.rootPlaceId or v16;
    local l_universeId_0 = v12.universeId;
    local v19 = l_findAnalyticsField_0("eventContext", l_analyticsContext_0.analyticsData, "ExperienceTile");
    local v20 = l_findAnalyticsField_0("referralSource", l_analyticsContext_0.analyticsData);
    local v21 = v10(v12.sduiContext, v12.analyticsContext, l_universeId_0, v16, v17, v12.appliedFilters);
    local v23 = v3.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: l_SduiActionType_0 (ref), l_executeAction_0 (ref), l_analyticsContext_0 (copy), v12 (copy)
        local v22 = {
            actionType = l_SduiActionType_0.PlayButtonClick
        };
        l_executeAction_0(v22, l_analyticsContext_0, v12.sduiContext);
    end, {
        l_analyticsContext_0, 
        v12.sduiContext
    });
    local v24 = if l_FFlagSduiServerCompat_0 then v12.anchorPoint else v12.AnchorPoint;
    local v25 = if l_FFlagSduiServerCompat_0 then v12.layoutOrder else v12.LayoutOrder;
    local v26 = if l_FFlagSduiServerCompat_0 then v12.position else v12.Position;
    local v27 = v12.fetchDelayInSeconds or 0.1;
    return v3.createElement(l_PlayButton_0, v2.Dictionary.join(v12, {
        AnchorPoint = v24, 
        LayoutOrder = v25, 
        Position = v26, 
        fetchDelayInSeconds = v27, 
        universeId = v12.universeId, 
        placeId = v12.placeId, 
        reportExperienceLaunched = v21, 
        onPurchaseRequiredCallback = if v12.openGameDetailsOnPurchaseRequired then v15 else nil, 
        onActivated = v23, 
        referralSource = v20, 
        eventContext = v19
    }));
end);
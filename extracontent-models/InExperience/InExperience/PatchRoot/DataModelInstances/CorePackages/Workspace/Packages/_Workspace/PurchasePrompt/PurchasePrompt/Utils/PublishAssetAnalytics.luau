local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v1 = {
    Section = {
        BuyCreationPage = "buy_creation_page", 
        BuyItemModal = "buy_item_modal", 
        ProcessCompleteModal = "process_complete_modal"
    }, 
    Action = {
        FieldTouched = "field_touched", 
        ButtonClicked = "button_clicked", 
        PageLoad = "page_load"
    }, 
    Element = {
        Name = "name", 
        Description = "description", 
        X = "x", 
        Expand = "expand", 
        Buy = "buy", 
        Cancel = "cancel"
    }
};
local function _(v2, v3, v4) --[[ Line: 26 ]] --[[ Name: sendEvent ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    l_RbxAnalyticsService_0:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
        section = v2, 
        action = v3, 
        element = v4
    });
end;
v1.sendPageLoad = function(v6) --[[ Line: 34 ]] --[[ Name: sendPageLoad ]]
    -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
    local l_PageLoad_0 = v1.Action.PageLoad;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
        section = v6, 
        action = l_PageLoad_0, 
        element = nil
    });
end;
v1.sendFieldTouched = function(v8, v9) --[[ Line: 38 ]] --[[ Name: sendFieldTouched ]]
    -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
    local l_FieldTouched_0 = v1.Action.FieldTouched;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
        section = v8, 
        action = l_FieldTouched_0, 
        element = v9
    });
end;
v1.sendButtonClicked = function(v11, v12) --[[ Line: 42 ]] --[[ Name: sendButtonClicked ]]
    -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
    local l_ButtonClicked_0 = v1.Action.ButtonClicked;
    l_RbxAnalyticsService_0:SendEventDeferred("client", "publish_avatar_prompt", "iec_funnel_user_creation", {
        section = v11, 
        action = l_ButtonClicked_0, 
        element = v12
    });
end;
return v1;
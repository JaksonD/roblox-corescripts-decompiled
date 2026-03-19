local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.PurchasePromptDeps);
local l_RunService_0 = game:GetService("RunService");
local l_Roact_0 = v2.Roact;
local l_Rodux_0 = v2.Rodux;
local l_CoreGui_0 = game:GetService("CoreGui");
local v7 = require(script.Components.PurchasePromptApp);
local v8 = require(l_script_0.Reducers.Reducer);
local v9 = require(l_script_0.Services.ABTest);
local v10 = require(l_script_0.Services.Network);
local v11 = require(l_script_0.Services.Analytics);
local v12 = require(l_script_0.Services.PlatformInterface);
local v13 = require(l_script_0.Services.ExternalSettings);
local v14 = require(l_script_0.Services.PublicBindables);
local v15 = require(l_script_0.Thunk);
local v16 = require(l_script_0.Thunks.initiateAvatarCreationFeePurchase);
local v17 = require(l_script_0.Components.UnifiedPurchasePrompt);
local l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 = require(l_script_0.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow;
local _ = require(l_script_0.types);
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_script_0.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local l_FFlagPurchasePromptSubtitleForTimedOptions_0 = require(l_script_0.Parent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions;
local v22 = require(l_script_0.Enums.WindowState);
local v23 = require(l_script_0.Enums.PromptState);
local v24 = require(l_script_0.Utils.PublishAssetAnalytics);
local v25 = nil;
local v26 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local function v37() --[[ Line: 44 ]] --[[ Name: createStore ]]
    -- upvalues: v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), l_BindableEvent_0 (copy), v26 (ref), l_Rodux_0 (copy), v8 (copy), v15 (copy), v22 (copy), v23 (copy), l_BindableEvent_1 (copy)
    local v29 = v9.new();
    local v30 = v10.new();
    local v31 = v11.new();
    local v32 = v12.new();
    local v33 = v13.new();
    local v34 = v14.new({
        windowStateChangedBindable = l_BindableEvent_0
    });
    v26 = l_Rodux_0.Store.new(v8, {}, {
        v15.middleware({
            [v9] = v29, 
            [v10] = v30, 
            [v11] = v31, 
            [v12] = v32, 
            [v13] = v33, 
            [v14] = v34
        })
    });
    v26.changed:connect(function(v35, v36) --[[ Line: 66 ]]
        -- upvalues: l_BindableEvent_0 (ref), v22 (ref), v23 (ref), l_BindableEvent_1 (ref)
        if v36.windowState ~= v35.windowState then
            l_BindableEvent_0:Fire({
                isShown = v35.windowState == v22.Shown, 
                hasCompletedPurchase = v35.hasCompletedPurchase
            });
        end;
        if v36.promptState ~= v35.promptState and v35.promptState == v23.None then
            l_BindableEvent_1:Fire();
        end;
    end);
end;
local function v39() --[[ Line: 82 ]]
    -- upvalues: l_RunService_0 (copy), v25 (ref), v37 (copy), l_Roact_0 (copy), v7 (copy), v26 (ref), l_CoreGui_0 (copy)
    if l_RunService_0:IsStudio() and l_RunService_0:IsEdit() or v25 then
        return nil;
    else
        v37();
        local v38 = l_Roact_0.createElement("ScreenGui", {
            AutoLocalize = false, 
            IgnoreGuiInset = true
        }, {
            l_Roact_0.createElement(v7, {
                store = v26
            })
        });
        v25 = l_Roact_0.mount(v38, l_CoreGui_0, "PurchasePromptApp");
        return v25;
    end;
end;
local function v44(v40, v41, v42, v43) --[[ Line: 104 ]] --[[ Name: initiateAvatarCreationFeePurchase ]]
    -- upvalues: v26 (ref), v16 (copy)
    if not v26 then
        error("initiateAvatarCreationFeePurchase cannot be called when the PurchasePrompt has not been mounted");
    end;
    v26:dispatch(v16(v40, v41, v42, v43));
end;
local function v46(v45) --[[ Line: 121 ]] --[[ Name: UnifiedPurchasePromptContainer ]]
    -- upvalues: v37 (copy), l_Roact_0 (copy), v17 (copy), v26 (ref), l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 (copy), l_FFlagPurchasePromptSubtitleForTimedOptions_0 (copy)
    v37();
    return l_Roact_0.createElement(v17, {
        store = v26, 
        productPayload = v45.productPayload, 
        purchaseCallbacks = v45.purchaseCallbacks, 
        postPurchaseActions = v45.postPurchaseActions, 
        purchaseAnalyticsMetadata = v45.purchaseAnalyticsMetadata, 
        purchaseOptions = if l_FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow_0 then v45.purchaseOptions else nil, 
        subtitleView = if l_FFlagPurchasePromptSubtitleForTimedOptions_0 then v45.subtitleView else nil
    });
end;
return {
    mountPurchasePrompt = v39, 
    initiateAvatarCreationFeePurchase = v44, 
    windowStateChangedEvent = l_BindableEvent_0.Event, 
    promptStateSetToNoneEvent = l_BindableEvent_1.Event, 
    PublishAssetAnalytics = v24, 
    UnifiedPurchasePromptContainer = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v46 else nil, 
    ["jest.config"] = script["jest.config"]
};
local _ = require(script.Types);
local v1 = require(script.Enums.PriceStatus);
local v2 = require(script.Hooks.useViewBreakpoints);
local v3 = require(script.Components.useResponsivePanelLayoutProps);
local v4 = require(script.Hooks.useInspectAndBuyFocusNavigation);
local v5 = require(script.Enums.ViewType);
local v6 = require(script.Enums.InspectAndBuyVersion);
local v7 = require(script.Constants);
local l_Parent_0 = script.Parent;
local l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase;
local _ = require(script.Stores.createItemSelectionStore);
return {
    Enums = {
        PriceStatus = v1, 
        ViewType = v5, 
        InspectAndBuyVersion = v6
    }, 
    Utils = {
        getPriceStatus = require(script.Utils.getPriceStatus), 
        getViewType = require(script.Utils.getViewType), 
        applyTryOnItemToHumanoidDescription = require(script.Utils.applyTryOnItemToHumanoidDescription), 
        convertAssetInfoToItemData = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then require(script.Utils.convertAssetInfoToItemData) else nil, 
        convertBundleInfoToItemData = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then require(script.Utils.convertBundleInfoToItemData) else nil, 
        itemDetailsUtils = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then require(script.Utils.itemDetailsUtils) else nil, 
        buildBulkPurchaseAnalyticsPayload = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then require(script.Utils.buildBulkPurchaseAnalyticsPayload) else nil
    }, 
    Hooks = {
        useViewBreakpoints = v2, 
        useResponsivePanelLayoutProps = v3, 
        useInspectAndBuyFocusNavigation = v4
    }, 
    Components = {
        ResponsivePanelLayout = require(script.Components.Common.ResponsivePanelLayout)
    }, 
    Contexts = {
        ItemSelectionStoreContext = if l_FFlagAXEnableIaBTimedOptionsBulkPurchase_0 then require(script.Contexts.ItemSelectionStoreContext) else nil
    }, 
    Constants = v7, 
    ["jest.config"] = script["jest.config"]
};
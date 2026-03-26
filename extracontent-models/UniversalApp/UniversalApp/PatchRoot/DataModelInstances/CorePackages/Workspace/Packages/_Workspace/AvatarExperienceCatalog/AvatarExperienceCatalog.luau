local v0 = require(script.Api.GetWidgetListInfo.getWidgetListInfo);
local v1 = require(script.Api.GetWidgetListInfo.getWidgetListInfoSearch);
local v2 = require(script.Api.GetWidgetListInfo.getLooksFromWidgetListInfo);
local v3 = require(script.Api.GetCatalogV2SearchItemDetails.getCatalogV2SearchItemDetails);
local v4 = require(script.Api.GetCatalogV2SearchItemDetails.Types.CatalogSearchAXPages);
local _ = require(script.Api.GetCatalogV2SearchItemDetails.Types.AXPagesTypes);
local _ = require(script.Models.WidgetListInfo);
local _ = require(script.Models.CatalogV2SearchItemDetails);
local _ = require(script.Components.ResultsList.WidgetListInfoViewModel);
local v9 = require(script.Components.ResultsList.useWidgetListInfoViewModel);
local v10 = require(script.Components.ResultsList.WidgetListBreakPointEnum);
local v11 = require(script.Components.ResultsList.WidgetListBreakPointThresholds);
local v12 = require(script.Components.ResultsList.WidgetListBreakPointSizeMap);
local v13 = require(script.Utils.WidgetIxpLayerMap);
local v14 = require(script.Utils.getFooterVisibilityFromItemFooters);
local v15 = require(script.State.Actions.PurchaseItemsSuccess);
local v16 = require(script.State.Actions.FetchAssetOrBundleInfoBatchedSuccess);
local v17 = require(script.State.Actions.FetchCollectibleItemDataBatchedSuccess);
local v18 = require(script.State.Actions.SetSelectedTimedOption);
local v19 = require(script.Api.GetCatalogCategories.getCatalogCategories);
local v20 = require(script.State.Thunks.SaveAsMakeupLookThunk);
local v21 = require(script.Stores.GetAXMarketplaceWidgetStore);
local _ = require(script.Stores);
return {
    Api = {
        getWidgetListInfo = v0, 
        getWidgetListInfoSearch = v1, 
        getLooksFromWidgetListInfo = v2, 
        getCatalogV2SearchItemDetails = v3.getCatalogV2SearchItemDetails, 
        CatalogSearchAXPages = v4, 
        getCatalogCategories = v19.getCatalogCategories
    }, 
    Components = {
        Checkout = {
            CheckoutPage = require(script.Components.Checkout.CheckoutPage), 
            CheckoutPageContainer = require(script.Components.Checkout.CheckoutPageContainer), 
            CheckoutActionBarContainer = require(script.Components.Checkout.CheckoutActionBarContainer), 
            OwnedActionBar = require(script.Components.Checkout.OwnedActionBar)
        }, 
        ResultsList = {
            useWidgetListInfoViewModel = v9, 
            WidgetListBreakPointEnum = v10, 
            WidgetListBreakPointThresholds = v11, 
            WidgetListBreakPointSizeMap = v12
        }, 
        Prompts = {
            TryOnMultipleItemsFtuxPrompt = require(script.Components.Prompts.TryOnMultipleItemsFtuxPrompt), 
            ClearAllItemsOnAvatarPrompt = require(script.Components.Prompts.ClearAllItemsOnAvatarPrompt), 
            WearAvatarReplaceAllItemsPrompt = require(script.Components.Prompts.WearAvatarReplaceAllItemsPrompt), 
            CartUnavailableItemsPrompt = require(script.Components.Prompts.CartUnavailableItemsPrompt), 
            GoToCustomizeToEditPrompt = require(script.Components.Prompts.GoToCustomizeToEditPrompt), 
            ItemReplacedOnAvatarPrompt = require(script.Components.Prompts.ItemReplacedOnAvatarPrompt), 
            ItemsUnavailablePrompt = require(script.Components.Prompts.ItemsUnavailablePrompt), 
            MakeupMax6LayersPrompt = require(script.Components.Prompts.MakeupMax6LayersPrompt), 
            TimeoutStatusPrompt = require(script.Components.Prompts.TimeoutStatusPrompt), 
            MakeupReleaseFtuxPrompt = require(script.Components.Prompts.MakeupReleaseFtuxPrompt)
        }
    }, 
    Constants = require(script.Constants), 
    Enums = {
        WearTimeFTUXStatusSessionEnum = require(script.Enums.WearTimeFTUXStatusSessionEnum)
    }, 
    Hooks = {
        useMultiItemShoppingFtux = require(script.Hooks.useMultiItemShoppingFtux), 
        useCatalogPageMISIntroFtux = require(script.Hooks.useCatalogPageMISIntroFtux), 
        useCatalogPageTimeoutPrompt = require(script.Hooks.useCatalogPageTimeoutPrompt), 
        useMakeupFtux = require(script.Hooks.useMakeupFtux), 
        useMakeupLayeringTooltip = require(script.Hooks.useMakeupLayeringTooltip), 
        useCatalogPageMakeupReleaseFtux = require(script.Hooks.useCatalogPageMakeupReleaseFtux)
    }, 
    Utils = {
        WidgetIxpLayerMap = v13, 
        getFooterVisibilityFromItemFooters = v14, 
        getBreakpointFromRowWidth = require(script.Utils.getBreakpointFromRowWidth), 
        getUIScaleFromTokens = require(script.Utils.getUIScaleFromTokens), 
        getShouldPageUseWidgetOnlyFetcher = require(script.Utils.getShouldPageUseWidgetOnlyFetcher), 
        TryOns = {
            getFilteredTryOnItems = require(script.Utils.TryOns.getFilteredTryOnItems), 
            getTryOnItemComparisonData = require(script.Utils.TryOns.getTryOnItemComparisonData), 
            getShouldReplaceTryOn = require(script.Utils.TryOns.getShouldReplaceTryOn), 
            getEquippableAssetsFromTryOnItems = require(script.Utils.TryOns.getEquippableAssetsFromTryOnItems), 
            getDoesBundleHaveClothingOrAccessories = require(script.Utils.TryOns.getDoesBundleHaveClothingOrAccessories), 
            removeMakeupAssetsFromTryOnsIfOverLimit = require(script.Utils.TryOns.removeMakeupAssetsFromTryOnsIfOverLimit)
        }
    }, 
    Context = {
        AXCatalogStoreContext = require(script.Context.AXCatalogStoreContext), 
        useAXCatalogStoreContext = require(script.Context.useAXCatalogStoreContext)
    }, 
    Stores = {
        getCatalogStores = require(script.Stores), 
        getAXMarketplaceWidgetStore = v21
    }, 
    State = {
        Actions = {
            PurchaseItemsSuccess = v15, 
            FetchAssetOrBundleInfoBatchedSuccess = v16, 
            FetchCollectibleItemDataBatchedSuccess = v17, 
            SetSelectedTimedOption = v18
        }
    }, 
    Thunks = {
        SaveAsMakeupLookThunk = v20
    }, 
    ["jest.config"] = script["jest.config"]
};
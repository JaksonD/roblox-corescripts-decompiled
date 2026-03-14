local _ = require(script.Types);
local v1 = require(script.Enums.AvatarEditorCategories);
local v2 = require(script.Enums.AvatarEditorSubcategories);
local v3 = require(script.Enums.Categories);
local v4 = require(script.Enums.ScreenLayout);
local v5 = require(script.Enums.ItemView);
local v6 = require(script.Enums.NavigationParams);
local _ = require(script.Hooks.useSlotItemCardBreakpoints);
local v8 = require(script.Enums.InventoryItemType);
local v9 = require(script.Enums.InventorySorts);
local v10 = require(script.Enums.InventoryItemAvailability);
local v11 = require(script.Enums.SlotType);
local v12 = require(script.Stores.createCategoryInventoryStore);
local v13 = require(script.Stores.createSortAndFiltersStore);
local v14 = require(script.Stores.createAvatarEditorStores);
local v15 = require(script.Context.SlotBasedEditorContext);
local v16 = require(script.Context.AvatarEditorStores);
return {
    Components = {
        SlotItemCard = require(script.Components.SlotItemCard), 
        SlotItemCardFooter = require(script.Components.SlotItemCardFooter), 
        SlotCircularGradientFrame = require(script.Components.SlotCircularGradientFrame), 
        SlotItemCardThumbnail = require(script.Components.SlotItemCardThumbnail), 
        ClearAllButton = require(script.Components.ClearAllButton), 
        CloseableHeader = require(script.Components.CloseableHeader), 
        AXPartialPageModal = require(script.Components.AXPartialPageModal)
    }, 
    Hooks = {
        useSlotItemCardBreakpoints = require(script.Hooks.useSlotItemCardBreakpoints), 
        useSlotCustomizeFtux = require(script.Hooks.useSlotCustomizeFtux)
    }, 
    Context = {
        SlotBasedEditorContext = v15, 
        useSlotBasedEditorContext = require(script.Context.useSlotBasedEditorContext), 
        AvatarEditorStores = v16, 
        useAvatarEditorStores = require(script.Context.useAvatarEditorStores)
    }, 
    Stores = {
        createCategoryInventoryStore = v12, 
        createSortAndFiltersStore = v13, 
        createAvatarEditorStores = v14
    }, 
    Enums = {
        ScreenLayout = v4, 
        AvatarEditorCategories = v1, 
        AvatarEditorSubcategories = v2, 
        Categories = v3, 
        ItemView = v5, 
        NavigationParams = v6, 
        InventoryItemType = v8, 
        InventorySorts = v9, 
        InventoryItemAvailability = v10, 
        SlotType = v11
    }, 
    Constants = require(script.Constants), 
    Utils = {
        buildStringsToLocalize = require(script.Utils.buildStringsToLocalize), 
        buildSlots = require(script.Utils.buildSlots), 
        getAssetTypesByCategory = require(script.Utils.getAssetTypesByCategory), 
        buildBodySlotViewportProps = require(script.Utils.buildBodySlotViewportProps), 
        getRemainingTimeFromExpiration = require(script.Utils.getRemainingTimeFromExpiration)
    }, 
    ["jest.config"] = script["jest.config"]
};
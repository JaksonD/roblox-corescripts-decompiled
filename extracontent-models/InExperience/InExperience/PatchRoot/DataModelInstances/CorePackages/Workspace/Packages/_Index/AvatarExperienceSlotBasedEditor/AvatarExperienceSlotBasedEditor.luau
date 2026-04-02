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
local v10 = require(script.Enums.InventoryFilters);
local v11 = require(script.Enums.InventoryItemAvailability);
local v12 = require(script.Enums.SlotType);
local v13 = require(script.Stores.createCategoryInventoryStore);
local v14 = require(script.Stores.createSortAndFiltersStore);
local v15 = require(script.Stores.createAvatarEditorStores);
local v16 = require(script.Stores.createSlotBasedEditorStore);
local v17 = require(script.Context.SlotBasedEditorContext);
local v18 = require(script.Context.AvatarEditorStores);
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
        SlotBasedEditorContext = v17, 
        useSlotBasedEditorContext = require(script.Context.useSlotBasedEditorContext), 
        AvatarEditorStores = v18, 
        useAvatarEditorStores = require(script.Context.useAvatarEditorStores)
    }, 
    Stores = {
        createCategoryInventoryStore = v13, 
        createSortAndFiltersStore = v14, 
        createAvatarEditorStores = v15, 
        createSlotBasedEditorStore = v16
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
        InventoryFilters = v10, 
        InventoryItemAvailability = v11, 
        SlotType = v12
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
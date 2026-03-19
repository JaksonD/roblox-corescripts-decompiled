local v0 = require(script.CollectionViewTypes);
local v1 = require(script.Grid.CollectionGrid);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(script.Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext;
return {
    ["jest.config"] = script["jest.config"], 
    CollectionCarousel = require(script.Carousel.CollectionCarousel), 
    CollectionGrid = v1, 
    CollectionViewTypes = v0, 
    CollectionLayoutCalculators = require(script.CollectionLayoutCalculators), 
    calculateItemWidth = require(script.calculateItemWidth), 
    calculateNumColumns = require(script.calculateNumColumns), 
    useCollectionLayoutParams = require(script.useCollectionLayoutParams), 
    useCollectionLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then require(script.useCollectionLayoutConfig) else nil, 
    useCollectionImpressionsSignal = require(script.useCollectionImpressionsSignal), 
    usePageSideMargin = require(script.usePageSideMargin), 
    useCollectionSizeBindings = require(script.useCollectionSizeBindings), 
    maybeForceDarkTheme = require(script.maybeForceDarkTheme), 
    CarouselScrollButtons = require(script.Carousel.CarouselScrollButtons), 
    CollectionHeader = require(script.CollectionHeader), 
    checkAndFormatPossibleLink = require(script.checkAndFormatPossibleLink), 
    CollectionItemSize = v0.CollectionItemSize, 
    useCollectionLayout = require(script.CollectionLayoutStore.useCollectionLayout), 
    CollectionLayoutStoreProvider = require(script.CollectionLayoutStore.CollectionLayoutStoreProvider), 
    getItemsPerRow = require(script.CollectionLayoutStore.getItemsPerRow), 
    getMainCollectionLayoutStore = require(script.CollectionLayoutStore.getMainCollectionLayoutStore)
};
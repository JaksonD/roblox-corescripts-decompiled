local l_Parent_0 = script.Parent;
local l_FFlagLuaAppRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppRfySignalApportioning;
local v2 = require(script.Parent.SduiCoreSystem);
return {
    ["jest.config"] = script["jest.config"], 
    SduiComponent = v2.SduiComponent, 
    SduiComponentType = v2.SduiComponentType, 
    SduiOmniFeedItem = require(script.Migration.SduiOmniFeedItem), 
    SduiSeeAllGrid = require(script.Migration.SduiSeeAllGrid), 
    AddSduiRootConfig = require(script.Rodux.AddSduiRootConfig), 
    RemoveSduiRootConfig = require(script.Rodux.RemoveSduiRootConfig), 
    SduiConfigReducer = require(script.Rodux.SduiConfigReducer), 
    useSduiContext = require(script.System.useSduiContext), 
    isSduiGameOmniFeedItem = require(script.Migration.isSduiGameOmniFeedItem), 
    useSduiContextFromRoduxAndProcessConfigs = require(script.Migration.useSduiContextFromRoduxAndProcessConfigs), 
    useApportioningPreprocessingFromOmniRecommendations = if l_FFlagLuaAppRfySignalApportioning_0 then require(script.Migration.useApportioningPreprocessingFromOmniRecommendations) else nil, 
    validateSduiComponentConfig = v2.validateSduiComponentConfig, 
    useSduiContextFromSignalAndProcessConfigs = require(script.Migration.useSduiContextFromSignalAndProcessConfigs), 
    getSduiFeedStore = require(script.DataStore.getSduiFeedStore), 
    useSduiEdpFeedItemConfigs = require(script.Migration.useSduiEdpFeedItemConfigs), 
    SduiErrors = v2.SduiErrors, 
    SduiLogger = v2.SduiLogger, 
    SduiDiscoveryDependencyUpdater = require(script.System.SduiDiscoveryDependencyUpdater), 
    ItemHeightMode = require(script.Content.Collections.ItemHeightMode)
};
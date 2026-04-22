local v0 = require(script.Common.Constants);
return {
    ["jest.config"] = script["jest.config"], 
    RoduxKey = v0.RODUX_KEY, 
    installReducer = require(script.Rodux.installReducer), 
    SocialTabsPage = require(script.Components.SocialTabsPage), 
    SocialTabsPageNavigator = require(script.Navigation.SocialTabsPageNavigator), 
    SocialTabsContext = require(script.Contexts.SocialTabsContext), 
    useSocialTabsContext = require(script.Contexts.useSocialTabsContext)
};
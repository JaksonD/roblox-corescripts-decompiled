local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local l_FFlagAppIaHomeSubTab_0 = require(l_Parent_0.SharedFlags).FFlagAppIaHomeSubTab;
return {
    ModerationOverlay = "ModerationOverlay", 
    CentralOverlay = "CentralOverlay", 
    NavBar = "NavBar", 
    RouterView = "RouterView", 
    SubRouterView = "SubRouterView", 
    SearchBar = "SearchBar", 
    ContextualMenu = "ContextualMenu", 
    PopUp = "PopUp", 
    PeekView = "PeekView", 
    Auxiliary = "Auxiliary", 
    HeaderView = l_FFlagAppIaHomeSubTab_0 and "HeaderView" or nil
};
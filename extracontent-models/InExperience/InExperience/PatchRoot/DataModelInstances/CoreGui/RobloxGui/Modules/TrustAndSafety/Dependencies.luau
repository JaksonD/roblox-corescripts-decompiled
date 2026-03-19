local l_CorePackages_0 = game:GetService("CorePackages");
local l_InGameMenu_0 = script.Parent.Parent.InGameMenu;
local v2 = game:DefineFastFlag("SwitchTnSTranslationsPackage", false);
return {
    BarOnTopScrollingFrame = l_InGameMenu_0.Components.BarOnTopScrollingFrame, 
    Divider = l_InGameMenu_0.Components.Divider, 
    FocusHandler = l_InGameMenu_0.Components.Connection.FocusHandler, 
    ThemedTextLabel = l_InGameMenu_0.Components.ThemedTextLabel, 
    PlayerCell = l_InGameMenu_0.Components.PlayerCell, 
    GameIcon = l_InGameMenu_0.Components.GameIcon, 
    PlayerSearchPredicate = l_InGameMenu_0.Utility.PlayerSearchPredicate, 
    SearchBar = l_InGameMenu_0.Components.SearchBar, 
    Localization = if v2 then require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization else require(l_InGameMenu_0.Localization.Localization), 
    LocalizationProvider = l_InGameMenu_0.Localization.LocalizationProvider, 
    withLocalization = l_InGameMenu_0.Localization.withLocalization, 
    playerInterface = script.Parent.Parent.Interfaces.playerInterface
};
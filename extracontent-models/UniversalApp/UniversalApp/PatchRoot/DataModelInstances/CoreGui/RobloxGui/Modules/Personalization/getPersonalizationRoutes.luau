local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v2 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v2.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v2.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v7 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_FFlagEnableTopSongsSort_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppSortDeeplinkFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSortDeeplinkFix;
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local l_FFlagLuaAppBadgeDetailsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgeDetailsEnabled;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_FFlagAppIaHomeSubTab_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaHomeSubTab;
return function() --[[ Line: 28 ]]
    -- upvalues: l_AppPage_0 (copy), l_createLazyComponent_0 (copy), l_Modules_0 (copy), l_GlobalNavDisplayOption_0 (copy), l_ScreenKind_0 (copy), l_CorePackages_0 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v7 (copy), l_default_0 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_FFlagLuaAppBadgeDetailsEnabled_0 (copy), l_FFlagEnableTopSongsSort_0 (copy), l_FFlagLuaAppSortDeeplinkFix_0 (copy)
    local v16 = {
        {
            [l_AppPage_0.GamesList] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 32 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Games.GamesList);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly, 
                    enableFocusRestoration = false
                }
            }
        }, 
        {
            [l_AppPage_0.ExperienceDetail] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 43 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.ExperienceDetails.Navigation.ExperienceDetailsSelector);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        }, 
        {
            [l_AppPage_0.SearchPage] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 54 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Search.AdaptiveSearchPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll, 
                    enableFocusRestoration = false
                }
            }
        }, 
        {
            [l_AppPage_0.GameFilterMenuPeekView] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 66 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.GameFilters).FilterMenuPeekView;
                end), 
                navigationOptions = {
                    transparent = true, 
                    overlayEnabled = false
                }
            }
        }
    };
    if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then
        table.insert(v16, {
            [v7.Constants.HomeContainerName] = {
                getScreen = function() --[[ Line: 80 ]] --[[ Name: getScreen ]]
                    -- upvalues: l_Modules_0 (ref)
                    return (require(l_Modules_0.Personalization.HomeContainer.HomeContainerPage));
                end
            }
        });
    else
        table.insert(v16, {
            [l_AppPage_0.Home] = l_createLazyComponent_0(function() --[[ Line: 87 ]]
                -- upvalues: l_default_0 (ref), l_Modules_0 (ref)
                l_default_0:logEventOnce("lazily_require_home_page");
                return require(l_Modules_0.Personalization.Home.HomePage);
            end)
        });
        table.insert(v16, {
            [l_AppPage_0.Games] = l_createLazyComponent_0(function() --[[ Line: 93 ]]
                -- upvalues: l_Modules_0 (ref)
                return require(l_Modules_0.Personalization.Games.GamesPage);
            end)
        });
    end;
    if l_FFlagLuaAppBadgesSeeAllEnabled_0 then
        table.insert(v16, {
            [l_AppPage_0.BadgesSeeAll] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 102 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.Badges).BadgesSeeAllPage;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen
                }
            }
        });
    end;
    if l_FFlagLuaAppBadgeDetailsEnabled_0 then
        table.insert(v16, {
            [l_AppPage_0.BadgeDetails] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 115 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.Badges).BadgeDetailsPage;
                end), 
                navigationOptions = {
                    transparent = true, 
                    absorbInput = true
                }
            }
        });
    end;
    if l_FFlagEnableTopSongsSort_0 then
        table.insert(v16, {
            [l_AppPage_0.SongDetail] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 129 ]]
                    -- upvalues: l_CorePackages_0 (ref)
                    return require(l_CorePackages_0.Workspace.Packages.SongDetails).SongDetailPage;
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen, 
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll
                }
            }
        });
        table.insert(v16, {
            [l_AppPage_0.SongList] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 141 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.Personalization.Songs.SongGridPage);
                end), 
                navigationOptions = {
                    screenKind = l_ScreenKind_0.FullScreen
                }
            }
        });
    end;
    if l_FFlagLuaAppSortDeeplinkFix_0 then
        table.insert(v16, {
            [l_AppPage_0.DeeplinkGamesList] = {
                screen = l_createLazyComponent_0(function() --[[ Line: 154 ]]
                    -- upvalues: l_Modules_0 (ref)
                    return require(l_Modules_0.LuaApp.Components.Games.DeeplinkGamesListWrapper);
                end), 
                navigationOptions = {
                    globalNavDisplayOption = l_GlobalNavDisplayOption_0.OptionGroupOnly, 
                    enableFocusRestoration = false
                }
            }
        });
    end;
    return v16;
end;
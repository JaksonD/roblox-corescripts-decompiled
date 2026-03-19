local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCatalog").Parent;
local l_AppUserLayers_0 = require(l_Parent_0.ExperimentLayers).AppUserLayers;
return {
    TrendingWidget = l_AppUserLayers_0.AvatarMarketplaceALGOONLYTrendingWidget, 
    ThemedAvatarItemsWidget = l_AppUserLayers_0.AvatarMarketplaceALGOONLYThematicWidget, 
    PersonalizedAvatarLooksWidget = l_AppUserLayers_0.AvatarMarketplaceALGOONLYAvatarWidget, 
    PopularAmongFriendsWidget = l_AppUserLayers_0.AvatarMarketplaceALGOONLYFriendsWidget, 
    CurationWidget = l_AppUserLayers_0.AvatarMarketplaceALGOONLYCurationWidget
};
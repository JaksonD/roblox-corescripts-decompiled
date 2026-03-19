local l_CorePackages_0 = game:GetService("CorePackages");
local l_Images_0 = require(l_CorePackages_0.Packages.UIBlox).App.ImageSet.Images;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v3 = l_Images_0["icons/actions/favoriteOff"];
local v4 = l_Images_0["icons/actions/favoriteOn"];
return function(_, v6, v7) --[[ Line: 11 ]] --[[ Name: useFavoriteButton ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v3 (copy)
    local v8 = l_useLocalization_0({
        favoriteAction = "Feature.Favorites.Label.Favorite"
    });
    return {
        icon = if v6 then v4 else v3, 
        text = v8.favoriteAction, 
        onActivated = v7
    };
end;
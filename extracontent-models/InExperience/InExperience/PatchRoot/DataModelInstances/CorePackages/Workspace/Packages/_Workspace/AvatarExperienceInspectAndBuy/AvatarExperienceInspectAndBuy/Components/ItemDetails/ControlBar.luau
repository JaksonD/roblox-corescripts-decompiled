local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Components.Common.Badge);
local l_Enums_0 = v3.Enums;
local l_FFlagAXUseStarIconForFavorites_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXUseStarIconForFavorites;
return function(v7) --[[ Line: 35 ]] --[[ Name: ControlBar ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), l_FFlagAXUseStarIconForFavorites_0 (copy), l_Enums_0 (copy)
    return v2.createElement(v3.View, {
        tag = "auto-xy row align-x-left align-y-center gap-small", 
        LayoutOrder = v7.LayoutOrder
    }, {
        FavoritesBadge = v2.createElement(v4, {
            icon = if l_FFlagAXUseStarIconForFavorites_0 then l_Enums_0.IconName.Star else l_Enums_0.IconName.Bookmark, 
            iconVariant = v7.favoritesBadge.iconVariant, 
            text = v7.favoritesBadge.text, 
            onActivated = v7.favoritesBadge.onActivated, 
            LayoutOrder = 1
        }), 
        TryOnBadge = if v7.tryOnBadge then v2.createElement(v4, {
            icon = l_Enums_0.IconName.MirrorStanding, 
            iconVariant = v7.tryOnBadge.iconVariant, 
            text = v7.tryOnBadge.text, 
            onActivated = v7.tryOnBadge.onActivated, 
            LayoutOrder = 2
        }) else nil
    });
end;
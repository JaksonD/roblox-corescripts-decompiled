local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.constants);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v5 = {
    size = v1.ICON_SIZE
};
return function(v6) --[[ Line: 20 ]] --[[ Name: LikeButton ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    local v7 = v2.Dictionary.join(v5, v6);
    return v3.createElement(v4.IconButton, {
        icon = v7.isFavorited and "icons/common/ratingFilled_medium" or "icons/common/rating_medium", 
        size = v4.Enums.IconSize.Medium, 
        onActivated = if v7.onFavorite then v7.onFavorite else function() --[[ Line: 26 ]]

        end
    });
end;
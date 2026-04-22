local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local v4 = require(l_script_FirstAncestor_0.Components.Tiles.UserTile);
local v5 = require(l_script_FirstAncestor_0.Components.Tiles.AddFriendsTile);
local v6 = require(l_script_FirstAncestor_0.Components.Tiles.FriendsHintTile);
local v7 = require(l_script_FirstAncestor_0.Components.Tiles.StartSquadTile);
local v8 = require(l_script_FirstAncestor_0.Components.Tiles.ShareQRTile);
local l_FFlagSocialCarouselShareQREnabled_0 = require(l_Parent_0.SharedFlags).FFlagSocialCarouselShareQREnabled;
return {
    [l_Tile_0.Friend] = function(v10, v11, v12, v13, v14) --[[ Line: 13 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4, {
            item = v10, 
            index = v11, 
            itemSize = v12, 
            selectionOrder = v13, 
            onTileContentChanged = v14
        });
    end, 
    [l_Tile_0.Recommendation] = function(v15, v16, v17, v18, v19) --[[ Line: 28 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4, {
            item = v15, 
            index = v16, 
            itemSize = v17, 
            selectionOrder = v18, 
            onTileContentChanged = v19
        });
    end, 
    [l_Tile_0.AddFriends] = function(_, v21, v22, v23, _) --[[ Line: 43 ]]
        -- upvalues: v2 (copy), v5 (copy)
        return v2.createElement(v5, {
            index = v21, 
            itemSize = v22, 
            selectionOrder = v23
        });
    end, 
    [l_Tile_0.FriendsHint] = function(_, v26, v27, v28, _) --[[ Line: 50 ]]
        -- upvalues: v2 (copy), v6 (copy)
        return v2.createElement(v6, {
            index = v26, 
            itemSize = v27, 
            selectionOrder = v28
        });
    end, 
    [l_Tile_0.StartSquad] = function(v30, v31, v32, v33, _) --[[ Line: 57 ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2.createElement(v7, {
            index = v31, 
            item = v30, 
            itemSize = v32, 
            selectionOrder = v33
        });
    end, 
    [l_Tile_0.ShareQR] = l_FFlagSocialCarouselShareQREnabled_0 and function(_, v36, v37, v38, _) --[[ Line: 66 ]]
        -- upvalues: v2 (copy), v8 (copy)
        return v2.createElement(v8, {
            index = v36, 
            itemSize = v37, 
            selectionOrder = v38
        });
    end or nil
};
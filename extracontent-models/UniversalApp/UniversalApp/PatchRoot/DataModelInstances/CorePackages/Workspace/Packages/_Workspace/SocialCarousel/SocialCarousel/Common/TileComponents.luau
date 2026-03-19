local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Tile_0 = require(l_script_FirstAncestor_0.Common.Enums).Tile;
local v4 = require(l_script_FirstAncestor_0.Components.Tiles.UserTile);
local v5 = require(l_script_FirstAncestor_0.Components.Tiles.AddFriendsTile);
local v6 = require(l_script_FirstAncestor_0.Components.Tiles.FriendsHintTile);
local v7 = require(l_script_FirstAncestor_0.Components.Tiles.StartSquadTile);
return {
    [l_Tile_0.Friend] = function(v8, v9, v10, v11, v12) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4, {
            item = v8, 
            index = v9, 
            itemSize = v10, 
            selectionOrder = v11, 
            onTileContentChanged = v12
        });
    end, 
    [l_Tile_0.Recommendation] = function(v13, v14, v15, v16, v17) --[[ Line: 26 ]]
        -- upvalues: v2 (copy), v4 (copy)
        return v2.createElement(v4, {
            item = v13, 
            index = v14, 
            itemSize = v15, 
            selectionOrder = v16, 
            onTileContentChanged = v17
        });
    end, 
    [l_Tile_0.AddFriends] = function(_, v19, v20, v21, _) --[[ Line: 41 ]]
        -- upvalues: v2 (copy), v5 (copy)
        return v2.createElement(v5, {
            index = v19, 
            itemSize = v20, 
            selectionOrder = v21
        });
    end, 
    [l_Tile_0.FriendsHint] = function(_, v24, v25, v26, _) --[[ Line: 48 ]]
        -- upvalues: v2 (copy), v6 (copy)
        return v2.createElement(v6, {
            index = v24, 
            itemSize = v25, 
            selectionOrder = v26
        });
    end, 
    [l_Tile_0.StartSquad] = function(v28, v29, v30, v31, _) --[[ Line: 55 ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2.createElement(v7, {
            index = v29, 
            item = v28, 
            itemSize = v30, 
            selectionOrder = v31
        });
    end
};
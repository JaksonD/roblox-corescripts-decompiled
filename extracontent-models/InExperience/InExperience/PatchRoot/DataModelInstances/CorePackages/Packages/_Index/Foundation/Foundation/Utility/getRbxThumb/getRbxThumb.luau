local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ThumbnailType);
local v2 = require(l_script_FirstAncestor_0.Enums.ThumbnailSize);
local v3 = require(l_script_FirstAncestor_0.Utility.getAssetIdAsNumeric);
local v4 = {
    [v1.Asset] = {
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }, 
    [v1.Avatar] = {
        [v2.Small] = Vector2.new(48, 48), 
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420), 
        [v2.XLarge] = Vector2.new(720, 720)
    }, 
    [v1.AvatarBust] = {
        [v2.Small] = Vector2.new(50, 50), 
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }, 
    [v1.AvatarHeadShot] = {
        [v2.Small] = Vector2.new(48, 48), 
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }, 
    [v1.BadgeIcon] = {
        [v2.Medium] = Vector2.new(150, 150)
    }, 
    [v1.BundleThumbnail] = {
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }, 
    [v1.FontFamily] = {
        [v2.Medium] = Vector2.new(1200, 80)
    }, 
    [v1.GameIcon] = {
        [v2.Small] = Vector2.new(50, 50), 
        [v2.Medium] = Vector2.new(150, 150)
    }, 
    [v1.GamePass] = {
        [v2.Medium] = Vector2.new(150, 150)
    }, 
    [v1.GameThumbnail] = {
        [v2.Small] = Vector2.new(256, 144), 
        [v2.Medium] = Vector2.new(384, 216), 
        [v2.Large] = Vector2.new(480, 270), 
        [v2.XLarge] = Vector2.new(768, 432)
    }, 
    [v1.GroupIcon] = {
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }, 
    [v1.Outfit] = {
        [v2.Medium] = Vector2.new(150, 150), 
        [v2.Large] = Vector2.new(420, 420)
    }
};
return function(v5, v6, v7) --[[ Line: 188 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    local v8 = v4[v5][v7 or v2.Medium];
    local v9 = v3(v6);
    if not v8 then
        warn((("Unsupported size %* for media type: %*, defaulting to %*"):format(v7, v5, v2.Medium)));
        v8 = v4[v5][v2.Medium];
    end;
    return (("rbxthumb://type=%*&id=%*&w=%*&h=%*"):format(v5, v9, v8.X, v8.Y));
end;
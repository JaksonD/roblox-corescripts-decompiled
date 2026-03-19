local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v3 = require(l_script_FirstAncestor_0.Common.tryLoadRbxthumbAsync);
local l_useAsync_0 = v2.useAsync;
local l_useMemo_0 = v1.useMemo;
local v6 = {
    Icon = "Icon", 
    Masthead = "Masthead"
};
local v7 = {
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_blue.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_green.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_magenta.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_orange.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_pink.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_purple.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_turquoise.png", 
    "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_yellow.png"
};
local v8 = {
    [v6.Icon] = Vector2.new(420, 420), 
    [v6.Masthead] = Vector2.new(1440, 456)
};
local function _(v9) --[[ Line: 35 ]] --[[ Name: getFallbackMusicThumbnail ]]
    -- upvalues: v7 (copy)
    if v9 then
        local v10 = nil;
        v10 = if typeof(v9) == "string" then tonumber((v9:match("(%d+)$"))) else v9;
        if v10 then
            return v7[v10 % #v7 + 1];
        end;
    end;
    return "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png";
end;
return function(v12, v13) --[[ Line: 58 ]] --[[ Name: useSongAlbumArt ]]
    -- upvalues: v6 (copy), l_useMemo_0 (copy), v7 (copy), l_useAsync_0 (copy), v8 (copy), v3 (copy)
    local v14 = v13 or v6.Icon;
    local v17 = l_useMemo_0(function() --[[ Line: 61 ]]
        -- upvalues: v12 (copy), v7 (ref)
        local l_v12_0 = v12;
        if l_v12_0 then
            local v16 = nil;
            v16 = if typeof(l_v12_0) == "string" then tonumber((l_v12_0:match("(%d+)$"))) else l_v12_0;
            if v16 then
                return v7[v16 % #v7 + 1];
            end;
        end;
        return "rbxasset://textures/ui/LuaApp/graphic/album_art_fallback_gray.png";
    end, {
        v12
    });
    local v20 = l_useAsync_0(function() --[[ Line: 65 ]]
        -- upvalues: v12 (copy), v8 (ref), v14 (copy), v3 (ref)
        if v12 then
            local v18 = v8[v14];
            local v19 = ("rbxthumb://type=Asset&id=%*&w=%*&h=%*"):format(v12, v18.X, v18.Y);
            if pcall(v3, v19) then
                return v19;
            end;
        end;
        return nil;
    end, {
        v14, 
        v12
    });
    local v21 = l_useMemo_0(function() --[[ Line: 79 ]]
        -- upvalues: v20 (copy), v17 (copy)
        if v20.status == "ok" and v20.value then
            return v20.value;
        else
            return v17;
        end;
    end, {
        v20, 
        v17
    });
    return {
        status = v20.status, 
        value = v21
    };
end;
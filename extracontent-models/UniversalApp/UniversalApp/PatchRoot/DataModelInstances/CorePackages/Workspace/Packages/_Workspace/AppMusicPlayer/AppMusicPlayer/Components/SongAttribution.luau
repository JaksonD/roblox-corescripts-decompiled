local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppMusicPlayer");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v5 = require(l_script_FirstAncestor_0.Enums.SongAttributionVariant);
local l_createNextOrder_0 = v4.createNextOrder;
local l_useTokens_0 = v2.Hooks.useTokens;
local v8 = {
    isLoading = false, 
    variant = v5.Expanded
};
return function(v9) --[[ Line: 32 ]] --[[ Name: SongAttribution ]]
    -- upvalues: v1 (copy), v8 (copy), l_createNextOrder_0 (copy), l_useTokens_0 (copy), v3 (copy), v2 (copy), v5 (copy)
    local v10 = v1.Dictionary.join(v8, v9);
    local v11 = l_createNextOrder_0();
    local v12 = l_useTokens_0();
    return v3.createElement(v2.View, {
        tag = {
            ["auto-xy row shrink flex-between align-y-center"] = true, 
            ["gap-medium"] = v10.variant == v5.Expanded, 
            ["gap-small"] = v10.variant == v5.Compact
        }, 
        testId = "song-attribution-root", 
        LayoutOrder = v10.LayoutOrder
    }, {
        AlbumArt = if not v10.isLoading then v3.createElement(v2.Image, {
            tag = {
                ["bg-surface-100 radius-medium"] = true, 
                ["size-1600-1600"] = v10.variant == v5.Expanded, 
                ["size-800-800"] = v10.variant == v5.Compact
            }, 
            testId = "song-attribution-album-art", 
            Image = v10.albumArt, 
            LayoutOrder = v11(), 
            onActivated = v10.onActivated
        }) else v3.createElement(v2.Skeleton, {
            testId = "song-attribution-album-art-skeleton", 
            Size = UDim2.fromOffset(v12.Size.Size_1600, v12.Size.Size_1600)
        }), 
        Attribution = v3.createElement(v2.View, {
            tag = "auto-xy shrink col gap-xsmall", 
            LayoutOrder = v11()
        }, {
            Title = if not v10.isLoading then v3.createElement(v2.Text, {
                tag = {
                    ["auto-xy text-truncate-end content-emphasis"] = true, 
                    ["text-title-medium"] = v10.variant == v5.Expanded, 
                    ["text-title-small"] = v10.variant == v5.Compact
                }, 
                Text = v10.title, 
                LayoutOrder = v11(), 
                onActivated = v10.onActivated
            }) else v3.createElement(v2.Skeleton, {
                testId = "song-attribution-song-title-skeleton", 
                Size = UDim2.new(1, 0, 0, v12.FontSize.FontSize_300)
            }), 
            Artist = if not v10.isLoading then v3.createElement(v2.Text, {
                tag = {
                    ["auto-xy text-truncate-end content-muted"] = true, 
                    ["text-body-medium"] = v10.variant == v5.Expanded, 
                    ["text-body-small"] = v10.variant == v5.Compact
                }, 
                Text = v10.artist, 
                LayoutOrder = v11(), 
                onActivated = v10.onActivated
            }) else v3.createElement(v2.Skeleton, {
                testId = "song-attribution-artist-name-skeleton", 
                Size = UDim2.new(0.5, 0, 0, v12.FontSize.FontSize_300)
            })
        })
    });
end;
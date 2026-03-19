local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_FlatList_0 = require(l_Parent_0.VirtualizedList).FlatList;
local v6 = require(l_script_FirstAncestor_0.Components.OutfitsRow);
local _ = require(l_script_FirstAncestor_0.types);
local v8 = game:DefineFastInt("AvatarSwitcherGridWindowSize", 10);
local v9 = game:DefineFastInt("AvatarSwitcherGridInitialNumToRender", 10);
local v10 = game:DefineFastInt("AvatarSwitcherGridOnEndReachedThreshold", 200) / 100;
local v11 = if require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes then game:DefineFastInt("AvatarSwitcherTileSize", 98) else 108;
return function(v12) --[[ Line: 35 ]] --[[ Name: OutfitsGrid ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v6 (copy), v11 (copy), v3 (copy), l_FlatList_0 (copy), v8 (copy), v9 (copy), v10 (copy)
    local v13 = l_useTokens_0();
    local v14, v15 = v2.useState(3);
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v12 (copy)
        task.spawn(function() --[[ Line: 41 ]]
            -- upvalues: v12 (ref)
            v12.fetchNextOutfitsPage();
        end);
    end, {});
    local v18 = v2.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: v12 (copy), v14 (copy)
        local v16 = {};
        for v17 = 1, #v12.outfits, v14 do
            table.insert(v16, {
                unpack(v12.outfits, v17, v17 + v14 - 1)
            });
        end;
        return v16;
    end, {
        v12.outfits, 
        v14
    });
    local v20 = v2.useCallback(function(v19) --[[ Line: 55 ]]
        -- upvalues: v2 (ref), v6 (ref), v14 (copy), v12 (copy)
        return v2.createElement(v6, {
            outfits = v19.item, 
            desiredItemsCount = v14, 
            rowNumber = v19.index, 
            disabled = v12.disabled
        });
    end, {
        v14
    });
    local v23 = v2.useCallback(function(v21) --[[ Line: 64 ]]
        -- upvalues: v15 (copy), v11 (ref)
        local l_X_0 = v21.AbsoluteSize.X;
        v15((math.max(3, (math.floor(l_X_0 / v11)))));
    end, {});
    return (v2.createElement(v3.View, {
        tag = "size-full-full", 
        onAbsoluteSizeChanged = v23, 
        padding = {
            left = UDim.new(0, -v13.Padding.XXSmall), 
            right = UDim.new(0, -v13.Padding.XXSmall)
        }
    }, {
        ClipFrame = v2.createElement(v3.View, {
            tag = "size-full-full clip", 
            padding = {
                top = UDim.new(0, v13.Padding.XXSmall), 
                left = UDim.new(0, v13.Padding.XXSmall), 
                right = UDim.new(0, v13.Padding.XXSmall)
            }
        }, {
            OutfitsList = v2.createElement(l_FlatList_0, {
                renderItem = v20, 
                data = v18, 
                onEndReached = v12.fetchNextOutfitsPage, 
                windowSize = v8, 
                initialNumToRender = v9, 
                onEndReachedThreshold = v10, 
                contentContainerStyle = {
                    BackgroundTransparency = 1
                }, 
                style = {
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    ClipsDescendants = false
                }, 
                ListFooterComponent = not v12.lastPageReached and v2.createElement(v3.View, {
                    tag = "size-0-full position-top-center padding-small"
                }, {
                    v2.createElement(v3.Loading)
                })
            })
        })
    }));
end;
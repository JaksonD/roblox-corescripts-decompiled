local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_Skeleton_0 = v2.Skeleton;
local l_Radius_0 = v2.Enums.Radius;
local l_View_0 = v2.View;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useTextSizeOffset_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useTextSizeOffset;
local v8 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_GameTileConstants_0 = v8.GameTileConstants;
local v10 = require(l_CorePackages_0.Workspace.Packages.GameCollections);
local l_useGameCollectionLayoutParams_0 = v10.useGameCollectionLayoutParams;
local l_useGetGameTileHeight_0 = v10.useGetGameTileHeight;
local l_useCollectionSizeBindings_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionSizeBindings;
local v14 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_FIntSearchLandingPageSideMargin_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.Search.FIntSearchLandingPageSideMargin;
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v14.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
SearchLandingPageSkeleton = function(v17) --[[ Line: 39 ]] --[[ Name: SearchLandingPageSkeleton ]]
    -- upvalues: v1 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), v8 (copy), l_GameTileConstants_0 (copy), l_useGetGameTileHeight_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_FIntSearchLandingPageSideMargin_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useCollectionSizeBindings_0 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    local v18, v19 = v1.useState(nil);
    local v20 = l_useTextSizeOffset_0();
    local v21 = l_useTokens_0();
    local l_Narrow_0 = v8.GameTileTypes.GameTileLayoutType.Narrow;
    local v23 = l_GameTileConstants_0.TileTextLines[l_Narrow_0] and l_GameTileConstants_0.TileTextLines[l_Narrow_0].titleTextLines;
    local v24 = l_useGetGameTileHeight_0(true, l_Narrow_0, false, false, false, v20, nil, v23);
    local v25 = if v17.isCompactView then l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 else l_FIntSearchLandingPageSideMargin_0;
    local v26 = l_useGameCollectionLayoutParams_0(l_Narrow_0, v18, false, {
        sideMargin = v25
    }, v17.defaultContainerSize);
    local v27, _, v29, v30 = l_useCollectionSizeBindings_0(v26.numColumns, v26.columnGap, v26.sideMargin, v26.fractionalItemAmount, v24, nil);
    local v35 = v1.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v26 (copy), v1 (ref), l_View_0 (ref), v27 (copy), l_Skeleton_0 (ref), l_Radius_0 (ref), v21 (copy)
        local v31 = {};
        for v32 = 1, v26.numColumns + math.ceil(v26.fractionalItemAmount) do
            v31[("GameTileSkeleton_%*"):format(v32)] = v1.createElement(l_View_0, {
                tag = "col flex-y-between", 
                Size = v27:map(function(v33) --[[ Line: 80 ]]
                    return UDim2.new(0, v33.X, 0, v33.Y);
                end), 
                LayoutOrder = v32
            }, {
                MainView = v1.createElement(l_View_0, {
                    tag = "col align-x-left size-full-0 auto-y", 
                    LayoutOrder = 1
                }, {
                    Icon = v1.createElement(l_View_0, {
                        Size = v27:map(function(v34) --[[ Line: 90 ]]
                            return UDim2.fromOffset(v34.X, v34.X);
                        end), 
                        LayoutOrder = 1
                    }, {
                        IconSkeleton = v1.createElement(l_Skeleton_0, {
                            Size = UDim2.fromScale(1, 1), 
                            radius = l_Radius_0.Medium
                        })
                    }), 
                    PaddingBetweenIconAndTitle = v1.createElement(l_View_0, {
                        Size = UDim2.new(1, 0, 0, v21.Padding.Medium), 
                        LayoutOrder = 2
                    }), 
                    FirstTitleLine = v1.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, v21.Typography.BodyMedium.FontSize), 
                        LayoutOrder = 3
                    }), 
                    PaddingBetweenTitleLines = v1.createElement(l_View_0, {
                        Size = UDim2.new(1, 0, 0, v21.Typography.BodyMedium.LineHeight), 
                        LayoutOrder = 4
                    }), 
                    SecondTitleLine = v1.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.7, 0, 0, v21.Typography.BodyMedium.FontSize), 
                        LayoutOrder = 5
                    })
                }), 
                Rating = v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v21.Size.Size_500), 
                    LayoutOrder = 2
                })
            });
        end;
        return v31;
    end, {
        v26.numColumns, 
        v26.fractionalItemAmount, 
        v21.Typography.BodyMedium.FontSize, 
        v21.Padding.Small, 
        v21.Padding.Medium, 
        v21.Size.Size_500, 
        v21.Typography.BodyMedium.LineHeight, 
        v18
    });
    return v1.createElement(l_View_0, {
        ref = function(v36) --[[ Line: 143 ]] --[[ Name: ref ]]
            -- upvalues: v19 (copy), v30 (copy)
            v19(v36);
            v30(v36);
        end, 
        LayoutOrder = v17.LayoutOrder, 
        Size = v17.Size, 
        ClipsDescendants = true, 
        onAbsoluteSizeChanged = v29
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v1.Change.AbsoluteContentSize] = v17.onAbsoluteContentSizeChanged
        }), 
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v25), 
            PaddingRight = UDim.new(0, v25)
        }), 
        TopPadding = v1.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v17.topPadding or 0), 
            LayoutOrder = 1
        }), 
        TitleSkeleton = v1.createElement(l_Skeleton_0, {
            Size = UDim2.new(0, v21.Size.Size_3000, 0, v21.Typography.HeadingSmall.FontSize), 
            LayoutOrder = 2
        }), 
        PaddingBetweenHeaderAndItems = v1.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v21.Padding.Large), 
            LayoutOrder = 3
        }), 
        CarouselSkeleton = v1.createElement(l_View_0, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = 4
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v26.columnGap)
            })
        }, v35), 
        BottomPadding = v1.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 0, v17.bottomPadding or 0), 
            LayoutOrder = 5
        })
    });
end;
return SearchLandingPageSkeleton;
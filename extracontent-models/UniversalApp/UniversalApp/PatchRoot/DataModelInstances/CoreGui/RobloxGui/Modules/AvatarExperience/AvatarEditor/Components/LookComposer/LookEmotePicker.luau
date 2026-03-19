local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v6.Focusable;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v8.App.Grid.GridMetrics;
local l_useStyle_0 = v8.Core.Style.useStyle;
local v11 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrameWithLoadMore);
local v12 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local v16 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v20 = require(l_Modules_0.AvatarExperience.Common.getEmotesCategory);
local v21 = require(script.Parent.LookEmotePickerTile);
local v22 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLookComposerRecommendedEmotes);
local v23 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXLooksTranslationAudit);
local v24 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXExtractEmotesCategory);
local v25 = nil;
if v24() then
    v25 = v20();
else
    local v26 = v15().AssetTypeToCategorySubcategory[v17.AssetTypeIdStrings.EmoteAnimation];
    if v26 then
        local l_category_0 = v26.category;
        local l_subcategory_0 = v26.subcategory;
        v25 = v16.getAvatarEditorCategoryInfo(l_category_0, l_subcategory_0);
    end;
end;
return function() --[[ Line: 52 ]] --[[ Name: LookEmotePicker ]]
    -- upvalues: v2 (copy), v6 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), v23 (copy), v12 (copy), l_useSelector_0 (copy), v25 (ref), v16 (copy), v17 (copy), v19 (copy), v21 (copy), l_Focusable_0 (copy), v11 (copy), v14 (copy), l_GridMetrics_0 (copy), v18 (copy), v22 (copy), v13 (copy)
    local v29 = v2.useRef(nil);
    local v30 = v2.useRef(nil);
    local v31 = v6.useRefCache();
    local v32 = l_useStyle_0();
    local v33 = l_useDispatch_0();
    local v34 = l_useDesignTokens_0();
    local v35 = if v23() then v12({
        avatarEmoteSelection = "Feature.Avatar.Message.SelectEmote"
    }) else nil;
    local v37 = l_useSelector_0(function(v36) --[[ Line: 66 ]]
        -- upvalues: v25 (ref)
        return not v36.AvatarExperience.AvatarEditor.PageFinished[v25.SearchUuid];
    end);
    local v39 = l_useSelector_0(function(v38) --[[ Line: 69 ]]
        -- upvalues: v25 (ref)
        return v38.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v25.SearchUuid] or {};
    end);
    local v40 = v37 and #v39 == 0;
    local v41 = v32.Font.Header2.RelativeSize * v32.Font.BaseSize;
    local v42 = v16.GridItemHeightGetterWithOptions({
        itemTileType = v17.ItemTileType.AvatarEditorTile, 
        fontHeight = v41
    });
    local v43 = v2.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v33 (copy), v19 (ref), v25 (ref)
        return v33(v19(v25));
    end, {
        v33
    });
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v37 (copy), v43 (copy)
        if v37 then
            v43();
        end;
    end, {});
    local v45 = v2.useCallback(function(v44) --[[ Line: 92 ]]
        -- upvalues: v2 (ref), v21 (ref)
        return v2.createElement(v21, {
            itemId = v44
        });
    end, {});
    return v2.createElement(l_Focusable_0.Frame, {
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
        ref = v29
    }, {
        Header = v2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, v34.Global.Size_600), 
            BackgroundColor3 = v32.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            Text = if v23() then v35.avatarEmoteSelection else "Select an emote to pose your Avatar", 
            Font = v32.Font.Header2.Font, 
            TextSize = v32.Font.BaseSize * v32.Font.Header2.RelativeSize, 
            TextColor3 = v32.Theme.TextDefault.Color, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v34.Global.Space_150)
            })
        }), 
        EmotesScrollingFrame = v2.createElement(v11, {
            Size = UDim2.new(1, 0, 1, -v34.Global.Size_600), 
            Position = UDim2.fromOffset(0, v34.Global.Size_600), 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.fromScale(1, 1), 
            onLoadMore = if v37 then v43 else nil, 
            hasMoreRows = v37, 
            initializing = v40
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            EmotesContainer = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v17.WidgetListHorizontalMargin), 
                    PaddingRight = UDim.new(0, v17.WidgetListHorizontalMargin), 
                    PaddingBottom = UDim.new(0, v17.WidgetListVerticalMargin)
                }), 
                EmotesGridView = v2.createElement(v14, {
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v18.ItemsGridMetrics), 
                    items = v39, 
                    totalNumItems = 0, 
                    renderItem = v45, 
                    getItemHeight = v42, 
                    LayoutOrder = 1
                })
            }), 
            RecommendedEmotes = v22() and v2.createElement(v13, {
                LayoutOrder = 2, 
                categoryInfo = v25, 
                itemDetailsPeekViewRefs = v31, 
                baseRef = v30, 
                listFrameRef = v29, 
                sendShopForMoreAnalytics = function() --[[ Line: 164 ]] --[[ Name: sendShopForMoreAnalytics ]]

                end
            })
        })
    });
end;
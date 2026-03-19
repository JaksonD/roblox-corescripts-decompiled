local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactOtter);
local v4 = require(l_Parent_0.UIBlox);
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v10 = require(script.Parent.Constants);
local _ = require(script.Parent.MediaGalleryTypes);
local v12 = {
    titleText = "Media", 
    numItemsShown = 4, 
    itemAspectRatio = 1.7777777777777777, 
    animationConfig = {
        dampingRatio = 1, 
        frequency = 6.666666666666667
    }, 
    onActivated = function() --[[ Line: 29 ]] --[[ Name: onActivated ]]

    end, 
    onSelectionGained = function() --[[ Line: 30 ]] --[[ Name: onSelectionGained ]]

    end, 
    exitFullscreen = function() --[[ Line: 31 ]] --[[ Name: exitFullscreen ]]

    end
};
return function(v13) --[[ Line: 67 ]] --[[ Name: MediaGalleryExpandableView ]]
    -- upvalues: v1 (copy), v12 (copy), l_useStyle_0 (copy), v10 (copy), v3 (copy), v2 (copy), l_useCursor_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), l_StyledTextLabel_0 (copy)
    local v14 = v1.Dictionary.join(v12, v13);
    local v15 = l_useStyle_0();
    local v16 = v10.getDefaultStyleProps(v15);
    local v17 = v1.Dictionary.join(v16, v14.styleProps or {});
    local l_borderRadius_0 = v17.borderRadius;
    local l_gutter_0 = v17.gutter;
    local l_contentGap_0 = v17.contentGap;
    local l_titleFont_0 = v17.titleFont;
    local l_titleTextColor_0 = v17.titleTextColor;
    local v23, v24 = v3.useAnimatedBinding(0);
    local v25, v26 = v2.useState(Vector2.zero);
    local v33 = v2.useCallback(function(v27, _, _, _) --[[ Line: 83 ]]
        -- upvalues: l_gutter_0 (copy), v14 (copy), v26 (copy)
        local v31 = l_gutter_0 * (v14.numItemsShown - 1);
        local v32 = (v27.AbsoluteSize.X - v31) / v14.numItemsShown;
        v26(Vector2.new(v32, v32 / v14.itemAspectRatio));
    end, {
        l_gutter_0, 
        v14.itemAspectRatio, 
        v14.numItemsShown
    });
    local v43 = v2.useCallback(function(v34, _, v36, v37) --[[ Line: 97 ]]
        -- upvalues: v24 (copy), v3 (ref), v14 (copy)
        if not v34 then
            return nil;
        else
            local v38 = false;
            if v37 ~= nil then
                v38 = v37:IsDescendantOf(v34);
            end;
            local v39 = false;
            if v36 ~= nil then
                v39 = v36:IsDescendantOf(v34);
            end;
            local v40 = v38 and not v39;
            local v41 = not v38 and v39;
            if v40 then
                v24(v3.spring(v14.expandableAreaHeightOffset, v14.animationConfig));
                v14.mediaGalleryGainFocused(true);
                return nil;
            elseif v41 then
                local v42 = false;
                if v37 ~= nil then
                    v42 = v37.AbsolutePosition.Y > v36.AbsolutePosition.Y;
                end;
                if not v42 then
                    v24(v3.spring(0, v14.animationConfig));
                end;
                v14.exitFullscreen();
                v14.mediaGalleryGainFocused(false);
                return nil;
            else
                return nil;
            end;
        end;
    end, {
        v14.expandableAreaHeightOffset, 
        v14.animationConfig, 
        v14.exitFullscreen, 
        v14.mediaGalleryGainFocused
    });
    local v44 = l_useCursor_0(l_borderRadius_0);
    local v45 = l_useSelectionCursor_0(l_CursorKind_0.Invisible);
    local v46 = if v14.showCursor then v44 else v45;
    local v50 = v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v14 (copy), v2 (ref), v25 (copy), v46 (copy), l_borderRadius_0 (copy)
        local v47 = {};
        for v48, v49 in v14.items do
            v47["Item" .. v48] = v2.createElement("ImageButton", {
                LayoutOrder = v48, 
                Size = UDim2.fromOffset(v25.X, v25.Y), 
                Image = v49.imageId, 
                ScaleType = Enum.ScaleType.Crop, 
                BackgroundTransparency = 1, 
                AutoButtonColor = false, 
                SelectionImageObject = v46, 
                [v2.Event.Activated] = function() --[[ Line: 159 ]]
                    -- upvalues: v14 (ref), v48 (copy)
                    v14.onActivated(v48);
                end, 
                [v2.Event.SelectionGained] = function() --[[ Line: 162 ]]
                    -- upvalues: v14 (ref), v48 (copy)
                    v14.onSelectionGained(v48);
                end
            }, {
                Corner = v2.createElement("UICorner", {
                    CornerRadius = l_borderRadius_0
                })
            });
        end;
        return v47;
    end, {
        v25, 
        v14.items, 
        v14.onActivated, 
        v14.onSelectionGained, 
        v46, 
        l_borderRadius_0
    });
    local v51 = if l_titleFont_0.RelativeSize then l_titleFont_0.RelativeSize * v15.Font.BaseSize else l_titleFont_0.FontSize;
    return v2.createElement("CanvasGroup", {
        GroupTransparency = v14.groupTransparency, 
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_contentGap_0)
        }), 
        ExpandableArea = v2.createElement("Frame", {
            Size = v23:map(function(v52) --[[ Line: 199 ]]
                return UDim2.new(1, 0, 0, v52);
            end), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }), 
        Title = v2.createElement(l_StyledTextLabel_0, {
            text = v14.titleText, 
            fontStyle = l_titleFont_0, 
            colorStyle = l_titleTextColor_0, 
            textXAlignment = Enum.TextXAlignment.Left, 
            size = UDim2.new(1, 0, 0, v51), 
            layoutOrder = 2
        }), 
        MediaGallery = v2.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 0, v25.Y), 
            BackgroundTransparency = 1, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ScrollBarImageTransparency = 1, 
            ScrollBarThickness = 0, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            Selectable = false, 
            LayoutOrder = 3, 
            [v2.Change.AbsoluteSize] = v33, 
            [v2.Event.SelectionChanged] = v43
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, l_gutter_0)
            }), 
            Items = v2.createElement(v2.Fragment, {}, v50)
        })
    });
end;
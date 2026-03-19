local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local _ = require(script.Parent.MediaGalleryTypes);
local v9 = UDim2.fromScale(0.4, 0.512);
local v10 = UDim2.fromScale(0.25, 0.33);
local v11 = {
    numItemsShown = 3.5, 
    itemAspectRatio = 1.7777777777777777, 
    itemPadding = 16, 
    borderRadius = UDim.new(0, 8)
};
return function(v12) --[[ Line: 40 ]] --[[ Name: MediaGalleryCarousel ]]
    -- upvalues: v1 (copy), v11 (copy), v2 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), v9 (copy), l_ImageSetLabel_0 (copy), v10 (copy), l_Images_0 (copy)
    local v13 = v1.Dictionary.join(v11, v12);
    local v14, v15 = v2.useState(Vector2.zero);
    local v19 = v2.useCallback(function(v16) --[[ Line: 44 ]]
        -- upvalues: v13 (copy), v15 (copy)
        local v17 = v13.itemPadding * (v13.numItemsShown - 1);
        local v18 = (v16.AbsoluteSize.X - v17) / v13.numItemsShown;
        v15(Vector2.new(v18, v18 / v13.itemAspectRatio));
    end, {
        v13.itemAspectRatio, 
        v13.numItemsShown
    });
    local v21 = v2.useCallback(function(v20) --[[ Line: 55 ]]
        -- upvalues: v13 (copy)
        if v13.onVideoPlayActivated and v13.items[v20].isYouTubeVideo then
            return v13.onVideoPlayActivated(v20);
        elseif v13.onPreviewActivated then
            return v13.onPreviewActivated(v20);
        else
            return;
        end;
    end, {
        v13.items, 
        v13.onVideoPlayActivated, 
        v13.onPreviewActivated
    });
    local v22 = {};
    for v23, v24 in v13.items do
        v22["Item" .. v23] = v2.createElement("ImageButton", {
            LayoutOrder = v23, 
            Size = UDim2.fromOffset(v14.X, v14.Y), 
            Image = v24.imageId, 
            ScaleType = Enum.ScaleType.Crop, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v2.Event.Activated] = function() --[[ Line: 82 ]]
                -- upvalues: v21 (copy), v23 (copy)
                v21(v23);
            end
        }, {
            Corner = v2.createElement("UICorner", {
                CornerRadius = v13.borderRadius
            }), 
            PlayButton = if v24.isYouTubeVideo then v2.createElement(l_Button_0, {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                size = v9, 
                anchorPoint = Vector2.new(0.5, 0.5), 
                position = UDim2.fromScale(0.5, 0.5), 
                onActivated = function() --[[ Line: 95 ]] --[[ Name: onActivated ]]
                    -- upvalues: v21 (copy), v23 (copy)
                    v21(v23);
                end
            }) else nil, 
            PlayIcon = if v24.isYouTubeVideo then v2.createElement(l_ImageSetLabel_0, {
                Size = v10, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Image = l_Images_0["icons/common/play"], 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }) else nil
        });
    end;
    return v2.createElement("ScrollingFrame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        AutomaticCanvasSize = Enum.AutomaticSize.XY, 
        ScrollBarImageTransparency = 1, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        ClipsDescendants = false, 
        [v2.Change.AbsoluteSize] = v19
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, v13.itemPadding)
        }), 
        Items = v2.createElement(v2.Fragment, {}, v22)
    });
end;
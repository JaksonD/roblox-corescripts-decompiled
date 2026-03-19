local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v6 = require(l_Modules_0.LuaApp.Components.ListCell);
local v7 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v8 = Rect.new(8, 8, 9, 9);
local v9 = v2.PureComponent:extend("ListCellMenu");
v9.defaultProps = {
    itemHeight = 66, 
    maxHeight = 10000, 
    visibleItem = 5.58
};
v9.init = function(v10) --[[ Line: 26 ]] --[[ Name: init ]]
    -- upvalues: l_FormFactor_0 (copy)
    v10.onCanvasSizeChanged = function(v11) --[[ Line: 27 ]]
        -- upvalues: v10 (copy), l_FormFactor_0 (ref)
        local l_Offset_0 = v11.CanvasSize.Y.Offset;
        local l_maxHeight_0 = v10.props.maxHeight;
        local l_formFactor_0 = v10.props.formFactor;
        local l_itemHeight_0 = v10.props.itemHeight;
        local l_screenHeight_0 = v10.props.screenHeight;
        local l_visibleItem_0 = v10.props.visibleItem;
        l_maxHeight_0 = if l_formFactor_0 == l_FormFactor_0.COMPACT then math.min(l_maxHeight_0, l_visibleItem_0 * l_itemHeight_0) else math.min(l_maxHeight_0, l_screenHeight_0 * 0.5);
        if l_Offset_0 <= l_maxHeight_0 then
            v11.ScrollingEnabled = false;
        else
            v11.ScrollingEnabled = true;
            l_Offset_0 = l_maxHeight_0;
        end;
        v11.Size = UDim2.new(0, v10.props.width, 0, l_Offset_0);
    end;
end;
v9.render = function(v18) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v6 (copy), v4 (copy), v8 (copy)
    local l_items_0 = v18.props.items;
    local l_layoutOrder_0 = v18.props.layoutOrder;
    local v21 = UDim2.new(0, v18.props.width, 0, 0);
    local l_ContextualMenu_0 = v18.props.appTheme.ContextualMenu;
    local v23 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v24 = 0;
    for v25, v26 in ipairs(l_items_0) do
        v24 = v24 + 1;
        v23["Item_" .. v25] = v2.createElement(v6, {
            item = v26, 
            layoutOrder = v24
        });
        if v25 < #l_items_0 then
            v24 = v24 + 1;
            v23["Divider_" .. v25] = v2.createElement("Frame", {
                BackgroundColor3 = l_ContextualMenu_0.Divider.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                LayoutOrder = v24, 
                Size = UDim2.new(1, 0, 0, 1)
            });
        end;
    end;
    return v2.createElement(v4.FitImageLabel, {
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Image = "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_ContextualMenu_0.Background.Color, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v8, 
        fitAxis = v4.FitAxis.Both, 
        LayoutOrder = l_layoutOrder_0
    }, {
        ScrollingFrame = v2.createElement(v4.FitScrollingFrame, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            Size = v21, 
            fitFields = {
                CanvasSize = v4.FitAxis.Height
            }, 
            [v2.Change.CanvasSize] = v18.onCanvasSizeChanged
        }, v23)
    });
end;
return (v7((v3.connect(function(v27, _) --[[ Line: 110 ]]
    return {
        formFactor = v27.FormFactor, 
        screenWidth = v27.ScreenSize.X, 
        screenHeight = v27.ScreenSize.Y
    };
end)(v9))));
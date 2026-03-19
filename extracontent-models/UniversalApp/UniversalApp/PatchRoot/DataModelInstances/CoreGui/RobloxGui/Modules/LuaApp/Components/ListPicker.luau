local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v7 = require(l_Modules_0.LuaApp.Components.ListPickerItem);
game:DefineFastInt("AutomaticSizingListPickerHotfix", 0);
local v8 = v2.PureComponent:extend("ListPicker");
v8.defaultProps = {
    itemHeight = 54, 
    maxHeight = 10000, 
    visibleItem = 5.58, 
    Selectable = false
};
v8.init = function(v9) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: l_FormFactor_0 (copy)
    v9.onCanvasSizeChanged = function(v10) --[[ Line: 30 ]]
        -- upvalues: v9 (copy), l_FormFactor_0 (ref)
        local l_Offset_0 = v10.CanvasSize.Y.Offset;
        local l_maxHeight_0 = v9.props.maxHeight;
        local l_formFactor_0 = v9.props.formFactor;
        local l_itemHeight_0 = v9.props.itemHeight;
        local l_screenHeight_0 = v9.props.screenHeight;
        local l_visibleItem_0 = v9.props.visibleItem;
        l_maxHeight_0 = if l_formFactor_0 == l_FormFactor_0.COMPACT then math.min(l_maxHeight_0, l_visibleItem_0 * l_itemHeight_0) else math.min(l_maxHeight_0, l_screenHeight_0 * 0.5);
        if l_Offset_0 <= l_maxHeight_0 then
            v9:setState({
                scrollingEnabled = false, 
                canvasSizeYOffset = l_Offset_0
            });
            return;
        else
            v9:setState({
                scrollingEnabled = true, 
                canvasSizeYOffset = l_maxHeight_0
            });
            return;
        end;
    end;
    v9:setState({
        scrollingEnabled = false, 
        canvasSizeYOffset = 0
    });
end;
v8.render = function(v17) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v7 (copy), l_withStyle_0 (copy), v5 (copy)
    local l_items_0 = v17.props.items;
    local l_layoutOrder_0 = v17.props.layoutOrder;
    local l_width_0 = v17.props.width;
    local l_canvasSizeYOffset_0 = v17.state.canvasSizeYOffset;
    local l_scrollingEnabled_0 = v17.state.scrollingEnabled;
    local v23 = UDim2.fromOffset(l_width_0, l_canvasSizeYOffset_0);
    local v24 = {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    for v25, v26 in ipairs(l_items_0) do
        v24[v25] = v2.createElement(v7, {
            item = v26, 
            layoutOrder = v25, 
            separatorEnabled = v25 < #l_items_0
        });
    end;
    return l_withStyle_0(function(v27) --[[ Line: 87 ]]
        -- upvalues: v2 (ref), v5 (ref), l_layoutOrder_0 (copy), v23 (copy), l_scrollingEnabled_0 (copy), v17 (copy), v24 (copy)
        return v2.createElement(v5.FitScrollingFrame, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v27.Theme.BackgroundUIDefault.Color, 
            BackgroundTransparency = v27.Theme.BackgroundUIDefault.Transparency, 
            LayoutOrder = l_layoutOrder_0, 
            ScrollBarThickness = 0, 
            Size = v23, 
            ScrollingEnabled = l_scrollingEnabled_0, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            fitFields = {
                CanvasSize = v5.FitAxis.Height
            }, 
            [v2.Change.CanvasSize] = v17.onCanvasSizeChanged, 
            Selectable = v17.props.Selectable
        }, v24);
    end);
end;
return (v3.connect(function(v28, _) --[[ Line: 106 ]]
    return {
        formFactor = v28.FormFactor, 
        screenWidth = v28.ScreenSize.X, 
        screenHeight = v28.ScreenSize.Y
    };
end)(v8));
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local l_FitFrameVertical_0 = require(l_Parent_3.FitFrame).FitFrameVertical;
local v7 = require(l_Parent_1.ImageSet.Images);
local v8 = require(l_Parent_2.Core.Style.withStyle);
local v9 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v10 = require(l_Parent_0.getModalWindowWidth);
local v11 = Rect.new(8, 8, 9, 9);
local v12 = v4.PureComponent:extend("ModalWindow");
v12.validateProps = v5.strictInterface({
    isFullHeight = v5.boolean, 
    screenSize = v5.Vector2, 
    [v4.Children] = v5.table, 
    position = v5.optional(v5.UDim2), 
    anchorPoint = v5.optional(v5.Vector2), 
    distanceFromTop = v5.optional(v5.number)
});
v12.defaultProps = {
    distanceFromTop = 0
};
v12.init = function(v13) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    local v14, v15 = v4.createBinding(Vector2.new(0, 0));
    v13.contentSize = v14;
    v13.changeContentSize = v15;
end;
v12.isFullWidth = function(_, v17) --[[ Line: 53 ]] --[[ Name: isFullWidth ]]
    return v17 < 540;
end;
v12.render = function(v18) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v10 (copy), v4 (copy), v9 (copy), v7 (copy), v11 (copy), l_FitFrameVertical_0 (copy)
    return v8(function(v19) --[[ Line: 58 ]]
        -- upvalues: v18 (copy), v10 (ref), v4 (ref), v9 (ref), v7 (ref), v11 (ref), l_FitFrameVertical_0 (ref)
        local l_Theme_0 = v19.Theme;
        local l_screenSize_0 = v18.props.screenSize;
        local v22 = nil;
        local v23 = nil;
        local v24 = nil;
        local v25 = nil;
        v25 = UDim.new(0, v10(l_screenSize_0.X));
        if v18:isFullWidth(l_screenSize_0.X) then
            v22 = Vector2.new(0.5, 1);
            v23 = "component_assets/bullet_17";
            v24 = v18.props.position or UDim2.new(0.5, 0, 1, 0);
        else
            v22 = Vector2.new(0.5, 0.5);
            v23 = "component_assets/circle_17";
            v24 = v18.props.position or UDim2.new(0.5, 0, 0.5, 0);
        end;
        v22 = v18.props.anchorPoint or v22;
        if v18.props.isFullHeight then
            local v26 = nil;
            if v18.props.distanceFromTop > 0 then
                v26 = UDim.new(1, -v18.props.distanceFromTop);
            else
                v26 = UDim.new(1, 0);
                if l_screenSize_0.X >= 540 and l_screenSize_0.Y >= 700 then
                    v26 = UDim.new(0.8, 0);
                end;
            end;
            return v4.createElement(v9.Button, {
                Position = v24, 
                Size = UDim2.new(v25, v26), 
                AnchorPoint = v22, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v7[v23], 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v11, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                Selectable = false
            }, {
                BackgroundImage = v4.createElement(v9.Label, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, v18.props[v4.Children])
            });
        else
            return v4.createElement(v9.Button, {
                Position = v24, 
                Size = v18.contentSize:map(function(v27) --[[ Line: 112 ]]
                    return UDim2.new(0, v27.X, 0, v27.Y);
                end), 
                AnchorPoint = v22, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v7[v23], 
                ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v11, 
                AutoButtonColor = false, 
                ClipsDescendants = true, 
                Selectable = false
            }, {
                BackgroundImage = v4.createElement(l_FitFrameVertical_0, {
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    width = v25, 
                    [v4.Change.AbsoluteSize] = function(v28) --[[ Line: 133 ]]
                        -- upvalues: v18 (ref)
                        v18.changeContentSize(v28.AbsoluteSize);
                    end
                }, v18.props[v4.Children])
            });
        end;
    end);
end;
return v12;
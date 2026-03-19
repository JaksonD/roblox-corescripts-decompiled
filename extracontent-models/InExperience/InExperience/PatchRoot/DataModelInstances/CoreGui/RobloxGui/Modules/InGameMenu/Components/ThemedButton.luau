local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.Utility.divideTransparency);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local v12 = l_Roact_0.PureComponent:extend("ThemedButton");
v12.validateProps = l_t_0.strictInterface({
    normalThemeKey = l_t_0.string, 
    hoverThemeKey = l_t_0.string, 
    imageProps = l_t_0.strictInterface({
        Image = l_t_0.union(l_t_0.string, l_t_0.table), 
        ScaleType = l_t_0.enum(Enum.ScaleType), 
        SliceCenter = l_t_0.Rect
    }), 
    enabled = l_t_0.optional(l_t_0.boolean), 
    renderChildren = l_t_0.callback, 
    onActivated = l_t_0.callback, 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    ButtonRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
});
v12.defaultProps = {
    imageProps = v6.Images.RoundedRect, 
    enabled = true
};
v12.init = function(v13) --[[ Line: 67 ]] --[[ Name: init ]]
    v13:setState({
        hover = false, 
        press = false
    });
end;
v12.renderWithSelectionCursor = function(v14, v15) --[[ Line: 74 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), v7 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), l_CursorKind_0 (copy)
    local l_props_0 = v14.props;
    local l_normalThemeKey_0 = l_props_0.normalThemeKey;
    if l_props_0.enabled and v14.state.hover then
        l_normalThemeKey_0 = l_props_0.hoverThemeKey;
    end;
    return l_withStyle_0(function(v18) --[[ Line: 82 ]]
        -- upvalues: l_normalThemeKey_0 (ref), v7 (ref), v14 (copy), l_props_0 (copy), l_Roact_0 (ref), l_ImageSetButton_0 (ref), v15 (copy), l_CursorKind_0 (ref)
        local v19 = v18.Theme[l_normalThemeKey_0];
        assert(v19 ~= nil, "theme key " .. l_normalThemeKey_0 .. " is nil");
        local v20 = v7(v19.Transparency, v14.state.press and 2 or 1);
        if not l_props_0.enabled then
            v20 = 0.5;
        end;
        return l_Roact_0.createElement(l_ImageSetButton_0, {
            Visible = l_props_0.Visible, 
            BackgroundTransparency = 1, 
            ImageColor3 = v19.Color, 
            Position = l_props_0.Position, 
            Size = l_props_0.Size, 
            AnchorPoint = l_props_0.AnchorPoint, 
            ImageTransparency = v20, 
            LayoutOrder = l_props_0.LayoutOrder, 
            ScaleType = l_props_0.imageProps.ScaleType, 
            SliceCenter = l_props_0.imageProps.SliceCenter, 
            Image = l_props_0.imageProps.Image, 
            SelectionImageObject = v15(l_CursorKind_0.RoundedRectNoInset), 
            [l_Roact_0.Event.Activated] = function() --[[ Line: 102 ]]
                -- upvalues: l_props_0 (ref)
                if l_props_0.enabled then
                    l_props_0.onActivated();
                end;
            end, 
            [l_Roact_0.Event.MouseEnter] = function() --[[ Line: 107 ]]
                -- upvalues: v14 (ref)
                v14:setState({
                    hover = true
                });
            end, 
            [l_Roact_0.Event.MouseLeave] = function() --[[ Line: 112 ]]
                -- upvalues: v14 (ref)
                v14:setState({
                    hover = false, 
                    press = false
                });
            end, 
            [l_Roact_0.Event.InputBegan] = function(_, v22) --[[ Line: 118 ]]
                -- upvalues: v14 (ref)
                if v22.UserInputType == Enum.UserInputType.MouseButton1 or v22.UserInputType == Enum.UserInputType.Touch then
                    v14:setState({
                        press = true
                    });
                end;
            end, 
            [l_Roact_0.Event.InputEnded] = function(_, v24) --[[ Line: 128 ]]
                -- upvalues: v14 (ref)
                if v24.UserInputType == Enum.UserInputType.MouseButton1 or v24.UserInputType == Enum.UserInputType.Touch then
                    v14:setState({
                        press = false
                    });
                end;
            end, 
            [l_Roact_0.Ref] = v14.props.ButtonRef
        }, l_props_0.renderChildren(v20, l_props_0.enabled and v14.state.hover, l_props_0.enabled and v14.state.press));
    end);
end;
v12.render = function(v25) --[[ Line: 143 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v26) --[[ Line: 144 ]]
        -- upvalues: v25 (copy)
        return v25:renderWithSelectionCursor(v26);
    end);
end;
return v12;
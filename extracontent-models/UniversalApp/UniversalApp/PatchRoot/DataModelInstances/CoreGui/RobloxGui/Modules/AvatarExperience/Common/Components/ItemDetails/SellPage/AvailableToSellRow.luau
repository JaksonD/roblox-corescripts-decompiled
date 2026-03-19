local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v3.Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_withStyle_0 = v5.Style.withStyle;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRemoveSellPageAndChildrenGamepadBindings;
local v12 = l_Images_0["icons/actions/edit/add"];
local v13 = v2.PureComponent:extend("AvailableToSellRow");
v13.defaultProps = {
    horizontalPadding = 24, 
    onActivated = function() --[[ Line: 36 ]] --[[ Name: onActivated ]]

    end
};
v13.render = function(v14) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy), v2 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v12 (copy)
    return l_withStyle_0(function(v15) --[[ Line: 40 ]]
        -- upvalues: v14 (copy), l_withSelectionCursorProvider_0 (ref), v2 (ref), l_Focusable_0 (ref), l_CursorKind_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v3 (ref), l_ImageSetLabel_0 (ref), v12 (ref)
        local l_Font_0 = v15.Font;
        local l_Theme_0 = v15.Theme;
        local l_Position_0 = v14.props.Position;
        local l_LayoutOrder_0 = v14.props.LayoutOrder;
        local l_horizontalPadding_0 = v14.props.horizontalPadding;
        local l_onActivated_0 = v14.props.onActivated;
        local v22 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_Text_0 = v14.props.Text;
        local l_forwardRef_0 = v14.props.forwardRef;
        return l_withSelectionCursorProvider_0(function(v25) --[[ Line: 54 ]]
            -- upvalues: v2 (ref), l_Focusable_0 (ref), l_LayoutOrder_0 (copy), l_Position_0 (copy), v14 (ref), l_forwardRef_0 (copy), l_CursorKind_0 (ref), l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 (ref), v3 (ref), l_onActivated_0 (copy), l_horizontalPadding_0 (copy), l_Font_0 (copy), l_Text_0 (copy), l_Theme_0 (copy), v22 (copy), l_ImageSetLabel_0 (ref), v12 (ref)
            return v2.createElement(l_Focusable_0.Frame, {
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0, 
                Position = l_Position_0, 
                Size = UDim2.new(1, 0, 0, 70), 
                NextSelectionLeft = v14.props.NextSelectionLeft, 
                NextSelectionRight = v14.props.NextSelectionRight, 
                NextSelectionUp = v14.props.NextSelectionUp, 
                NextSelectionDown = v14.props.NextSelectionDown, 
                [v2.Ref] = l_forwardRef_0, 
                SelectionImageObject = v25(l_CursorKind_0.RoundedRectNoInset), 
                inputBindings = if l_FFlagAXRemoveSellPageAndChildrenGamepadBindings_0 then nil else {
                    SellItem = v3.Input.onBegin(Enum.KeyCode.ButtonA, l_onActivated_0)
                }
            }, {
                Paddding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_horizontalPadding_0), 
                    PaddingRight = UDim.new(0, l_horizontalPadding_0)
                }), 
                TextLabel = v2.createElement("TextLabel", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Font = l_Font_0.Body.Font, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    Size = UDim2.new(1, -50, 1, 0), 
                    Text = l_Text_0, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextSize = v22, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                PressableButton = v2.createElement("TextButton", {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(1, -50, 0.5, 0), 
                    Size = UDim2.new(0, 50, 0, 50), 
                    Text = "", 
                    [v2.Event.Activated] = l_onActivated_0
                }, {
                    RemoveButton = v2.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = v12, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        LayoutOrder = 2, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        Size = UDim2.new(0, 40, 0, 40)
                    })
                })
            });
        end);
    end);
end;
return v2.forwardRef(function(v26, v27) --[[ Line: 118 ]]
    -- upvalues: v2 (copy), v13 (copy), v1 (copy)
    return v2.createElement(v13, v1.Dictionary.join(v26, {
        forwardRef = v27
    }));
end);
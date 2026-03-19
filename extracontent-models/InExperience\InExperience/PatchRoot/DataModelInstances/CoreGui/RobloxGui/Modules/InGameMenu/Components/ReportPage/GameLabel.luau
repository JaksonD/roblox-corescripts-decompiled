local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_Cryo_0 = v1.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local v11 = require(l_Parent_0.Resources.Assets);
local v12 = require(l_CorePackages_0.Packages.React);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v14 = l_Roact_0.PureComponent:extend("GameLabel");
v14.validateProps = l_t_0.strictInterface({
    gameId = l_t_0.number, 
    gameName = l_t_0.string, 
    LayoutOrder = l_t_0.integer, 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    buttonRef = l_t_0.optional(l_t_0.table)
});
v14.renderButtons = function(v15) --[[ Line: 42 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v16 = v15.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v16, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v14.renderWithSelectionCursor = function(v17, v18) --[[ Line: 57 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v11 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), v12 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v10 (copy)
    local l_gameId_0 = v17.props.gameId;
    local l_PlaceholderGameIcon_0 = v11.Images.PlaceholderGameIcon;
    if v17.props.gameId > 0 then
        l_PlaceholderGameIcon_0 = "rbxthumb://type=GameIcon&id=" .. l_gameId_0 .. "&w=150&h=150";
    end;
    return l_withStyle_0(function(_) --[[ Line: 64 ]]
        -- upvalues: l_Roact_0 (ref), v12 (ref), v17 (copy), v18 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), l_PlaceholderGameIcon_0 (ref), v10 (ref)
        return l_Roact_0.createElement("TextButton", {
            [v12.Tag] = "data-testid=experienceLabel", 
            BackgroundTransparency = 1, 
            LayoutOrder = v17.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 70), 
            Text = "", 
            AutoButtonColor = false, 
            SelectionImageObject = v18(l_CursorKind_0.Square), 
            [l_Roact_0.Ref] = v17.props.buttonRef, 
            [l_Roact_0.Event.Activated] = v17.props.onActivated
        }, {
            GameIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 24, 0.5, 0), 
                Size = UDim2.new(0, 44, 0, 44), 
                BackgroundTransparency = 1, 
                Image = l_PlaceholderGameIcon_0
            }), 
            GameNameLabel = l_Roact_0.createElement(v10, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 80, 0.5, 0), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = v17.props.gameName, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v17:renderButtons())
        });
    end);
end;
v14.render = function(v22) --[[ Line: 106 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v23) --[[ Line: 107 ]]
        -- upvalues: v22 (copy)
        return v22:renderWithSelectionCursor(v23);
    end);
end;
return l_Roact_0.forwardRef(function(v24, v25) --[[ Line: 112 ]]
    -- upvalues: l_Roact_0 (copy), v14 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v14, l_Cryo_0.Dictionary.join(v24, {
        buttonRef = v25
    }));
end);
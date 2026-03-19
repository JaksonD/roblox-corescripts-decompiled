local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Localization.withLocalization);
local v11 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = l_Roact_0.PureComponent:extend("SearchBox");
v13.validateProps = l_t_0.strictInterface({
    Size = l_t_0.UDim2, 
    Position = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2, 
    searchUpdated = l_t_0.callback, 
    searchCleared = l_t_0.callback, 
    itemRef = l_t_0.optional(l_t_0.table)
});
v13.init = function(v14) --[[ Line: 41 ]] --[[ Name: init ]]
    v14.state = {
        searchText = ""
    };
end;
v13.renderWithSelectionCursor = function(v15, v16) --[[ Line: 47 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: v10 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v9 (copy), v11 (copy)
    return v10({
        searchPlaceholder = "CoreScripts.InGameMenu.InviteFriends.Search"
    })(function(v17) --[[ Line: 50 ]]
        -- upvalues: l_withStyle_0 (ref), v15 (copy), l_Roact_0 (ref), v16 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v9 (ref), v11 (ref)
        return l_withStyle_0(function(v18) --[[ Line: 51 ]]
            -- upvalues: v15 (ref), l_Roact_0 (ref), v16 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v9 (ref), v11 (ref), v17 (copy)
            local l_TextEmphasis_0 = v18.Theme.TextEmphasis;
            local l_Body_0 = v18.Font.Body;
            local v21 = nil;
            local v22 = nil;
            v21 = v15.state.searchText ~= "";
            v22 = 49;
            if v21 then
                v22 = v22 + 46;
            end;
            local v23 = l_Roact_0.createElement("TextButton", {
                Size = UDim2.fromOffset(32, 32), 
                Position = UDim2.new(1, -7, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                Visible = v21, 
                SelectionImageObject = v16(l_CursorKind_0.SmallPill), 
                Selectable = true, 
                [l_Roact_0.Event.Activated] = function() --[[ Line: 72 ]]
                    -- upvalues: v15 (ref)
                    v15:setState({
                        searchText = ""
                    });
                    v15.props.searchCleared();
                end
            }, {
                UIPadding = l_Roact_0.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 7), 
                    PaddingRight = UDim.new(0, 7), 
                    PaddingTop = UDim.new(0, 7), 
                    PaddingBottom = UDim.new(0, 7)
                }), 
                ClearImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    Image = v9.Images.ClearIcon, 
                    ImageColor3 = v18.Theme.IconEmphasis.Color, 
                    Selectable = false
                })
            });
            return l_Roact_0.createElement(l_ImageSetLabel_0, {
                BackgroundTransparency = 1, 
                Size = v15.props.Size, 
                Position = v15.props.Position, 
                AnchorPoint = v15.props.AnchorPoint, 
                Image = v9.Images.RoundedRect.Image, 
                ImageColor3 = v18.Theme.BackgroundUIContrast.Color, 
                ImageTransparency = v18.Theme.BackgroundUIContrast.Transparency, 
                ScaleType = v9.Images.RoundedRect.ScaleType, 
                SliceCenter = v9.Images.RoundedRect.SliceCenter
            }, {
                Border = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Image = v9.Images.RoundedRectBorder.Image, 
                    SliceCenter = v9.Images.RoundedRectBorder.SliceCenter, 
                    ScaleType = v9.Images.RoundedRectBorder.ScaleType, 
                    ImageColor3 = v18.Theme.Divider.Color, 
                    ImageTransparency = v18.Theme.Divider.Transparency
                }), 
                SearchIcon = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(0, 22, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v9.Images.SearchIcon, 
                    ImageColor3 = v18.Theme.IconEmphasis.Color
                }), 
                TextBox = l_Roact_0.createElement("TextBox", {
                    Size = UDim2.new(1, -v22, 1, 0), 
                    Position = UDim2.new(0, 44, 0, 0), 
                    PlaceholderText = "", 
                    Text = v15.state.searchText, 
                    ClearTextOnFocus = false, 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextColor3 = l_TextEmphasis_0.Color, 
                    TextTransparency = l_TextEmphasis_0.Transparency, 
                    Font = l_Body_0.Font, 
                    TextSize = l_Body_0.RelativeSize * v18.Font.BaseSize, 
                    TextWrapped = false, 
                    SelectionImageObject = v16(l_CursorKind_0.InputFields), 
                    [l_Roact_0.Change.Text] = function(v24) --[[ Line: 143 ]]
                        -- upvalues: v15 (ref)
                        if v15.state.searchText ~= v24.Text then
                            v15:setState({
                                searchText = v24.Text
                            });
                            v15.props.searchUpdated(v24.Text);
                        end;
                    end, 
                    [l_Roact_0.Ref] = v15.props.itemRef
                }), 
                PlaceholderText = l_Roact_0.createElement(v11, {
                    themeKey = "TextEmphasis", 
                    fontKey = "Body", 
                    Text = v17.searchPlaceholder, 
                    Size = UDim2.new(1, -44, 1, 0), 
                    Position = UDim2.new(0, 44, 0, 0), 
                    TextTransparency = 0.5, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    ZIndex = 2, 
                    Visible = v15.state.searchText == ""
                }), 
                ClearButton = v23
            });
        end);
    end);
end;
v13.render = function(v25) --[[ Line: 173 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v26) --[[ Line: 174 ]]
        -- upvalues: v25 (copy)
        return v25:renderWithSelectionCursor(v26);
    end);
end;
return v13;
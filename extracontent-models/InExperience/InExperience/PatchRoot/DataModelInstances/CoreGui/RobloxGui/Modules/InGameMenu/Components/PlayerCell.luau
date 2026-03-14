local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local v4 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v4.Roact;
local l_UIBlox_0 = v4.UIBlox;
local l_Cryo_0 = v4.Cryo;
local l_t_0 = v4.t;
local l_Cell_0 = l_UIBlox_0.App.Table.Cell;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local l_LoadingStrategy_0 = l_UIBlox_0.App.Loading.Enum.LoadingStrategy;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_Parent_0 = script.Parent.Parent;
local v17 = require(l_Parent_0.Resources.Assets);
local v18 = require(l_Parent_0.Components.ThemedTextLabel);
local v19 = UDim.new(0, 24);
local v20 = l_Roact_0.PureComponent:extend("PlayerCell");
v20.validateProps = l_t_0.strictInterface({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    displayName = l_t_0.optional(l_t_0.string), 
    hasVerifiedBadge = l_t_0.optional(l_t_0.boolean), 
    isOnline = l_t_0.optional(l_t_0.boolean), 
    isSelected = l_t_0.optional(l_t_0.boolean), 
    LayoutOrder = l_t_0.union(l_t_0.integer, l_t_0.table), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    loadingStrategy = l_t_0.optional(l_LoadingStrategy_0.isEnumValue), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    memoKey = l_t_0.optional(l_t_0.number), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    forwardRef = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table)), 
    UserInputService = l_t_0.optional(l_t_0.union(l_t_0.Instance, l_t_0.table))
});
v20.defaultProps = {
    Visible = true, 
    UserInputService = l_UserInputService_0
};
v20.init = function(v21) --[[ Line: 63 ]] --[[ Name: init ]]
    v21.onActivated = function() --[[ Line: 64 ]]
        -- upvalues: v21 (copy)
        if v21.props.onActivated and v21.props.userId then
            v21.props.onActivated(v21.props.userId);
        end;
    end;
end;
v20.renderButtons = function(v22) --[[ Line: 71 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v23 = v22.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v23, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 5)
        })
    }));
end;
v20.renderWithSelectionCursor = function(v24, _) --[[ Line: 86 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), l_Cell_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v19 (copy), l_LoadableImage_0 (copy), v17 (copy), v3 (copy), v18 (copy)
    local l_props_0 = v24.props;
    local v27 = l_props_0.displayName ~= "" and l_props_0.displayName or l_props_0.username;
    return l_withStyle_0(function(v28) --[[ Line: 96 ]]
        -- upvalues: v24 (copy), l_Roact_0 (ref), l_Cell_0 (ref), l_props_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v19 (ref), l_LoadableImage_0 (ref), v17 (ref), v3 (ref), v18 (ref), v27 (copy)
        local l_BackgroundContrast_0 = v28.Theme.BackgroundContrast;
        local v30 = 1.1;
        if v24.props.isSelected then
            l_BackgroundContrast_0 = v28.Theme.BackgroundOnHover;
            v30 = 0.23;
        end;
        local l_Color_0 = l_BackgroundContrast_0.Color;
        return l_Roact_0.createElement(l_Cell_0, {
            background = v24.props.isSelected and l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Color_0, 
                BackgroundTransparency = l_BackgroundContrast_0.Transparency
            }) or nil, 
            onActivated = v24.onActivated, 
            [l_Roact_0.Change.AbsolutePosition] = v24.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = v24.props.forwardRef or nil, 
            layoutOrder = l_props_0.LayoutOrder, 
            size = UDim2.new(1, 0, 0, 72), 
            head = l_Roact_0.createElement("Frame", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(1, -20, 0, 72), 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                HeadListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                AvatarBackground = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = l_Images_0["component_assets/userBG_dark"], 
                    Size = UDim2.new(0, 48, 0, 48)
                }, {
                    BorderRadius = l_Roact_0.createElement("UICorner", {
                        CornerRadius = v19
                    }), 
                    PlayerIcon = l_Roact_0.createElement(l_LoadableImage_0, {
                        loadingStrategy = v24.props.loadingStrategy, 
                        Size = UDim2.fromScale(1, 1), 
                        ImageColor3 = l_props_0.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115), 
                        BackgroundTransparency = 1, 
                        Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=60&h=60" or "", 
                        ZIndex = 2, 
                        LayoutOrder = 1, 
                        useShimmerAnimationWhileLoading = true, 
                        renderOnFailed = function() --[[ Line: 149 ]] --[[ Name: renderOnFailed ]]
                            -- upvalues: l_Roact_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v19 (ref)
                            return l_Roact_0.createElement(l_ImageSetLabel_0, {
                                Size = UDim2.fromScale(1, 1), 
                                BackgroundTransparency = 1, 
                                Image = l_Images_0["icons/common/user"], 
                                ZIndex = 2, 
                                LayoutOrder = 1
                            }, {
                                Corner = l_Roact_0.createElement("UICorner", {
                                    CornerRadius = v19
                                })
                            });
                        end, 
                        cornerRadius = v19
                    }), 
                    OnlineIndicator = v24.props.isOnline and l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(1, 1), 
                        Image = v17.Images.Circle, 
                        ImageColor3 = l_props_0.isOnline and v28.Theme.OnlineStatus.Color or nil, 
                        Position = UDim2.new(1, -3, 1, -3), 
                        Size = UDim2.new(0, 6, 0, 6), 
                        ZIndex = 3
                    }, {
                        Corner = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 3)
                        }), 
                        Border = l_Roact_0.createElement("UIStroke", {
                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                            Color = Color3.new(l_Color_0.R * v30, l_Color_0.G * v30, l_Color_0.B * v30), 
                            Transparency = 0, 
                            Thickness = 2
                        })
                    }) or nil
                }), 
                NameContainer = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -68, 0, 72), 
                    Position = UDim2.fromOffset(48, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LayoutOrder = 2
                }, {
                    NameListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    NamePadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 6)
                    }), 
                    DisplayNameLabel = l_Roact_0.createElement(v3.EmojiWrapper, {
                        emoji = if l_props_0.hasVerifiedBadge then v3.emoji.verified else "", 
                        automaticSize = Enum.AutomaticSize.None, 
                        size = UDim2.new(1, -40, 0, 20)
                    }, {
                        DisplayNameLabel = l_Roact_0.createElement(v18, {
                            fontKey = "CaptionHeader", 
                            themeKey = "TextEmphasis", 
                            BackgroundTransparency = 1, 
                            Text = v27 or l_props_0.username, 
                            Size = UDim2.new(1, 0, 0, 20), 
                            AutomaticSize = if l_props_0.hasVerifiedBadge then Enum.AutomaticSize.XY else Enum.AutomaticSize.None, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            LayoutOrder = 1
                        })
                    }), 
                    UsernameLabel = l_Roact_0.createElement(v18, {
                        fontKey = "Footer", 
                        themeKey = "TextDefault", 
                        BackgroundTransparency = 1, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Size = UDim2.new(1, 0, 0, 14), 
                        Text = "@" .. l_props_0.username, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        LayoutOrder = 2
                    })
                })
            }), 
            tail = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, 0, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v24:renderButtons())
        });
    end);
end;
v20.render = function(v32) --[[ Line: 245 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v33) --[[ Line: 246 ]]
        -- upvalues: v32 (copy)
        return v32:renderWithSelectionCursor(v33);
    end);
end;
return v2.memo(v20, function(v34, v35) --[[ Line: 251 ]]
    -- upvalues: l_Roact_0 (copy)
    local v36 = false;
    if v34.isSelected == v35.isSelected then
        v36 = false;
        if v34.isOnline == v35.isOnline then
            v36 = false;
            if v34[l_Roact_0.Change.AbsolutePosition] == v35[l_Roact_0.Change.AbsolutePosition] then
                v36 = false;
                if v34.forwardRef == v35.forwardRef then
                    v36 = false;
                    if v34.memoKey == v35.memoKey then
                        v36 = v34.loadingStrategy == v35.loadingStrategy;
                    end;
                end;
            end;
        end;
    end;
    return v36;
end);
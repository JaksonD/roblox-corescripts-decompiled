local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local v11 = require(l_Modules_0.LuaApp.FitChildren);
local v12 = require(l_Modules_0.LuaApp.Components.FitTextLabel);
local v13 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v14 = require(l_Modules_0.LuaApp.Flags.FFlagBoldSearchListPickerSuggestions);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v17 = v4.PureComponent:extend("SearchBarListPickerItem");
v17.defaultProps = {
    displayIcon = nil
};
v17.init = function(v18) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: l_UserInputService_0 (copy)
    v18.state = {
        menuItemDown = false
    };
    v18.onMenuItemInputBegan = function(_, v20) --[[ Line: 43 ]]
        -- upvalues: v18 (copy)
        if (v20.UserInputType == Enum.UserInputType.Touch or v20.UserInputType == Enum.UserInputType.MouseButton1) and v20.UserInputState == Enum.UserInputState.Begin then
            v18.onMenuItemDown();
        end;
    end;
    v18.onMenuItemInputEnd = function(_, _) --[[ Line: 54 ]]
        -- upvalues: v18 (copy)
        v18.onMenuItemUp();
    end;
    v18.eventDisconnect = function() --[[ Line: 58 ]]
        -- upvalues: v18 (copy)
        if v18.userInputServiceConn then
            v18.userInputServiceConn:Disconnect();
            v18.userInputServiceConn = nil;
        end;
    end;
    v18.onMenuItemDown = function() --[[ Line: 65 ]]
        -- upvalues: v18 (copy), l_UserInputService_0 (ref)
        if not v18.state.menuItemDown then
            v18.eventDisconnect();
            v18.userInputServiceConn = l_UserInputService_0.InputEnded:Connect(function() --[[ Line: 68 ]]
                -- upvalues: v18 (ref)
                v18.onMenuItemUp();
            end);
            v18:setState({
                menuItemDown = true
            });
        end;
    end;
    v18.onMenuItemUp = function(v23) --[[ Line: 77 ]]
        -- upvalues: v18 (copy)
        if v18.state.menuItemDown or v18.state.menuItemActive ~= v23 then
            v18:setState({
                menuItemDown = false
            });
        end;
        v18.eventDisconnect();
    end;
end;
v17.renderWithProviders = function(v24, v25) --[[ Line: 87 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_withStyle_0 (copy), v14 (copy), v4 (copy), l_Focusable_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v13 (copy), v12 (copy), v11 (copy), l_LoadableImage_0 (copy)
    local l_item_0 = v24.props.item;
    local l_layoutOrder_0 = v24.props.layoutOrder;
    local l_separatorEnabled_0 = v24.props.separatorEnabled;
    local l_menuItemDown_0 = v24.state.menuItemDown;
    local l_isRichItem_0 = l_item_0.isRichItem;
    local l_isRecentCatalogSearchItem_0 = l_item_0.isRecentCatalogSearchItem;
    local l_forwardRef_0 = v24.props.forwardRef;
    return l_withStyle_0(function(v33) --[[ Line: 99 ]]
        -- upvalues: v14 (ref), l_item_0 (copy), v24 (copy), l_isRichItem_0 (copy), v4 (ref), l_Focusable_0 (ref), l_menuItemDown_0 (copy), l_layoutOrder_0 (copy), l_forwardRef_0 (copy), v25 (copy), l_CursorKind_0 (ref), l_isRecentCatalogSearchItem_0 (copy), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v13 (ref), v12 (ref), v11 (ref), l_LoadableImage_0 (ref), l_separatorEnabled_0 (copy)
        local v34 = if v14 then l_item_0.text else nil;
        if v14 and v24.props.currentKeyword and not l_isRichItem_0 then
            local l_Color3_0 = v33.Tokens.Semantic.Color.Text.Emphasis.Color3;
            local v36 = ("rgb(%*,%*,%*)"):format(math.round(l_Color3_0.r * 255), math.round(l_Color3_0.g * 255), (math.round(l_Color3_0.b * 255)));
            local v37 = v34:lower():find(v24.props.currentKeyword:lower());
            if v37 then
                local v38 = v34:sub(v37, v37 + v24.props.currentKeyword:len() - 1);
                local v39 = ("<font color=\"%*\"><b>"):format(v36);
                v34 = ("%*%*</b></font>"):format(v39, (v34:gsub(v38, ("</b></font>%*%*"):format(v38, v39), 1)));
            elseif not v24.props.currentKeyword:lower():find(v34:lower()) then
                v34 = ("<font color=\"%*\"><b>"):format(v36) .. v34 .. "</b></font>";
            end;
        end;
        return v4.createElement(l_Focusable_0.ImageButton, {
            BackgroundColor3 = l_menuItemDown_0 and v33.Theme.BackgroundOnPress.Color or v33.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = l_menuItemDown_0 and v33.Theme.BackgroundOnPress.Transparency or 1, 
            AutoButtonColor = false, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            LayoutOrder = l_layoutOrder_0, 
            Size = UDim2.new(1, 0, 0, l_isRichItem_0 and 64 or 56), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            [v4.Event.Activated] = l_item_0.onSelect, 
            [v4.Event.InputBegan] = v24.onMenuItemInputBegan, 
            [v4.Event.InputEnded] = v24.onMenuItemInputEnd, 
            NextSelectionLeft = v24.props.NextSelectionLeft, 
            NextSelectionRight = v24.props.NextSelectionRight, 
            NextSelectionUp = v24.props.NextSelectionUp, 
            NextSelectionDown = v24.props.NextSelectionDown, 
            [v4.Ref] = l_forwardRef_0, 
            SelectionImageObject = v25(l_CursorKind_0.RoundedRectNoInset)
        }, {
            Container = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Layout = v4.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 9)
                }), 
                LeftSpacing = v4.createElement("Frame", {
                    Size = UDim2.new(0, 0, 0, l_isRichItem_0 and 64 or 56), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }), 
                SearchIcon = if l_isRecentCatalogSearchItem_0 then v4.createElement(l_ImageSetLabel_0, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = l_Images_0["icons/menu/recent"], 
                    ImageColor3 = v33.Theme.IconDefault.Color, 
                    ImageTransparency = v33.Theme.IconDefault.Transparency, 
                    LayoutOrder = 2
                }) else v4.createElement(v13, {
                    Size = UDim2.new(0, 24, 0, 24), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = "LuaApp/icons/ic-search-new", 
                    ImageColor3 = v33.Theme.IconDefault.Color, 
                    ImageTransparency = v33.Theme.IconDefault.Transparency, 
                    LayoutOrder = 2
                }), 
                Content = v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, -112, 1, 0), 
                    LayoutOrder = 3
                }, {
                    Layout = v4.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, 5)
                    }), 
                    TitleText = v4.createElement(v12, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        RichText = if v14 then v24.props.currentKeyword ~= nil and not l_isRichItem_0 else nil, 
                        Text = if v14 then v34 else l_item_0.text, 
                        Font = v33.Font.Body.Font, 
                        TextSize = v33.Font.BaseSize * v33.Font.Body.RelativeSize, 
                        TextColor3 = v33.Theme.TextDefault.Color, 
                        TextTransparency = v33.Theme.TextDefault.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = if v14 then l_isRichItem_0 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center else Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        fitAxis = v11.FitAxis.Height
                    }), 
                    CategoryText = l_isRichItem_0 and v4.createElement(v12, {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        Text = "Game", 
                        Font = v33.Font.CaptionBody.Font, 
                        TextSize = v33.Font.BaseSize * v33.Font.CaptionBody.RelativeSize, 
                        TextColor3 = v33.Theme.TextMuted.Color, 
                        TextTransparency = v33.Theme.TextMuted.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true, 
                        fitAxis = v11.FitAxis.Height
                    })
                }), 
                RichIcon = l_isRichItem_0 and v4.createElement("Frame", {
                    Size = UDim2.new(0, 44, 0, 44), 
                    Position = UDim2.new(1, -44, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 4
                }, {
                    Shadow = v4.createElement("Frame", {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 8, 0, 0), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v33.Theme.BackgroundOnHover.Color, 
                        BackgroundTransparency = v33.Theme.BackgroundOnHover.Transparency, 
                        ZIndex = 10
                    }), 
                    Border = v4.createElement("Frame", {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 2, 0, 6), 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = v33.Theme.BackgroundDefault.Color, 
                        BackgroundTransparency = v33.Theme.BackgroundDefault.Transparency, 
                        ZIndex = 11
                    }), 
                    GameIcon = v4.createElement(l_LoadableImage_0, {
                        Size = UDim2.new(0, 36, 0, 36), 
                        Position = UDim2.new(0, 0, 0, 8), 
                        BackgroundTransparency = 1, 
                        Image = l_item_0.displayIcon, 
                        useShimmerAnimationWhileLoading = true, 
                        ZIndex = 12
                    })
                })
            }), 
            Separator = l_separatorEnabled_0 and v4.createElement("Frame", {
                BackgroundColor3 = v33.Theme.Divider.Color, 
                BackgroundTransparency = v33.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
    end);
end;
v17.render = function(v40) --[[ Line: 284 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v41) --[[ Line: 285 ]]
        -- upvalues: v40 (copy)
        return v40:renderWithProviders(v41);
    end);
end;
v17.willUnmount = function(v42) --[[ Line: 290 ]] --[[ Name: willUnmount ]]
    v42.eventDisconnect();
end;
return v4.forwardRef(function(v43, v44) --[[ Line: 294 ]]
    -- upvalues: v4 (copy), v17 (copy), v3 (copy)
    return v4.createElement(v17, v3.Dictionary.join(v43, {
        forwardRef = v44
    }));
end);
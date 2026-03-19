local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_t_0 = v2.t;
local l_UIBlox_0 = v2.UIBlox;
local l_Cryo_0 = v2.Cryo;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Localization.withLocalization);
local v12 = l_Roact_0.PureComponent:extend("SearchBar");
v12.validateProps = l_t_0.interface({
    size = l_t_0.UDim2, 
    text = l_t_0.optional(l_t_0.string), 
    onTextChanged = l_t_0.optional(l_t_0.callback), 
    onFocused = l_t_0.optional(l_t_0.callback), 
    onCancelled = l_t_0.optional(l_t_0.callback), 
    onFocusLost = l_t_0.optional(l_t_0.callback), 
    autoCaptureFocus = l_t_0.optional(l_t_0.boolean), 
    zIndex = l_t_0.optional(l_t_0.number), 
    visible = l_t_0.optional(l_t_0.boolean)
});
v12.defaultProps = {
    size = UDim2.fromScale(1, 1), 
    autoCaptureFocus = false, 
    visible = true
};
v12.init = function(v13) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy)
    v13.textboxRef = l_Roact_0.createRef();
    v13.onAbsoluteSizeChanged = function(v14) --[[ Line: 49 ]]
        -- upvalues: v13 (copy)
        local v15 = false;
        if v13.width ~= v14.AbsoluteSize.X then
            v13.width = v14.AbsoluteSize.X;
            v15 = true;
        end;
        if v13.height ~= v14.AbsoluteSize.Y then
            v13.height = v14.AbsoluteSize.Y;
            v15 = true;
        end;
        if v15 then
            v13:setState({
                width = v13.width - 2, 
                height = v13.height - 2
            });
        end;
    end;
    v13.searchTextChanged = function(v16) --[[ Line: 70 ]]
        -- upvalues: v13 (copy)
        if v13.props.onTextChanged then
            v13.props.onTextChanged(v16.Text);
        end;
    end;
    v13.searchBoxFocused = function(_) --[[ Line: 76 ]]
        -- upvalues: v13 (copy)
        if v13.props.onFocused then
            v13.props.onFocused();
        end;
    end;
    v13.searchCancel = function() --[[ Line: 82 ]]
        -- upvalues: v13 (copy)
        if v13.props.onCancelled then
            v13.props.onCancelled();
        end;
    end;
    v13.onFocusLost = function() --[[ Line: 88 ]]
        -- upvalues: v13 (copy)
        if v13.props.onFocusLost then
            v13.props.onFocusLost();
        end;
    end;
    v13.onTextboxTouchTap = function() --[[ Line: 94 ]]
        -- upvalues: v13 (copy)
        if v13.props.onTextboxTouchTap then
            v13.props.onTextboxTouchTap();
        end;
    end;
end;
v12.willUpdate = function(v18, v19) --[[ Line: 101 ]] --[[ Name: willUpdate ]]
    if v18.props.autoCaptureFocus and v18.props.visible == false and v19.visible then
        v18:focus();
    end;
end;
v12.didMount = function(v20) --[[ Line: 107 ]] --[[ Name: didMount ]]
    if v20.props.autoCaptureFocus and v20.props.visible then
        v20:focus();
    end;
end;
v12.focus = function(v21) --[[ Line: 113 ]] --[[ Name: focus ]]
    if v21.textboxRef then
        v21.textboxRef.current:CaptureFocus();
    end;
end;
v12.render = function(v22) --[[ Line: 119 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), l_Roact_0 (copy), l_UserInputService_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return l_withStyle_0(function(v23) --[[ Line: 120 ]]
        -- upvalues: v11 (ref), v22 (copy), l_Roact_0 (ref), l_UserInputService_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
        return v11({
            search = "CoreScripts.InGameMenu.InviteFriends.Search", 
            cancel = "CoreScripts.InGameMenu.Cancel"
        })(function(v24) --[[ Line: 124 ]]
            -- upvalues: v23 (copy), v22 (ref), l_Roact_0 (ref), l_UserInputService_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref)
            local l_Body_0 = v23.Font.Body;
            local v26 = v23.Font.BaseSize * l_Body_0.RelativeSize;
            local l_Body_1 = v23.Font.Body;
            local v28 = v23.Font.BaseSize * l_Body_1.RelativeSize;
            local v29 = {
                BackgroundTransparency = 1, 
                GroupTransparency = 0.5, 
                Size = v22.props.size, 
                ZIndex = v22.props.zIndex, 
                Visible = v22.props.visible, 
                [l_Roact_0.Ref] = v22.props.forwardRef or l_Roact_0.createRef()
            };
            local v30 = if l_UserInputService_0:GetPlatform() == Enum.Platform.Android then Enum.TextInputType.PasswordShown else Enum.TextInputType.NoSuggestions;
            return l_Roact_0.createElement("CanvasGroup", v29, {
                SearchPanelLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 9)
                }), 
                SearchBorder = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, -66, 0, 38), 
                    BackgroundColor3 = Color3.new(136, 136, 136), 
                    BackgroundTransparency = 0.8, 
                    [l_Roact_0.Change.AbsoluteSize] = v22.onAbsoluteSizeChanged
                }, {
                    BorderRadius = l_Roact_0.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 4)
                    }), 
                    SearchContainer = l_Roact_0.createElement("Frame", {
                        BackgroundTransparency = 0, 
                        Size = UDim2.fromOffset(v22.state.width, v22.state.height), 
                        BackgroundColor3 = Color3.new(0, 0, 0), 
                        Position = UDim2.fromOffset(1, 1)
                    }, {
                        SearchContainerLayout = l_Roact_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 10)
                        }), 
                        Padding = l_Roact_0.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 12), 
                            PaddingRight = UDim.new(0, 12)
                        }), 
                        BorderRadius = l_Roact_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 4)
                        }), 
                        SearchImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/common/search_small"], 
                            Size = UDim2.fromOffset(18, 18)
                        }), 
                        SearchInput = l_Roact_0.createElement("TextBox", {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, -28, 0, 20), 
                            Font = l_Body_1.Font, 
                            Text = v22.props.text or "", 
                            TextInputType = v30, 
                            TextSize = v28, 
                            TextColor3 = v23.Theme.TextEmphasis.Color, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            PlaceholderText = v24.search, 
                            PlaceholderColor3 = v23.Theme.TextDefault.Color, 
                            ClearTextOnFocus = false, 
                            ClipsDescendants = true, 
                            [l_Roact_0.Change.Text] = v22.searchTextChanged, 
                            [l_Roact_0.Event.Focused] = v22.searchBoxFocused, 
                            [l_Roact_0.Event.FocusLost] = v22.onFocusLost, 
                            [l_Roact_0.Ref] = v22.textboxRef, 
                            [l_Roact_0.Event.TouchTap] = v22.onTextboxTouchTap
                        })
                    })
                }), 
                CancelButton = l_Roact_0.createElement("TextButton", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromOffset(57, 20), 
                    Font = l_Body_0.Font, 
                    TextSize = v26, 
                    Text = v24.cancel, 
                    TextColor3 = v23.Theme.TextEmphasis.Color, 
                    [l_Roact_0.Event.Activated] = v22.searchCancel
                })
            });
        end);
    end);
end;
return l_Roact_0.forwardRef(function(v31, v32) --[[ Line: 236 ]]
    -- upvalues: l_Roact_0 (copy), v12 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v12, l_Cryo_0.Dictionary.join(v31, {
        forwardRef = v32
    }));
end);
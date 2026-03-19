local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v4.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v9 = require(l_Parent_0.PresentationCommon.IconButton);
local l_Colors_0 = require(l_CorePackages_0.Workspace.Packages.Style).Colors;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_Enabled_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled;
local v14 = v1.PureComponent:extend("DropDownButton");
v14.validateProps = v3.strictInterface({
    text = v3.string, 
    layoutOrder = v3.optional(v3.integer), 
    icon = v3.union(v3.string, v3.table), 
    lastButton = v3.boolean, 
    forceShowOptions = v3.boolean, 
    screenSizeX = v3.number, 
    screenSizeY = v3.number, 
    onActivated = v3.optional(v3.callback), 
    onDecline = v3.optional(v3.callback), 
    onDismiss = v3.optional(v3.callback), 
    animatingAccept = v3.optional(v3.boolean), 
    animatingDecline = v3.optional(v3.boolean), 
    animatingPercentage = v3.optional(v3.number)
});
v14.init = function(v15) --[[ Line: 43 ]] --[[ Name: init ]]
    v15.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v14.getColorBackgroundAnimation = function(v16, v17) --[[ Line: 53 ]] --[[ Name: getColorBackgroundAnimation ]]
    if v16.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v18 = v16.state.sizeX - v17.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v17.DropDownRightOptionSize;
        if v16.props.animatingDecline then
            v18 = v18 - v17.DropDownRightOptionSize;
        end;
        local v20 = v16.state.sizeX - v17.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v20 * v16.props.animatingPercentage;
        v18 = v18 - v20 * v16.props.animatingPercentage * 0.5;
        if v18 + l_DropDownRightOptionSize_0 > v16.state.sizeX then
            v18 = v18 - (v18 + l_DropDownRightOptionSize_0 - v16.state.sizeX);
        end;
        return v18, l_DropDownRightOptionSize_0;
    end;
end;
v14.render = function(v21) --[[ Line: 74 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_Enabled_0 (copy), l_Colors_0 (copy), v1 (copy), l_ImageSetLabel_0 (copy), v9 (copy), l_Images_0 (copy)
    return l_WithLayoutValues_0(function(v22) --[[ Line: 75 ]]
        -- upvalues: l_withStyle_0 (ref), l_Enabled_0 (ref), v21 (copy), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
        return l_withStyle_0(function(v23) --[[ Line: 76 ]]
            -- upvalues: l_Enabled_0 (ref), v22 (copy), v21 (ref), l_Colors_0 (ref), v1 (ref), l_ImageSetLabel_0 (ref), v9 (ref), l_Images_0 (ref)
            local v24 = {
                Color = if l_Enabled_0() then v23.Theme.BackgroundUIContrast.Color else v23.Theme.BackgroundContrast.Color, 
                Transparency = v22.OverrideBackgroundTransparency * v23.Settings.PreferredTransparency
            };
            local v25 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v21.state.isPressed then
                v25 = v23.Theme.BackgroundOnPress;
            elseif v21.state.isHovered then
                v25 = v23.Theme.BackgroundOnHover;
            end;
            local v26 = "";
            if v21.props.lastButton then
                v26 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v27 = true;
            if v21.props.onActivated == nil then
                v27 = v21.props.animatingAccept;
            end;
            local v28 = true;
            if v21.props.onDecline == nil then
                v28 = v21.props.animatingDecline;
            end;
            local v29 = true;
            if v21.props.onDecline == nil then
                v29 = true;
                if v21.props.animatingPercentage == nil then
                    v29 = v21.props.forceShowOptions;
                end;
            end;
            local v30, v31 = v21:getColorBackgroundAnimation(v22);
            local l_Green_0 = l_Colors_0.Green;
            if v21.props.animatingDecline then
                l_Green_0 = l_Colors_0.Red;
            elseif v21.props.forceShowOptions then
                l_Green_0 = l_Colors_0.White;
            end;
            local v33 = v22.DropDownPadding * 2 + v22.DropDownIconSize;
            local v34 = v22.DropDownRightOptionSize * 2;
            if v29 then
                v33 = v33 + v34;
            end;
            local function v35() --[[ Line: 120 ]] --[[ Name: onMouseButton1Down ]]
                -- upvalues: v29 (copy), v21 (ref)
                if not v29 then
                    v21:setState({
                        isPressed = true
                    });
                end;
            end;
            local function v36() --[[ Line: 128 ]] --[[ Name: onMouseButton1Up ]]
                -- upvalues: v21 (ref)
                v21:setState({
                    isPressed = false
                });
            end;
            return v1.createElement("ImageButton", {
                LayoutOrder = v21.props.layoutOrder, 
                Image = v26, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v21.props.lastButton and v24.Transparency or 1, 
                ImageColor3 = v24.Color, 
                Size = UDim2.new(1, 0, 0, v22.DropDownButtonSizeY), 
                BackgroundTransparency = v21.props.lastButton and 1 or v24.Transparency, 
                BackgroundColor3 = v24.Color, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                [v1.Event.Activated] = not v29 and v21.props.onActivated or nil, 
                [v1.Event.MouseEnter] = function() --[[ Line: 151 ]]
                    -- upvalues: v29 (copy), v21 (ref)
                    if not v29 then
                        v21:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v1.Event.MouseLeave] = function() --[[ Line: 159 ]]
                    -- upvalues: v21 (ref)
                    v21:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v1.Change.AbsoluteSize] = function(v37) --[[ Line: 166 ]]
                    -- upvalues: v21 (ref)
                    v21:setState({
                        sizeX = v37.AbsoluteSize.X
                    });
                end, 
                [v1.Change.AbsolutePosition] = function(v38) --[[ Line: 172 ]]
                    -- upvalues: v21 (ref)
                    v21:setState({
                        absolutePosX = v38.AbsolutePosition.X, 
                        absolutePosY = v38.AbsolutePosition.Y
                    });
                end, 
                [v1.Event.MouseButton1Down] = v35, 
                [v1.Event.MouseButton1Up] = v36
            }, {
                ColorBackground = v1.createElement("ImageLabel", {
                    Visible = v21.props.animatingPercentage ~= nil, 
                    ZIndex = 1, 
                    Size = UDim2.new(0, v31, 1, 0), 
                    Position = UDim2.new(0, v30, 0, 0), 
                    Image = v26, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = v21.props.lastButton and v22.IconButtonBackgroundTransparency or 1, 
                    ImageColor3 = l_Green_0, 
                    BackgroundTransparency = v21.props.lastButton and 1 or v22.IconButtonBackgroundTransparency, 
                    BackgroundColor3 = l_Green_0, 
                    BorderSizePixel = 0
                }), 
                HoverBackground = v1.createElement("ImageLabel", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Image = v26, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 24, 16), 
                    SliceScale = 0.5, 
                    ImageTransparency = v21.props.lastButton and v25.Transparency or 1, 
                    ImageColor3 = v25.Color, 
                    BackgroundTransparency = v21.props.lastButton and 1 or v25.Transparency, 
                    BackgroundColor3 = v25.Color, 
                    BorderSizePixel = 0
                }, {
                    InitalPadding = v1.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v22.DropDownPadding)
                    }), 
                    ListLayout = v1.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        Padding = UDim.new(0, v22.DropDownPadding)
                    }), 
                    Icon = v1.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, v22.DropDownIconSize, 0, v22.DropDownIconSize), 
                        ImageColor3 = v23.Theme.IconEmphasis.Color, 
                        Image = v21.props.icon, 
                        BackgroundTransparency = 1
                    }), 
                    Text = v1.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        Size = UDim2.new(1, -v33, 1, 0), 
                        Text = v21.props.text, 
                        Font = v23.Font.Header2.Font, 
                        TextSize = v23.Font.BaseSize * v23.Font.Header2.RelativeSize, 
                        TextColor3 = v23.Theme.TextEmphasis.Color, 
                        TextTransparency = v23.Theme.TextEmphasis.Transparency, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        BackgroundTransparency = 1
                    }), 
                    ButtonContainer = v1.createElement("Frame", {
                        LayoutOrder = 3, 
                        Visible = v29, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v34, 1, 0)
                    }, {
                        ConfirmButton = v27 and v1.createElement(v9, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0.5, 0, 0, 0), 
                            backgroundColor = v21.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                            icon = l_Images_0["icons/actions/accept"], 
                            showBackground = v21.props.animatingPercentage == nil, 
                            onActivated = v21.props.onActivated
                        }) or nil, 
                        DeclineButton = v28 and v1.createElement(v9, {
                            size = UDim2.new(0.5, 0, 1, 0), 
                            position = UDim2.new(0, 0, 0, 0), 
                            backgroundColor = l_Colors_0.Red, 
                            icon = l_Images_0["icons/actions/reject"], 
                            showBackground = v21.props.animatingPercentage == nil, 
                            onActivated = v21.props.onDecline
                        }) or nil
                    })
                }), 
                DismissInputHandler = v1.createElement("ImageButton", {
                    Image = "", 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v21.props.screenSizeX, 0, v21.props.screenSizeY), 
                    Position = UDim2.new(0, -v21.state.absolutePosX, 0, -v21.state.absolutePosY), 
                    Visible = v21.props.onDismiss ~= nil, 
                    [v1.Event.Activated] = v21.props.onDismiss
                }), 
                Divider = not v21.props.lastButton and v1.createElement("Frame", {
                    ZIndex = 3, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    Position = UDim2.new(0, 0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 1), 
                    BackgroundTransparency = v23.Theme.Divider.Transparency, 
                    BackgroundColor3 = v23.Theme.Divider.Color, 
                    BorderSizePixel = 0
                })
            });
        end);
    end);
end;
return v2.UNSTABLE_connect2(function(v39) --[[ Line: 298 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v39.screenSize.X, 
        screenSizeY = v39.screenSize.Y
    };
end, nil)(v14);
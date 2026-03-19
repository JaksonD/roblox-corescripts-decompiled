local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local l_useLayoutValues_0 = v6.Common.useLayoutValues;
local l_withStyle_0 = v5.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local v12 = require(l_Parent_0.PresentationCommon.IconButton);
local l_Colors_0 = require(l_CorePackages_0.Workspace.Packages.Style).Colors;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local l_FFlagUseNewPlayerList_0 = v6.Flags.FFlagUseNewPlayerList;
local l_FFlagEnableMobilePlayerListOnConsole_0 = v6.Flags.FFlagEnableMobilePlayerListOnConsole;
local v18 = v2.PureComponent:extend("DropDownButton");
v18.validateProps = v4.strictInterface({
    contentVisible = v4.boolean, 
    buttonTransparency = v4.any, 
    text = v4.string, 
    layoutOrder = v4.optional(v4.integer), 
    icon = v4.union(v4.string, v4.table), 
    lastButton = v4.boolean, 
    forceShowOptions = v4.boolean, 
    screenSizeX = v4.number, 
    screenSizeY = v4.number, 
    onActivated = v4.optional(v4.callback), 
    onDecline = v4.optional(v4.callback), 
    onDismiss = v4.optional(v4.callback), 
    animatingAccept = v4.optional(v4.boolean), 
    animatingDecline = v4.optional(v4.boolean), 
    animatingPercentage = v4.optional(v4.number), 
    layoutValues = v4.optional(v4.table)
});
v18.init = function(v19) --[[ Line: 54 ]] --[[ Name: init ]]
    v19.state = {
        isHovered = false, 
        isPressed = false, 
        sizeX = 100, 
        absolutePosX = 0, 
        absolutePosY = 0
    };
end;
v18.getColorBackgroundAnimation = function(v20, v21) --[[ Line: 64 ]] --[[ Name: getColorBackgroundAnimation ]]
    if v20.props.animatingPercentage == nil then
        return 0, 0;
    else
        local v22 = v20.state.sizeX - v21.DropDownRightOptionSize;
        local l_DropDownRightOptionSize_0 = v21.DropDownRightOptionSize;
        if v20.props.animatingDecline then
            v22 = v22 - v21.DropDownRightOptionSize;
        end;
        local v24 = v20.state.sizeX - v21.DropDownRightOptionSize;
        l_DropDownRightOptionSize_0 = l_DropDownRightOptionSize_0 + v24 * v20.props.animatingPercentage;
        v22 = v22 - v24 * v20.props.animatingPercentage * 0.5;
        if v22 + l_DropDownRightOptionSize_0 > v20.state.sizeX then
            v22 = v22 - (v22 + l_DropDownRightOptionSize_0 - v20.state.sizeX);
        end;
        return v22, l_DropDownRightOptionSize_0;
    end;
end;
v18.render = function(v25) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), l_FFlagUseNewPlayerList_0 (copy), l_Colors_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_FFlagEnableMobilePlayerListOnConsole_0 (copy), v12 (copy), l_Images_0 (copy)
    return l_WithLayoutValues_0(function(v26) --[[ Line: 86 ]]
        -- upvalues: l_withStyle_0 (ref), l_FFlagUseNewPlayerList_0 (ref), v25 (copy), l_Colors_0 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), v12 (ref), l_Images_0 (ref)
        return l_withStyle_0(function(v27) --[[ Line: 87 ]]
            -- upvalues: v26 (ref), l_FFlagUseNewPlayerList_0 (ref), v25 (ref), l_Colors_0 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_FFlagEnableMobilePlayerListOnConsole_0 (ref), v12 (ref), l_Images_0 (ref)
            v26 = if l_FFlagUseNewPlayerList_0 then v25.props.layoutValues else v26;
            local v28 = {
                Transparency = 1, 
                Color = Color3.new(1, 1, 1)
            };
            if v25.state.isPressed then
                v28 = v27.Theme.BackgroundOnPress;
            elseif v25.state.isHovered then
                v28 = v27.Theme.BackgroundOnHover;
            end;
            local v29 = "";
            if v25.props.lastButton then
                v29 = "rbxasset://textures/ui/BottomRoundedRect8px.png";
            end;
            local v30 = true;
            if v25.props.onActivated == nil then
                v30 = v25.props.animatingAccept;
            end;
            local v31 = true;
            if v25.props.onDecline == nil then
                v31 = v25.props.animatingDecline;
            end;
            local v32 = true;
            if v25.props.onDecline == nil then
                v32 = true;
                if v25.props.animatingPercentage == nil then
                    v32 = v25.props.forceShowOptions;
                end;
            end;
            local v33, v34 = v25:getColorBackgroundAnimation(v26);
            local l_Green_0 = l_Colors_0.Green;
            if v25.props.animatingDecline then
                l_Green_0 = l_Colors_0.Red;
            elseif v25.props.forceShowOptions then
                l_Green_0 = l_Colors_0.White;
            end;
            local v36 = v26.DropDownPadding * 2 + v26.DropDownIconSize;
            local v37 = v26.DropDownRightOptionSize * 2;
            if v32 then
                v36 = v36 + v37;
            end;
            local function v38() --[[ Line: 125 ]] --[[ Name: onMouseButton1Down ]]
                -- upvalues: v32 (copy), v25 (ref)
                if not v32 then
                    v25:setState({
                        isPressed = true
                    });
                end;
            end;
            local function v39() --[[ Line: 133 ]] --[[ Name: onMouseButton1Up ]]
                -- upvalues: v25 (ref)
                v25:setState({
                    isPressed = false
                });
            end;
            local l_createElement_0 = v2.createElement;
            local v41 = "ImageButton";
            local v44 = {
                LayoutOrder = v25.props.layoutOrder, 
                Image = v29, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v25.props.lastButton and v25.props.buttonTransparency or 1, 
                ImageColor3 = Color3.fromRGB(0, 0, 0), 
                Size = UDim2.new(1, 0, 0, v26.DropDownButtonSizeY), 
                BackgroundTransparency = v25.props.lastButton and 1 or v25.props.buttonTransparency, 
                BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                Selectable = not v32, 
                [v2.Event.Activated] = not v32 and v25.props.onActivated or nil, 
                [v2.Event.MouseEnter] = function() --[[ Line: 157 ]]
                    -- upvalues: v32 (copy), v25 (ref)
                    if not v32 then
                        v25:setState({
                            isHovered = true
                        });
                    end;
                end, 
                [v2.Event.MouseLeave] = function() --[[ Line: 165 ]]
                    -- upvalues: v25 (ref)
                    v25:setState({
                        isHovered = false, 
                        isPressed = false
                    });
                end, 
                [v2.Change.AbsoluteSize] = function(v42) --[[ Line: 172 ]]
                    -- upvalues: v25 (ref)
                    v25:setState({
                        sizeX = v42.AbsoluteSize.X
                    });
                end, 
                [v2.Change.AbsolutePosition] = function(v43) --[[ Line: 178 ]]
                    -- upvalues: v25 (ref)
                    v25:setState({
                        absolutePosX = v43.AbsolutePosition.X, 
                        absolutePosY = v43.AbsolutePosition.Y
                    });
                end, 
                [v2.Event.MouseButton1Down] = v38, 
                [v2.Event.MouseButton1Up] = v39
            };
            local v45 = {};
            local l_createElement_1 = v2.createElement;
            local v47 = "ImageLabel";
            local v48 = {};
            local v49 = false;
            if v25.props.animatingPercentage ~= nil then
                v49 = v25.props.contentVisible;
            end;
            v48.Visible = v49;
            v48.ZIndex = 1;
            v48.Size = UDim2.new(0, v34, 1, 0);
            v48.Position = UDim2.fromOffset(v33, 0);
            v48.Image = v29;
            v48.ScaleType = Enum.ScaleType.Slice;
            v48.SliceCenter = Rect.new(8, 8, 24, 16);
            v48.SliceScale = 0.5;
            v48.ImageTransparency = v25.props.lastButton and v26.IconButtonBackgroundTransparency or 1;
            v48.ImageColor3 = l_Green_0;
            v48.BackgroundTransparency = v25.props.lastButton and 1 or v26.IconButtonBackgroundTransparency;
            v48.BackgroundColor3 = l_Green_0;
            v48.BorderSizePixel = 0;
            v45.ColorBackground = l_createElement_1(v47, v48);
            v45.HoverBackground = v2.createElement("ImageLabel", {
                ZIndex = 2, 
                Size = UDim2.fromScale(1, 1), 
                Visible = v25.props.contentVisible, 
                Image = v29, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 24, 16), 
                SliceScale = 0.5, 
                ImageTransparency = v25.props.lastButton and v28.Transparency or 1, 
                ImageColor3 = v28.Color, 
                BackgroundTransparency = v25.props.lastButton and 1 or v28.Transparency, 
                BackgroundColor3 = v28.Color, 
                BorderSizePixel = 0
            }, {
                InitalPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v26.DropDownPadding)
                }), 
                ListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v26.DropDownPadding)
                }), 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(v26.DropDownIconSize, v26.DropDownIconSize), 
                    ImageColor3 = v27.Theme.IconEmphasis.Color, 
                    Image = v25.props.icon, 
                    BackgroundTransparency = 1
                }), 
                Text = v2.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, -v36, 1, 0), 
                    Text = v25.props.text, 
                    Font = v27.Font.Header2.Font, 
                    TextSize = if l_FFlagEnableMobilePlayerListOnConsole_0 then v26.DropDownButtonTextSize else v27.Font.BaseSize * v27.Font.Header2.RelativeSize, 
                    TextColor3 = v27.Theme.TextEmphasis.Color, 
                    TextTransparency = v27.Theme.TextEmphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    BackgroundTransparency = 1
                }), 
                ButtonContainer = v2.createElement("Frame", {
                    LayoutOrder = 3, 
                    Visible = v32, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v37, 1, 0)
                }, {
                    ConfirmButton = v30 and v2.createElement(v12, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.fromScale(0.5, 0), 
                        backgroundColor = v25.props.onDecline and l_Colors_0.Green or l_Colors_0.White, 
                        icon = l_Images_0["icons/actions/accept"], 
                        showBackground = v25.props.animatingPercentage == nil, 
                        onActivated = v25.props.onActivated
                    }) or nil, 
                    DeclineButton = v31 and v2.createElement(v12, {
                        size = UDim2.fromScale(0.5, 1), 
                        position = UDim2.new(0, 0, 0, 0), 
                        backgroundColor = l_Colors_0.Red, 
                        icon = l_Images_0["icons/actions/reject"], 
                        showBackground = v25.props.animatingPercentage == nil, 
                        onActivated = v25.props.onDecline
                    }) or nil
                })
            });
            l_createElement_1 = v2.createElement;
            v47 = "ImageButton";
            v48 = {
                Image = "", 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(v25.props.screenSizeX, v25.props.screenSizeY), 
                Position = UDim2.fromOffset(-v25.state.absolutePosX, -v25.state.absolutePosY)
            };
            v49 = false;
            if v25.props.onDismiss ~= nil then
                v49 = v25.props.contentVisible;
            end;
            v48.Visible = v49;
            v48[v2.Event.Activated] = v25.props.onDismiss;
            v45.DismissInputHandler = l_createElement_1(v47, v48);
            v45.Divider = not v25.props.lastButton and v2.createElement("Frame", {
                Visible = v25.props.contentVisible, 
                ZIndex = 3, 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = v27.Theme.Divider.Transparency, 
                BackgroundColor3 = v27.Theme.Divider.Color, 
                BorderSizePixel = 0
            });
            return l_createElement_0(v41, v44, v45);
        end);
    end);
end;
local function v52(v50) --[[ Line: 307 ]]
    -- upvalues: l_FFlagUseNewPlayerList_0 (copy), l_useLayoutValues_0 (copy), v2 (copy), v18 (copy), v1 (copy)
    local v51 = if l_FFlagUseNewPlayerList_0 then l_useLayoutValues_0() else nil;
    return v2.createElement(v18, v1.Dictionary.join(v50, {
        layoutValues = v51
    }));
end;
local function v54(v53) --[[ Line: 315 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSizeX = v53.screenSize.X, 
        screenSizeY = v53.screenSize.Y
    };
end;
if l_FFlagUseNewPlayerList_0 then
    return v3.connect(v54, nil)(v52);
else
    return v3.connect(v54, nil)(v18);
end;
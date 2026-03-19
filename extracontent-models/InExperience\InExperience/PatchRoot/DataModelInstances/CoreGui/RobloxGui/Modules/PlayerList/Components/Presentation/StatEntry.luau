local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = require(l_RobloxGui_0.Modules.GameTranslator);
local l_Parent_0 = script.Parent.Parent;
local l_Connection_0 = l_Parent_0.Connection;
local l_WithLayoutValues_0 = require(l_Connection_0.LayoutValues).WithLayoutValues;
local l_Parent_1 = l_Parent_0.Parent;
local v12 = require(l_Parent_1.FormatStatString);
local v13 = require(l_Parent_1.createShallowEqualAndTables);
local v14 = require(l_Parent_1.Flags.FFlagPlayerListReduceRerenders);
local v15 = v2.PureComponent:extend("StatEntry");
v15.validateProps = v4.strictInterface({
    statName = v4.string, 
    statValue = v4.optional(v4.any), 
    isTitleEntry = v4.boolean, 
    isTeamEntry = v4.boolean, 
    layoutOrder = v4.integer, 
    backgroundStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number
    }), 
    overlayStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number
    }), 
    doubleOverlay = v4.boolean, 
    textStyle = v4.strictInterface({
        Color = v4.Color3, 
        Transparency = v4.number, 
        StrokeColor = v4.optional(v4.Color3), 
        StrokeTransparency = v4.optional(v4.number)
    }), 
    onActivated = v4.optional(v4.callback), 
    onSelectionGained = v4.optional(v4.callback), 
    onSelectionLost = v4.optional(v4.callback), 
    onMouseEnter = v4.optional(v4.callback), 
    onMouseLeave = v4.optional(v4.callback), 
    onMouseDown = v4.optional(v4.callback), 
    onInputEnded = v4.optional(v4.callback)
});
v15.render = function(v16) --[[ Line: 60 ]] --[[ Name: render ]]
    -- upvalues: l_WithLayoutValues_0 (copy), l_withStyle_0 (copy), v7 (copy), l_CoreGui_0 (copy), v12 (copy), v2 (copy)
    return l_WithLayoutValues_0(function(v17) --[[ Line: 61 ]]
        -- upvalues: l_withStyle_0 (ref), v7 (ref), l_CoreGui_0 (ref), v16 (copy), v12 (ref), v2 (ref)
        return l_withStyle_0(function(v18) --[[ Line: 62 ]]
            -- upvalues: v7 (ref), l_CoreGui_0 (ref), v16 (ref), v17 (copy), v12 (ref), v2 (ref)
            local v19 = v7:TranslateGameText(l_CoreGui_0, v16.props.statName);
            local v20 = nil;
            local v21 = nil;
            if not v17.IsTenFoot then
                v20 = v18.Font.CaptionHeader.Font;
                v21 = v18.Font.CaptionHeader.RelativeSize * v18.Font.BaseSize;
            else
                v21 = v17.StatTextSize;
                v20 = v17.StatFont;
                if v16.props.isTitleEntry then
                    v20 = v17.TitleStatFont;
                elseif v16.props.isTeamEntry then
                    v20 = v17.TeamStatFont;
                end;
            end;
            local v22 = v12(v16.props.statValue);
            local v23 = {};
            if v17.IsTenFoot then
                v23.Shadow = v2.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v17.ShadowImage, 
                    Position = UDim2.new(0, -v17.ShadowSize, 0, 0), 
                    Size = UDim2.new(1, v17.ShadowSize * 2, 1, v17.ShadowSize), 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v17.ShadowSliceRect
                });
            end;
            v23.StatText = v2.createElement("TextLabel", {
                Size = v16.props.isTitleEntry and UDim2.new(1, 0, 0.5, 0) or UDim2.new(1, 0, 1, 0), 
                Position = v16.props.isTitleEntry and UDim2.new(0, 0, 0.5, 0) or UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                Font = v20, 
                TextSize = v21, 
                TextColor3 = v16.props.textStyle.Color, 
                TextTransparency = v16.props.textStyle.Transparency, 
                TextStrokeColor3 = v16.props.textStyle.StrokeColor, 
                TextStrokeTransparency = v16.props.textStyle.StrokeTransparency, 
                Text = v22, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Active = true
            }, {
                v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v17.StatTextPadding)
                }) or nil
            });
            if v16.props.isTitleEntry then
                v23.StatName = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0.5, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    Font = v17.StatNameFont, 
                    TextSize = v21, 
                    TextColor3 = v16.props.textStyle.Color, 
                    TextTransparency = v16.props.textStyle.Transparency, 
                    TextStrokeColor3 = v16.props.textStyle.StrokeColor, 
                    TextStrokeTransparency = v16.props.textStyle.StrokeTransparency, 
                    Text = v19, 
                    Active = true, 
                    ClipsDescendants = true
                });
            end;
            return v2.createElement("TextButton", {
                Text = "", 
                LayoutOrder = v16.props.layoutOrder, 
                Size = UDim2.new(0, v17.StatEntrySizeX, 1, 0), 
                BackgroundTransparency = v16.props.backgroundStyle.Transparency, 
                BackgroundColor3 = v16.props.backgroundStyle.Color, 
                BorderSizePixel = 0, 
                AutoLocalize = false, 
                AutoButtonColor = false, 
                Selectable = false, 
                [v2.Event.Activated] = v16.props.onActivated, 
                [v2.Event.SelectionGained] = v16.props.onSelectionGained, 
                [v2.Event.SelectionLost] = v16.props.onSelectionLost, 
                [v2.Event.MouseEnter] = v16.props.onMouseEnter, 
                [v2.Event.MouseLeave] = v16.props.onMouseLeave, 
                [v2.Event.MouseButton1Down] = v16.props.onMouseDown, 
                [v2.Event.MouseButton1Up] = v16.props.onInputEnded, 
                [v2.Event.InputEnded] = function(_, v25) --[[ Line: 148 ]]
                    -- upvalues: v16 (ref)
                    if v25.UserInputType == Enum.UserInputType.Touch then
                        if v16.props.onMouseLeave then
                            v16.props.onMouseLeave();
                        end;
                        if v16.props.onInputEnded then
                            v16.props.onInputEnded();
                        end;
                    end;
                end
            }, {
                DoubleOverLay = v2.createElement("Frame", {
                    ZIndex = 1, 
                    Visible = v16.props.doubleOverlay, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v16.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v16.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }), 
                OverlayFrame = v2.createElement("Frame", {
                    ZIndex = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = v16.props.overlayStyle.Transparency, 
                    BackgroundColor3 = v16.props.overlayStyle.Color, 
                    BorderSizePixel = 0
                }, v23)
            });
        end);
    end);
end;
if v14 then
    return v3.memo(v15, v13({
        "backgroundStyle"
    }));
else
    return v15;
end;
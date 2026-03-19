local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v5 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v6 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v7 = v3.PureComponent:extend("GenericTextButton");
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_withSelectionCursorProvider_0 = v8.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v8.App.SelectionImage.CursorKind;
local l_GetFFlagLuaAppFixSelectionCursor_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixSelectionCursor;
v7.init = function(v12) --[[ Line: 24 ]] --[[ Name: init ]]
    v12.state = {
        isButtonPressed = false
    };
    v12.onInputBegan = function() --[[ Line: 29 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            isButtonPressed = true
        });
    end;
    v12.onInputEnded = function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        v12:setState({
            isButtonPressed = false
        });
    end;
end;
local function _(v13, v14) --[[ Line: 42 ]] --[[ Name: getCombinedTransparency ]]
    return 1 - (1 - v13) * (1 - v14);
end;
v7.render = function(v16) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_withSelectionCursorProvider_0 (copy)
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        return l_withSelectionCursorProvider_0(function(v17) --[[ Line: 48 ]]
            -- upvalues: v16 (copy)
            return v16:renderWithSelectionCursor(v17);
        end);
    else
        return v16:renderWithSelectionCursor(nil);
    end;
end;
v7.renderWithSelectionCursor = function(v18, v19) --[[ Line: 56 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_GetFFlagLuaAppFixSelectionCursor_0 (copy), l_CursorKind_0 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v20 = false;
    local l_themeSettings_0 = v18.props.themeSettings;
    local l_Size_0 = v18.props.Size;
    local l_Position_0 = v18.props.Position;
    local l_AnchorPoint_0 = v18.props.AnchorPoint;
    local l_LayoutOrder_0 = v18.props.LayoutOrder;
    local l_Text_0 = v18.props.Text;
    local l_Font_0 = v18.props.Font;
    local l_TextSize_0 = v18.props.TextSize;
    local l_onActivated_0 = v18.props.onActivated;
    local l_isLoading_0 = v18.props.isLoading;
    local l_isDisabled_0 = v18.props.isDisabled;
    local l_isButtonPressed_0 = v18.state.isButtonPressed;
    local v33 = l_themeSettings_0.Border.Hidden == false;
    local l_NextSelectionDown_0 = v18.props.NextSelectionDown;
    local l_NextSelectionLeft_0 = v18.props.NextSelectionLeft;
    local l_NextSelectionRight_0 = v18.props.NextSelectionRight;
    local l_NextSelectionUp_0 = v18.props.NextSelectionUp;
    local l_Color_0 = l_themeSettings_0.Color;
    local v39 = 0;
    if l_isLoading_0 or l_isDisabled_0 then
        l_Color_0 = l_themeSettings_0.DisabledColor;
        v39 = l_themeSettings_0.DisabledTransparency;
    elseif l_isButtonPressed_0 then
        l_Color_0 = l_themeSettings_0.OnPressColor;
        v39 = l_themeSettings_0.OnPressTransparency;
    end;
    local l_v39_0 = v39;
    local l_Transparency_0 = l_themeSettings_0.Transparency;
    local v42 = 1 - (1 - l_v39_0) * (1 - l_Transparency_0);
    if v33 then
        l_Transparency_0 = v39;
        local l_Transparency_1 = l_themeSettings_0.Border.Transparency;
        l_v39_0 = 1 - (1 - l_Transparency_0) * (1 - l_Transparency_1);
        v20 = l_v39_0;
    end;
    if not v20 then
        l_v39_0 = 0;
    end;
    v20 = false;
    local l_v39_1 = v39;
    local l_Transparency_2 = l_themeSettings_0.Text.Transparency;
    l_Transparency_0 = 1 - (1 - l_v39_1) * (1 - l_Transparency_2);
    l_v39_1 = v18.props.forwardRef;
    l_Transparency_2 = nil;
    if l_GetFFlagLuaAppFixSelectionCursor_0() then
        l_Transparency_2 = v19(l_CursorKind_0.InputButton);
    end;
    return v3.createElement(v4, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1, 
        Image = "LuaApp/buttons/buttonFill", 
        ImageColor3 = l_Color_0, 
        ImageTransparency = v42, 
        BorderSizePixel = 0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        NextSelectionDown = l_NextSelectionDown_0, 
        NextSelectionLeft = l_NextSelectionLeft_0, 
        NextSelectionRight = l_NextSelectionRight_0, 
        NextSelectionUp = l_NextSelectionUp_0, 
        SelectionImageObject = l_Transparency_2, 
        [v3.Ref] = l_v39_1, 
        [v3.Event.InputBegan] = v18.onInputBegan, 
        [v3.Event.InputEnded] = v18.onInputEnded, 
        [v3.Event.Activated] = l_onActivated_0
    }, {
        Border = v33 and v3.createElement(v5, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Image = "LuaApp/buttons/buttonStroke", 
            ImageColor3 = l_themeSettings_0.Border.Color, 
            ImageTransparency = l_v39_0, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = Rect.new(8, 8, 9, 9)
        }), 
        Text = v3.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, l_TextSize_0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = l_Text_0, 
            Font = l_Font_0, 
            TextSize = l_TextSize_0, 
            TextColor3 = l_themeSettings_0.Text.Color, 
            TextTransparency = l_Transparency_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            BackgroundTransparency = 1
        }), 
        ShimmerAnimation = l_isLoading_0 and v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            Shimmer = v3.createElement(v6, {
                Size = UDim2.new(1, 0, 2, 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                shimmerSpeed = 1.5
            })
        })
    });
end;
return v3.forwardRef(function(v46, v47) --[[ Line: 157 ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy)
    return v3.createElement(v7, v2.Dictionary.join(v46, {
        forwardRef = v47
    }));
end);
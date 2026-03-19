local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Cryo_0 = v1.Cryo;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local v9 = require(l_Parent_0.Resources.Assets);
local v10 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local v15 = {
    AnchorPoint = Vector2.new(0, 0.5), 
    Position = UDim2.new(0, 24, 0.5, 0), 
    Size = UDim2.new(0, 44, 0, 44)
};
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix;
local v19 = l_Roact_0.PureComponent:extend("PlayerLabel");
v19.validateProps = l_t_0.strictInterface(l_validatePropsWithForwardRef_0({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    isOnline = l_t_0.boolean, 
    isSelected = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer, 
    Visible = l_t_0.optional(l_t_0.boolean), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Ref] = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}));
v19.defaultProps = {
    Visible = true
};
if v8 then
    v19.init = function(v20) --[[ Line: 72 ]] --[[ Name: init ]]
        v20.onActivated = function() --[[ Line: 73 ]]
            -- upvalues: v20 (copy)
            v20.props.onActivated(v20.props.userId);
        end;
    end;
end;
v19.renderButtons = function(v21) --[[ Line: 79 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v22 = v21.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v22, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v19.renderWithSelectionCursor = function(v23, v24) --[[ Line: 94 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), v8 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_Cryo_0 (copy), v15 (copy), v9 (copy), v10 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_props_0 = v23.props;
    return l_withStyle_0(function(v26) --[[ Line: 97 ]]
        -- upvalues: v23 (copy), v8 (ref), l_Roact_0 (ref), l_props_0 (copy), v24 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), l_Cryo_0 (ref), v15 (ref), v9 (ref), v10 (ref), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (ref), l_OpenTypeSupport_0 (ref)
        local l_BackgroundContrast_0 = v26.Theme.BackgroundContrast;
        if v23.props.isSelected then
            l_BackgroundContrast_0 = {
                Color = Color3.fromRGB(48, 50, 52), 
                Transparency = 0
            };
        end;
        local l_onActivated_0 = v23.props.onActivated;
        if v8 then
            l_onActivated_0 = v23.props.onActivated and v23.onActivated or nil;
        end;
        local l_forwardRef_0 = v23.props.forwardRef;
        return l_Roact_0.createElement("TextButton", {
            BackgroundTransparency = l_BackgroundContrast_0.Transparency, 
            BackgroundColor3 = l_BackgroundContrast_0.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 70), 
            Visible = l_props_0.Visible, 
            Text = "", 
            AutoButtonColor = false, 
            [l_Roact_0.Event.Activated] = l_onActivated_0, 
            [l_Roact_0.Change.AbsolutePosition] = v23.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = l_forwardRef_0, 
            SelectionImageObject = v24(l_CursorKind_0.Square)
        }, {
            PlayerCutout = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v15, {
                BackgroundTransparency = 1, 
                Image = v9.Images.CircleCutout, 
                ImageColor3 = l_BackgroundContrast_0.Color, 
                ZIndex = 3
            })), 
            PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v15, {
                BackgroundTransparency = 1, 
                Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=48&h=48" or "", 
                ZIndex = 2
            })), 
            PlayerBackground = l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join(v15, {
                BackgroundColor3 = v26.Theme.UIDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            })), 
            OnlineIndicator = l_Roact_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                Image = v9.Images.Circle, 
                ImageColor3 = l_props_0.isOnline and v26.Theme.OnlineStatus.Color or v26.Theme.UIDefault.Color, 
                Position = UDim2.new(0, 80, 0.5, 0), 
                Size = UDim2.new(0, 16, 0, 16)
            }), 
            UsernameLabel = l_Roact_0.createElement(v10, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 100, 0.5, 0), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() and l_GetFFlagLuaAppEnableOpenTypeIGMFix_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v23:renderButtons())
        });
    end);
end;
v19.render = function(v30) --[[ Line: 190 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v31) --[[ Line: 191 ]]
        -- upvalues: v30 (copy)
        return v30:renderWithSelectionCursor(v31);
    end);
end;
return l_Roact_0.forwardRef(function(v32, v33) --[[ Line: 196 ]]
    -- upvalues: l_Roact_0 (copy), v19 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v19, l_Cryo_0.Dictionary.join(v32, {
        forwardRef = v33
    }));
end);
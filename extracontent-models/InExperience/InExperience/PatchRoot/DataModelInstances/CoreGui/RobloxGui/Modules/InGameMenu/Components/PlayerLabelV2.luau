local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Cryo_0 = v1.Cryo;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_Parent_0 = script.Parent.Parent;
local v11 = require(l_Parent_0.Flags.FFlagLuaMenuPerfImprovements);
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeIGMFix;
local v14 = require(l_Parent_0.Components.ThemedTextLabel);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v16 = {
    AnchorPoint = Vector2.new(0, 1), 
    Position = UDim2.new(0, 24, 1, 1), 
    Size = UDim2.new(0, 56, 0, 56)
};
local l_validatePropsWithForwardRef_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).validatePropsWithForwardRef;
local v18 = l_Roact_0.PureComponent:extend("PlayerLabelV2");
v18.validateProps = l_t_0.strictInterface(l_validatePropsWithForwardRef_0({
    userId = l_t_0.number, 
    username = l_t_0.string, 
    displayName = l_t_0.string, 
    isOnline = l_t_0.boolean, 
    isSelected = l_t_0.boolean, 
    LayoutOrder = l_t_0.integer, 
    Visible = l_t_0.optional(l_t_0.boolean), 
    onActivated = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    [l_Roact_0.Change.AbsolutePosition] = l_t_0.optional(l_t_0.callback), 
    [l_Roact_0.Ref] = l_t_0.optional(l_t_0.union(l_t_0.callback, l_t_0.table))
}));
v18.defaultProps = {
    Visible = true
};
if v11 then
    v18.init = function(v19) --[[ Line: 69 ]] --[[ Name: init ]]
        v19.onActivated = function() --[[ Line: 70 ]]
            -- upvalues: v19 (copy)
            v19.props.onActivated(v19.props.userId);
        end;
    end;
end;
v18.renderButtons = function(v20) --[[ Line: 76 ]] --[[ Name: renderButtons ]]
    -- upvalues: l_Roact_0 (copy), l_Cryo_0 (copy)
    local v21 = v20.props[l_Roact_0.Children] or {};
    return (l_Cryo_0.Dictionary.join(v21, {
        List = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = UDim.new(0, 12)
        })
    }));
end;
v18.renderWithSelectionCursor = function(v22, v23) --[[ Line: 91 ]] --[[ Name: renderWithSelectionCursor ]]
    -- upvalues: l_withStyle_0 (copy), v11 (copy), l_Roact_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), l_Cryo_0 (copy), v16 (copy), v14 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (copy), l_OpenTypeSupport_0 (copy)
    local l_props_0 = v22.props;
    local v25 = l_props_0.displayName ~= "" and l_props_0.displayName or l_props_0.username;
    return l_withStyle_0(function(v26) --[[ Line: 101 ]]
        -- upvalues: v22 (copy), v11 (ref), l_Roact_0 (ref), l_props_0 (copy), v23 (copy), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), l_Cryo_0 (ref), v16 (ref), v14 (ref), v25 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (ref), l_GetFFlagLuaAppEnableOpenTypeIGMFix_0 (ref), l_OpenTypeSupport_0 (ref)
        local l_BackgroundContrast_0 = v26.Theme.BackgroundContrast;
        if v22.props.isSelected then
            l_BackgroundContrast_0 = v26.Theme.BackgroundOnHover;
        end;
        local l_onActivated_0 = v22.props.onActivated;
        if v11 then
            l_onActivated_0 = v22.props.onActivated and v22.onActivated or nil;
        end;
        local l_forwardRef_0 = v22.props.forwardRef;
        return l_Roact_0.createElement("TextButton", {
            BackgroundTransparency = l_BackgroundContrast_0.Transparency, 
            BackgroundColor3 = l_BackgroundContrast_0.Color, 
            BorderSizePixel = 0, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 71), 
            Visible = l_props_0.Visible, 
            Text = "", 
            AutoButtonColor = false, 
            [l_Roact_0.Event.Activated] = l_onActivated_0, 
            [l_Roact_0.Change.AbsolutePosition] = v22.props[l_Roact_0.Change.AbsolutePosition], 
            [l_Roact_0.Ref] = l_forwardRef_0, 
            SelectionImageObject = v23(l_CursorKind_0.Square)
        }, {
            PlayerIcon = l_Roact_0.createElement(l_ImageSetLabel_0, l_Cryo_0.Dictionary.join(v16, {
                ImageColor3 = l_props_0.isOnline and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(115, 115, 115), 
                BackgroundTransparency = 1, 
                Image = l_props_0.userId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. l_props_0.userId .. "&w=60&h=60" or "", 
                ZIndex = 2
            })), 
            DisplayNameLabel = l_Roact_0.createElement(v14, {
                fontKey = "Header2", 
                themeKey = "TextEmphasis", 
                Position = UDim2.new(0, 104, 0, 14), 
                AnchorPoint = Vector2.new(0, 0), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = v25, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            UsernameLabel = l_Roact_0.createElement(v14, {
                fontKey = "Header2", 
                themeKey = "TextDefault", 
                Position = UDim2.new(0, 104, 0, 36), 
                Size = UDim2.new(0, 219, 0, 22), 
                Text = "@" .. l_props_0.username, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                OpenTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() and l_GetFFlagLuaAppEnableOpenTypeIGMFix_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            }), 
            ButtonContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(1, -24, 0, 0), 
                Size = UDim2.new(0, 0, 1, 0)
            }, v22:renderButtons())
        });
    end);
end;
v18.render = function(v30) --[[ Line: 182 ]] --[[ Name: render ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy)
    return l_withSelectionCursorProvider_0(function(v31) --[[ Line: 183 ]]
        -- upvalues: v30 (copy)
        return v30:renderWithSelectionCursor(v31);
    end);
end;
return l_Roact_0.forwardRef(function(v32, v33) --[[ Line: 188 ]]
    -- upvalues: l_Roact_0 (copy), v18 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v18, l_Cryo_0.Dictionary.join(v32, {
        forwardRef = v33
    }));
end);
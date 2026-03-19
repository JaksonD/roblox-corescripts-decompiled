local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent.Parent;
local v10 = require(l_Parent_0.GlobalConfig);
local v11 = require(script.Parent.Parent.ThemedTextLabel);
local v12 = require(script.Parent.Parent.Divider);
local v13 = require(l_Parent_0.Actions.NavigateBack);
local v14 = require(l_Parent_0.Localization.withLocalization);
local v15 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v18 = l_t_0.strictInterface({
    titleText = l_t_0.string, 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table), 
    onClosed = l_t_0.callback, 
    closeButtonRef = l_t_0.optional(l_t_0.table)
});
local function v23(v19, v20) --[[ Line: 43 ]] --[[ Name: ControlLayoutContainerWithSelectionCursor ]]
    -- upvalues: v10 (copy), v18 (copy), v14 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v15 (copy), l_CursorKind_0 (copy), v11 (copy), v12 (copy), l_ImageSetLabel_0 (copy)
    if v10.propValidation then
        assert(v18(v19));
    end;
    return v14({
        titleText = v19.titleText
    })(function(v21) --[[ Line: 50 ]]
        -- upvalues: l_withStyle_0 (ref), l_Roact_0 (ref), v19 (copy), l_ImageSetButton_0 (ref), v15 (ref), v20 (copy), l_CursorKind_0 (ref), v11 (ref), v12 (ref), l_ImageSetLabel_0 (ref)
        return l_withStyle_0(function(v22) --[[ Line: 51 ]]
            -- upvalues: l_Roact_0 (ref), v19 (ref), l_ImageSetButton_0 (ref), v15 (ref), v20 (ref), l_CursorKind_0 (ref), v11 (ref), v21 (copy), v12 (ref), l_ImageSetLabel_0 (ref)
            return l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v22.Theme.Overlay.Color, 
                BackgroundTransparency = 0, 
                Active = true
            }, {
                PageContent = l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -132), 
                    Position = UDim2.new(0, 0, 0, 132), 
                    ClipsDescendants = true
                }, v19[l_Roact_0.Children]), 
                HeaderContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 132), 
                    BackgroundTransparency = 1
                }, {
                    Padding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 95), 
                        PaddingRight = UDim.new(0, 95)
                    }), 
                    CloseButton = l_Roact_0.createElement(l_ImageSetButton_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0, 100), 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v15.Images.CloseModal, 
                        BackgroundTransparency = 1, 
                        SelectionImageObject = v20(l_CursorKind_0.RoundedRect), 
                        [l_Roact_0.Event.Activated] = v19.onClosed, 
                        [l_Roact_0.Ref] = v19.closeButtonRef
                    }), 
                    HeaderTextLabel = l_Roact_0.createElement(v11, {
                        fontKey = "Header1", 
                        themeKey = "TextEmphasis", 
                        Size = UDim2.new(0, 250, 0, 28), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0, 100), 
                        Text = v21.titleText
                    }), 
                    HeaderDivider = l_Roact_0.createElement(v12, {
                        Size = UDim2.new(1, 0, 0, 2), 
                        AnchorPoint = Vector2.new(0.5, 1), 
                        Position = UDim2.new(0.5, 0, 1, 0)
                    })
                }), 
                RadialGlowBig = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v15.Images.RadialGlow, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    Size = UDim2.new(1, 0, 1, 0)
                }), 
                RadialGlowSquashed = l_Roact_0.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Image = v15.Images.RadialGlow, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    SizeConstraint = Enum.SizeConstraint.RelativeXX, 
                    Size = UDim2.new(1, 0, 0.6, 0)
                })
            });
        end);
    end);
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v24) --[[ Line: 139 ]]
    -- upvalues: v13 (copy)
    return {
        onClosed = function() --[[ Line: 141 ]] --[[ Name: onClosed ]]
            -- upvalues: v24 (copy), v13 (ref)
            v24(v13());
        end
    };
end)(function(v25) --[[ Line: 133 ]] --[[ Name: ControlLayoutContainer ]]
    -- upvalues: l_withSelectionCursorProvider_0 (copy), v23 (copy)
    return l_withSelectionCursorProvider_0(function(v26) --[[ Line: 134 ]]
        -- upvalues: v23 (ref), v25 (copy)
        return v23(v25, v26);
    end);
end);
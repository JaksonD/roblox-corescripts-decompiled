local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_FitFrameVertical_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical;
local l_withStyle_0 = v4.Style.withStyle;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v4.App.ImageSet.Images;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v10 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateScalesPageComponentsForAutofocus;
local v12 = if v10 then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeSlider) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodySizeSlider_DEPRECATED);
local v13 = l_Images_0["icons/menu/body_tall"];
local v14 = l_Images_0["icons/menu/body_thin"];
local v15 = l_Images_0["icons/menu/body_heavy"];
local v16 = l_Images_0["icons/menu/body_short"];
local v17 = v3.PureComponent:extend("BodySizeRadar");
v17.render = function(v18) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), v13 (copy), v14 (copy), v12 (copy), v15 (copy), v16 (copy)
    return l_withStyle_0(function(v19) --[[ Line: 35 ]]
        -- upvalues: l_withLocalization_0 (ref), v18 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), v3 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v13 (ref), v14 (ref), v12 (ref), v15 (ref), v16 (ref)
        return l_withLocalization_0({
            bodySize = "Feature.Avatar.Label.BodySize"
        })(function(v20) --[[ Line: 38 ]]
            -- upvalues: v18 (ref), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), v19 (copy), v3 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v13 (ref), v14 (ref), v12 (ref), v15 (ref), v16 (ref)
            local l_lockNavigationCallback_0 = v18.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v18.props.unlockNavigationCallback;
            local v23 = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v18.props.layoutOrder else v18.props.LayoutOrder;
            local l_isDisabled_0 = v18.props.isDisabled;
            local l_Font_0 = v19.Font;
            local l_Theme_0 = v19.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v28 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local l_forwardRef_0 = v18.props.forwardRef;
            return v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 24), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = v23
            }, {
                BodySizeLabel = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v28), 
                    BackgroundTransparency = 1, 
                    Text = v20.bodySize, 
                    TextSize = v28, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1, 
                    Font = l_Font_1
                }), 
                BodySizeContainer = v3.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 8), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    TallIcon = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        LayoutOrder = 1, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                        Image = v13
                    }), 
                    Wrapper = v3.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        ThinIcon = v3.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            LayoutOrder = 1, 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                            Image = v14
                        }), 
                        BodySize = v3.createElement(v12, {
                            LayoutOrder = 2, 
                            lockNavigationCallback = l_lockNavigationCallback_0, 
                            unlockNavigationCallback = l_unlockNavigationCallback_0, 
                            isDisabled = l_isDisabled_0, 
                            NextSelectionLeft = v18.props.NextSelectionLeft, 
                            NextSelectionRight = v18.props.NextSelectionRight, 
                            NextSelectionUp = v18.props.NextSelectionUp, 
                            NextSelectionDown = v18.props.NextSelectionDown, 
                            [v3.Ref] = l_forwardRef_0
                        }), 
                        HeavyIcon = v3.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            LayoutOrder = 3, 
                            Size = UDim2.new(0, 36, 0, 36), 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                            BackgroundTransparency = 1, 
                            Image = v15
                        })
                    }), 
                    ShortIcon = v3.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0, 0.5), 
                        LayoutOrder = 3, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        BackgroundTransparency = 1, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                        Image = v16
                    })
                })
            });
        end);
    end);
end;
return v3.forwardRef(function(v30, v31) --[[ Line: 148 ]]
    -- upvalues: v3 (copy), v17 (copy), v2 (copy)
    return v3.createElement(v17, v2.Dictionary.join(v30, {
        forwardRef = v31
    }));
end);
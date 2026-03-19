local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_RoactFitComponents_0 = v4.RoactFitComponents;
local l_FitFrameOnAxis_0 = l_RoactFitComponents_0.FitFrameOnAxis;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_withStyle_0 = v3.Style.withStyle;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v13 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates);
local l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateScalesPageComponentsForAutofocus;
local v15 = if v13 then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeSlider) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyTypeSlider_DEPRECATED);
local v16 = l_Images_0["icons/menu/body_female"];
local v17 = l_Images_0["icons/menu/body_male"];
local v18 = l_Images_0["icons/menu/body_neutral"];
local v19 = v2.PureComponent:extend("BodyTypeRadar");
v19.render = function(v20) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (copy), v2 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v15 (copy), v17 (copy), l_FitFrameOnAxis_0 (copy), l_RoactFitComponents_0 (copy), v18 (copy)
    return l_withStyle_0(function(v21) --[[ Line: 36 ]]
        -- upvalues: l_withLocalization_0 (ref), v20 (copy), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), v2 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v15 (ref), v17 (ref), l_FitFrameOnAxis_0 (ref), l_RoactFitComponents_0 (ref), v18 (ref)
        return l_withLocalization_0({
            bodyType = "Feature.Avatar.Label.BodyType"
        })(function(v22) --[[ Line: 39 ]]
            -- upvalues: v20 (ref), l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 (ref), v21 (copy), v2 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), v16 (ref), v15 (ref), v17 (ref), l_FitFrameOnAxis_0 (ref), l_RoactFitComponents_0 (ref), v18 (ref)
            local l_lockNavigationCallback_0 = v20.props.lockNavigationCallback;
            local l_unlockNavigationCallback_0 = v20.props.unlockNavigationCallback;
            local v25 = if l_FFlagAXMigrateScalesPageComponentsForAutofocus_0 then v20.props.layoutOrder else v20.props.LayoutOrder;
            local l_isDisabled_0 = v20.props.isDisabled;
            local l_Font_0 = v21.Font;
            local l_Theme_0 = v21.Theme;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v30 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local l_forwardRef_0 = v20.props.forwardRef;
            return v2.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 36), 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                BackgroundTransparency = 1, 
                LayoutOrder = v25
            }, {
                BodyTypeLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v30), 
                    BackgroundTransparency = 1, 
                    Text = v22.bodyType, 
                    TextSize = v30, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.TextTransparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1, 
                    Font = l_Font_1
                }), 
                Container = v2.createElement(l_FitFrameVertical_0, {
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    UpperRow = v2.createElement(l_FitFrameVertical_0, {
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        RthroWomanIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                            Image = v16, 
                            LayoutOrder = 1
                        }), 
                        BodyType = v2.createElement(v15, {
                            lockNavigationCallback = l_lockNavigationCallback_0, 
                            unlockNavigationCallback = l_unlockNavigationCallback_0, 
                            LayoutOrder = 2, 
                            isDisabled = l_isDisabled_0, 
                            NextSelectionLeft = v20.props.NextSelectionLeft, 
                            NextSelectionRight = v20.props.NextSelectionRight, 
                            NextSelectionUp = v20.props.NextSelectionUp, 
                            NextSelectionDown = v20.props.NextSelectionDown, 
                            [v2.Ref] = l_forwardRef_0
                        }), 
                        RthroManIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0, 0.5), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(1, -36, 0, 0), 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                            Image = v17, 
                            LayoutOrder = 3
                        })
                    }), 
                    LowerRow = v2.createElement(l_FitFrameOnAxis_0, {
                        axis = l_FitFrameOnAxis_0.Axis.Both, 
                        margin = l_RoactFitComponents_0.Rect.quad(8, 0, 0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        MiniFigIcon = v2.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            Size = UDim2.new(0, 36, 0, 36), 
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            BackgroundTransparency = 1, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_isDisabled_0 and 0.5 or l_Theme_0.IconEmphasis.Transparency, 
                            Image = v18
                        })
                    })
                })
            });
        end);
    end);
end;
return v2.forwardRef(function(v32, v33) --[[ Line: 149 ]]
    -- upvalues: v2 (copy), v19 (copy), v5 (copy)
    return v2.createElement(v19, v5.Dictionary.join(v32, {
        forwardRef = v33
    }));
end);
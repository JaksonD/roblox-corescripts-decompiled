local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitFrameHorizontal_0 = v3.FitFrameHorizontal;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v7 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v7.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v7.App.Button.Enum.ButtonType;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Core.Style.withStyle;
local v13 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v14 = l_Images_0["icons/common/robux"];
local v15 = v2.Component:extend(script.Name);
v15.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v15.render = function(v16) --[[ Line: 45 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy)
    return v2.createElement(v13, {
        keys = {
            title = {
                key = "IAPExperience.InsufficientRobux.Title.InsufficientRobux"
            }, 
            dontHaveEnough = {
                key = "IAPExperience.InsufficientRobux.Text.DontHaveEnough"
            }, 
            currentBalance = {
                key = "IAPExperience.InsufficientRobux.Text.CurrentBalance"
            }, 
            cancel = {
                key = "IAPExperience.InsufficientRobux.Action.Cancel"
            }, 
            buyRobux = {
                key = "IAPExperience.InsufficientRobux.Action.BuyRobux"
            }
        }, 
        render = function(v17) --[[ Line: 64 ]] --[[ Name: render ]]
            -- upvalues: v16 (copy)
            return v16:renderAlert(v17);
        end
    });
end;
v15.renderAlert = function(v18, v19) --[[ Line: 70 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy), l_FitFrameVertical_0 (copy), v3 (copy), l_FitTextLabel_0 (copy), l_FitFrameHorizontal_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy)
    return l_withStyle_0(function(v20) --[[ Line: 71 ]]
        -- upvalues: v2 (ref), l_InteractiveAlert_0 (ref), v18 (copy), v19 (copy), l_ButtonType_0 (ref), l_FitFrameVertical_0 (ref), v3 (ref), l_FitTextLabel_0 (ref), l_FitFrameHorizontal_0 (ref), l_ImageSetLabel_0 (ref), v14 (ref)
        local l_Font_0 = v20.Font;
        local l_Theme_0 = v20.Theme;
        local v23 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = v18.props.screenSize, 
            title = v19.title, 
            bodyText = v19.dontHaveEnough, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v18.props.closePrompt, 
                            text = v19.cancel
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v18.props.buyRobux, 
                            text = v19.buyRobux
                        }
                    }
                }
            }, 
            middleContent = function() --[[ Line: 99 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), l_FitFrameVertical_0 (ref), v3 (ref), l_FitTextLabel_0 (ref), l_Font_0 (copy), v19 (ref), l_Theme_0 (copy), v23 (copy), l_FitFrameHorizontal_0 (ref), l_ImageSetLabel_0 (ref), v14 (ref), v18 (ref)
                return v2.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    margin = v3.Rect.quad(10, 0, 10, 0), 
                    contentPadding = UDim.new(0, 30), 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    CurrentBalanceLabel = v2.createElement(l_FitTextLabel_0, {
                        width = l_FitTextLabel_0.Width.FitToText, 
                        BackgroundTransparency = 1, 
                        Font = l_Font_0.Body.Font, 
                        Text = v19.currentBalance, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency, 
                        TextSize = v23, 
                        LayoutOrder = 0
                    }), 
                    RobuxAmount = v2.createElement(l_FitFrameHorizontal_0, {
                        height = UDim.new(1, 0), 
                        contentPadding = UDim.new(0, 10), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1
                    }, {
                        Icon = v2.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.fromOffset(v23, v23), 
                            Image = v14, 
                            ImageColor3 = l_Theme_0.TextDefault.Color, 
                            ImageTransparency = l_Theme_0.TextDefault.Transparency
                        }), 
                        Text = v2.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Text = v18.props.robuxBalance, 
                            Font = l_Font_0.Body.Font, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextTransparency = l_Theme_0.TextDefault.Transparency, 
                            TextSize = v23, 
                            BackgroundTransparency = 1
                        })
                    })
                });
            end
        });
    end);
end;
return v15;
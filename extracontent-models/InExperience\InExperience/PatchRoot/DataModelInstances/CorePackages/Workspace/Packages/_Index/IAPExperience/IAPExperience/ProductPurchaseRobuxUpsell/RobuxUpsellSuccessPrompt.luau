local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.RoactFitComponents);
local l_FitFrameVertical_0 = v3.FitFrameVertical;
local l_FitTextLabel_0 = v3.FitTextLabel;
local v6 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v6.App.Constant.IconSize;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v13 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v14 = require(l_Parent_0.Generic.ModelViewport);
local v15 = l_Images_0["icons/status/imageunavailable"];
local v16 = v2.Component:extend(script.Name);
v16.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0)
};
v16.init = function(v17) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v17.contentRef = v2.createRef();
    v17.state = {
        contentSize = Vector2.new(0, 0)
    };
    v17.changeContentSize = function(v18) --[[ Line: 54 ]]
        -- upvalues: v17 (copy)
        if v17.state.contentSize ~= v18.AbsoluteSize then
            v17:setState({
                contentSize = v18.AbsoluteSize
            });
        end;
    end;
end;
v16.render = function(v19) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v13 (copy)
    return v2.createElement(v13, {
        keys = {
            PurchaseSucceededTitle = {
                key = "IAPExperience.PurchaseSuccess.Title.PurchaseSucceeded"
            }, 
            YouOwnText = {
                key = "IAPExperience.PurchaseSuccess.Text.YouOwn", 
                params = {
                    name = v19.props.itemName
                }
            }, 
            BalanceNow = {
                key = "IAPExperience.PurchaseSuccess.Text.BalanceNow"
            }, 
            BackToGameButtonText = {
                key = "IAPExperience.PurchaseSuccess.Action.BackToGame"
            }, 
            EquipText = {
                key = "IAPExperience.PurchaseSuccess.Action.Equip"
            }, 
            BackToShopText = {
                key = "IAPExperience.PurchaseSuccess.Action.BackToShop"
            }
        }, 
        render = function(v20) --[[ Line: 88 ]] --[[ Name: render ]]
            -- upvalues: v19 (copy)
            return v19:renderAlert(v20);
        end
    });
end;
v16.renderAlert = function(v21, v22) --[[ Line: 94 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), l_ButtonType_0 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_IconSize_0 (copy), v15 (copy), v14 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_FitTextLabel_0 (copy)
    local l_props_0 = v21.props;
    return l_withStyle_0(function(v24) --[[ Line: 97 ]]
        -- upvalues: v22 (copy), l_props_0 (copy), v21 (copy), l_ButtonType_0 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_IconSize_0 (ref), v15 (ref), v14 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), l_FitTextLabel_0 (ref)
        local l_Theme_0 = v24.Theme;
        local l_Font_0 = v24.Font;
        local v27 = v22.YouOwnText .. " " .. v22.BalanceNow:gsub("{robux}", utf8.char(57346) .. tostring(l_props_0.balance));
        local v28 = nil;
        v28 = if v21.props.equipActivated then {
            buttons = {
                {
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v22.BackToShopText, 
                        inputIcon = l_props_0.cancelControllerIcon
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.equipActivated, 
                        text = v22.EquipText, 
                        inputIcon = l_props_0.confirmControllerIcon
                    }
                }
            }
        } else {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = l_props_0.doneActivated, 
                        text = v22.BackToGameButtonText, 
                        inputIcon = l_props_0.confirmControllerIcon
                    }
                }
            }
        };
        local v29 = if l_props_0.itemIcon then v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, 85, 0, 85), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = l_props_0.itemIcon, 
            ImageTransparency = 0
        }) else v2.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 5, 0, 5), 
            Size = UDim2.new(0, l_IconSize_0.Large, 0, l_IconSize_0.Large), 
            ScaleType = Enum.ScaleType.Stretch, 
            Image = v15, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageTransparency = l_Theme_0.UIDefault.Transparency
        });
        if l_props_0.model then
            v29 = v2.createElement(v14, {
                model = l_props_0.model, 
                Position = UDim2.fromOffset(5, 5), 
                Size = UDim2.fromOffset(85, 85)
            });
        end;
        return v2.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v22.PurchaseSucceededTitle, 
            middleContent = function() --[[ Line: 175 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), l_FitFrameVertical_0 (ref), v21 (ref), v29 (ref), l_FitTextLabel_0 (ref), l_Font_0 (copy), v27 (copy), l_Theme_0 (copy)
                return v2.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 24), 
                    [v2.Ref] = v21.contentRef, 
                    [v2.Change.AbsoluteSize] = v21.changeContentSize
                }, {
                    ItemIconFrame = v2.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 0, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }, {
                        ItemIcon = v29
                    }), 
                    YouOwnText = v2.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        TextWrapped = true, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        maximumWidth = v21.state.contentSize.X, 
                        Font = l_Font_0.Body.Font, 
                        Text = v27, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end, 
            buttonStackInfo = v28
        });
    end);
end;
return v16;
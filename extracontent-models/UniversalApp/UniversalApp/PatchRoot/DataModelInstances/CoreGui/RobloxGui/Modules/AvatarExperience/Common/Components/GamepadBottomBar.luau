local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Text_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Text;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_FitFrameHorizontal_0 = v3.RoactFitComponents.FitFrameHorizontal;
local l_withStyle_0 = v9.Style.withStyle;
local l_SpringAnimatedItem_0 = v9.Utility.SpringAnimatedItem;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBarContent);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadBottomBarElement);
local v16 = require(l_Modules_0.LuaApp.Constants);
local v17 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = {
    dampingRatio = 1, 
    frequency = 2.5
};
local v20 = v4.PureComponent:extend("GamepadBottomBar");
v20.validateProps = v6.strictInterface({
    displayOrder = v6.number, 
    hideGamepadBottomBar = v6.optional(v6.boolean), 
    boundInputs = v6.table, 
    screenSize = v6.Vector2
});
v20.defaultProps = {
    hideGamepadBottomBar = false
};
v20.getDerivedStateFromProps = function(v21, _) --[[ Line: 54 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v18 (copy), v16 (copy)
    local v23 = v18.getNumElementsWithKeyField(v21.boundInputs) > 0;
    return {
        showBar = v23, 
        height = v23 and v16.GAMEPAD_BOTTOM_BAR_SIZE or v16.GAMEPAD_BOTTOM_BAR_SIZE / 2
    };
end;
v20.renderWithLocalization = function(v24, v25) --[[ Line: 63 ]] --[[ Name: renderWithLocalization ]]
    -- upvalues: l_withStyle_0 (copy), l_Text_0 (copy), v9 (copy), v4 (copy), l_CoreGui_0 (copy), v17 (copy), l_SpringAnimatedItem_0 (copy), v16 (copy), v19 (copy), v15 (copy), l_FitFrameHorizontal_0 (copy), v14 (copy)
    if not v24.state.showBar then
        return nil;
    else
        return l_withStyle_0(function(v26) --[[ Line: 67 ]]
            -- upvalues: v25 (copy), l_Text_0 (ref), v9 (ref), v4 (ref), l_CoreGui_0 (ref), v17 (ref), v24 (copy), l_SpringAnimatedItem_0 (ref), v16 (ref), v19 (ref), v15 (ref), l_FitFrameHorizontal_0 (ref), v14 (ref)
            local l_Theme_0 = v26.Theme;
            local l_Font_0 = v26.Font;
            local l_Font_1 = l_Font_0.Header2.Font;
            local v30 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
            local v31 = v25.bText or v25.backText;
            local v32 = l_Text_0.GetTextWidth(v31, l_Font_1, v30);
            local v33 = 24 + (v9.App.Constant.IconSize.Regular + v32 + 8) + 36;
            return v4.createElement(v4.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUIForGamepadBottomBar = v4.createElement(v17, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = v24.props.displayOrder, 
                    Enabled = not v24.props.hideGamepadBottomBar
                }, {
                    AnimatedFrame = v4.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                        regularProps = {
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            BackgroundColor3 = l_Theme_0.BackgroundUIContrast.Color, 
                            BackgroundTransparency = l_Theme_0.BackgroundUIContrast.Transparency, 
                            Size = UDim2.new(1, 0, 0, v16.GAMEPAD_BOTTOM_BAR_SIZE), 
                            ZIndex = 3
                        }, 
                        animatedValues = {
                            positionY = v24.state.height
                        }, 
                        mapValuesToProps = function(v34) --[[ Line: 99 ]] --[[ Name: mapValuesToProps ]]
                            return {
                                Position = UDim2.new(0, 0, 1, -v34.positionY)
                            };
                        end, 
                        springOptions = v19
                    }, {
                        BackElement = v4.createElement(v15, {
                            elementIcon = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png", 
                            elementText = v31, 
                            position = UDim2.new(0, 24, 0, 0)
                        }), 
                        UIElementsFrame = v4.createElement("Frame", {
                            Position = UDim2.new(0, v33, 0, 0), 
                            Size = UDim2.new(1, -v33, 1, 0), 
                            BackgroundTransparency = 1, 
                            ClipsDescendants = true
                        }, {
                            UIElements = v4.createElement(l_FitFrameHorizontal_0, {
                                height = UDim.new(1, 0), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                AnchorPoint = Vector2.new(1, 0), 
                                BackgroundTransparency = 1, 
                                Position = UDim2.new(1, -24, 0, 0), 
                                contentPadding = UDim.new(0, 36)
                            }, {
                                GamepadBottomBarElements = v4.createElement(v14, {
                                    width = v24.props.screenSize.X - v33, 
                                    boundInputs = v24.props.boundInputs
                                })
                            })
                        })
                    })
                })
            });
        end);
    end;
end;
v20.render = function(v35) --[[ Line: 140 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), l_withLocalization_0 (copy)
    local v36 = {
        backText = "CommonUI.Controls.Action.Back"
    };
    local v37 = v35.props.boundInputs[Enum.KeyCode.ButtonB];
    if v37 and v37.key then
        v36 = v7.Dictionary.join(v36, {
            bText = v37.key
        });
    end;
    return l_withLocalization_0(v36)(function(v38) --[[ Line: 153 ]]
        -- upvalues: v35 (copy)
        return v35:renderWithLocalization(v38);
    end);
end;
return (v5.connect(function(v39, _) --[[ Line: 158 ]]
    return {
        boundInputs = v39.GamepadBottomBar.boundInputs, 
        screenSize = v39.ScreenSize
    };
end)(v20));
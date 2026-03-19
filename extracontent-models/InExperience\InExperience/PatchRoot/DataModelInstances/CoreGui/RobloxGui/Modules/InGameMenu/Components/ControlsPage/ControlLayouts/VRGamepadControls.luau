local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameMenu");
local l_Array_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Array;
local v6 = require(script.Parent.Parent.ControlLayoutContainer);
local v7 = require(l_script_FirstAncestor_0.Components.ThemedTextLabel);
local v8 = require(l_script_FirstAncestor_0.Resources.Assets);
local v9 = require(l_script_FirstAncestor_0.Resources.Controls);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_script_FirstAncestor_0.Localization.withLocalization);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v13 = {
    ResetCameraLabel = "CoreScripts.InGameMenu.Controls.ResetCameraLabel", 
    MenuLabel = "CoreScripts.InGameMenu.Controls.MenuLabel", 
    SelectItemLabel = "CoreScripts.InGameMenu.Controls.SelectItemLabel", 
    BackExitLabel = "CoreScripts.InGameMenu.Controls.BackExitLabel", 
    FirstPersonCameraLabel = "CoreScripts.InGameMenu.Controls.FirstPersonCameraLabel", 
    JumpSelectLabel = "CoreScripts.InGameMenu.Controls.JumpSelectLabel"
};
return function(_) --[[ Line: 38 ]] --[[ Name: GamepadControls ]]
    -- upvalues: l_Roact_0 (copy), v6 (copy), l_ImageSetLabel_0 (copy), v8 (copy), v10 (copy), l_Array_0 (copy), v9 (copy), v13 (copy), v11 (copy), v7 (copy)
    return l_Roact_0.createElement(v6, {
        titleText = "CoreScripts.InGameMenu.Controls.GamepadTitle"
    }, {
        GamepadImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
            BackgroundTransparency = 1, 
            Image = v8.Images.GamepadQuest, 
            Size = UDim2.new(1, 0, 0.6, 0), 
            Position = UDim2.new(0.5, 16.5, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            SizeConstraint = Enum.SizeConstraint.RelativeXX, 
            [v10.Tag] = "data-testid=VRGamepadInstructions"
        }, {
            l_Array_0.map(v9.questGamepadLabels, function(v15, v16) --[[ Line: 51 ]]
                -- upvalues: v13 (ref), v11 (ref), l_Roact_0 (ref), v7 (ref)
                local v17 = v13[v15.labelKey];
                return v11({
                    v17
                })(function(v18) --[[ Line: 54 ]]
                    -- upvalues: l_Roact_0 (ref), v7 (ref), v15 (copy), v16 (copy)
                    return l_Roact_0.createElement(v7, {
                        key = v15.labelKey, 
                        fontKey = "Header2", 
                        themeKey = "TextEmphasis", 
                        TextXAlignment = v15.xAlignment or Enum.TextXAlignment.Right, 
                        Size = UDim2.new(v15.width, 0, 0.026, 0), 
                        Text = v18[1], 
                        LayoutOrder = v16, 
                        Position = UDim2.new(v15.xPosition, 0, v15.yPosition, 0), 
                        TextScaled = true
                    });
                end);
            end)
        })
    });
end;
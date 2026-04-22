local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Foundation);
local v7 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local l_useTokens_0 = v6.Hooks.useTokens;
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_Image_0 = v6.Image;
local l_PopoverSide_0 = v6.Enums.PopoverSide;
local l_Traversal_0 = v8.Traversal;
local v15 = require(l_RobloxGui_0.Modules.Settings.Components.Traversal.TraversalHistoryMenu);
local v16 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v17 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons);
local v18 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v19 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsUseKeyImages);
local l_FFlagTraversalLeaveArrowDown_0 = l_Traversal_0.Flags.FFlagTraversalLeaveArrowDown;
local l_FFlagFixTraversalHistoryMenuFixesV3_0 = l_Traversal_0.Flags.FFlagFixTraversalHistoryMenuFixesV3;
local v22 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons);
local l_FFlagGamepadIconSupportCheck_0 = v16.FFlagGamepadIconSupportCheck;
local function _(v24) --[[ Line: 52 ]]
    return v24 + (1 - v24) * 0.5;
end;
local function v40(v26, v27) --[[ Line: 56 ]] --[[ Name: KeyLabelIcon ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v28 = l_useTokens_0();
    local l_createElement_0 = v5.createElement;
    local l_l_View_0_0 = l_View_0;
    local v31 = {
        LayoutOrder = 1
    };
    local v32 = {
        Color3 = v28.Color.ActionStandard.Background.Color3
    };
    local v33;
    if v27 then
        local l_Transparency_0 = v28.Color.ActionStandard.Background.Transparency;
        v33 = l_Transparency_0 + (1 - l_Transparency_0) * 0.5;
    else
        v33 = v28.Color.ActionStandard.Background.Transparency;
    end;
    v32.Transparency = v33;
    v31.backgroundStyle = v32;
    v31.tag = "size-1000-700 row align-x-center align-y-center radius-medium";
    v32 = {};
    v33 = v5.createElement;
    local l_l_Text_0_0 = l_Text_0;
    local v36 = {
        Text = v26
    };
    local v37 = {
        Color3 = v28.Color.ActionStandard.Foreground.Color3
    };
    local v38;
    if v27 then
        local l_Transparency_1 = v28.Color.ActionStandard.Foreground.Transparency;
        v38 = l_Transparency_1 + (1 - l_Transparency_1) * 0.5;
    else
        v38 = v28.Color.ActionStandard.Foreground.Transparency;
    end;
    v37.Transparency = v38;
    v36.textStyle = v37;
    v36.tag = "text-title-small";
    v32.HotkeyText = v33(l_l_Text_0_0, v36);
    return l_createElement_0(l_l_View_0_0, v31, v32);
end;
local function v42(v41) --[[ Line: 78 ]] --[[ Name: Hint ]]
    -- upvalues: v18 (copy), v4 (copy), v19 (copy), v7 (copy), v5 (copy), l_Image_0 (copy), v40 (copy)
    if v18 == 2 and v4:IsSmallTouchScreen() then
        return nil;
    elseif v19 and (v41.lastInput == v7.Input.Pointer or v41.lastInput == v7.Input.Directional) then
        return v5.createElement(l_Image_0, {
            Image = if v41.lastInput == v7.Input.Directional then v41.gamepadButtonImageHint else v41.keyboardButtonImageHint, 
            imageStyle = {
                Color3 = v41.foregroundStyle.Color3, 
                Transparency = v41.isDisabled and 0.5 or v41.foregroundStyle.Transparency
            }, 
            tag = {
                ["size-800"] = not v41.isSmall, 
                ["size-700"] = v41.isSmall
            }
        });
    elseif v41.lastInput == v7.Input.Pointer then
        return v40(v41.keyboardHint, v41.isDisabled);
    elseif v41.lastInput == v7.Input.Directional then
        return v5.createElement(l_Image_0, {
            Image = v41.gamepadButtonImageHint, 
            imageStyle = {
                Color3 = v41.foregroundStyle.Color3, 
                Transparency = v41.isDisabled and 0.5 or v41.foregroundStyle.Transparency
            }, 
            tag = {
                ["size-600"] = not v41.isSmall, 
                ["size-500"] = v41.isSmall
            }
        });
    else
        return nil;
    end;
end;
local function v44(v43) --[[ Line: 112 ]] --[[ Name: ButtonText ]]
    -- upvalues: v5 (copy), l_Text_0 (copy)
    return v5.createElement(l_Text_0, {
        Text = v43.text, 
        LayoutOrder = 2, 
        textStyle = {
            Color3 = v43.foregroundStyle.Color3, 
            Transparency = v43.isDisabled and 0.5 or v43.foregroundStyle.Transparency
        }, 
        tag = {
            ["auto-x"] = true, 
            ["text-title-medium"] = not v43.isSmall, 
            ["text-title-small"] = v43.isSmall, 
            ["content-action-standard"] = not v43.isEmphasized, 
            ["content-action-soft-emphasis"] = v43.isEmphasized
        }
    });
end;
local function v47(v45, v46) --[[ Line: 147 ]] --[[ Name: supportsButton ]]
    -- upvalues: l_FFlagGamepadIconSupportCheck_0 (copy), v7 (copy), l_UserInputService_0 (copy)
    if not l_FFlagGamepadIconSupportCheck_0 or not v46 or v45 ~= v7.Input.Directional then
        return true;
    else
        return l_UserInputService_0:GamepadSupports(l_UserInputService_0:GetLastInputType(), v46);
    end;
end;
return v5.memo(function(v48) --[[ Line: 154 ]] --[[ Name: MenuButton ]]
    -- upvalues: l_useTokens_0 (copy), v22 (copy), v17 (copy), v5 (copy), v47 (copy), l_FFlagGamepadIconSupportCheck_0 (copy), l_UserInputService_0 (copy), l_View_0 (copy), v42 (copy), v19 (copy), v44 (copy), v18 (copy), v4 (copy), v7 (copy), l_Image_0 (copy), v40 (copy), l_Text_0 (copy), v15 (copy), l_FFlagTraversalLeaveArrowDown_0 (copy), l_FFlagFixTraversalHistoryMenuFixesV3_0 (copy), l_PopoverSide_0 (copy)
    local v49 = l_useTokens_0();
    local v50 = if v22 then v48.buttonRef else if v17 then v5.useRef(nil) else nil;
    local v51 = if v48.isEmphasized then v49.Color.ActionSoftEmphasis.Background else v49.Color.ActionStandard.Background;
    local v52 = if v48.isEmphasized then v49.Color.ActionSoftEmphasis.Foreground else v49.Color.ActionStandard.Foreground;
    local v53, v54 = v5.useState(v47(v48.lastInput, v48.gamepadButton));
    v5.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: l_FFlagGamepadIconSupportCheck_0 (ref), v48 (copy), l_UserInputService_0 (ref), v54 (copy), v47 (ref)
        local v55 = nil;
        if l_FFlagGamepadIconSupportCheck_0 and v48.gamepadButton then
            v55 = l_UserInputService_0.LastInputTypeChanged:Connect(function() --[[ Line: 167 ]]
                -- upvalues: v54 (ref), v47 (ref), v48 (ref)
                v54(v47(v48.lastInput, v48.gamepadButton));
            end);
        end;
        return function() --[[ Line: 172 ]]
            -- upvalues: v55 (ref)
            if v55 then
                v55:Disconnect();
            end;
        end;
    end, {
        v48.gamepadButton, 
        v48.lastInput
    });
    local l_createElement_1 = v5.createElement;
    local l_l_View_0_1 = l_View_0;
    local v58 = {
        onActivated = v48.onActivated, 
        isDisabled = v48.isDisabled, 
        LayoutOrder = v48.layoutOrder
    };
    local v59 = {
        Color3 = v51.Color3
    };
    local v60;
    if v48.isDisabled then
        local l_Transparency_2 = v51.Transparency;
        v60 = l_Transparency_2 + (1 - l_Transparency_2) * 0.5;
    else
        v60 = v51.Transparency;
    end;
    v59.Transparency = v60;
    v58.backgroundStyle = v59;
    v58.tag = {
        ["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true, 
        ["size-0-1200"] = not v48.isSmall, 
        ["size-0-1000"] = v48.isSmall, 
        ["bg-action-standard"] = not v48.isEmphasized, 
        ["bg-action-soft-emphasis"] = v48.isEmphasized
    };
    v58.ref = if not not v17 or v22 then v50 else nil;
    v58.Selectable = v22 and true or nil;
    return l_createElement_1(l_l_View_0_1, v58, {
        Button = if v17 then v5.createElement(l_View_0, {
            tag = "auto-xy row align-y-center align-x-center grow gap-small"
        }, {
            Hint = if not l_FFlagGamepadIconSupportCheck_0 or v53 then v5.createElement(v42, {
                lastInput = v48.lastInput, 
                keyboardHint = if v19 then nil else v48.keyboardHint, 
                gamepadButtonImageHint = v48.gamepadButtonImageHint, 
                keyboardButtonImageHint = if v19 then v48.keyboardButtonImageHint else nil, 
                isDisabled = v48.isDisabled, 
                foregroundStyle = v52, 
                isSmall = v48.isSmall
            }) else nil, 
            ButtonText = v5.createElement(v44, {
                text = v48.text, 
                isDisabled = v48.isDisabled, 
                foregroundStyle = v52, 
                isEmphasized = v48.isEmphasized, 
                isSmall = v48.isSmall
            })
        }) else nil, 
        Hint = if not (not l_FFlagGamepadIconSupportCheck_0 or v53) or v17 then nil else if v18 == 2 and v4:IsSmallTouchScreen() then nil else if v19 and (not (v48.lastInput ~= v7.Input.Pointer) or v48.lastInput == v7.Input.Directional) then v5.createElement(l_Image_0, {
            Image = if v48.lastInput == v7.Input.Directional then v48.gamepadButtonImageHint else v48.keyboardButtonImageHint, 
            imageStyle = {
                Color3 = v52.Color3, 
                Transparency = v48.isDisabled and 0.5 or v52.Transparency
            }, 
            tag = {
                ["size-800"] = not v48.isSmall, 
                ["size-700"] = v48.isSmall
            }
        }) else if v48.lastInput == v7.Input.Pointer then v40(v48.keyboardHint, v48.isDisabled) else if v48.lastInput == v7.Input.Directional then v5.createElement(l_Image_0, {
            Image = v48.gamepadButtonImageHint, 
            imageStyle = {
                Color3 = v52.Color3, 
                Transparency = v48.isDisabled and 0.5 or v52.Transparency
            }, 
            tag = {
                ["size-600"] = not v48.isSmall, 
                ["size-500"] = v48.isSmall
            }
        }) else nil, 
        ButtonText = if not v17 then v5.createElement(l_Text_0, {
            Text = v48.text, 
            LayoutOrder = 2, 
            textStyle = {
                Color3 = v52.Color3, 
                Transparency = v48.isDisabled and 0.5 or v52.Transparency
            }, 
            tag = {
                ["auto-x"] = true, 
                ["text-title-medium"] = not v48.isSmall, 
                ["text-title-small"] = v48.isSmall, 
                ["content-action-standard"] = not v48.isEmphasized, 
                ["content-action-soft-emphasis"] = v48.isEmphasized
            }
        }) else nil, 
        TraversalHistoryMenu = if v17 and v48.addTraversalHistoryMenu then v5.createElement(v15, {
            anchorRef = v50, 
            idleButtonStateIsDown = l_FFlagTraversalLeaveArrowDown_0 and true or not v48.isSmall, 
            currentPageChangeSignal = v48.currentPageChangeSignal, 
            isDarkOnDarkMode = true, 
            menuSide = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then if v48.isSmall then l_PopoverSide_0.Bottom else l_PopoverSide_0.Top else nil
        }) else nil
    });
end);
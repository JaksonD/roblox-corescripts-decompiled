local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v6 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_Image_0 = v4.Image;
local l_Traversal_0 = v6.Traversal;
local v12 = require(l_RobloxGui_0.Modules.Settings.Components.Traversal.TraversalHistoryMenu);
local v13 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons);
local v14 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v15 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsUseKeyImages);
local l_FFlagTraversalLeaveArrowDown_0 = l_Traversal_0.Flags.FFlagTraversalLeaveArrowDown;
local function _(v17) --[[ Line: 45 ]]
    return v17 + (1 - v17) * 0.5;
end;
local function v33(v19, v20) --[[ Line: 49 ]] --[[ Name: KeyLabelIcon ]]
    -- upvalues: l_useTokens_0 (copy), v3 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v21 = l_useTokens_0();
    local l_createElement_0 = v3.createElement;
    local l_l_View_0_0 = l_View_0;
    local v24 = {
        LayoutOrder = 1
    };
    local v25 = {
        Color3 = v21.Color.ActionStandard.Background.Color3
    };
    local v26;
    if v20 then
        local l_Transparency_0 = v21.Color.ActionStandard.Background.Transparency;
        v26 = l_Transparency_0 + (1 - l_Transparency_0) * 0.5;
    else
        v26 = v21.Color.ActionStandard.Background.Transparency;
    end;
    v25.Transparency = v26;
    v24.backgroundStyle = v25;
    v24.tag = "size-1000-700 row align-x-center align-y-center radius-medium";
    v25 = {};
    v26 = v3.createElement;
    local l_l_Text_0_0 = l_Text_0;
    local v29 = {
        Text = v19
    };
    local v30 = {
        Color3 = v21.Color.ActionStandard.Foreground.Color3
    };
    local v31;
    if v20 then
        local l_Transparency_1 = v21.Color.ActionStandard.Foreground.Transparency;
        v31 = l_Transparency_1 + (1 - l_Transparency_1) * 0.5;
    else
        v31 = v21.Color.ActionStandard.Foreground.Transparency;
    end;
    v30.Transparency = v31;
    v29.textStyle = v30;
    v29.tag = "text-title-small";
    v25.HotkeyText = v26(l_l_Text_0_0, v29);
    return l_createElement_0(l_l_View_0_0, v24, v25);
end;
local function v35(v34) --[[ Line: 71 ]] --[[ Name: Hint ]]
    -- upvalues: v14 (copy), v2 (copy), v15 (copy), v5 (copy), v3 (copy), l_Image_0 (copy), v33 (copy)
    if v14 == 2 and v2:IsSmallTouchScreen() then
        return nil;
    elseif v15 and (v34.lastInput == v5.Input.Pointer or v34.lastInput == v5.Input.Directional) then
        return v3.createElement(l_Image_0, {
            Image = if v34.lastInput == v5.Input.Directional then v34.gamepadButtonImageHint else v34.keyboardButtonImageHint, 
            imageStyle = {
                Color3 = v34.foregroundStyle.Color3, 
                Transparency = v34.isDisabled and 0.5 or v34.foregroundStyle.Transparency
            }, 
            tag = {
                ["size-800"] = not v34.isSmall, 
                ["size-700"] = v34.isSmall
            }
        });
    elseif v34.lastInput == v5.Input.Pointer then
        return v33(v34.keyboardHint, v34.isDisabled);
    elseif v34.lastInput == v5.Input.Directional then
        return v3.createElement(l_Image_0, {
            Image = v34.gamepadButtonImageHint, 
            imageStyle = {
                Color3 = v34.foregroundStyle.Color3, 
                Transparency = v34.isDisabled and 0.5 or v34.foregroundStyle.Transparency
            }, 
            tag = {
                ["size-600"] = not v34.isSmall, 
                ["size-500"] = v34.isSmall
            }
        });
    else
        return nil;
    end;
end;
local function v37(v36) --[[ Line: 105 ]] --[[ Name: ButtonText ]]
    -- upvalues: v3 (copy), l_Text_0 (copy)
    return v3.createElement(l_Text_0, {
        Text = v36.text, 
        LayoutOrder = 2, 
        textStyle = {
            Color3 = v36.foregroundStyle.Color3, 
            Transparency = v36.isDisabled and 0.5 or v36.foregroundStyle.Transparency
        }, 
        tag = {
            ["auto-x"] = true, 
            ["text-title-medium"] = not v36.isSmall, 
            ["text-title-small"] = v36.isSmall, 
            ["content-action-standard"] = not v36.isEmphasized, 
            ["content-action-soft-emphasis"] = v36.isEmphasized
        }
    });
end;
return v3.memo(function(v38) --[[ Line: 138 ]] --[[ Name: MenuButton ]]
    -- upvalues: l_useTokens_0 (copy), v13 (copy), v3 (copy), l_View_0 (copy), v35 (copy), v15 (copy), v37 (copy), v14 (copy), v2 (copy), v5 (copy), l_Image_0 (copy), v33 (copy), l_Text_0 (copy), v12 (copy), l_FFlagTraversalLeaveArrowDown_0 (copy)
    local v39 = l_useTokens_0();
    local v40 = if v13 then v3.useRef(nil) else nil;
    local v41 = if v38.isEmphasized then v39.Color.ActionSoftEmphasis.Background else v39.Color.ActionStandard.Background;
    local v42 = if v38.isEmphasized then v39.Color.ActionSoftEmphasis.Foreground else v39.Color.ActionStandard.Foreground;
    local l_createElement_1 = v3.createElement;
    local l_l_View_0_1 = l_View_0;
    local v45 = {
        onActivated = v38.onActivated, 
        isDisabled = v38.isDisabled, 
        LayoutOrder = v38.layoutOrder
    };
    local v46 = {
        Color3 = v41.Color3
    };
    local v47;
    if v38.isDisabled then
        local l_Transparency_2 = v41.Transparency;
        v47 = l_Transparency_2 + (1 - l_Transparency_2) * 0.5;
    else
        v47 = v41.Transparency;
    end;
    v46.Transparency = v47;
    v45.backgroundStyle = v46;
    v45.tag = {
        ["fill auto-x row align-y-center align-x-center gap-small radius-medium"] = true, 
        ["size-0-1200"] = not v38.isSmall, 
        ["size-0-1000"] = v38.isSmall, 
        ["bg-action-standard"] = not v38.isEmphasized, 
        ["bg-action-soft-emphasis"] = v38.isEmphasized
    };
    v45.ref = if v13 then v40 else nil;
    return l_createElement_1(l_l_View_0_1, v45, {
        Button = if v13 then v3.createElement(l_View_0, {
            tag = "auto-xy row align-y-center align-x-center grow gap-small"
        }, {
            Hint = v3.createElement(v35, {
                lastInput = v38.lastInput, 
                keyboardHint = if v15 then nil else v38.keyboardHint, 
                gamepadButtonImageHint = v38.gamepadButtonImageHint, 
                keyboardButtonImageHint = if v15 then v38.keyboardButtonImageHint else nil, 
                isDisabled = v38.isDisabled, 
                foregroundStyle = v42, 
                isSmall = v38.isSmall
            }), 
            ButtonText = v3.createElement(v37, {
                text = v38.text, 
                isDisabled = v38.isDisabled, 
                foregroundStyle = v42, 
                isEmphasized = v38.isEmphasized, 
                isSmall = v38.isSmall
            })
        }) else nil, 
        Hint = if not v13 then if v14 == 2 and v2:IsSmallTouchScreen() then nil else if v15 and (not (v38.lastInput ~= v5.Input.Pointer) or v38.lastInput == v5.Input.Directional) then v3.createElement(l_Image_0, {
            Image = if v38.lastInput == v5.Input.Directional then v38.gamepadButtonImageHint else v38.keyboardButtonImageHint, 
            imageStyle = {
                Color3 = v42.Color3, 
                Transparency = v38.isDisabled and 0.5 or v42.Transparency
            }, 
            tag = {
                ["size-800"] = not v38.isSmall, 
                ["size-700"] = v38.isSmall
            }
        }) else if v38.lastInput == v5.Input.Pointer then v33(v38.keyboardHint, v38.isDisabled) else if v38.lastInput == v5.Input.Directional then v3.createElement(l_Image_0, {
            Image = v38.gamepadButtonImageHint, 
            imageStyle = {
                Color3 = v42.Color3, 
                Transparency = v38.isDisabled and 0.5 or v42.Transparency
            }, 
            tag = {
                ["size-600"] = not v38.isSmall, 
                ["size-500"] = v38.isSmall
            }
        }) else nil else nil, 
        ButtonText = if not v13 then v3.createElement(l_Text_0, {
            Text = v38.text, 
            LayoutOrder = 2, 
            textStyle = {
                Color3 = v42.Color3, 
                Transparency = v38.isDisabled and 0.5 or v42.Transparency
            }, 
            tag = {
                ["auto-x"] = true, 
                ["text-title-medium"] = not v38.isSmall, 
                ["text-title-small"] = v38.isSmall, 
                ["content-action-standard"] = not v38.isEmphasized, 
                ["content-action-soft-emphasis"] = v38.isEmphasized
            }
        }) else nil, 
        TraversalHistoryMenu = if v13 and v38.addTraversalHistoryMenu then v3.createElement(v12, {
            anchorRef = v40, 
            idleButtonStateIsDown = l_FFlagTraversalLeaveArrowDown_0 and true or not v38.isSmall, 
            currentPageChangeSignal = v38.currentPageChangeSignal, 
            isDarkOnDarkMode = true
        }) else nil
    });
end);
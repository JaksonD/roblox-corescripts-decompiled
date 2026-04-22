local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.Settings.Utility);
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local _ = require(l_CorePackages_0.Packages.Signals);
local v10 = require(l_CorePackages_0.Packages.SignalsReact);
local v11 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v12 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v14 = require(script.Parent.MenuButton);
local l_useSignalState_0 = v10.useSignalState;
local l_useLastInput_0 = v12.useLastInput;
local l_Traversal_0 = v11.Traversal;
local l_View_0 = v8.View;
local v19 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v20 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons);
local v21 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsUseKeyImages);
local l_FFlagGamepadIconSupportCheck_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagGamepadIconSupportCheck;
local l_FFlagFixTraversalHistoryMenuFixesV3_0 = l_Traversal_0.Flags.FFlagFixTraversalHistoryMenuFixesV3;
local v24 = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false);
local v25 = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false);
local v26 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagIEMFocusNavSupportNewButtons);
local function v32(v27, v28, v29) --[[ Line: 41 ]] --[[ Name: createMenuButtons ]]
    -- upvalues: v7 (copy), l_View_0 (copy), v26 (copy), v14 (copy), v21 (copy), l_FFlagGamepadIconSupportCheck_0 (copy), v20 (copy)
    local v30 = {};
    for v31 = 1, #v27 do
        v30["MenuButtonContainer" .. v31] = v7.createElement(l_View_0, {
            tag = "fill row align-y-center", 
            LayoutOrder = v31, 
            SelectionGroup = v26 and true or nil
        }, {
            MenuButton = v7.createElement(v14, {
                text = v27[v31].text, 
                lastInput = v28, 
                keyboardHint = if v21 then nil else v27[v31].hint.keyboard, 
                keyboardButtonImageHint = if v21 then v27[v31].hint.keyboardButtonImage else nil, 
                gamepadButton = if l_FFlagGamepadIconSupportCheck_0 then v27[v31].hint.gamepadButton else nil, 
                gamepadButtonImageHint = v27[v31].hint.gamepadButtonImage, 
                onActivated = v27[v31].onActivated, 
                layoutOrder = 1, 
                isEmphasized = v27[v31].isEmphasized, 
                isSmall = v29, 
                isDisabled = v27[v31].getIsDisabled(), 
                addTraversalHistoryMenu = if v20 then v27[v31].addTraversalHistoryMenu else nil, 
                currentPageChangeSignal = if v20 then v27[v31].currentPageChangeSignal else nil, 
                buttonRef = if v26 then v27[v31].buttonRef else nil
            })
        });
    end;
    return v30;
end;
return function(v33) --[[ Line: 82 ]] --[[ Name: MenuButtons ]]
    -- upvalues: v7 (copy), v5 (copy), l_useSignalState_0 (copy), l_FFlagFixTraversalHistoryMenuFixesV3_0 (copy), v26 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_useLastInput_0 (copy), v21 (copy), v20 (copy), v25 (copy), v19 (copy), l_ContextActionService_0 (copy), l_UserInputService_0 (copy), v24 (copy), l_View_0 (copy), v32 (copy)
    local v34, _ = v7.useState(v5:IsSmallTouchScreen());
    local _ = l_useSignalState_0(v33.getCanRespawn);
    local v37 = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v7.useRef(nil) else nil;
    local v38 = v7.useRef(nil);
    if v26 then
        v7.useEffect(function() --[[ Line: 91 ]]
            -- upvalues: v33 (copy), v38 (copy)
            if v33.setResumeMenuButton then
                v33.setResumeMenuButton(v38.current);
            end;
        end, {
            v33.setResumeMenuButton
        });
    end;
    local v39, v40 = v7.useBinding("");
    local v41, v42 = v7.useBinding("");
    local v43, v44 = v7.useBinding("");
    local v45 = l_useLocalization_0({
        LeaveGame = l_Constants_0.LeaveGameLocalizedKey, 
        Respawn = l_Constants_0.RespawnLocalizedKey, 
        Resume = l_Constants_0.ResumeLocalizedKey
    });
    local v46 = l_useLastInput_0();
    local v47 = v7.useMemo(function() --[[ Line: 109 ]]
        -- upvalues: v45 (copy), v21 (ref), v39 (copy), v40 (copy), v33 (copy), l_Constants_0 (ref), v20 (ref), l_FFlagFixTraversalHistoryMenuFixesV3_0 (ref), v37 (copy), v41 (copy), v42 (copy), v43 (copy), v44 (copy), v25 (ref), v19 (ref), v26 (ref), v38 (copy)
        return {
            {
                name = "LeaveGameButton", 
                text = v45.LeaveGame, 
                hint = {
                    keyboard = "L", 
                    keyboardButtonImage = v21 and "icons/controls/keys/key_l" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonX, 
                    gamepadButtonImage = v39, 
                    setGamepadButtonImage = v40
                }, 
                isEmphasized = false, 
                getIsDisabled = function() --[[ Line: 122 ]] --[[ Name: getIsDisabled ]]
                    return false;
                end, 
                onActivated = function() --[[ Line: 125 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onLeaveGame(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeys = {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                }, 
                hotkeyFunc = function() --[[ Line: 129 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onLeaveGame(l_Constants_0.AnalyticsMenuHotkeySource);
                end, 
                addTraversalHistoryMenu = v20 and true or nil, 
                currentPageChangeSignal = if v20 then v33.currentPageChangeSignal else nil, 
                buttonRef = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v37 else nil
            }, 
            {
                name = "ResetButton", 
                text = v45.Respawn, 
                hint = {
                    keyboard = "R", 
                    keyboardButtonImage = v21 and "icons/controls/keys/key_r" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonY, 
                    gamepadButtonImage = v41, 
                    setGamepadButtonImage = v42
                }, 
                isEmphasized = false, 
                getIsDisabled = function() --[[ Line: 147 ]] --[[ Name: getIsDisabled ]]
                    -- upvalues: v33 (ref)
                    return not v33.getCanRespawn(false);
                end, 
                onActivated = function() --[[ Line: 150 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onRespawn(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeys = {
                    Enum.KeyCode.R, 
                    Enum.KeyCode.ButtonY
                }, 
                hotkeyFunc = function() --[[ Line: 154 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onRespawn(l_Constants_0.AnalyticsMenuHotkeySource);
                end
            }, 
            {
                name = "ResumeButton", 
                text = v45.Resume, 
                hint = {
                    keyboard = "ESC", 
                    keyboardButtonImage = v21 and "icons/controls/keys/key_esc" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonStart, 
                    gamepadButtonImage = v43, 
                    setGamepadButtonImage = v44
                }, 
                isEmphasized = not v25 and not (v19 == 1), 
                getIsDisabled = function() --[[ Line: 169 ]] --[[ Name: getIsDisabled ]]
                    return false;
                end, 
                onActivated = function() --[[ Line: 172 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onResume(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeyFunc = function() --[[ Line: 175 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v33 (ref), l_Constants_0 (ref)
                    v33.onResume(l_Constants_0.AnalyticsMenuHotkeySource);
                end, 
                hotkeys = {
                    Enum.KeyCode.ButtonB, 
                    Enum.KeyCode.ButtonStart
                }, 
                buttonRef = if v26 then v38 else nil
            }
        };
    end, {
        v45, 
        v33.onLeaveGame, 
        v33.onRespawn, 
        v33.onResume, 
        v33.getCanRespawn
    });
    local v50 = v7.useCallback(function(v48) --[[ Line: 184 ]]
        -- upvalues: v33 (copy), l_ContextActionService_0 (ref)
        if not v33.getVisibility() then
            return;
        else
            for v49 = 1, #v48 do
                if v48[v49].hotkeyFunc ~= nil then
                    l_ContextActionService_0:BindCoreAction(v48[v49].name, v48[v49].hotkeyFunc, false, unpack(v48[v49].hotkeys));
                end;
            end;
            return;
        end;
    end, {});
    local v53 = v7.useCallback(function(v51) --[[ Line: 201 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        for v52 = 1, #v51 do
            l_ContextActionService_0:UnbindCoreAction(v51[v52].name);
        end;
    end, {});
    local v77 = v7.useCallback(function(v54) --[[ Line: 207 ]]
        -- upvalues: v53 (copy), l_UserInputService_0 (ref), v33 (copy), v50 (copy)
        local function _(v55, v56) --[[ Line: 208 ]]
            -- upvalues: v53 (ref), v54 (copy)
            return function() --[[ Line: 209 ]]
                -- upvalues: v56 (copy), v53 (ref), v54 (ref), v55 (copy)
                if not v56() then
                    v53(v54);
                    v55();
                end;
            end;
        end;
        local _ = function(v58, v59) --[[ Line: 217 ]]
            -- upvalues: v53 (ref), v54 (copy)
            return function(_, v61, _) --[[ Line: 218 ]]
                -- upvalues: v58 (copy), v59 (copy), v53 (ref), v54 (ref)
                if v61 == Enum.UserInputState.Begin then
                    local l_v58_0 = v58;
                    local l_v59_0 = v59;
                    (function() --[[ Line: 209 ]]
                        -- upvalues: l_v59_0 (copy), v53 (ref), v54 (ref), l_v58_0 (copy)
                        if not l_v59_0() then
                            v53(v54);
                            l_v58_0();
                        end;
                    end)();
                end;
            end;
        end;
        for v66 = 1, #v54 do
            local v67 = v54[v66];
            local l_onActivated_0 = v54[v66].onActivated;
            local l_getIsDisabled_0 = v54[v66].getIsDisabled;
            local l_l_getIsDisabled_0_0 = l_getIsDisabled_0 --[[ copy: 9 -> 10 ]];
            local l_l_onActivated_0_0 = l_onActivated_0 --[[ copy: 8 -> 11 ]];
            v67.onActivated = function() --[[ Line: 209 ]]
                -- upvalues: l_l_getIsDisabled_0_0 (copy), v53 (ref), v54 (copy), l_l_onActivated_0_0 (copy)
                if not l_l_getIsDisabled_0_0() then
                    v53(v54);
                    l_l_onActivated_0_0();
                end;
            end;
            v67 = v54[v66];
            l_onActivated_0 = v54[v66].hotkeyFunc;
            l_getIsDisabled_0 = v54[v66].getIsDisabled;
            v67.hotkeyFunc = function(_, v73, _) --[[ Line: 218 ]]
                -- upvalues: l_onActivated_0 (copy), l_getIsDisabled_0 (copy), v53 (ref), v54 (copy)
                if v73 == Enum.UserInputState.Begin then
                    local l_l_onActivated_0_1 = l_onActivated_0;
                    local l_l_getIsDisabled_0_1 = l_getIsDisabled_0;
                    (function() --[[ Line: 209 ]]
                        -- upvalues: l_l_getIsDisabled_0_1 (copy), v53 (ref), v54 (ref), l_l_onActivated_0_1 (copy)
                        if not l_l_getIsDisabled_0_1() then
                            v53(v54);
                            l_l_onActivated_0_1();
                        end;
                    end)();
                end;
            end;
            v54[v66].hint.setGamepadButtonImage(l_UserInputService_0:GetImageForKeyCode(v54[v66].hint.gamepadButton));
        end;
        v33.setAddMenuKeyBindings(function() --[[ Line: 233 ]]
            -- upvalues: v50 (ref), v54 (copy)
            v50(v54);
        end);
        v33.setRemoveMenuKeyBindings(function() --[[ Line: 236 ]]
            -- upvalues: v53 (ref), v54 (copy)
            v53(v54);
        end);
        return v54;
    end, {});
    local v78 = v7.useMemo(function() --[[ Line: 243 ]]
        -- upvalues: v77 (copy), v47 (copy)
        return v77(v47);
    end, {
        v47
    });
    v7.useEffect(function() --[[ Line: 247 ]]
        -- upvalues: l_UserInputService_0 (ref), v78 (copy), v24 (ref)
        local v80 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 248 ]]
            -- upvalues: v78 (ref), l_UserInputService_0 (ref)
            for v79 = 1, #v78 do
                v78[v79].hint.setGamepadButtonImage(l_UserInputService_0:GetImageForKeyCode(v78[v79].hint.gamepadButton));
            end;
        end);
        return function() --[[ Line: 256 ]]
            -- upvalues: v24 (ref), v80 (copy)
            if v24 then
                v80:Disconnect();
            end;
        end;
    end, {
        v78
    });
    return v7.createElement(l_View_0, {
        tag = {
            ["size-full row align-y-center"] = true, 
            ["gap-small"] = not v34, 
            ["gap-xsmall"] = v34
        }
    }, (v32(v78, v46, v34)));
end;
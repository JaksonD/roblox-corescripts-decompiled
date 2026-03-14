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
local v11 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v13 = require(script.Parent.MenuButton);
local l_useSignalState_0 = v10.useSignalState;
local l_useLastInput_0 = v11.useLastInput;
local l_View_0 = v8.View;
local v17 = require(l_RobloxGui_0.Modules.Settings.Flags.FIntRelocateMobileMenuButtonsVariant);
local v18 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons);
local v19 = require(l_RobloxGui_0.Modules.Settings.Flags.FFlagMenuButtonsUseKeyImages);
local v20 = game:DefineFastFlag("MenuButtonsDisconnectGamepadConnected", false);
local v21 = game:DefineFastFlag("MenuButtonsUseGreyResumeButton", false);
local function v27(v22, v23, v24) --[[ Line: 33 ]] --[[ Name: createMenuButtons ]]
    -- upvalues: v7 (copy), l_View_0 (copy), v13 (copy), v19 (copy), v18 (copy)
    local v25 = {};
    for v26 = 1, #v22 do
        v25["MenuButtonContainer" .. v26] = v7.createElement(l_View_0, {
            tag = "fill row align-y-center", 
            LayoutOrder = v26
        }, {
            MenuButton = v7.createElement(v13, {
                text = v22[v26].text, 
                lastInput = v23, 
                keyboardHint = if v19 then nil else v22[v26].hint.keyboard, 
                keyboardButtonImageHint = if v19 then v22[v26].hint.keyboardButtonImage else nil, 
                gamepadButtonImageHint = v22[v26].hint.gamepadButtonImage, 
                onActivated = v22[v26].onActivated, 
                layoutOrder = 1, 
                isEmphasized = v22[v26].isEmphasized, 
                isSmall = v24, 
                isDisabled = v22[v26].getIsDisabled(), 
                addTraversalHistoryMenu = if v18 then v22[v26].addTraversalHistoryMenu else nil, 
                currentPageChangeSignal = if v18 then v22[v26].currentPageChangeSignal else nil
            })
        });
    end;
    return v25;
end;
return function(v28) --[[ Line: 70 ]] --[[ Name: MenuButtons ]]
    -- upvalues: v7 (copy), v5 (copy), l_useSignalState_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_useLastInput_0 (copy), v19 (copy), v18 (copy), v21 (copy), v17 (copy), l_ContextActionService_0 (copy), l_UserInputService_0 (copy), v20 (copy), l_View_0 (copy), v27 (copy)
    local v29, _ = v7.useState(v5:IsSmallTouchScreen());
    local _ = l_useSignalState_0(v28.getCanRespawn);
    local v32, v33 = v7.useBinding("");
    local v34, v35 = v7.useBinding("");
    local v36, v37 = v7.useBinding("");
    local v38 = l_useLocalization_0({
        LeaveGame = l_Constants_0.LeaveGameLocalizedKey, 
        Respawn = l_Constants_0.RespawnLocalizedKey, 
        Resume = l_Constants_0.ResumeLocalizedKey
    });
    local v39 = l_useLastInput_0();
    local v40 = v7.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v38 (copy), v19 (ref), v32 (copy), v33 (copy), v28 (copy), l_Constants_0 (ref), v18 (ref), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v21 (ref), v17 (ref)
        return {
            {
                name = "LeaveGameButton", 
                text = v38.LeaveGame, 
                hint = {
                    keyboard = "L", 
                    keyboardButtonImage = v19 and "icons/controls/keys/key_l" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonX, 
                    gamepadButtonImage = v32, 
                    setGamepadButtonImage = v33
                }, 
                isEmphasized = false, 
                getIsDisabled = function() --[[ Line: 100 ]] --[[ Name: getIsDisabled ]]
                    return false;
                end, 
                onActivated = function() --[[ Line: 103 ]] --[[ Name: onActivated ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onLeaveGame(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeys = {
                    Enum.KeyCode.L, 
                    Enum.KeyCode.ButtonX
                }, 
                hotkeyFunc = function() --[[ Line: 107 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onLeaveGame(l_Constants_0.AnalyticsMenuHotkeySource);
                end, 
                addTraversalHistoryMenu = v18 and true or nil, 
                currentPageChangeSignal = if v18 then v28.currentPageChangeSignal else nil
            }, 
            {
                name = "ResetButton", 
                text = v38.Respawn, 
                hint = {
                    keyboard = "R", 
                    keyboardButtonImage = v19 and "icons/controls/keys/key_r" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonY, 
                    gamepadButtonImage = v34, 
                    setGamepadButtonImage = v35
                }, 
                isEmphasized = false, 
                getIsDisabled = function() --[[ Line: 124 ]] --[[ Name: getIsDisabled ]]
                    -- upvalues: v28 (ref)
                    return not v28.getCanRespawn(false);
                end, 
                onActivated = function() --[[ Line: 127 ]] --[[ Name: onActivated ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onRespawn(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeys = {
                    Enum.KeyCode.R, 
                    Enum.KeyCode.ButtonY
                }, 
                hotkeyFunc = function() --[[ Line: 131 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onRespawn(l_Constants_0.AnalyticsMenuHotkeySource);
                end
            }, 
            {
                name = "ResumeButton", 
                text = v38.Resume, 
                hint = {
                    keyboard = "ESC", 
                    keyboardButtonImage = v19 and "icons/controls/keys/key_esc" or nil, 
                    gamepadButton = Enum.KeyCode.ButtonStart, 
                    gamepadButtonImage = v36, 
                    setGamepadButtonImage = v37
                }, 
                isEmphasized = not v21 and not (v17 == 1), 
                getIsDisabled = function() --[[ Line: 146 ]] --[[ Name: getIsDisabled ]]
                    return false;
                end, 
                onActivated = function() --[[ Line: 149 ]] --[[ Name: onActivated ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onResume(l_Constants_0.AnalyticsMenuButtonSource);
                end, 
                hotkeyFunc = function() --[[ Line: 152 ]] --[[ Name: hotkeyFunc ]]
                    -- upvalues: v28 (ref), l_Constants_0 (ref)
                    v28.onResume(l_Constants_0.AnalyticsMenuHotkeySource);
                end, 
                hotkeys = {
                    Enum.KeyCode.ButtonB, 
                    Enum.KeyCode.ButtonStart
                }
            }
        };
    end, {
        v38, 
        v28.onLeaveGame, 
        v28.onRespawn, 
        v28.onResume, 
        v28.getCanRespawn
    });
    local v43 = v7.useCallback(function(v41) --[[ Line: 160 ]]
        -- upvalues: v28 (copy), l_ContextActionService_0 (ref)
        if not v28.getVisibility() then
            return;
        else
            for v42 = 1, #v41 do
                if v41[v42].hotkeyFunc ~= nil then
                    l_ContextActionService_0:BindCoreAction(v41[v42].name, v41[v42].hotkeyFunc, false, unpack(v41[v42].hotkeys));
                end;
            end;
            return;
        end;
    end, {});
    local v46 = v7.useCallback(function(v44) --[[ Line: 177 ]]
        -- upvalues: l_ContextActionService_0 (ref)
        for v45 = 1, #v44 do
            l_ContextActionService_0:UnbindCoreAction(v44[v45].name);
        end;
    end, {});
    local v70 = v7.useCallback(function(v47) --[[ Line: 183 ]]
        -- upvalues: v46 (copy), l_UserInputService_0 (ref), v28 (copy), v43 (copy)
        local function _(v48, v49) --[[ Line: 184 ]]
            -- upvalues: v46 (ref), v47 (copy)
            return function() --[[ Line: 185 ]]
                -- upvalues: v49 (copy), v46 (ref), v47 (ref), v48 (copy)
                if not v49() then
                    v46(v47);
                    v48();
                end;
            end;
        end;
        local _ = function(v51, v52) --[[ Line: 193 ]]
            -- upvalues: v46 (ref), v47 (copy)
            return function(_, v54, _) --[[ Line: 194 ]]
                -- upvalues: v51 (copy), v52 (copy), v46 (ref), v47 (ref)
                if v54 == Enum.UserInputState.Begin then
                    local l_v51_0 = v51;
                    local l_v52_0 = v52;
                    (function() --[[ Line: 185 ]]
                        -- upvalues: l_v52_0 (copy), v46 (ref), v47 (ref), l_v51_0 (copy)
                        if not l_v52_0() then
                            v46(v47);
                            l_v51_0();
                        end;
                    end)();
                end;
            end;
        end;
        for v59 = 1, #v47 do
            local v60 = v47[v59];
            local l_onActivated_0 = v47[v59].onActivated;
            local l_getIsDisabled_0 = v47[v59].getIsDisabled;
            local l_l_getIsDisabled_0_0 = l_getIsDisabled_0 --[[ copy: 9 -> 10 ]];
            local l_l_onActivated_0_0 = l_onActivated_0 --[[ copy: 8 -> 11 ]];
            v60.onActivated = function() --[[ Line: 185 ]]
                -- upvalues: l_l_getIsDisabled_0_0 (copy), v46 (ref), v47 (copy), l_l_onActivated_0_0 (copy)
                if not l_l_getIsDisabled_0_0() then
                    v46(v47);
                    l_l_onActivated_0_0();
                end;
            end;
            v60 = v47[v59];
            l_onActivated_0 = v47[v59].hotkeyFunc;
            l_getIsDisabled_0 = v47[v59].getIsDisabled;
            v60.hotkeyFunc = function(_, v66, _) --[[ Line: 194 ]]
                -- upvalues: l_onActivated_0 (copy), l_getIsDisabled_0 (copy), v46 (ref), v47 (copy)
                if v66 == Enum.UserInputState.Begin then
                    local l_l_onActivated_0_1 = l_onActivated_0;
                    local l_l_getIsDisabled_0_1 = l_getIsDisabled_0;
                    (function() --[[ Line: 185 ]]
                        -- upvalues: l_l_getIsDisabled_0_1 (copy), v46 (ref), v47 (ref), l_l_onActivated_0_1 (copy)
                        if not l_l_getIsDisabled_0_1() then
                            v46(v47);
                            l_l_onActivated_0_1();
                        end;
                    end)();
                end;
            end;
            v47[v59].hint.setGamepadButtonImage(l_UserInputService_0:GetImageForKeyCode(v47[v59].hint.gamepadButton));
        end;
        v28.setAddMenuKeyBindings(function() --[[ Line: 209 ]]
            -- upvalues: v43 (ref), v47 (copy)
            v43(v47);
        end);
        v28.setRemoveMenuKeyBindings(function() --[[ Line: 212 ]]
            -- upvalues: v46 (ref), v47 (copy)
            v46(v47);
        end);
        return v47;
    end, {});
    local v71 = v7.useMemo(function() --[[ Line: 219 ]]
        -- upvalues: v70 (copy), v40 (copy)
        return v70(v40);
    end, {
        v40
    });
    v7.useEffect(function() --[[ Line: 223 ]]
        -- upvalues: l_UserInputService_0 (ref), v71 (copy), v20 (ref)
        local v73 = l_UserInputService_0.GamepadConnected:Connect(function() --[[ Line: 224 ]]
            -- upvalues: v71 (ref), l_UserInputService_0 (ref)
            for v72 = 1, #v71 do
                v71[v72].hint.setGamepadButtonImage(l_UserInputService_0:GetImageForKeyCode(v71[v72].hint.gamepadButton));
            end;
        end);
        return function() --[[ Line: 232 ]]
            -- upvalues: v20 (ref), v73 (copy)
            if v20 then
                v73:Disconnect();
            end;
        end;
    end, {
        v71
    });
    return v7.createElement(l_View_0, {
        tag = {
            ["size-full row align-y-center"] = true, 
            ["gap-small"] = not v29, 
            ["gap-xsmall"] = v29
        }
    }, (v27(v71, v39, v29)));
end;
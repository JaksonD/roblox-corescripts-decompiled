local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v4 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v5 = require(l_RobloxGui_0.Modules.Settings.leaveGame);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_Constants_0 = require(l_RobloxGui_0.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"));
local v11 = require(l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface")):IsEnabled();
local v12 = require(l_CorePackages_0.Packages.Foundation);
local v13 = require(script.Parent.Telemetry);
local v14 = require(script.Parent.NextUpState);
local l_useFocusGuiObject_0 = v7.useFocusGuiObject;
local l_useLastInputMode_0 = v8.useLastInputMode;
local l_Button_0 = v12.Button;
local l_ButtonVariant_0 = v12.Enums.ButtonVariant;
local l_InputSize_0 = v12.Enums.InputSize;
local l_Text_0 = v12.Text;
local l_View_0 = v12.View;
local l_useTokens_0 = v12.Hooks.useTokens;
local v23 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local v24 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
local v25 = if v24 then require(l_RobloxGui_0.Modules.Chrome.Service) else nil;
local v26 = if v24 then require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Unibar.Constants) else nil;
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableConsoleExpControls_0 = v27.FFlagEnableConsoleExpControls;
local l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 = v27.FFlagChromeShortcutRemoveRespawnOnLeavePage;
return v6.memo(function(v30) --[[ Line: 48 ]] --[[ Name: LeaveButtonsContainer ]]
    -- upvalues: l_useTokens_0 (copy), v6 (copy), l_useLastInputMode_0 (copy), l_useFocusGuiObject_0 (copy), l_useLocalization_0 (copy), l_Constants_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v24 (copy), v25 (copy), v26 (copy), l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 (copy), l_ContextActionService_0 (copy), v23 (copy), v13 (copy), v14 (copy), v5 (copy), v4 (copy), v11 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_InputSize_0 (copy), l_ButtonVariant_0 (copy)
    local v31 = l_useTokens_0();
    local v32 = v6.useRef(nil);
    local v33 = l_useLastInputMode_0();
    local v34 = l_useFocusGuiObject_0();
    local v35 = l_useLocalization_0({
        [l_Constants_0.ConfirmLeaveGameLocalizedKey] = l_Constants_0.ConfirmLeaveGameLocalizedKey, 
        [l_Constants_0.LeaveGameLocalizedKey] = l_Constants_0.LeaveGameLocalizedKey, 
        [l_Constants_0.DontLeaveGameLocalizedKey] = l_Constants_0.DontLeaveGameLocalizedKey
    });
    local v40 = v6.useCallback(function(_, v37, v38) --[[ Line: 60 ]]
        -- upvalues: v30 (copy)
        if v37 == Enum.UserInputState.Begin then
            local v39 = true;
            if v38.UserInputType ~= Enum.UserInputType.Gamepad1 then
                v39 = true;
                if v38.UserInputType ~= Enum.UserInputType.Gamepad2 then
                    v39 = true;
                    if v38.UserInputType ~= Enum.UserInputType.Gamepad3 then
                        v39 = v38.UserInputType == Enum.UserInputType.Gamepad4;
                    end;
                end;
            end;
            v30.onDontLeave(v39);
        end;
    end, {
        v30.onDontLeave
    });
    v6.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v24 (ref), v25 (ref), v26 (ref), l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 (ref), l_ContextActionService_0 (ref), v40 (copy)
        if l_FFlagEnableConsoleExpControls_0 then
            if v24 and v25 and v26 then
                if l_FFlagChromeShortcutRemoveRespawnOnLeavePage_0 then
                    v25:setShortcutBar(v26.TILTMENU_LEAVE_DIALOG_SHORTCUTBAR_ID);
                else
                    v25:setShortcutBar(v26.TILTMENU_DIALOG_SHORTCUTBAR_ID);
                end;
            end;
        else
            l_ContextActionService_0:BindCoreAction("LeaveGameCancelAction", v40, false, Enum.KeyCode.ButtonB);
        end;
        return function() --[[ Line: 84 ]]
            -- upvalues: l_ContextActionService_0 (ref)
            l_ContextActionService_0:UnbindCoreAction("LeaveGameCancelAction");
        end;
    end, {
        v40
    });
    v6.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v33 (copy), v34 (copy), v32 (copy)
        if v33 == "Focus" then
            v34(v32.current);
            return;
        else
            v34(nil);
            return;
        end;
    end, {
        v33, 
        v32.current
    });
    local v41 = if v23 then v6.useRef(false) else nil;
    local v43 = v23 and function(v42) --[[ Line: 99 ]]
        -- upvalues: v41 (copy), v13 (ref)
        if v41.current then
            return;
        else
            v41.current = true;
            v13.logNextUpExitModalAction(v42);
            return;
        end;
    end or nil;
    if v23 then
        v6.useEffect(function() --[[ Line: 109 ]]
            -- upvalues: v43 (copy), v13 (ref)
            return function() --[[ Line: 110 ]]
                -- upvalues: v43 (ref), v13 (ref)
                v43(v13.NextUpSortViewActionType.CloseExitModalEscape);
            end;
        end, {});
    end;
    local v44 = v6.useCallback(function() --[[ Line: 116 ]]
        -- upvalues: v23 (ref), v43 (copy), v13 (ref), v14 (ref), v5 (ref)
        if v23 then
            v43(v13.NextUpSortViewActionType.LeaveGame);
        else
            v13.logNextUpSortView(v14.getNextUpTilesLoaded());
        end;
        v5(true);
    end, {});
    local v45 = v6.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v23 (ref), v43 (copy), v13 (ref), v14 (ref), v30 (copy), v4 (ref)
        if v23 then
            v43(v13.NextUpSortViewActionType.CloseExitModalClick);
        else
            v13.logNextUpSortView(v14.getNextUpTilesLoaded());
        end;
        v30.onDontLeave(v4:IsUsingGamepad());
    end, {
        v30.onDontLeave
    });
    local v46 = "text-heading-medium";
    if v4:IsSmallTouchScreen() then
        v46 = "text-heading-small";
    elseif v11 then
        v46 = "text-heading-large";
    end;
    return v6.createElement(l_View_0, {
        Position = UDim2.new(0, 0, 0, v11 and 100 or 0), 
        tag = "size-full-0 auto-y col gap-large", 
        LayoutOrder = 1
    }, {
        LeaveGameText = v6.createElement(l_Text_0, {
            Text = v35[l_Constants_0.ConfirmLeaveGameLocalizedKey], 
            LayoutOrder = 1, 
            tag = ("text-wrap %* auto-y size-full-0"):format(v46), 
            textStyle = v31.Color.Extended.White.White_100
        }), 
        LeaveButtonsContainer = v6.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "size-full-0 auto-y row align-x-center gap-medium wrap flex-x-fill"
        }, {
            LeaveGameButton = v6.createElement(l_Button_0, {
                text = v35[l_Constants_0.LeaveGameLocalizedKey], 
                size = l_InputSize_0.Medium, 
                variant = l_ButtonVariant_0.SoftEmphasis, 
                width = UDim.new(0, v30.buttonSize), 
                LayoutOrder = 1, 
                ref = v32, 
                onActivated = v44
            }), 
            DontLeaveGameButton = v6.createElement(l_Button_0, {
                text = v35[l_Constants_0.DontLeaveGameLocalizedKey], 
                size = l_InputSize_0.Medium, 
                variant = l_ButtonVariant_0.Standard, 
                width = UDim.new(0, v30.buttonSize), 
                LayoutOrder = 2, 
                onActivated = v45
            })
        })
    });
end);
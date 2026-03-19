local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Signals);
local v7 = require(l_CorePackages_0.Packages.SignalsReact);
local v8 = require(l_CorePackages_0.Workspace.Packages.DataHydration);
local v9 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon);
local v10 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v11 = require(l_CorePackages_0.Workspace.Packages.Localization);
local v12 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_View_0 = v4.View;
local l_getGameInfoStore_0 = v8.Game.getGameInfoStore;
local l_Traversal_0 = v9.Traversal;
local l_useLastInputMode_0 = v10.useLastInputMode;
local l_Constants_0 = l_Traversal_0.Constants;
local l_TeleportLeaveConfirmation_0 = l_Traversal_0.TeleportLeaveConfirmation;
local l_useLocalization_0 = v11.Hooks.useLocalization;
local l_GetInputModeStore_0 = v12.GetInputModeStore;
local l_Input_0 = v12.Input;
local l_FFlagTraversalRemoveLastInput_0 = l_Traversal_0.Flags.FFlagTraversalRemoveLastInput;
return v5.memo(function(v23) --[[ Line: 39 ]] --[[ Name: TraversalLeaveConfirmation ]]
    -- upvalues: v5 (copy), l_FFlagTraversalRemoveLastInput_0 (copy), l_useLastInputMode_0 (copy), l_useLocalization_0 (copy), v7 (copy), l_getGameInfoStore_0 (copy), v6 (copy), l_UserInputService_0 (copy), l_GetInputModeStore_0 (copy), l_Input_0 (copy), l_Constants_0 (copy), l_ContextActionService_0 (copy), l_GuiService_0 (copy), l_View_0 (copy), l_TeleportLeaveConfirmation_0 (copy)
    local v24 = v5.useRef(nil);
    local v25 = nil;
    if not l_FFlagTraversalRemoveLastInput_0 then
        v25 = l_useLastInputMode_0();
    end;
    local v26 = l_useLocalization_0({
        previous = "CoreScripts.TopBar.Traversal.BackButtonDefault"
    });
    local v27 = v7.useSignalState(l_getGameInfoStore_0(false).getAndFetchGameInfo((tostring(v23.universeId))).data);
    local v28 = nil;
    local v29 = nil;
    if typeof(v27) == "table" then
        v28 = v27.name;
        v29 = tonumber(v27.rootPlaceId);
    else
        v28 = v26.previous;
    end;
    local v32 = v5.useCallback(function(_, v31) --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        if v31 == Enum.UserInputState.End then
            v23.onCancel();
            return Enum.ContextActionResult.Sink;
        else
            return Enum.ContextActionResult.Pass;
        end;
    end, {
        v23.onCancel
    });
    if l_FFlagTraversalRemoveLastInput_0 then
        v5.useEffect(function() --[[ Line: 69 ]]
            -- upvalues: v6 (ref), l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v29 (ref), l_Constants_0 (ref), l_ContextActionService_0 (ref), v32 (copy), l_GuiService_0 (ref), v24 (copy)
            local v37 = v6.createEffect(function(v33) --[[ Line: 70 ]]
                -- upvalues: l_UserInputService_0 (ref), l_GetInputModeStore_0 (ref), l_Input_0 (ref), v29 (ref), l_Constants_0 (ref), l_ContextActionService_0 (ref), v32 (ref), l_GuiService_0 (ref), v24 (ref)
                local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
                local v35 = l_GetInputModeStore_0(v33).getLastInputType(v33);
                local v36 = true;
                if v35 ~= l_Input_0.Directional then
                    v36 = false;
                    if v35 == l_Input_0.Pointer then
                        v36 = l_l_UserInputService_0_LastInputType_0 == Enum.UserInputType.Keyboard;
                    end;
                end;
                if v29 ~= nil and v29 > l_Constants_0.NO_PLACE_ID then
                    if v36 then
                        l_ContextActionService_0:BindCoreAction("FREEZE_CONTROLLER", function() --[[ Line: 76 ]]

                        end, false, Enum.UserInputType.Gamepad1);
                        l_ContextActionService_0:BindCoreAction("EXIT_DIALOG", v32, false, Enum.KeyCode.ButtonB);
                        l_GuiService_0.SelectedCoreObject = v24.current;
                        return;
                    end;
                elseif v36 then
                    l_ContextActionService_0:UnbindCoreAction("FREEZE_CONTROLLER");
                    l_ContextActionService_0:UnbindCoreAction("EXIT_DIALOG");
                end;
            end);
            return function() --[[ Line: 87 ]]
                -- upvalues: v37 (copy)
                v37();
            end;
        end, {
            v29
        });
    else
        v5.useEffect(function() --[[ Line: 92 ]]
            -- upvalues: v25 (ref), v29 (ref), l_Constants_0 (ref), l_ContextActionService_0 (ref), v32 (copy), l_GuiService_0 (ref), v24 (copy)
            local v38 = v25 == "Focus";
            if v29 ~= nil and v29 > l_Constants_0.NO_PLACE_ID then
                if v38 then
                    l_ContextActionService_0:BindCoreAction("FREEZE_CONTROLLER", function() --[[ Line: 96 ]]

                    end, false, Enum.UserInputType.Gamepad1);
                    l_ContextActionService_0:BindCoreAction("EXIT_DIALOG", v32, false, Enum.KeyCode.ButtonB);
                    l_GuiService_0.SelectedCoreObject = if v24.current then v24.current else nil;
                    return;
                end;
            elseif v38 then
                l_ContextActionService_0:UnbindCoreAction("FREEZE_CONTROLLER");
                l_ContextActionService_0:UnbindCoreAction("EXIT_DIALOG");
            end;
        end, {
            v29, 
            v25
        });
    end;
    return v23.isDialogOpen and v29 and v5.createElement("ScreenGui", {
        DisplayOrder = 10, 
        IgnoreGuiInset = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        NoEscapeZone = v5.createElement(l_View_0, {
            tag = "auto-xy size-full", 
            selectionGroup = {
                SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            }
        }, {
            Dialog = v5.createElement(l_TeleportLeaveConfirmation_0, {
                onCancel = v23.onCancel, 
                onClose = v23.onClose, 
                placeId = v29, 
                teleportName = v28, 
                source = v23.source, 
                ref = v24
            })
        })
    });
end);
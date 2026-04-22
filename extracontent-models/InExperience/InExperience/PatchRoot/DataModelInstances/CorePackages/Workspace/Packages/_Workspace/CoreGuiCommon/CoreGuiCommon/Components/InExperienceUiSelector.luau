local l_GamepadService_0 = game:GetService("GamepadService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CoreGuiCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Chrome);
local v5 = require(l_Parent_0.Foundation);
local v6 = require(l_Parent_0.Localization);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.SignalsReact);
local l_useLocalization_0 = v6.Hooks.useLocalization;
local l_FocusOnChrome_0 = v4.FocusUtils.FocusOnChrome;
local l_GetUiSelectorSignalStore_0 = require(l_script_FirstAncestor_0.Stores).GetUiSelectorSignalStore;
local l_BaseMenu_0 = v5.UNSTABLE.BaseMenu;
local l_InputSize_0 = v5.Enums.InputSize;
return function(_) --[[ Line: 27 ]] --[[ Name: InExperienceUiSelector ]]
    -- upvalues: v8 (copy), l_GetUiSelectorSignalStore_0 (copy), v7 (copy), l_useLocalization_0 (copy), l_GuiService_0 (copy), l_FocusOnChrome_0 (copy), l_GamepadService_0 (copy), v5 (copy), l_BaseMenu_0 (copy), l_InputSize_0 (copy)
    local v15 = v8.useSignalState(l_GetUiSelectorSignalStore_0);
    local v16 = v8.useSignalState(v15.getVisibility);
    local v17 = v7.useRef(nil);
    local v18 = v7.useRef(nil);
    local v19 = l_useLocalization_0({
        robloxMenu = "CoreScripts.InGameMenu.Controls.RobloxMenu", 
        uiNavToggle = "CoreScripts.InGameMenu.GameSettings.UINavToggle"
    });
    v7.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v16 (copy), v18 (copy), l_GuiService_0 (ref)
        if v16 and v18.current then
            l_GuiService_0.SelectedCoreObject = v18.current;
            return;
        else
            if not v16 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
            return;
        end;
    end, {
        v16
    });
    local v22 = v7.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v19 (copy), v18 (copy), v15 (copy), l_FocusOnChrome_0 (ref), l_GamepadService_0 (ref)
        return {
            {
                id = "RobloxMenu", 
                text = v19.robloxMenu, 
                ref = v18, 
                onActivated = function() --[[ Line: 51 ]] --[[ Name: onActivated ]]
                    -- upvalues: v15 (ref), l_FocusOnChrome_0 (ref)
                    v15.setVisibility(false);
                    l_FocusOnChrome_0();
                end
            }, 
            {
                id = "UiNavigationMode", 
                text = v19.uiNavToggle, 
                onActivated = function() --[[ Line: 59 ]] --[[ Name: onActivated ]]
                    -- upvalues: v15 (ref), l_GamepadService_0 (ref)
                    v15.setVisibility(false);
                    local _, _ = pcall(function() --[[ Line: 61 ]]
                        -- upvalues: l_GamepadService_0 (ref)
                        l_GamepadService_0:AutoSelectGui();
                    end);
                end
            }
        };
    end, {
        v15, 
        v19
    });
    if v16 then
        return (v7.createElement(v5.View, {
            tag = "position-center-center anchor-center-center auto-xy radius-medium bg-surface-200", 
            ref = v17, 
            selectionGroup = {
                SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
                SelectionBehaviorUp = Enum.SelectionBehavior.Stop
            }, 
            testId = "in-experience-ui-selector"
        }, {
            Menu = v7.createElement(l_BaseMenu_0.Root, {
                items = v22, 
                size = l_InputSize_0.Medium, 
                radius = v5.Enums.Radius.Medium
            })
        }));
    else
        return nil;
    end;
end;
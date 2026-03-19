local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.Cryo);
local v7 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v8 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigationEventNameEnum_0 = v8.FocusNavigationEventNameEnum;
local l_useEventMap_0 = v7.useEventMap;
local l_useLastInputMethod_0 = v8.useLastInputMethod;
local v12 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v13 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v14 = require(l_Modules_0.LuaApp.Flags.GetFFlagDisableUADPadNavigationInVR);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_DropdownMenu_0 = v5.App.Menu.DropdownMenu;
return function(v17) --[[ Line: 57 ]]
    -- upvalues: v12 (copy), v13 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_useEventMap_0 (copy), l_useLastInputMethod_0 (copy), v14 (copy), l_IsVRAppBuild_0 (copy), l_GuiService_0 (copy), l_ContextActionService_0 (copy), v6 (copy), l_DropdownMenu_0 (copy)
    local v18 = v12(v13);
    local v19, v20 = v4.useState(nil);
    local v21, v22 = v4.useState(false);
    local v23, v24 = v4.useState(false);
    local v25 = v4.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v21 (copy), l_FocusNavigationEventNameEnum_0 (ref)
        if v21 then
            return {
                [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NoOpEvent, 
                [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NoOpEvent
            };
        else
            return {};
        end;
    end, {
        v21
    });
    local v26 = l_useEventMap_0(v25, v20);
    local v27 = l_useLastInputMethod_0();
    local v28 = if v14() then (not (v27 ~= "Gamepad") or v27 == "Keyboard") and not l_IsVRAppBuild_0() else v27 == "Gamepad" or v27 == "Keyboard";
    local v30 = v4.useCallback(function(v29) --[[ Line: 80 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if v17.analyticsContext then
            v18.EventStream:setRBXEvent(v17.analyticsContext, "DropdownMenuState", {
                menuOpen = v29
            });
        end;
    end, {
        v18, 
        v17.analyticsContext
    });
    local v32 = v4.useCallback(function(v31) --[[ Line: 88 ]]
        -- upvalues: v17 (copy), v18 (copy)
        if v17.analyticsContext then
            v18.EventStream:setRBXEvent(v17.analyticsContext, "DropdownMenuSelect", {
                selection = tostring(v31)
            });
        end;
        return v17.onChange(v31);
    end, {
        v18, 
        v17.analyticsContext, 
        v17.onChange
    });
    local v34 = v4.useCallback(function(v33) --[[ Line: 97 ]]
        -- upvalues: v22 (copy), v30 (copy), v24 (copy), v19 (copy), v17 (copy), l_GuiService_0 (ref), l_ContextActionService_0 (ref), v28 (copy)
        v22(v33);
        v30(v33);
        v24(false);
        if v19 and v17.selectionGroupName then
            if v33 then
                l_GuiService_0:AddSelectionParent(v17.selectionGroupName, v19);
                l_ContextActionService_0:BindAction("CloseDropdownBind", function() --[[ Line: 106 ]]
                    -- upvalues: v24 (ref)
                    v24(true);
                end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
            else
                l_ContextActionService_0:UnbindAction("CloseDropdownBind");
                v24(false);
                l_GuiService_0:RemoveSelectionGroup(v17.selectionGroupName);
                if v28 then
                    l_GuiService_0:Select(v19);
                end;
            end;
        end;
        if v17.onMenuOpenChange then
            v17.onMenuOpenChange(v33);
        end;
    end, {
        v19, 
        v17.selectionGroupName, 
        v17.onMenuOpenChange
    });
    local v35 = v6.Dictionary.join(v17, {
        onMenuOpenChange = v34, 
        onChange = v32, 
        selectionGroupName = v6.None, 
        analyticsContext = v6.None, 
        selectionOrder = 1, 
        isForcedClosed = v23
    });
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        Selectable = false, 
        ref = v26
    }, {
        DropdownMenu = v4.createElement(l_DropdownMenu_0, v35)
    });
end;
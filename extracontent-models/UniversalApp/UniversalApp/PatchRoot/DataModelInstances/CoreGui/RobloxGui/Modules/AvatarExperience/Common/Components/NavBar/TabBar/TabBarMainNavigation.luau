local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local v9 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v9.useFocusGuiObject;
local v11 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v12 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v11.FocusNavigationEventNameEnum;
local l_findValueKeyInRefCache_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.findValueKeyInRefCache;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_useFocusController_0 = v5.useFocusController;
local l_useStyle_0 = v8.Core.Style.useStyle;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.TabBar.TabBarButton);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXMigrateTabBarMainNavigationToFocusNavigation2", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v22 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward, 
    [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward
};
local function v29(v23, v24, v25, v26) --[[ Line: 48 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v9 (copy), v22 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v12 (copy)
    local v27 = v9.useEventMap(v22, v23);
    local v28 = v4.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v12 (ref), v24 (copy), v25 (copy), v26 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v12.onRelease(v24)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v12.onRelease(v25)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v12.onRelease(v26)
            }
        };
    end, {
        v24, 
        v26, 
        v25
    });
    return v9.useEventHandlerMap(v28, v27);
end;
return function(v30) --[[ Line: 84 ]]
    -- upvalues: v5 (copy), v4 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v7 (copy), l_useStyle_0 (copy), l_useFocusGuiObject_0 (copy), v20 (copy), l_findValueKeyInRefCache_0 (copy), l_GuiService_0 (copy), v29 (copy), l_useTableWrappedCallbackRef_0 (copy), v18 (copy), l_Focusable_0 (copy)
    local v31 = v5.useRefCache();
    local v32, v33 = v4.useState({});
    local v34 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v36 = v4.useCallback(function(v35) --[[ Line: 89 ]]
        -- upvalues: v32 (copy), v33 (copy), v7 (ref), v4 (ref)
        if not v32[v35] then
            v33(v7.Dictionary.join(v32, {
                [v35] = v4.createRef()
            }));
        end;
        return v32[v35];
    end, {
        v32
    });
    local l_layoutOrder_0 = v30.layoutOrder;
    local l_navHeight_0 = v30.navHeight;
    local l_zIndex_0 = v30.zIndex;
    local l_selectedTabIndex_0 = v30.selectedTabIndex;
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_mainNavigationRef_0 = v30.mainNavigationRef;
    local v43 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v44 = nil;
    if v20 then
        local v46 = v4.useCallback(function(v45) --[[ Line: 112 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v43 (copy), v30 (copy), v34 (copy)
            v45.cancelled = true;
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v43 and v30.NextSelectionUp and v30.NextSelectionUp.current then
                    v43(v30.NextSelectionUp.current);
                    return;
                end;
            else
                v34.moveFocusUp();
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v43 else v34, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v30.NextSelectionUp else nil
        });
        local v49 = v4.useCallback(function(v47) --[[ Line: 125 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v31 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v43 (copy), v34 (copy)
            v47.cancelled = true;
            local v48 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v31);
            if v48 and v48 > 1 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v43 then
                        v43(v31[v48 - 1].current);
                        return;
                    end;
                else
                    v34.moveFocusLeft();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v43 else v34
        });
        local v52 = v4.useCallback(function(v50) --[[ Line: 138 ]]
            -- upvalues: l_findValueKeyInRefCache_0 (ref), l_GuiService_0 (ref), v31 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v43 (copy), v34 (copy)
            v50.cancelled = true;
            local v51 = l_findValueKeyInRefCache_0(l_GuiService_0.SelectedCoreObject, v31);
            if v51 and v51 < #v31 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v43 then
                        v43(v31[v51 + 1].current);
                        return;
                    end;
                else
                    v34.moveFocusRight();
                end;
            end;
        end, {
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v43 else v34
        });
        local v53 = v29(nil, v46, v49, v52);
        v44 = l_useTableWrappedCallbackRef_0(v53);
    end;
    local v59 = v4.useCallback(function(v54, v55) --[[ Line: 155 ]]
        -- upvalues: l_selectedTabIndex_0 (copy), v30 (copy), v4 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v18 (ref), l_Focusable_0 (ref), v36 (copy), v31 (copy), v20 (ref), v34 (copy), v5 (ref)
        local v56 = l_selectedTabIndex_0 == v54;
        local l_selectTab_0 = v30.selectTab;
        local l_tabs_0 = v30.tabs;
        return v4.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v18 else l_Focusable_0[v18], {
            tabIndex = v54, 
            tabsLength = #l_tabs_0, 
            tabTitle = v55.Title, 
            layoutOrder = v54, 
            isSelected = v56, 
            frameRef = v36(v54), 
            onActivate = function() --[[ Line: 169 ]] --[[ Name: onActivate ]]
                -- upvalues: l_selectTab_0 (copy), v54 (copy)
                l_selectTab_0(v54);
            end, 
            ref = v31[v54], 
            NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v54 > 1 and v31[v54 - 1] or nil, 
            NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v54 < #l_tabs_0 and v31[v54 + 1] or nil, 
            inputBindings = if not (not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v20) and v34 ~= nil then {
                ShiftLeft = v5.Input.onBegin(Enum.KeyCode.ButtonL1, function() --[[ Line: 184 ]]
                    -- upvalues: v54 (copy), v34 (ref)
                    if v54 > 1 then
                        v34.moveFocusLeft();
                    end;
                end), 
                ShiftRight = v5.Input.onBegin(Enum.KeyCode.ButtonR1, function() --[[ Line: 189 ]]
                    -- upvalues: v54 (copy), l_tabs_0 (copy), v34 (ref)
                    if v54 < #l_tabs_0 then
                        v34.moveFocusRight();
                    end;
                end)
            } else nil
        });
    end, {
        l_selectedTabIndex_0, 
        v30.selectTab, 
        v30.tabs, 
        v31, 
        v36, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v34
    });
    local v64 = v4.useCallback(function() --[[ Line: 207 ]]
        -- upvalues: v30 (copy), v4 (ref), v59 (copy)
        local l_tabs_1 = v30.tabs;
        local v61 = {
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        for v62, v63 in l_tabs_1 do
            v61[v63.Name] = v59(v62, v63);
        end;
        return v61;
    end, {
        v30.tabs, 
        v59
    });
    return v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        ClipsDescendants = true, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BorderSizePixel = 0, 
        LayoutOrder = l_layoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_navHeight_0), 
        ZIndex = l_zIndex_0, 
        ref = l_mainNavigationRef_0, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v30.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v30.NextSelectionDown, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v31[l_selectedTabIndex_0]
    }, {
        NavFrame = v4.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            ref = if v20 then v44 else nil, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or v20 then nil else {
                ToTopBar = v5.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 248 ]]
                    -- upvalues: v34 (copy)
                    v34.moveFocusUp();
                end)
            }
        }, v64(v34))
    });
end;
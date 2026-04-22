local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Foundation);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.MenuItems.DropdownReportMenuItem);
local v6 = require(l_script_FirstAncestor_0.Components.MenuItems.ButtonReportMenuItem);
local v7 = require(l_script_FirstAncestor_0.Components.MenuItems.FreeCommentsMenuItem);
local v8 = require(l_script_FirstAncestor_0.Components.MenuItems.ModalBasedSelectorMenuItem);
local v9 = require(l_script_FirstAncestor_0.Components.MenuItems.ChatModalSelectorMenuItem);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Components.Constants);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local l_FFlagInGameMenuAddChatLineReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagInGameMenuAddChatLineReporting;
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagReportFocusNavIEMButtons);
return function(v16, v17, v18, v19, v20) --[[ Line: 22 ]] --[[ Name: getMenuItemsFromConfigs ]]
    -- upvalues: l_useLocalization_0 (copy), v11 (copy), v13 (copy), v3 (copy), v15 (copy), v7 (copy), v6 (copy), v2 (copy), l_ButtonVariant_0 (copy), v5 (copy), v8 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy), v9 (copy)
    local v21 = {};
    local v22 = l_useLocalization_0(v11.localizationKeys);
    local v23 = nil;
    if v13 then
        v23 = v3.useCallback(function(v24) --[[ Line: 34 ]]
            -- upvalues: v18 (copy)
            if v18.onDropdownMenuOpenChange then
                v18.onDropdownMenuOpenChange(v24);
            end;
        end, {
            v18.onDropdownMenuOpenChange
        });
    end;
    local v25 = if v15 then v3.useRef(nil) else nil;
    if v15 then
        v3.useEffect(function() --[[ Line: 45 ]]
            -- upvalues: v18 (copy), v25 (copy)
            if v18.setLastSelectableObjects and v25.current then
                v18.setLastSelectableObjects({
                    v25.current
                });
            end;
        end, {
            v25, 
            v18.setLastSelectableObjects
        });
    end;
    local l_v19_0 = v19;
    if v15 then
        l_v19_0 = {};
        for _, v28 in v19 do
            if v28.getIsVisible(v16) then
                table.insert(l_v19_0, v28);
            end;
        end;
    end;
    for v29, v30 in l_v19_0 do
        if v15 or v30.getIsVisible(v16) then
            local l_componentType_0 = v30.componentType;
            local l_componentName_0 = v30.componentName;
            if l_componentType_0 ~= "generic" then
                if l_componentType_0 == "freeComments" then
                    v21[l_componentName_0] = v3.createElement(v7, {
                        layoutOrder = v29, 
                        comment = v16.comment, 
                        placeholderText = v22.ReportCommentPlaceholder, 
                        menuContainerWidth = v18.menuWidth, 
                        isSmallPortraitViewport = v20, 
                        onUpdate = function(v33) --[[ Line: 75 ]] --[[ Name: onUpdate ]]
                            -- upvalues: v30 (copy), v16 (copy), v17 (copy), v18 (copy)
                            v30.onUpdate(v33, v16, v17, v18);
                        end, 
                        ref = if v15 and v29 == #l_v19_0 then v25 else nil
                    });
                elseif l_componentType_0 == "button" then
                    local v34 = v30.getIconSrc(v18);
                    v21[l_componentName_0] = v3.createElement(v6, {
                        label = if v30.fieldLabel == "" then v30.fieldLabel else v22[v30.fieldLabel], 
                        button = v3.createElement(v2.Button, {
                            variant = if v30.variant == "primary" then l_ButtonVariant_0.SubEmphasis else l_ButtonVariant_0.Subtle, 
                            text = v22[v30.getButtonLabel(v18)], 
                            icon = if v34 ~= "" then v34 else nil, 
                            width = UDim.new(1, 0), 
                            isDisabled = v30.getIsDisabled ~= nil and v30.getIsDisabled(v16, v18), 
                            onActivated = function() --[[ Line: 96 ]] --[[ Name: onActivated ]]
                                -- upvalues: v30 (copy), v16 (copy), v17 (copy), v18 (copy)
                                v30.onClick(v16, v17, v18);
                            end, 
                            ref = if v15 and v29 == #l_v19_0 then v25 else nil
                        }), 
                        menuContainerWidth = v18.menuWidth, 
                        layoutOrder = v29, 
                        isSmallPortraitViewport = v20
                    });
                elseif l_componentType_0 == "dropdown" then
                    v21[l_componentName_0] = v3.createElement(v5, {
                        label = v22[v30.fieldLabel], 
                        placeholderText = v22.ChooseOne, 
                        layoutOrder = v29, 
                        onSelect = function(v35) --[[ Line: 112 ]] --[[ Name: onSelect ]]
                            -- upvalues: v30 (copy), v16 (copy), v17 (copy), v18 (copy)
                            v30.onUpdateSelectedOption(v35, v16, v17, v18);
                        end, 
                        onMenuOpenChange = v23, 
                        menuContainerWidth = v18.menuWidth, 
                        readonlyValue = v22[v30.readonlyValue], 
                        selections = v30.getMenuItems(v16), 
                        isSmallPortraitViewport = v20, 
                        minHeight = v20 and 0 or v11.MenuItemHeight, 
                        ref = if v15 and v29 == #l_v19_0 then v25 else nil
                    });
                elseif l_componentType_0 == "modalSelector" then
                    v21[l_componentName_0] = v3.createElement(v8, {
                        label = v22[v30.fieldLabel], 
                        layoutOrder = v29, 
                        onSelect = function(v36, v37, v38) --[[ Line: 129 ]] --[[ Name: onSelect ]]
                            -- upvalues: v30 (copy), v16 (copy), v17 (copy), v18 (copy)
                            local v39 = {
                                label = v36, 
                                subLabel = v37, 
                                identifier = v38
                            };
                            v30.onUpdateSelectedOption(v39, v16, v17, v18);
                        end, 
                        onMenuOpenChange = v23, 
                        menuContainerWidth = v18.menuWidth, 
                        selectorHeight = v11.MenuItemHeight, 
                        selectedValue = if v30.getSelectedValue then v22[v30.getSelectedValue(v16)] or v30.getSelectedValue(v16) or nil else nil, 
                        selections = v30.getMenuItems(v16, v22), 
                        viewportHeight = v18.viewportDimension.height, 
                        viewportWidth = v18.viewportDimension.width, 
                        isSmallPortraitViewport = v20, 
                        placeholderText = v22.ChooseOne, 
                        ref = if v15 and v29 == #l_v19_0 then v25 else nil
                    });
                elseif l_FFlagInGameMenuAddChatLineReporting_0 and l_componentType_0 == "chatModalSelector" then
                    v21[l_componentName_0] = v3.createElement(v9, {
                        label = v22[v30.fieldLabel], 
                        layoutOrder = v29, 
                        onSelect = function(v40, v41) --[[ Line: 158 ]] --[[ Name: onSelect ]]
                            -- upvalues: v30 (copy), v16 (copy), v17 (copy), v18 (copy)
                            v30.onUpdateSelectedOption(v40, v41, v16, v17, v18);
                        end, 
                        onMenuOpenChange = v23, 
                        menuContainerWidth = v18.menuWidth, 
                        selectorHeight = v11.MenuItemHeight, 
                        selectedValue = if v30.getSelectedValue then v30.getSelectedValue(v16) or nil else nil, 
                        isSmallPortraitViewport = v20, 
                        placeholderText = v22.ChooseOne, 
                        ref = if v15 and v29 == #l_v19_0 then v25 else nil
                    });
                end;
            end;
        end;
    end;
    return v21;
end;
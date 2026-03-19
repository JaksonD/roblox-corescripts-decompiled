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
return function(v15, v16, v17, v18, v19) --[[ Line: 21 ]] --[[ Name: getMenuItemsFromConfigs ]]
    -- upvalues: l_useLocalization_0 (copy), v11 (copy), v13 (copy), v3 (copy), v7 (copy), v6 (copy), v2 (copy), l_ButtonVariant_0 (copy), v5 (copy), v8 (copy), l_FFlagInGameMenuAddChatLineReporting_0 (copy), v9 (copy)
    local v20 = {};
    local v21 = l_useLocalization_0(v11.localizationKeys);
    local v22 = nil;
    if v13 then
        v22 = v3.useCallback(function(v23) --[[ Line: 33 ]]
            -- upvalues: v17 (copy)
            if v17.onDropdownMenuOpenChange then
                v17.onDropdownMenuOpenChange(v23);
            end;
        end, {
            v17.onDropdownMenuOpenChange
        });
    end;
    for v24, v25 in v18 do
        if v25.getIsVisible(v15) then
            local l_componentType_0 = v25.componentType;
            local l_componentName_0 = v25.componentName;
            if l_componentType_0 ~= "generic" then
                if l_componentType_0 == "freeComments" then
                    v20[l_componentName_0] = v3.createElement(v7, {
                        layoutOrder = v24, 
                        comment = v15.comment, 
                        placeholderText = v21.ReportCommentPlaceholder, 
                        menuContainerWidth = v17.menuWidth, 
                        isSmallPortraitViewport = v19, 
                        onUpdate = function(v28) --[[ Line: 53 ]] --[[ Name: onUpdate ]]
                            -- upvalues: v25 (copy), v15 (copy), v16 (copy), v17 (copy)
                            v25.onUpdate(v28, v15, v16, v17);
                        end
                    });
                elseif l_componentType_0 == "button" then
                    local v29 = v25.getIconSrc(v17);
                    v20[l_componentName_0] = v3.createElement(v6, {
                        label = if v25.fieldLabel == "" then v25.fieldLabel else v21[v25.fieldLabel], 
                        button = v3.createElement(v2.Button, {
                            variant = if v25.variant == "primary" then l_ButtonVariant_0.SubEmphasis else l_ButtonVariant_0.Subtle, 
                            text = v21[v25.getButtonLabel(v17)], 
                            icon = if v29 ~= "" then v29 else nil, 
                            width = UDim.new(1, 0), 
                            isDisabled = v25.getIsDisabled ~= nil and v25.getIsDisabled(v15, v17), 
                            onActivated = function() --[[ Line: 71 ]] --[[ Name: onActivated ]]
                                -- upvalues: v25 (copy), v15 (copy), v16 (copy), v17 (copy)
                                v25.onClick(v15, v16, v17);
                            end
                        }), 
                        menuContainerWidth = v17.menuWidth, 
                        layoutOrder = v24, 
                        isSmallPortraitViewport = v19
                    });
                elseif l_componentType_0 == "dropdown" then
                    v20[l_componentName_0] = v3.createElement(v5, {
                        label = v21[v25.fieldLabel], 
                        placeholderText = v21.ChooseOne, 
                        layoutOrder = v24, 
                        onSelect = function(v30) --[[ Line: 84 ]] --[[ Name: onSelect ]]
                            -- upvalues: v25 (copy), v15 (copy), v16 (copy), v17 (copy)
                            v25.onUpdateSelectedOption(v30, v15, v16, v17);
                        end, 
                        onMenuOpenChange = v22, 
                        menuContainerWidth = v17.menuWidth, 
                        readonlyValue = v21[v25.readonlyValue], 
                        selections = v25.getMenuItems(v15), 
                        isSmallPortraitViewport = v19, 
                        minHeight = v19 and 0 or v11.MenuItemHeight
                    });
                elseif l_componentType_0 == "modalSelector" then
                    v20[l_componentName_0] = v3.createElement(v8, {
                        label = v21[v25.fieldLabel], 
                        layoutOrder = v24, 
                        onSelect = function(v31, v32, v33) --[[ Line: 98 ]] --[[ Name: onSelect ]]
                            -- upvalues: v25 (copy), v15 (copy), v16 (copy), v17 (copy)
                            local v34 = {
                                label = v31, 
                                subLabel = v32, 
                                identifier = v33
                            };
                            v25.onUpdateSelectedOption(v34, v15, v16, v17);
                        end, 
                        onMenuOpenChange = v22, 
                        menuContainerWidth = v17.menuWidth, 
                        selectorHeight = v11.MenuItemHeight, 
                        selectedValue = if v25.getSelectedValue then v21[v25.getSelectedValue(v15)] or v25.getSelectedValue(v15) or nil else nil, 
                        selections = v25.getMenuItems(v15, v21), 
                        viewportHeight = v17.viewportDimension.height, 
                        viewportWidth = v17.viewportDimension.width, 
                        isSmallPortraitViewport = v19, 
                        placeholderText = v21.ChooseOne
                    });
                elseif l_FFlagInGameMenuAddChatLineReporting_0 and l_componentType_0 == "chatModalSelector" then
                    v20[l_componentName_0] = v3.createElement(v9, {
                        label = v21[v25.fieldLabel], 
                        layoutOrder = v24, 
                        onSelect = function(v35, v36) --[[ Line: 124 ]] --[[ Name: onSelect ]]
                            -- upvalues: v25 (copy), v15 (copy), v16 (copy), v17 (copy)
                            v25.onUpdateSelectedOption(v35, v36, v15, v16, v17);
                        end, 
                        onMenuOpenChange = v22, 
                        menuContainerWidth = v17.menuWidth, 
                        selectorHeight = v11.MenuItemHeight, 
                        selectedValue = if v25.getSelectedValue then v25.getSelectedValue(v15) or nil else nil, 
                        isSmallPortraitViewport = v19, 
                        placeholderText = v21.ChooseOne
                    });
                end;
            end;
        end;
    end;
    return v20;
end;
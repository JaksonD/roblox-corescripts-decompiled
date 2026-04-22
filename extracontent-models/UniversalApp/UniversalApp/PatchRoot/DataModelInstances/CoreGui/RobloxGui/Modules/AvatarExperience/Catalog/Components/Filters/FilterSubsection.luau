local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useIsGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useIsGamepad;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.RadioButtonGroup);
local l_CheckboxGroup_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Components.Filters.CheckboxGroup;
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v10 = UDim.new(0, 4);
local function _(v11) --[[ Line: 44 ]] --[[ Name: getTotalHeight ]]
    -- upvalues: v10 (copy)
    return v11 + 19 + v10.Offset;
end;
return function(v13) --[[ Line: 48 ]] --[[ Name: FilterSubsection ]]
    -- upvalues: l_useStyle_0 (copy), l_useIsGamepad_0 (copy), v2 (copy), v10 (copy), l_CheckboxGroup_0 (copy), v5 (copy), l_Focusable_0 (copy), v8 (copy), v7 (copy)
    local v14 = l_useStyle_0();
    local l_Theme_0 = v14.Theme;
    local l_Font_0 = v14.Font;
    local v17 = l_useIsGamepad_0();
    local v18, v19 = v2.useBinding(0);
    local function v21(v20) --[[ Line: 57 ]] --[[ Name: onHeightChanged ]]
        -- upvalues: v19 (copy), v13 (copy), v10 (ref)
        v19(v20);
        if v13.onHeightChanged then
            v13.onHeightChanged(v20 + 19 + v10.Offset);
        end;
    end;
    local v22 = if v13.selectionMode == "multiple" then l_CheckboxGroup_0 else v5;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v18:map(function(v23) --[[ Line: 67 ]]
            -- upvalues: v10 (ref)
            return UDim2.new(1, 0, 0, v23 + 19 + v10.Offset);
        end), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v13.LayoutOrder, 
        ref = v13.frameRef, 
        NextSelectionUp = v13.NextSelectionUp, 
        NextSelectionDown = v13.NextSelectionDown
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v10
        }), 
        Title = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            Text = v13.title, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency
        }), 
        RadioButtonGroupContainer = v2.createElement("Frame", {
            Size = v18:map(v8.mapHeightToSize), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            RadioButtons = v2.createElement(v22, {
                items = v13.items, 
                itemHeight = v7.SortAndFiltersRowHeight, 
                selectedValue = v13.selectedValue, 
                onActivated = function(v24) --[[ Line: 101 ]] --[[ Name: onActivated ]]
                    -- upvalues: v13 (copy)
                    if v13.setSelectedValue then
                        v13.setSelectedValue(v24);
                    end;
                end, 
                useDefaultControlState = v17, 
                onHeightChanged = v21
            })
        })
    });
end;
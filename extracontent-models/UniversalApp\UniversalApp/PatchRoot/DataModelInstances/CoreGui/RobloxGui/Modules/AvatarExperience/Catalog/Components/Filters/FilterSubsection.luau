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
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local v11 = UDim.new(0, 4);
local function _(v12) --[[ Line: 47 ]] --[[ Name: getTotalHeight ]]
    -- upvalues: v11 (copy)
    return v12 + 19 + v11.Offset;
end;
return function(v14) --[[ Line: 51 ]] --[[ Name: FilterSubsection ]]
    -- upvalues: l_useStyle_0 (copy), l_useIsGamepad_0 (copy), v2 (copy), v11 (copy), l_FFlagAXDurablesSupport_0 (copy), l_CheckboxGroup_0 (copy), v5 (copy), l_Focusable_0 (copy), v8 (copy), v7 (copy)
    local v15 = l_useStyle_0();
    local l_Theme_0 = v15.Theme;
    local l_Font_0 = v15.Font;
    local v18 = l_useIsGamepad_0();
    local v19, v20 = v2.useBinding(0);
    local function v22(v21) --[[ Line: 60 ]] --[[ Name: onHeightChanged ]]
        -- upvalues: v20 (copy), v14 (copy), v11 (ref)
        v20(v21);
        if v14.onHeightChanged then
            v14.onHeightChanged(v21 + 19 + v11.Offset);
        end;
    end;
    local v23 = nil;
    v23 = if l_FFlagAXDurablesSupport_0 then if v14.selectionMode == "multiple" then l_CheckboxGroup_0 else v5 else v5;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v19:map(function(v24) --[[ Line: 75 ]]
            -- upvalues: v11 (ref)
            return UDim2.new(1, 0, 0, v24 + 19 + v11.Offset);
        end), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v14.LayoutOrder, 
        ref = v14.frameRef, 
        NextSelectionUp = v14.NextSelectionUp, 
        NextSelectionDown = v14.NextSelectionDown
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v11
        }), 
        Title = v2.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Font = l_Font_0.Header2.Font, 
            TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
            Text = v14.title, 
            TextColor3 = l_Theme_0.TextEmphasis.Color, 
            TextTransparency = l_Theme_0.TextEmphasis.Transparency
        }), 
        RadioButtonGroupContainer = v2.createElement("Frame", {
            Size = v19:map(v8.mapHeightToSize), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            RadioButtons = v2.createElement(v23, {
                items = v14.items, 
                itemHeight = v7.SortAndFiltersRowHeight, 
                selectedValue = v14.selectedValue, 
                onActivated = function(v25) --[[ Line: 109 ]] --[[ Name: onActivated ]]
                    -- upvalues: v14 (copy)
                    if v14.setSelectedValue then
                        v14.setSelectedValue(v25);
                    end;
                end, 
                useDefaultControlState = v18, 
                onHeightChanged = v22
            })
        })
    });
end;
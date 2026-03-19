local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterButton);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXSlotsDesktopRedesign_0 = v6.FFlagAXSlotsDesktopRedesign;
local l_FFlagAXFixNavSubcategoryContainerFocus_0 = v6.FFlagAXFixNavSubcategoryContainerFocus;
local l_FFlagAXMoveCatalogFilterToL1Navigation_0 = v6.FFlagAXMoveCatalogFilterToL1Navigation;
return function(v10) --[[ Line: 36 ]] --[[ Name: FilterButtonLayout ]]
    -- upvalues: v3 (copy), l_FFlagAXFixNavSubcategoryContainerFocus_0 (copy), l_Focusable_0 (copy), l_FFlagAXSlotsDesktopRedesign_0 (copy), l_FFlagAXMoveCatalogFilterToL1Navigation_0 (copy), v5 (copy)
    local l_showFilterButton_0 = v10.showFilterButton;
    local v12 = l_showFilterButton_0 and 52 or 0;
    local v13 = v3.useRef(nil);
    local v14 = if l_FFlagAXFixNavSubcategoryContainerFocus_0 then nil else v3.useRef(nil);
    return v3.createElement(l_Focusable_0.Frame, {
        Size = UDim2.new(1, 0, 0, v10.height), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = v10.layoutOrder, 
        ref = v10.layoutRef, 
        defaultChild = if l_showFilterButton_0 then v13 else v14, 
        NextSelectionUp = v10.NextSelectionUp, 
        NextSelectionDown = v10.NextSelectionDown, 
        NextSelectionLeft = v10.NextSelectionLeft, 
        NextSelectionRight = v10.NextSelectionRight
    }, {
        Layout = if not not l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }) else nil, 
        FilterButton = l_showFilterButton_0 and v3.createElement(v5, {
            anchorPoint = Vector2.new(0, 0.5), 
            position = UDim2.new(0, 8, 0.5, 0), 
            buttonRef = v13, 
            NextSelectionRight = if not not l_FFlagAXFixNavSubcategoryContainerFocus_0 or v10.isContentEmpty or (l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0) and v10.showFilterRight then nil else v14, 
            NextSelectionLeft = if not l_FFlagAXFixNavSubcategoryContainerFocus_0 and (not (l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0) or v10.showFilterRight) then v14 else nil
        }), 
        ContentFrame = v3.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, -v12, 1, 0), 
            Position = UDim2.new(0, v12, 0, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ref = if l_FFlagAXFixNavSubcategoryContainerFocus_0 then nil else v14, 
            NextSelectionLeft = if not not l_FFlagAXFixNavSubcategoryContainerFocus_0 or (l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0) and v10.showFilterRight then nil else v13, 
            NextSelectionRight = if not l_FFlagAXFixNavSubcategoryContainerFocus_0 and (not (l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0) or v10.showFilterRight) then v13 else nil, 
            ClipsDescendants = true, 
            LayoutOrder = if not not l_FFlagAXSlotsDesktopRedesign_0 or l_FFlagAXMoveCatalogFilterToL1Navigation_0 then v10.showFilterRight and 0 or 1 else nil
        }, v10.children)
    });
end;
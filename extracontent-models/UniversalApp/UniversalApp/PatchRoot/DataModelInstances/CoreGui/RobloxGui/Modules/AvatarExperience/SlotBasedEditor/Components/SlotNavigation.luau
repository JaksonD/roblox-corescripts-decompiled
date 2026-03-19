local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_FitFrameHorizontal_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.NavHighlight);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.NavBar.DEPRECATED_CategoryButton);
local v8 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.ScrollingArrowsAndGradient);
local l_FFlagAXSlotsDesktopCrashFix_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDesktopCrashFix;
return function(v10) --[[ Line: 34 ]]
    -- upvalues: l_FFlagAXSlotsDesktopCrashFix_0 (copy), v2 (copy), l_useCallback_0 (copy), v7 (copy), l_FitFrameHorizontal_0 (copy), v6 (copy), v8 (copy)
    local l_categories_0 = v10.categories;
    local l_slotCategory_0 = v10.slotCategory;
    if l_FFlagAXSlotsDesktopCrashFix_0 then
        v2.useEffect(function() --[[ Line: 39 ]]
            -- upvalues: l_categories_0 (copy), l_slotCategory_0 (copy), v10 (copy)
            if l_categories_0[l_slotCategory_0].hide and v10.onSlotCategorySelected then
                for v13, v14 in l_categories_0 do
                    if not v14.hide then
                        v10.onSlotCategorySelected(v13, v14);
                        return;
                    end;
                end;
            end;
        end, {
            l_slotCategory_0, 
            l_categories_0, 
            v10.onSlotCategorySelected
        });
    end;
    local v22 = l_useCallback_0(function(v15) --[[ Line: 53 ]]
        -- upvalues: l_categories_0 (copy), l_slotCategory_0 (copy), v2 (ref), v7 (ref), v10 (copy), l_FitFrameHorizontal_0 (ref), v6 (ref)
        local v16 = {};
        local l_getScrollingFrameItemRef_0 = v15.getScrollingFrameItemRef;
        for v18, v19 in l_categories_0 do
            if not v19.hide then
                local v20 = l_slotCategory_0 == v18;
                local v21 = v2.createElement(v7, {
                    categoryIndex = v19.index, 
                    categoryTitle = v19.nameTranslationKey, 
                    layoutOrder = v19.index, 
                    isSelected = v20, 
                    frameRef = l_getScrollingFrameItemRef_0(v18), 
                    onActivate = function() --[[ Line: 68 ]] --[[ Name: onActivate ]]
                        -- upvalues: v10 (ref), v18 (copy), v19 (copy)
                        if v10.onSlotCategorySelected then
                            v10.onSlotCategorySelected(v18, v19);
                        end;
                    end, 
                    ref = l_getScrollingFrameItemRef_0(v18)
                });
                v16[("Category%*"):format(v18)] = v21;
            end;
        end;
        return v2.createElement(v2.Fragment, {}, {
            SlotNavFrame = v2.createElement(l_FitFrameHorizontal_0, {
                height = UDim.new(1, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                BackgroundTransparency = 1, 
                [v2.Change.AbsoluteSize] = v15.onNavFrameSizeChanged
            }, v16), 
            Highlight = v2.createElement(v6, {
                scrollingFrameRef = v15.getScrollingFrameRef(), 
                selectedCategoryButtonInstance = v15.selectedItemInstance
            })
        });
    end, {
        l_categories_0, 
        l_slotCategory_0, 
        v10.onSlotCategorySelected
    });
    return v2.createElement(v8, {
        LayoutOrder = v10.LayoutOrder, 
        ZIndex = v10.ZIndex, 
        navHeight = v10.navHeight, 
        selectedItemKey = l_slotCategory_0, 
        enableSnapToSelectedItem = v10.enableSnapToSelectedItem, 
        renderScrollingListContent = v22
    });
end;
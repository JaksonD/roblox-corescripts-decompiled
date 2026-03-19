local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterUtils);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterSubsection);
local v5 = require(l_Modules_0.AvatarExperience.Common.Enum.CreatorFilter);
local v6 = require(l_Modules_0.AvatarExperience.Common.Enum.PriceFilter);
local v7 = require(l_Modules_0.AvatarExperience.Common.Enum.SalesTypeFilter);
local v8 = require(l_Modules_0.AvatarExperience.Common.Enum.UnavailableItemFilter);
local v9 = require(l_Modules_0.AvatarExperience.Common.Enum.WearTimeFilter);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useFiltersController);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.FilterTextBox);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Components.Filters.PriceRangeInput);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_CorePackages_0.Packages.RoactGamepad);
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v17 = v16.FFlagAXDurablesSupport and game:DefineFastFlag("AXDurablesFilters", false);
local l_FFlagAXTimedOptionsSalesTypeFilter_0 = v16.FFlagAXTimedOptionsSalesTypeFilter;
local l_Focusable_0 = v15.Focusable;
local v20 = UDim.new(0, 20);
local v21 = UDim.new(0, 12);
return function(v22) --[[ Line: 44 ]] --[[ Name: Filters ]]
    -- upvalues: v15 (copy), l_useLocalization_0 (copy), l_FFlagAXTimedOptionsSalesTypeFilter_0 (copy), v2 (copy), v17 (copy), v21 (copy), v20 (copy), l_Focusable_0 (copy), v3 (copy), v4 (copy), v7 (copy), v5 (copy), v12 (copy), v9 (copy), v6 (copy), v14 (copy), v13 (copy), v8 (copy)
    local v23 = v15.useRefCache();
    local l_filtersController_0 = v22.filtersController;
    local v25 = l_useLocalization_0({
        salesType = "Feature.Catalog.Label.Filter.SalesType", 
        all = "Feature.Avatar.Heading.All", 
        limited = "Feature.Catalog.Label.Limited", 
        premium = "Feature.Catalog.Label.Premium", 
        timedOptions = l_FFlagAXTimedOptionsSalesTypeFilter_0 and "Feature.Durables.Filter.Title" or nil, 
        creator = "Feature.Catalog.Label.Filter.Creator", 
        allCreators = "Feature.Catalog.LabelAllCreators", 
        username = "Feature.Catalog.Label.Username", 
        creatorName = "Feature.Catalog.Label.CreatorName", 
        price = "Feature.Catalog.Label.Price", 
        anyPrice = "Feature.Catalog.LabelAnyPrice", 
        priceRange = "Feature.Catalog.Label.PriceRange", 
        unavailableItems = "Feature.Catalog.Label.Filter.UnavailableItems", 
        show = "Feature.Catalog.Label.Filter.Show", 
        hide = "Feature.Catalog.Label.Filter.Hide", 
        wearTimeTitle = "Feature.Durables.Filter.Title", 
        wearTimeAll = "Feature.Durables.Filter.All", 
        wearTimeTimedOptionsOnly = "Feature.Durables.Filter.TimedOptions"
    });
    local v26, v27 = v2.useBinding(0);
    local v28 = v15.useRefCache();
    local function v31() --[[ Line: 78 ]] --[[ Name: updateTotalHeight ]]
        -- upvalues: v17 (ref), v28 (copy), v21 (ref), v20 (ref), v27 (copy), v22 (copy)
        local v29 = nil;
        v29 = if v17 then v28.WearTime.current or 0 else 0;
        local v30 = v21.Offset * 2 + v20.Offset * 3 + (v28.SalesType.current or 0) + (v28.Creator.current or 0) + v29 + (v28.Price.current or 0) + (v28.UnavailableItems.current or 0);
        v27(v30);
        if v22.onHeightChanged then
            v22.onHeightChanged(v30);
        end;
    end;
    return v2.createElement(l_Focusable_0.Frame, {
        Size = v26:map(v3.mapHeightToSize), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v22.frameRef, 
        NextSelectionUp = v22.NextSelectionUp, 
        NextSelectionDown = v22.NextSelectionDown, 
        defaultChild = v23.SalesType, 
        restorePreviousChildFocus = true
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = v20
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingTop = v21, 
            PaddingBottom = v21, 
            PaddingLeft = v21
        }), 
        SalesType = v2.createElement(v4, {
            LayoutOrder = 1, 
            title = v25.salesType, 
            items = if l_FFlagAXTimedOptionsSalesTypeFilter_0 then {
                {
                    text = v25.all, 
                    id = v7.All
                }, 
                {
                    text = v25.limited, 
                    id = v7.Collectibles
                }, 
                {
                    text = v25.timedOptions, 
                    id = v7.TimedOptions
                }
            } else {
                {
                    text = v25.all, 
                    id = v7.All
                }, 
                {
                    text = v25.limited, 
                    id = v7.Collectibles
                }
            }, 
            selectedValue = l_filtersController_0.salesTypeFilter, 
            setSelectedValue = l_filtersController_0.setSalesTypeFilter, 
            frameRef = v23.SalesType, 
            NextSelectionDown = v23.Creator, 
            onHeightChanged = function(v32) --[[ Line: 136 ]] --[[ Name: onHeightChanged ]]
                -- upvalues: v28 (copy), v31 (copy)
                v28.SalesType.current = v32;
                v31();
            end
        }), 
        Creator = v2.createElement(v4, {
            LayoutOrder = 2, 
            title = v25.creator, 
            items = {
                {
                    text = v25.allCreators, 
                    id = v5.AllCreators
                }, 
                {
                    id = v5.Username, 
                    customView = v2.createElement(v12, {
                        text = l_filtersController_0.creatorUsername, 
                        placeholderText = v25.creatorName, 
                        onTextChanged = l_filtersController_0.setCreatorUsername, 
                        onFocused = function() --[[ Line: 152 ]] --[[ Name: onFocused ]]
                            -- upvalues: l_filtersController_0 (copy), v5 (ref)
                            l_filtersController_0.setCreatorFilter(v5.Username);
                        end
                    })
                }
            }, 
            selectedValue = l_filtersController_0.creatorFilter, 
            setSelectedValue = l_filtersController_0.setCreatorFilter, 
            frameRef = v23.Creator, 
            NextSelectionUp = v23.SalesType, 
            NextSelectionDown = v23.Price, 
            onHeightChanged = function(v33) --[[ Line: 163 ]] --[[ Name: onHeightChanged ]]
                -- upvalues: v28 (copy), v31 (copy)
                v28.Creator.current = v33;
                v31();
            end
        }), 
        WearTime = if v17 then v2.createElement(v4, {
            LayoutOrder = 3, 
            selectionMode = "single", 
            title = v25.wearTimeTitle, 
            items = {
                {
                    text = v25.wearTimeAll, 
                    id = v9.All
                }, 
                {
                    text = v25.wearTimeTimedOptionsOnly, 
                    id = v9.TimedOptionsOnly
                }
            }, 
            selectedValue = l_filtersController_0.wearTimeFilter, 
            setSelectedValue = l_filtersController_0.setWearTimeFilter, 
            frameRef = v23.WearTime, 
            NextSelectionUp = v23.Creator, 
            NextSelectionDown = v23.Price, 
            onHeightChanged = function(v34) --[[ Line: 182 ]] --[[ Name: onHeightChanged ]]
                -- upvalues: v28 (copy), v31 (copy)
                v28.WearTime.current = v34;
                v31();
            end
        }) else nil, 
        Price = v2.createElement(v4, {
            LayoutOrder = v17 and 4 or 3, 
            title = v25.price, 
            items = {
                {
                    text = v25.anyPrice, 
                    id = v6.AnyPrice
                }, 
                {
                    text = v25.priceRange, 
                    id = v6.PriceRange, 
                    expandedViewHeight = v14.SortAndFiltersRowHeight, 
                    expandedView = v2.createElement(v13, {
                        minPrice = l_filtersController_0.minPrice, 
                        maxPrice = l_filtersController_0.maxPrice, 
                        setMinPrice = l_filtersController_0.setMinPrice, 
                        setMaxPrice = l_filtersController_0.setMaxPrice, 
                        onFocused = function() --[[ Line: 202 ]] --[[ Name: onFocused ]]
                            -- upvalues: l_filtersController_0 (copy), v6 (ref)
                            l_filtersController_0.setPriceFilter(v6.PriceRange);
                        end
                    })
                }
            }, 
            selectedValue = l_filtersController_0.priceFilter, 
            setSelectedValue = l_filtersController_0.setPriceFilter, 
            frameRef = v23.Price, 
            NextSelectionUp = v23.Creator, 
            NextSelectionDown = v23.UnavailableItems, 
            onHeightChanged = function(v35) --[[ Line: 213 ]] --[[ Name: onHeightChanged ]]
                -- upvalues: v28 (copy), v31 (copy)
                v28.Price.current = v35;
                v31();
            end
        }), 
        UnavailableItems = v2.createElement(v4, {
            LayoutOrder = v17 and 5 or 4, 
            title = v25.unavailableItems, 
            items = {
                {
                    text = v25.hide, 
                    id = v8.Hide
                }, 
                {
                    text = v25.show, 
                    id = v8.Show
                }
            }, 
            selectedValue = l_filtersController_0.unavailableItemFilter, 
            setSelectedValue = l_filtersController_0.setUnavailableItemFilter, 
            frameRef = v23.UnavailableItems, 
            NextSelectionUp = v23.Price, 
            onHeightChanged = function(v36) --[[ Line: 229 ]] --[[ Name: onHeightChanged ]]
                -- upvalues: v28 (copy), v31 (copy)
                v28.UnavailableItems.current = v36;
                v31();
            end
        })
    });
end;
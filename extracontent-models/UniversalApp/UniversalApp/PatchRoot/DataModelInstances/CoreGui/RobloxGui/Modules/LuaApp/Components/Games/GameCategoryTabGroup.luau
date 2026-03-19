local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_TopicInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux).TopicInfosReducer;
local l_useAnimatedScrollToSelection_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection;
local l_IconTabGroup_0 = require(l_CorePackages_0.Packages.UIBlox).App.Navigation.PrimaryNavBar.IconTabGroup;
local v7 = require(l_CorePackages_0.Workspace.Packages.Display);
local l_useSignalState_0 = require(l_CorePackages_0.Packages.SignalsReact).useSignalState;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
local l_OmniFeedTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedTypes;
return function(v12) --[[ Line: 28 ]] --[[ Name: GameCategoryTabGroup ]]
    -- upvalues: l_useSelector_0 (copy), l_TopicInfosReducer_0 (copy), v1 (copy), l_OmniFeedTypes_0 (copy), v2 (copy), l_useAnimatedScrollToSelection_0 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_useSignalState_0 (copy), v7 (copy), l_IconTabGroup_0 (copy)
    local l_size_0 = v12.size;
    local l_onSelected_0 = v12.onSelected;
    local l_selectedSortIndex_0 = v12.selectedSortIndex;
    local l_selectedSortName_0 = v12.selectedSortName;
    local l_sortCategories_0 = v12.sortCategories;
    local v19 = l_useSelector_0(function(v18) --[[ Line: 35 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref)
        return v18.Personalization[l_TopicInfosReducer_0.key];
    end);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 38 ]]
        return v20.GameSortGroups;
    end);
    local v23 = l_useSelector_0(function(v22) --[[ Line: 41 ]]
        return v22.OmniRecommendations;
    end);
    local v34 = v1.useMemo(function() --[[ Line: 46 ]]
        -- upvalues: l_sortCategories_0 (copy), v23 (copy), l_OmniFeedTypes_0 (ref), v19 (copy), v21 (copy)
        local v24 = {};
        local function _(v25, v26) --[[ Line: 49 ]] --[[ Name: addSortToResult ]]
            -- upvalues: v24 (copy)
            table.insert(v24, {
                sort = v25, 
                storeIndex = v26
            });
        end;
        for _, v29 in l_sortCategories_0 do
            if v29.isOmni then
                if v23[v29.sortType] and v23[v29.sortType].sorts then
                    for v30, v31 in v23[v29.sortType].sorts do
                        if v31.treatmentType == l_OmniFeedTypes_0.Carousel then
                            table.insert(v24, {
                                sort = v19[v31.topicId], 
                                storeIndex = v30
                            });
                        end;
                    end;
                end;
            else
                for v32, v33 in v21[v29.sortType].sorts do
                    table.insert(v24, {
                        sort = v19[v33], 
                        storeIndex = v32
                    });
                end;
            end;
        end;
        return v24;
    end, {
        v19, 
        v21, 
        v23, 
        l_sortCategories_0
    });
    local v38 = v1.useCallback(function(v35, v36) --[[ Line: 86 ]]
        -- upvalues: l_onSelected_0 (copy), v34 (copy)
        if l_onSelected_0 and v36 <= #v34 then
            local l_storeIndex_0 = v35.storeIndex;
            if l_storeIndex_0 then
                return l_onSelected_0(v35.sort, l_storeIndex_0, v36);
            end;
        end;
        return nil;
    end, {
        l_onSelected_0, 
        v34
    });
    local v41 = v1.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v2 (ref), v34 (copy), v38 (copy), l_selectedSortName_0 (copy)
        return v2.List.map(v34, function(v39, v40) --[[ Line: 101 ]]
            -- upvalues: v38 (ref), l_selectedSortName_0 (ref)
            return {
                title = v39.sort.displayName, 
                onActivated = function() --[[ Line: 104 ]] --[[ Name: onActivated ]]
                    -- upvalues: v38 (ref), v39 (copy), v40 (copy)
                    v38(v39, v40);
                end, 
                showRoundedBackground = v39.sort.uniqueKey == l_selectedSortName_0
            };
        end);
    end, {
        v34, 
        l_selectedSortName_0
    });
    local v42, v43 = l_useAnimatedScrollToSelection_0(Enum.ScrollingDirection.X, if v12.padding then v12.padding.left else 0);
    local v44 = if l_FFlagEnableLeftNavOnConsole_0 and l_FFlagExtendScrollingFramesBySafeInsets_0 then l_useSignalState_0(v7.GetDisplayStore().getDeviceSafePadding) else nil;
    return v1.createElement("ScrollingFrame", {
        Size = UDim2.new(1, if l_FFlagEnableLeftNavOnConsole_0 and l_FFlagExtendScrollingFramesBySafeInsets_0 then v44.right else 0, 1, 0), 
        Selectable = false, 
        ClipsDescendants = true, 
        AutomaticCanvasSize = Enum.AutomaticSize.X, 
        CanvasSize = UDim2.new(0, 0, 1, 0), 
        CanvasPosition = v42, 
        ScrollBarThickness = 0, 
        ScrollingDirection = Enum.ScrollingDirection.X, 
        BackgroundTransparency = 1, 
        [v1.Event.SelectionChanged] = v43
    }, {
        TabGroup = v1.createElement(l_IconTabGroup_0, {
            size = l_size_0, 
            fillDirection = Enum.FillDirection.Horizontal, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            sortOrder = Enum.SortOrder.LayoutOrder, 
            items = v41, 
            selection = {
                l_selectedSortIndex_0
            }, 
            padding = v12.padding or {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        }), 
        UIPadding = if l_FFlagEnableLeftNavOnConsole_0 and l_FFlagExtendScrollingFramesBySafeInsets_0 then v1.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v44.right)
        }) else nil
    });
end;
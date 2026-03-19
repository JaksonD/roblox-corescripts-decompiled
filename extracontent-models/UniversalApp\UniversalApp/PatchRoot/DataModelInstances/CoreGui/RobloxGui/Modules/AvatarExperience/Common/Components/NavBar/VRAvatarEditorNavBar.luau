local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_IconButton_0 = v5.App.Button.IconButton;
local l_IconSize_0 = v5.App.ImageSet.Enum.IconSize;
local v9 = require(l_Modules_0.LuaApp.Components.SearchBar);
local v10 = require(l_Modules_0.LuaApp.SearchUuid);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_Panel3D_0 = v5.Core.VR.Panel3D;
local v13 = require(l_Modules_0.LuaApp.Navigation.CurrentTabContext);
local v14 = require(l_Modules_0.LuaApp.Navigation.SwitchNavigatorVisibleContext);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_HeaderBar_0 = v5.App.Bar.HeaderBar;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v19 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useStyle_0 = v5.Core.Style.useStyle;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_SegmentedControl_0 = v5.App.Control.SegmentedControl;
local v24 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local l_VR_0 = v4.VR;
local v26 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v27 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v28 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local l_ROUNDED_CORNER_RADIUS_0 = require(l_Modules_0.LuaApp.Constants).ROUNDED_CORNER_RADIUS;
local v30 = l_Images_0["icons/navigation/pushBack"];
local v31 = l_Images_0["icons/common/search"];
local v32 = l_Images_0["icons/menu/customize"];
local v33 = l_Images_0["icons/menu/shop"];
local v34 = {
    l_AvatarScreen_0.AvatarEditor, 
    l_AvatarScreen_0.Catalog
};
local v35 = {
    [l_AvatarScreen_0.AvatarEditor] = 1, 
    [l_AvatarScreen_0.MySharedAvatars] = 1, 
    [l_AvatarScreen_0.CatalogSearch] = 2, 
    [l_AvatarScreen_0.Catalog] = 2
};
return function(v36) --[[ Line: 68 ]]
    -- upvalues: v3 (copy), l_useDispatch_0 (copy), v19 (copy), v24 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_IconButton_0 (copy), v30 (copy), l_IconSize_0 (copy), v10 (copy), v27 (copy), l_SearchTypes_0 (copy), v26 (copy), l_AvatarScreen_0 (copy), v28 (copy), v11 (copy), v9 (copy), l_ROUNDED_CORNER_RADIUS_0 (copy), l_SegmentedControl_0 (copy), v35 (copy), v34 (copy), v32 (copy), v33 (copy), v31 (copy), v13 (copy), v14 (copy), l_Panel3D_0 (copy), l_VR_0 (copy), l_withLocalization_0 (copy), l_HeaderBar_0 (copy)
    local v37, v38 = v3.useState(false);
    local v39 = l_useDispatch_0();
    local v40 = v19(v24);
    local v41 = l_useStyle_0();
    local v42 = l_useLocalization_0({
        shop = "Feature.Avatar.Action.Shop", 
        customize = "Feature.Catalog.Action.Customize", 
        searchPlaceholder = "Search.GlobalSearch.Example.SearchCatalog"
    });
    local function v44(v43) --[[ Line: 79 ]]
        -- upvalues: v3 (ref), l_IconButton_0 (ref), v30 (ref), l_IconSize_0 (ref), v41 (copy)
        return v3.createElement(l_IconButton_0, {
            layoutOrder = 1, 
            size = UDim2.fromOffset(58, 58), 
            icon = v30, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = v41.Theme.SystemPrimaryDefault.Color, 
            iconTransparency = v41.Theme.SystemPrimaryDefault.Transparency, 
            backgroundColor = {
                Color = v41.Theme.BackgroundUIDefault.Color, 
                Transparency = v41.Theme.BackgroundUIDefault.Transparency
            }, 
            showBackground = true, 
            onActivated = v43
        });
    end;
    local v51 = v3.useCallback(function(v45, v46, v47) --[[ Line: 97 ]]
        -- upvalues: v10 (ref), v39 (copy), v27 (ref), l_SearchTypes_0 (ref), v26 (ref), l_AvatarScreen_0 (ref), v28 (ref), v40 (copy), v11 (ref), v36 (copy), v38 (copy)
        local v48 = v10();
        local v49 = {
            searchKeyword = v45, 
            isKeywordSuggestionEnabled = true
        };
        v39(v27(v48, l_SearchTypes_0.Catalog));
        v39(v26(v48, v49));
        local l_CatalogSearch_0 = l_AvatarScreen_0.CatalogSearch;
        v28(v40, "catalog", v45, v46, l_CatalogSearch_0, v47);
        v11.navigateToSearch(v36.navigation, v48, v49);
        v38(false);
    end);
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if v37 then
        v53 = v3.createElement(v9, {
            Size = UDim2.new(1, 0, 1, -l_ROUNDED_CORNER_RADIUS_0), 
            modernUI = true, 
            cancelSearch = function() --[[ Line: 131 ]] --[[ Name: cancelSearch ]]
                -- upvalues: v38 (copy)
                v38(false);
            end, 
            confirmSearch = v51, 
            onFocused = nil, 
            onTextCleared = nil, 
            isCompactView = false, 
            placeholderText = v42.searchPlaceholder, 
            searchType = l_SearchTypes_0.Catalog, 
            autocomplete = true, 
            isSearching = v37
        });
    elseif v36.currentPage == l_AvatarScreen_0.LayeredClothingSort then
        v52 = v44(function() --[[ Line: 144 ]]
            -- upvalues: v36 (copy), l_AvatarScreen_0 (ref)
            v36.navigation.navigate(l_AvatarScreen_0.Catalog);
        end);
        v55 = "Feature.Avatar.Title.LCSortPage";
    else
        v53 = v3.createElement(l_SegmentedControl_0, {
            layoutOrder = 2, 
            selectedTabIndex = v35[v36.currentPage] or 1, 
            onTabActivated = function(v56) --[[ Line: 152 ]] --[[ Name: onTabActivated ]]
                -- upvalues: v36 (copy), v34 (ref)
                v36.navigation.navigate(v34[v56]);
            end, 
            tabs = {
                {
                    tabName = v42.customize, 
                    icon = v32
                }, 
                {
                    tabName = v42.shop, 
                    icon = v33
                }
            }, 
            width = UDim.new(0, 350), 
            height = 58
        });
        v54 = if v35[v36.currentPage] == 2 then v3.createElement(l_IconButton_0, {
            layoutOrder = 3, 
            size = UDim2.fromOffset(58, 58), 
            icon = v31, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = v41.Theme.SystemPrimaryDefault.Color, 
            iconTransparency = v41.Theme.SystemPrimaryDefault.Transparency, 
            backgroundColor = {
                Color = v41.Theme.BackgroundUIDefault.Color, 
                Transparency = v41.Theme.BackgroundUIDefault.Transparency
            }, 
            showBackground = true, 
            onActivated = function() --[[ Line: 182 ]] --[[ Name: onActivated ]]
                -- upvalues: v38 (copy)
                v38(true);
            end
        }) else nil;
    end;
    return v3.createElement(v13.Consumer, {
        render = function(v57) --[[ Line: 190 ]] --[[ Name: render ]]
            -- upvalues: v3 (ref), v14 (ref), l_Panel3D_0 (ref), l_VR_0 (ref), l_AvatarScreen_0 (ref), v41 (copy), l_ROUNDED_CORNER_RADIUS_0 (ref), l_withLocalization_0 (ref), v55 (ref), l_HeaderBar_0 (ref), v52 (ref), v53 (ref), v54 (ref)
            return v3.createElement(v14.Consumer, {
                render = function(v58) --[[ Line: 192 ]] --[[ Name: render ]]
                    -- upvalues: v3 (ref), l_Panel3D_0 (ref), l_VR_0 (ref), v57 (copy), l_AvatarScreen_0 (ref), v41 (ref), l_ROUNDED_CORNER_RADIUS_0 (ref), l_withLocalization_0 (ref), v55 (ref), l_HeaderBar_0 (ref), v52 (ref), v53 (ref), v54 (ref)
                    return v3.createElement(l_Panel3D_0, {
                        partSize = l_VR_0.AvatarEditorNavBarSize, 
                        offset = CFrame.lookAt(l_VR_0.AvatarEditorNavBarPosition, l_VR_0.AvatarEditorNavBarOrientation), 
                        virtualScreenSize = l_VR_0.AvatarEditorNavBarResolution, 
                        panelName = "AvatarNavBarVR", 
                        hidden = not v58 or v57 ~= l_AvatarScreen_0.AvatarExperienceRoot
                    }, {
                        RoundedFrame = v3.createElement("Frame", {
                            Size = UDim2.new(1, 0, 1, 0), 
                            BackgroundTransparency = 0, 
                            BackgroundColor3 = v41.Theme.BackgroundDefault.Color
                        }, {
                            UICorner = v3.createElement("UICorner", {
                                CornerRadius = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0)
                            }), 
                            UIPadding = v3.createElement("UIPadding", {
                                PaddingRight = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0), 
                                PaddingLeft = UDim.new(0, l_ROUNDED_CORNER_RADIUS_0)
                            }), 
                            HeaderBar = l_withLocalization_0({
                                title = v55
                            })(function(v59) --[[ Line: 217 ]]
                                -- upvalues: v3 (ref), l_HeaderBar_0 (ref), l_VR_0 (ref), v52 (ref), v53 (ref), v54 (ref), v55 (ref)
                                return v3.createElement(l_HeaderBar_0, {
                                    backgroundTransparency = 0, 
                                    barHeight = l_VR_0.AvatarEditorNavBarResolution.Y, 
                                    renderLeft = v52 and function() --[[ Line: 222 ]]
                                        -- upvalues: v52 (ref)
                                        return v52;
                                    end or nil, 
                                    renderCenter = v53 and function() --[[ Line: 226 ]]
                                        -- upvalues: v53 (ref)
                                        return v53;
                                    end or nil, 
                                    renderRight = v54 and function() --[[ Line: 229 ]]
                                        -- upvalues: v54 (ref)
                                        return v54;
                                    end or nil, 
                                    title = v55 and v59.title or nil
                                });
                            end)
                        })
                    });
                end
            });
        end
    });
end;
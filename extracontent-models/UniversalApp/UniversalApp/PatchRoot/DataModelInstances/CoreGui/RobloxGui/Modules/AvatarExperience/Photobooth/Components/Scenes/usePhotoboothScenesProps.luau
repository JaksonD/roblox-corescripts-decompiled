local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_NotificationService_0 = game:GetService("NotificationService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_GridMetrics_0 = require(l_CorePackages_0.Packages.UIBlox).App.Grid.GridMetrics;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit);
local l_CatalogItemCard_0 = v2.Components.CatalogItemCard.CatalogItemCard;
local v13 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v14 = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.PhotoboothSceneData);
local v15 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXPhotoboothBugBashFixes_0 = v15.FFlagAXPhotoboothBugBashFixes;
local l_FFlagAXPhotoboothAnalytics_0 = v15.FFlagAXPhotoboothAnalytics;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_usePhotoboothContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperiencePhotobooth).Context.usePhotoboothContext;
local l_PHOTOBOOTH_SCENES_0 = v14.PHOTOBOOTH_SCENES;
return function(v23, v24) --[[ Line: 55 ]] --[[ Name: usePhotoboothScenesProps ]]
    -- upvalues: l_useTokens_0 (copy), l_useSelector_0 (copy), v13 (copy), l_usePhotoboothContext_0 (copy), v4 (copy), l_GridMetrics_0 (copy), l_useLocalization_0 (copy), l_NotificationService_0 (copy), l_FFlagAXPhotoboothAnalytics_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLogConstants_0 (copy), l_CatalogItemCard_0 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (copy), v5 (copy), l_PHOTOBOOTH_SCENES_0 (copy)
    local v25 = l_useTokens_0();
    local v26 = l_useSelector_0(v13);
    local v27 = l_usePhotoboothContext_0();
    if not v27 then
        error("PhotoboothContext not found - make sure PhotoboothContextProvider is mounted");
    end;
    local l_photoboothStore_0 = v27.photoboothStore;
    local v29, v30 = v4.useState(v25.Size.Size_3000);
    local v31, v32 = v4.useState(l_photoboothStore_0.getSelectedSceneId(false));
    v4.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: l_photoboothStore_0 (copy), v31 (copy)
        l_photoboothStore_0.selectScene(v31);
    end, {
        v31
    });
    local v34 = v4.useCallback(function(v33) --[[ Line: 76 ]]
        -- upvalues: v30 (copy)
        v30(v33.AbsoluteSize.X);
    end, {});
    local v35 = v4.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: l_GridMetrics_0 (ref), v29 (copy), v25 (copy)
        return l_GridMetrics_0.getSmallMetrics(math.max(v29 - v25.Size.Size_400 * 2, 0), v25.Size.Size_300);
    end, {
        v29, 
        v25
    });
    local v36 = v4.useMemo(function() --[[ Line: 86 ]]
        -- upvalues: v35 (copy), v25 (copy)
        return math.floor(v35.itemWidth * 1.6) + v25.Size.Size_1000;
    end, {
        v35.itemWidth, 
        v25
    });
    local v45 = v4.useCallback(function(v37) --[[ Line: 92 ]]
        -- upvalues: v31 (copy), v25 (copy), l_useLocalization_0 (ref), l_NotificationService_0 (ref), l_FFlagAXPhotoboothAnalytics_0 (ref), v4 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLogConstants_0 (ref), l_CatalogItemCard_0 (ref), v35 (copy), v36 (copy), v32 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v24 (copy), v5 (ref)
        local l_item_0 = v37.item;
        local v39 = v31 == l_item_0.id;
        local l_Size_50_0 = v25.Size.Size_50;
        local v41 = l_useLocalization_0({
            title = l_item_0.name
        });
        local v42 = (l_NotificationService_0.SelectedTheme or "Light"):lower() == "dark";
        local l_thumbnail_0 = l_item_0.thumbnail;
        if v42 and l_item_0.dark and l_item_0.dark.thumbnail then
            l_thumbnail_0 = l_item_0.dark.thumbnail;
        end;
        local v44 = nil;
        if l_FFlagAXPhotoboothAnalytics_0 then
            v44 = v4.useRef(nil);
            l_addUnifiedEventLogging_0(v44, {
                action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                elementName = l_item_0.id == "" and "Photobooth_Scene_Selected_Blocky" or "Photobooth_Scene_Selected_" .. l_item_0.id
            }, {
                sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
            });
        end;
        return v4.createElement(l_CatalogItemCard_0, {
            Size = UDim2.fromOffset(v35.itemWidth, v36), 
            headerAspectRatio = 0.625, 
            isSelected = v39, 
            title = v41.title, 
            ref = if l_FFlagAXPhotoboothAnalytics_0 then v44 else nil, 
            onActivated = function() --[[ Line: 127 ]] --[[ Name: onActivated ]]
                -- upvalues: v39 (copy), v32 (ref), l_item_0 (copy), l_FFlagAXPhotoboothBugBashFixes_0 (ref), v24 (ref)
                if v39 then
                    v32("");
                else
                    v32(l_item_0.id);
                end;
                if l_FFlagAXPhotoboothBugBashFixes_0 and v24 then
                    v24();
                end;
            end, 
            presentationSlot = v4.createElement(v5.View, {
                Size = UDim2.fromScale(1, 1), 
                backgroundStyle = {
                    Transparency = 1
                }
            }, {
                UIPadding = v39 and v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_Size_50_0), 
                    PaddingBottom = UDim.new(0, l_Size_50_0), 
                    PaddingLeft = UDim.new(0, l_Size_50_0), 
                    PaddingRight = UDim.new(0, l_Size_50_0)
                }) or nil, 
                InnerContent = v4.createElement(v5.View, {
                    Size = UDim2.fromScale(1, 1), 
                    backgroundStyle = {
                        Color3 = l_item_0.color, 
                        Transparency = 0
                    }, 
                    tag = "radius-medium"
                }, {
                    UIStroke = v39 and v4.createElement("UIStroke", {
                        Thickness = l_Size_50_0, 
                        Color = v25.Color.ActionSubEmphasis.Background.Color3, 
                        Transparency = 0
                    }) or nil, 
                    Thumbnail = if l_thumbnail_0 and l_thumbnail_0 ~= "" then v4.createElement(v5.Image, {
                        tag = "size-full-full radius-medium", 
                        Image = l_thumbnail_0, 
                        ScaleType = Enum.ScaleType.Crop
                    }) else nil
                })
            })
        });
    end, {
        v35, 
        v36, 
        v31, 
        l_photoboothStore_0
    });
    local v47 = v4.useCallback(function(v46) --[[ Line: 179 ]]
        return v46.id;
    end, {});
    return {
        tokens = v25, 
        isPortrait = v26, 
        gridMetrics = v35, 
        itemsPerRow = v35.itemsPerRow, 
        scenes = l_PHOTOBOOTH_SCENES_0, 
        renderSceneItem = v45, 
        getSceneId = v47, 
        onContainerSizeChanged = v34, 
        selectedScene = v31, 
        position = v23
    };
end;
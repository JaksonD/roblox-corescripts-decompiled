local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_LayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LayoutConfig;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_GridMetrics_0 = v8.App.Grid.GridMetrics;
local l_Images_0 = v8.App.ImageSet.Images;
local l_useStyle_0 = v8.Core.Style.useStyle;
local l_useResponsiveLayout_0 = v8.Core.Layout.Responsive.useResponsiveLayout;
local l_CarouselGenericSquareTile_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Components.CarouselGenericSquareTile;
local l_useRouteName_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useRouteName;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local v16 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_OmniFeedConstants_0 = v16.OmniFeedConstants;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local l_OmniFeedProps_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v24 = require(l_Modules_0.LuaApp.Components.Generic.CarouselWidget);
local v25 = require(l_Modules_0.Personalization.OmniFeed.JoinYourFriendsTile);
local v26 = require(l_Modules_0.LuaApp.Constants);
local v27 = require(l_Modules_0.LuaApp.Components.FriendsCarousel.utils.useNavigateFromAddFriends);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v16.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v16.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
local l_GAME_CAROUSEL_CHILD_PADDING_0 = v16.Constants.GAME_CAROUSEL_CHILD_PADDING;
local function v42(v31, v32, v33, v34) --[[ Line: 53 ]] --[[ Name: onImpressionsDetected ]]
    -- upvalues: v25 (copy), v26 (copy)
    if not v31 or #v31 == 0 then
        return;
    else
        local v35 = {};
        local v36 = {};
        local v37 = {};
        local v38 = {};
        for v39 = 1, #v31 do
            local v40 = v31[v39];
            local v41 = v33[v40];
            if v41 then
                if v41.type == v25 then
                    table.insert(v35, v41.props.friendUserId);
                    table.insert(v36, v41.props.universeId);
                    table.insert(v37, v41.props.rootPlaceId);
                    table.insert(v38, v40);
                else
                    table.insert(v36, "Other");
                    table.insert(v38, v40);
                end;
            end;
        end;
        v32:sendEventDeferred(v34, v26.ImpressionsEvents.JoinYourFriends, {
            coplayIds = table.concat(v35, ","), 
            contentIds = table.concat(v36, ","), 
            rootPlaceIds = table.concat(v37, ","), 
            positions = table.concat(v38, ",")
        });
        return;
    end;
end;
local function _(v43, v44) --[[ Line: 89 ]] --[[ Name: reportFindFriends ]]
    v44:sendEventDeferred(v43, "joinYourFriendProfileViewOpen", {
        friendId = "FIND_FRIENDS"
    });
end;
local function v51(v46, v47, v48, v49, v50) --[[ Line: 98 ]] --[[ Name: createFindFriendsTile ]]
    -- upvalues: v1 (copy), l_CarouselGenericSquareTile_0 (copy), l_Images_0 (copy)
    return v1.createElement(l_CarouselGenericSquareTile_0, {
        LayoutOrder = v46, 
        borderThickness = 1, 
        tileSize = v47.Y, 
        icon = l_Images_0["icons/graphic/findfriends_large"], 
        labelText = v48, 
        onActivated = v50, 
        impressionsTag = "JYF_TILE_IMPRESSION", 
        styleProps = {
            font = v49, 
            textXAlignment = Enum.TextXAlignment.Left, 
            containFooterInTileSize = true
        }
    });
end;
local function v60(v52, v53, v54) --[[ Line: 115 ]] --[[ Name: getTilesForData ]]
    -- upvalues: v1 (copy), l_GAME_CAROUSEL_CHILD_PADDING_0 (copy), v51 (copy), v25 (copy)
    local v55 = {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, l_GAME_CAROUSEL_CHILD_PADDING_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v56 = 0;
    if v54 then
        v56 = v56 + 1;
        v55[v56] = v51(v56, v53, v54.tileText, v54.textFont, v54.onActivated);
    end;
    for v57 = 1, #v52 do
        local v58 = v52[v57];
        for v59 = 1, #v58.coplayUsers do
            v56 = v56 + 1;
            v55[v56] = v1.createElement(v25, {
                LayoutOrder = v56, 
                size = v53, 
                friendUserId = tostring(v58.coplayUsers[v59].userId), 
                thumbnailAssetId = tostring(v58.thumbnailAssetId), 
                experienceName = v58.name, 
                rootPlaceId = v58.rootPlaceId, 
                universeId = v58.contentId, 
                impressionsTag = "JYF_TILE_IMPRESSION"
            });
        end;
    end;
    return {
        tiles = v55, 
        tileCount = v56
    };
end;
return function(v61) --[[ Line: 160 ]] --[[ Name: JoinYourFriendsFeedItem ]]
    -- upvalues: l_useSelector_0 (copy), l_FormFactor_0 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), v26 (copy), l_LayoutConfig_0 (copy), l_useResponsiveLayout_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy), v1 (copy), l_Signal_0 (copy), l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_OmniFeedProps_0 (copy), l_useRouteName_0 (copy), l_useLocalization_0 (copy), l_GridMetrics_0 (copy), l_TopicContentsReducer_0 (copy), l_useStyle_0 (copy), l_useAppPolicy_0 (copy), v27 (copy), l_OmniFeedConstants_0 (copy), v60 (copy), l_GAME_CAROUSEL_CHILD_PADDING_0 (copy), v24 (copy), l_RetrievalStatus_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v42 (copy)
    local v63 = l_useSelector_0(function(v62) --[[ Line: 161 ]]
        return v62.FormFactor;
    end);
    local v64 = nil;
    local v65 = nil;
    if v63 == l_FormFactor_0.COMPACT then
        v64 = l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0;
        v65 = v26.JoinYourFriendsTile.NarrowColumnCount;
    else
        local l_GridTile_0 = l_LayoutConfig_0.Kind.Experiences.GridTile;
        local v67 = l_useResponsiveLayout_0("gutter", l_GridTile_0) or 0;
        v64 = if v67 ~= 0 then v67 else l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
        v65 = v26.JoinYourFriendsTile.WideColumnCount;
    end;
    local v68 = v1.useRef(l_Signal_0.new());
    local v69 = l_useRoactService_0(l_AppEventIngestService_0);
    local l_appPage_0 = (v61[l_OmniFeedProps_0.key] or {}).appPage;
    local v72 = v1.useCallback(function(_) --[[ Line: 183 ]]
        -- upvalues: v68 (copy)
        v68.current:fire();
    end);
    local v73 = l_useRouteName_0();
    local v74 = l_useLocalization_0({
        carouselTitle = "Feature.Home.Heading.JoinYourFriends", 
        findFriendsTile = "Feature.Friends.Action.FindFriends"
    });
    local v76 = l_useSelector_0(function(v75) --[[ Line: 193 ]]
        return v75.ScreenSize;
    end).X - 2 * v64;
    local l_itemWidth_0 = l_GridMetrics_0.getMetricsForFixedColumns(v76, v64, v65).itemWidth;
    local v78 = l_itemWidth_0 / 1.7777777777777777 + 50;
    local v79 = Vector2.new(l_itemWidth_0, v78);
    local l_topicId_0 = v61.topicId;
    local v82 = l_useSelector_0(function(v81) --[[ Line: 206 ]]
        -- upvalues: l_topicId_0 (copy), l_TopicContentsReducer_0 (ref)
        if l_topicId_0 then
            return v81.Personalization[l_TopicContentsReducer_0.key][l_topicId_0];
        else
            return nil;
        end;
    end);
    local v83 = v82 and v82.entries or {};
    local v84 = l_useStyle_0();
    local v86 = l_useAppPolicy_0(function(v85) --[[ Line: 217 ]]
        return v85.getContactImporterEnabled();
    end);
    local v87 = v27({
        policyIsEnabled = v86
    });
    local v88 = nil;
    if v61.topicLayoutData and v61.topicLayoutData[l_OmniFeedConstants_0.TopicLayoutDataKeys.JYFFindFriendsEnabled] then
        v88 = {
            tileText = v74.findFriendsTile, 
            textFont = v84.Font.Header2, 
            onActivated = function() --[[ Line: 230 ]] --[[ Name: onActivated ]]
                -- upvalues: v73 (copy), v69 (copy), v87 (copy)
                v69:sendEventDeferred(v73, "joinYourFriendProfileViewOpen", {
                    friendId = "FIND_FRIENDS"
                });
                v87();
            end
        };
    end;
    local v89 = {};
    local v90 = 0;
    if v82 then
        local v91 = v60(v83, v79, v88);
        v89 = v91.tiles;
        v90 = v91.tileCount;
    end;
    local v92 = (v90 - 1) * (l_GAME_CAROUSEL_CHILD_PADDING_0 + v79.X) + (l_GAME_CAROUSEL_CHILD_PADDING_0 + v79.X / 2);
    v1.useEffect(function() --[[ Line: 248 ]]
        -- upvalues: v68 (copy)
        v68.current:fire();
    end, {});
    if v90 > 0 then
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v64), 
                PaddingBottom = UDim.new(1, 0)
            }), 
            TileCarousel = v1.createElement(v24, {
                title = v74.carouselTitle, 
                index = 1, 
                itemWidth = v79.X, 
                canvasWidth = v92, 
                carouselHeight = v79.Y, 
                itemPadding = l_GAME_CAROUSEL_CHILD_PADDING_0, 
                items = v89, 
                itemCount = v90, 
                fetchingStatus = l_RetrievalStatus_0.Done, 
                showSeeAll = false, 
                onChangeCanvasPosition = v72
            }), 
            JYFCarouselImpressionsDetector = v1.createElement(l_ScreenSizeImpressionsDetector_0, {
                onRequestImpressionsSignal = v68.current, 
                onImpressionsDetected = function(v93) --[[ Line: 277 ]] --[[ Name: onImpressionsDetected ]]
                    -- upvalues: v42 (ref), v69 (copy), v89 (ref), l_appPage_0 (copy)
                    v42(v93, v69, v89, l_appPage_0);
                end, 
                impressionsTag = "JYF_TILE_IMPRESSION"
            })
        });
    else
        return v1.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        });
    end;
end;
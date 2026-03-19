local l_CorePackages_0 = game:GetService("CorePackages");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_Functional_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Functional;
local l_AccordionView_0 = require(l_CorePackages_0.Packages.UIBlox).AccordionView;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_GameMediaImageType_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameMediaImageType;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_MediaAccordionExpanded_0 = l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaAccordionExpanded;
local l_MediaAccordionCollapsed_0 = l_Modules_0.LuaApp.Analytics.Events.Games.GameDetailsEvents.MediaAccordionCollapsed;
local l_ApiFetchGameMedia_0 = l_Modules_0.LuaApp.Thunks.Games.ApiFetchGameMedia;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v18 = require(l_Modules_1.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local v19 = require(l_Modules_1.LuaApp.Thunks.OpenYouTubeVideo);
local v20 = require(l_Modules_1.LuaApp.Analytics.Events.openYouTubeVideo);
local v21 = require(l_Modules_1.LuaApp.Components.Games.GameMediaItem);
local v22 = require(l_Modules_1.LuaApp.Components.LoadableImage);
local v23 = require(l_Modules_1.LuaApp.Components.GenericIconButton);
local v24 = require(l_Modules_1.LuaApp.withTheme_DEPRECATED);
local l_FFlagMediaAccordionAndFullTelemetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMediaAccordionAndFullTelemetry;
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local v27 = {
    view = "view", 
    play = "play"
};
local function v32(v28, v29) --[[ Line: 54 ]] --[[ Name: processMediaEntry ]]
    -- upvalues: l_GameMediaImageType_0 (copy)
    local l_assetTypeId_0 = v28.assetTypeId;
    local v31 = nil;
    if l_assetTypeId_0 == l_GameMediaImageType_0.YouTubeVideo then
        if not v29 then
            return nil;
        else
            v31 = string.format("https://img.youtube.com/vi/%s/hqdefault.jpg", v28.videoHash);
        end;
    else
        v31 = "http://www.roblox.com/asset/?id=" .. tostring(v28.imageId);
    end;
    return {
        mediaType = v28.assetTypeId, 
        imageId = v31, 
        videoTitle = v28.videoTitle, 
        videoHash = v28.videoHash
    };
end;
local function _(v33) --[[ Line: 76 ]] --[[ Name: generateDefaultEntry ]]
    -- upvalues: l_GameMediaImageType_0 (copy), l_Url_0 (copy)
    return {
        mediaType = l_GameMediaImageType_0.Image, 
        imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v33, 768, 432)
    };
end;
local v45 = l_memoize_0(function(v35, v36, v37, v38, v39) --[[ Line: 84 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_GameMediaImageType_0 (copy), l_Url_0 (copy), v32 (copy)
    if not v35 then
        if v38 == l_RetrievalStatus_0.Done then
            return {
                [1] = {
                    mediaType = l_GameMediaImageType_0.Image, 
                    imageId = l_Url_0:getPlaceDefaultThumbnailUrl(v37, 768, 432)
                }
            };
        else
            return {};
        end;
    else
        local v40 = {
            unpack(v35, 1, v36)
        };
        local v41 = {};
        for _, v43 in ipairs(v40) do
            local v44 = v32(v43, v39);
            if v44 then
                table.insert(v41, v44);
            end;
        end;
        return v41;
    end;
end);
local v46 = v4.PureComponent:extend("GameMediaAccordionView");
v46.init = function(v47) --[[ Line: 113 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v27 (copy), l_Functional_0 (copy), l_GameMediaImageType_0 (copy), v20 (copy), l_RetrievalStatus_0 (copy), l_FFlagMediaAccordionAndFullTelemetry_0 (copy), l_MediaAccordionExpanded_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_MediaAccordionCollapsed_0 (copy)
    v47.isMounted = false;
    v47.state = {
        firstImageLoaded = v22.isLoaded(v47.props.firstImageId)
    };
    v47.performOpenYouTubeVideo = function(v48, v49) --[[ Line: 122 ]]
        -- upvalues: v47 (copy), v27 (ref)
        local l_guiService_0 = v47.props.guiService;
        local l_openYouTubeVideo_0 = v47.props.openYouTubeVideo;
        local l_eventIngest_0 = v47.props.eventIngest;
        local l_universeId_0 = v47.props.universeId;
        local l_videoHash_0 = v48.videoHash;
        local l_videoTitle_0 = v48.videoTitle;
        if l_videoHash_0 and #l_videoHash_0 > 0 and l_videoTitle_0 and #l_videoTitle_0 > 0 then
            l_openYouTubeVideo_0(l_guiService_0, l_videoHash_0, l_videoTitle_0, v49, l_eventIngest_0, l_universeId_0, v27.play);
        end;
    end;
    v47.logMediaItemsContainVideo = function(v56) --[[ Line: 144 ]]
        -- upvalues: v47 (copy), l_Functional_0 (ref), l_GameMediaImageType_0 (ref), v20 (ref), v27 (ref)
        local l_eventIngest_1 = v47.props.eventIngest;
        local l_universeId_1 = v47.props.universeId;
        local v59 = v47.props.gameMediaEntries or {};
        local v61 = l_Functional_0.Filter(v59, function(v60) --[[ Line: 149 ]]
            -- upvalues: l_GameMediaImageType_0 (ref)
            return v60.mediaType == l_GameMediaImageType_0.YouTubeVideo;
        end)[1];
        if v61 then
            local l_videoHash_1 = v61.videoHash;
            local l_videoTitle_1 = v61.videoTitle;
            v20(l_eventIngest_1, v56, l_videoTitle_1, l_videoHash_1, l_universeId_1, v27.view);
        end;
    end;
    v47.openItem = function(v64) --[[ Line: 168 ]]
        -- upvalues: l_GameMediaImageType_0 (ref), v47 (copy)
        if v64.mediaType == l_GameMediaImageType_0.YouTubeVideo then
            local l_openLeaveRobloxAlertUIBlox_0 = v47.props.openLeaveRobloxAlertUIBlox;
            local l_showYouTubeAgeAlert_0 = v47.props.showYouTubeAgeAlert;
            local function v67() --[[ Line: 172 ]]
                -- upvalues: v47 (ref), v64 (copy)
                v47.performOpenYouTubeVideo(v64, "gameDetailsAccordianImage");
            end;
            if l_showYouTubeAgeAlert_0 then
                l_openLeaveRobloxAlertUIBlox_0(v67);
                return;
            else
                v47.performOpenYouTubeVideo(v64, "gameDetailsAccordianImage");
            end;
        end;
    end;
    v47.onImageLoaded = function(v68) --[[ Line: 184 ]]
        -- upvalues: v47 (copy)
        if v68 == 1 and v47.state.firstImageLoaded == false and v47.isMounted then
            v47:setState({
                firstImageLoaded = true
            });
        end;
    end;
    if v47.props.gameMediaFetchingStatus == l_RetrievalStatus_0.Done then
        v47.logMediaItemsContainVideo("gameDetailsAccordianImage");
    end;
    if l_FFlagMediaAccordionAndFullTelemetry_0 then
        v47.onAccordionExpanded = function() --[[ Line: 197 ]]
            -- upvalues: v47 (copy), l_MediaAccordionExpanded_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
            if v47.props.placeId then
                l_MediaAccordionExpanded_0(v47.props.eventIngest, "GameMediaAccordionView", v47.props.placeId, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                    universeId = v47.props.universeId
                } else nil);
            end;
        end;
        v47.onAccordionCollapsed = function() --[[ Line: 212 ]]
            -- upvalues: v47 (copy), l_MediaAccordionCollapsed_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref)
            if v47.props.placeId then
                l_MediaAccordionCollapsed_0(v47.props.eventIngest, "GameMediaAccordionView", v47.props.placeId, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then {
                    universeId = v47.props.universeId
                } else nil);
            end;
        end;
    end;
end;
v46.renderItem = function(v69, v70, v71, v72) --[[ Line: 229 ]] --[[ Name: renderItem ]]
    -- upvalues: v4 (copy), v21 (copy), l_GameMediaImageType_0 (copy), l_Functional_0 (copy)
    local l_GameMediaAccordion_0 = v69.props.appTheme.GameMediaAccordion;
    local l_BackgroundColor_0 = l_GameMediaAccordion_0.Item.BackgroundColor;
    local l_BackgroundTransparency_0 = l_GameMediaAccordion_0.Item.BackgroundTransparency;
    local l_VideoIconColor_0 = l_GameMediaAccordion_0.VideoIconColor;
    local l_imageId_0 = v70.imageId;
    return v4.createElement(v21, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_BackgroundColor_0, 
        BackgroundTransparency = l_BackgroundTransparency_0, 
        Image = l_imageId_0, 
        ImageTransparency = v71, 
        isVideo = v70.mediaType == l_GameMediaImageType_0.YouTubeVideo, 
        videoIconColor = l_VideoIconColor_0, 
        animationSettings = v72, 
        onImageLoaded = function() --[[ Line: 247 ]] --[[ Name: onImageLoaded ]]
            -- upvalues: l_Functional_0 (ref), v69 (copy), v70 (copy)
            local v78 = l_Functional_0.Find(v69.props.gameMediaEntries, v70);
            v69.onImageLoaded(v78);
        end, 
        onActivated = function() --[[ Line: 251 ]] --[[ Name: onActivated ]]
            -- upvalues: v69 (copy), v70 (copy)
            v69.openItem(v70);
        end
    });
end;
v46.render = function(v79) --[[ Line: 257 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_AccordionView_0 (copy), v23 (copy), l_FFlagMediaAccordionAndFullTelemetry_0 (copy)
    local l_GameMediaAccordion_1 = v79.props.appTheme.GameMediaAccordion;
    local l_gameMediaEntries_0 = v79.props.gameMediaEntries;
    local l_LayoutOrder_0 = v79.props.LayoutOrder;
    local l_width_0 = v79.props.width;
    local v84 = v79.state.firstImageLoaded and l_GameMediaAccordion_1.FakeItem.Loaded or l_GameMediaAccordion_1.FakeItem.Loading;
    if #l_gameMediaEntries_0 > 0 then
        return v4.createElement(l_AccordionView_0, {
            items = l_gameMediaEntries_0, 
            itemWidth = l_width_0, 
            itemHeight = l_width_0 * 0.5611940298507463, 
            renderItem = function(...) --[[ Line: 271 ]] --[[ Name: renderItem ]]
                -- upvalues: v79 (copy)
                return v79:renderItem(...);
            end, 
            placeholderColor = v84.Color, 
            placeholderBaseTransparency = v84.BaseTransparency, 
            collapseButtonSize = 44, 
            renderCollapseButton = function(v85) --[[ Line: 277 ]] --[[ Name: renderCollapseButton ]]
                -- upvalues: v4 (ref), v23 (ref)
                return v4.createElement(v23, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    iconSize = UDim2.new(0, 36, 0, 36), 
                    iconImage = "LuaApp/icons/GameDetails/collapse", 
                    onActivated = v85, 
                    withNewThemeProvider = true
                });
            end, 
            LayoutOrder = l_LayoutOrder_0, 
            maxItemsInCompactView = 3, 
            onExpand = if l_FFlagMediaAccordionAndFullTelemetry_0 then v79.onAccordionExpanded else nil, 
            onCollapse = if l_FFlagMediaAccordionAndFullTelemetry_0 then v79.onAccordionCollapsed else nil
        });
    else
        return nil;
    end;
end;
v46.didUpdate = function(v86, v87, _) --[[ Line: 296 ]] --[[ Name: didUpdate ]]
    -- upvalues: v22 (copy), l_RetrievalStatus_0 (copy)
    if v87.firstImageId ~= v86.props.firstImageId then
        local v89 = v22.isLoaded(v86.props.firstImageId);
        if v89 ~= v86.state.firstImageLoaded then
            v86:setState({
                firstImageLoaded = v89
            });
        end;
    end;
    if v87.gameMediaFetchingStatus ~= l_RetrievalStatus_0.Done and v86.props.gameMediaFetchingStatus == l_RetrievalStatus_0.Done then
        v86.logMediaItemsContainVideo("gameDetailsAccordianImage");
    end;
end;
v46.didMount = function(v90) --[[ Line: 314 ]] --[[ Name: didMount ]]
    v90.isMounted = true;
end;
v46.willUnmount = function(v91) --[[ Line: 318 ]] --[[ Name: willUnmount ]]
    v91.isMounted = false;
end;
v46 = v24(v46);
v46 = v5.connect(function(v92, v93) --[[ Line: 324 ]]
    -- upvalues: l_ApiFetchGameMedia_0 (copy), v45 (copy), v4 (copy)
    local l_showVideoThumbnails_0 = v93.showVideoThumbnails;
    local v95 = nil;
    local v96 = l_ApiFetchGameMedia_0.GetFetchingStatus(v92, v93.universeId);
    v95 = v45(v92.GameMedia[v93.universeId], 10, v93.placeId, v96, l_showVideoThumbnails_0);
    local l_None_0 = v4.None;
    if v95 ~= nil and v95[1] ~= nil then
        l_None_0 = v95[1].imageId;
    end;
    return {
        gameMediaEntries = v95, 
        gameMediaFetchingStatus = v96, 
        firstImageId = l_None_0
    };
end, function(v98) --[[ Line: 348 ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        openLeaveRobloxAlertUIBlox = function(v99) --[[ Line: 350 ]] --[[ Name: openLeaveRobloxAlertUIBlox ]]
            -- upvalues: v98 (copy), v18 (ref)
            v98(v18(v99));
        end, 
        openYouTubeVideo = function(v100, v101, v102, v103, v104, v105, v106) --[[ Line: 353 ]] --[[ Name: openYouTubeVideo ]]
            -- upvalues: v98 (copy), v19 (ref)
            return v98(v19(v100, v101, v102, v103, v104, v105, v106));
        end
    };
end)(v46);
v46 = l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    eventIngest = l_AppEventIngestService_0
})(v46);
return (l_RoactAppPolicy_0.connect(function(v107, _) --[[ Line: 382 ]]
    return {
        showYouTubeAgeAlert = v107.getShowYouTubeAgeAlert(), 
        showVideoThumbnails = v107.getShowVideoThumbnails()
    };
end)(v46));
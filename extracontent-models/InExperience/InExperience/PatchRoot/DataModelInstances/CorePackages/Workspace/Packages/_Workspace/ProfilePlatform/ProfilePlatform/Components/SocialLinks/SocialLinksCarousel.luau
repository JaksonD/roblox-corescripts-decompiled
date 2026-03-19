local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.CollectionViews);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(l_script_FirstAncestor_0.Components.SocialLinks.SocialLinkTile);
local v9 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v10 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v11 = require(l_script_FirstAncestor_0.Hooks.useDynamicSizeMargin);
local v12 = require(l_script_FirstAncestor_0.Analytics.sendSocialLinkClickEvent);
local l_CollectionCarousel_0 = v4.CollectionCarousel;
local l_CollectionViewTypes_0 = v4.CollectionViewTypes;
local l_useCollectionLayoutParams_0 = v4.useCollectionLayoutParams;
local l_CollectionItemSize_0 = l_CollectionViewTypes_0.CollectionItemSize;
local l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp;
local v18 = if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then nil else game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0);
return function(v19) --[[ Line: 42 ]]
    -- upvalues: v9 (copy), l_useRoactService_0 (copy), l_AppLinking_0 (copy), v3 (copy), l_useLocalization_0 (copy), v10 (copy), v11 (copy), l_useCollectionLayoutParams_0 (copy), l_CollectionItemSize_0 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (copy), v12 (copy), v18 (copy), l_TelemetryService_0 (copy), v8 (copy), l_CollectionCarousel_0 (copy)
    local v20 = v9();
    local l_openLeaveRobloxAlertUIBlox_0 = v20.navigateTo.openLeaveRobloxAlertUIBlox;
    local l_closeLeaveRobloxAlert_0 = v20.navigateTo.closeLeaveRobloxAlert;
    local v23 = l_useRoactService_0(l_AppLinking_0);
    local v24, v25 = v3.useState(nil);
    local v26 = v3.useRef(nil);
    local v27 = l_useLocalization_0({
        title = v10.SocialMedia
    });
    local v28, v29 = v11();
    local v30 = {
        sideMargin = v28
    };
    local v31 = l_useCollectionLayoutParams_0(l_CollectionItemSize_0.XSmall, v24, true, v30);
    local v33 = v3.useCallback(function(v32) --[[ Line: 58 ]]
        return v32 + 36;
    end, {});
    local function _(v34, v35) --[[ Line: 62 ]]
        -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v12 (ref), v20 (copy), v18 (ref), l_TelemetryService_0 (ref), v23 (copy), l_closeLeaveRobloxAlert_0 (copy)
        return function() --[[ Line: 63 ]]
            -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v12 (ref), v20 (ref), v34 (copy), v35 (copy), v18 (ref), l_TelemetryService_0 (ref), v23 (ref), l_closeLeaveRobloxAlert_0 (ref)
            if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                v12({
                    assignment_id = v20.profileId, 
                    assignment_type = "group", 
                    social_link_type = v34, 
                    social_link_url = v35, 
                    social_link_display_type = "badge"
                });
            else
                local v36 = {
                    eventName = "socialLinkClickEvent", 
                    backends = {
                        "EventIngest"
                    }, 
                    throttlingPercentage = v18, 
                    lastUpdated = {
                        25, 
                        5, 
                        20
                    }, 
                    description = "Event fired from the client every time a social link is clicked", 
                    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto"
                };
                local v37 = {
                    assignment_id = v20.profileId, 
                    assignment_type = "group", 
                    social_link_type = v34, 
                    social_link_url = v35, 
                    social_link_display_type = "badge"
                };
                l_TelemetryService_0:LogEvent(v36, {
                    customFields = v37
                });
            end;
            if v23 then
                v23:openURL(v35):andThen(function(v38) --[[ Line: 93 ]]
                    -- upvalues: v23 (ref), v35 (ref)
                    if v38 == false then
                        v23:openURL(v35);
                    end;
                end);
            end;
            if l_closeLeaveRobloxAlert_0 then
                l_closeLeaveRobloxAlert_0();
            end;
        end;
    end;
    local v46 = v3.useCallback(function(v40) --[[ Line: 106 ]]
        -- upvalues: l_openLeaveRobloxAlertUIBlox_0 (copy), v23 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v12 (ref), v20 (copy), v18 (ref), l_TelemetryService_0 (ref), l_closeLeaveRobloxAlert_0 (copy)
        return function() --[[ Line: 107 ]]
            -- upvalues: l_openLeaveRobloxAlertUIBlox_0 (ref), v23 (ref), v40 (copy), l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v12 (ref), v20 (ref), v18 (ref), l_TelemetryService_0 (ref), l_closeLeaveRobloxAlert_0 (ref)
            if l_openLeaveRobloxAlertUIBlox_0 and v23 and v40.url then
                local l_key_0 = v40.key;
                local l_url_0 = v40.url;
                l_openLeaveRobloxAlertUIBlox_0(function() --[[ Line: 63 ]]
                    -- upvalues: l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 (ref), v12 (ref), v20 (ref), l_key_0 (copy), l_url_0 (copy), v18 (ref), l_TelemetryService_0 (ref), v23 (ref), l_closeLeaveRobloxAlert_0 (ref)
                    if l_FFlagLuaAppAddSocialLinkClickTelemetryToEdp_0 then
                        v12({
                            assignment_id = v20.profileId, 
                            assignment_type = "group", 
                            social_link_type = l_key_0, 
                            social_link_url = l_url_0, 
                            social_link_display_type = "badge"
                        });
                    else
                        local v43 = {
                            eventName = "socialLinkClickEvent", 
                            backends = {
                                "EventIngest"
                            }, 
                            throttlingPercentage = v18, 
                            lastUpdated = {
                                25, 
                                5, 
                                20
                            }, 
                            description = "Event fired from the client every time a social link is clicked", 
                            links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto"
                        };
                        local v44 = {
                            assignment_id = v20.profileId, 
                            assignment_type = "group", 
                            social_link_type = l_key_0, 
                            social_link_url = l_url_0, 
                            social_link_display_type = "badge"
                        };
                        l_TelemetryService_0:LogEvent(v43, {
                            customFields = v44
                        });
                    end;
                    if v23 then
                        v23:openURL(l_url_0):andThen(function(v45) --[[ Line: 93 ]]
                            -- upvalues: v23 (ref), l_url_0 (ref)
                            if v45 == false then
                                v23:openURL(l_url_0);
                            end;
                        end);
                    end;
                    if l_closeLeaveRobloxAlert_0 then
                        l_closeLeaveRobloxAlert_0();
                    end;
                end);
            end;
        end;
    end, {
        l_openLeaveRobloxAlertUIBlox_0, 
        v23
    });
    local v50 = v3.useCallback(function(v47, v48, _) --[[ Line: 115 ]]
        -- upvalues: v3 (ref), v8 (ref), v46 (copy)
        return v3.createElement(v8, {
            name = v47.name, 
            icon = v47.logo, 
            tileSize = 80, 
            onActivated = v46(v47), 
            layoutOrder = v48
        }), v47.key;
    end, {
        v46
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v19.layoutOrder, 
        [v3.Change.AbsoluteSize] = v29
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 0), 
            PaddingRight = UDim.new(0, 0)
        }), 
        CollectionCarousel = v3.createElement(l_CollectionCarousel_0, {
            containerRef = v25, 
            scrollingFrameRef = v26, 
            LayoutOrder = 1, 
            title = v27.title, 
            items = v19.items, 
            renderItem = v50, 
            getItemHeight = v33, 
            numColumns = v31.numColumns, 
            fractionalItemAmount = v31.fractionalItemAmount, 
            columnGap = v31.columnGap, 
            sideMargin = v31.sideMargin, 
            maxItemsToShow = v31.maxTilesToShow, 
            thresholdFromEnd = v31.loadMoreThreshold
        })
    });
end;
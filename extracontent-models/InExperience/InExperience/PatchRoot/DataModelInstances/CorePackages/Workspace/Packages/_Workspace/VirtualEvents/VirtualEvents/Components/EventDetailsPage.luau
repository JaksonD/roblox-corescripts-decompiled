local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useDeviceType_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useDeviceType;
local _ = require(l_script_FirstAncestor_0.Parent.RobloxAppEnums);
local l_useRoactService_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_script_FirstAncestor_0.Parent.RoactServiceTags).RoactNetworking;
local v10 = require(l_script_FirstAncestor_0.Parent.Responsive);
local v11 = require(l_script_FirstAncestor_0.Parent.ReactFocusNavigation);
local l_useCloseWithBackButton_0 = require(l_script_FirstAncestor_0.Parent.AppBlox).useCloseWithBackButton;
local v13 = require(l_script_FirstAncestor_0.Common.getEventTimerStatus);
local v14 = require(l_script_FirstAncestor_0.Common.findFirstImageInMedia);
local v15 = require(l_script_FirstAncestor_0.Common.getGalleryItems);
local v16 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnailList);
local v17 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnail);
local v18 = require(l_script_FirstAncestor_0.Hooks.useActionBarProps);
local v19 = require(l_script_FirstAncestor_0.Components.EventTimer);
local v20 = require(l_script_FirstAncestor_0.Components.EventDescription);
local v21 = require(l_script_FirstAncestor_0.Components.EventHostedBy);
local v22 = require(l_script_FirstAncestor_0.Components.Attendance);
local v23 = require(l_script_FirstAncestor_0.requests);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppLimitEventThumbnailToOne);
local l_useMutation_0 = v1.useMutation;
local v27 = require(l_script_FirstAncestor_0.Parent.AppBlox);
local l_DetailsPageTemplate_0 = v27.DetailsPageTemplate;
local l_ContentPosition_0 = v27.ContentPosition;
local l_MediaGalleryPreview_0 = v27.MediaGalleryPreview;
local l_calcMediaGallerySizesFromWidth_0 = v27.calcMediaGallerySizesFromWidth;
local l_ListTable_0 = v5.App.Table.ListTable;
local function v33() --[[ Line: 41 ]]

end;
local v34 = {
    onClose = v33, 
    onJoinEvent = v33, 
    onShare = v33
};
local v35 = game:DefineFastFlag("UseNewEventImageFetch2", false);
return function(v36) --[[ Line: 74 ]] --[[ Name: EventDetailsPage ]]
    -- upvalues: v3 (copy), v34 (copy), v4 (copy), l_useDeviceType_0 (copy), v35 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v25 (copy), v17 (copy), v15 (copy), v16 (copy), v14 (copy), l_useMutation_0 (copy), v23 (copy), v13 (copy), l_calcMediaGallerySizesFromWidth_0 (copy), v10 (copy), v11 (copy), l_useCloseWithBackButton_0 (copy), v18 (copy), l_ContentPosition_0 (copy), v22 (copy), l_MediaGalleryPreview_0 (copy), v20 (copy), l_ListTable_0 (copy), v21 (copy), l_DetailsPageTemplate_0 (copy), v19 (copy)
    local v37 = v3.Dictionary.join(v34, v36);
    local l_media_0 = v36.virtualEvent.media;
    local l_experienceDetails_0 = v36.virtualEvent.experienceDetails;
    local v40, v41 = v4.useState(0);
    local v42 = l_useDeviceType_0();
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    if v35 then
        local v46, v47 = v4.useState({});
        v43 = v46;
        v44 = v47;
        v45 = if v43[1] then v43[1].imageId else nil;
        v46 = l_useRoactService_0(l_RoactNetworking_0);
        local l_v46_0 = v46 --[[ copy: 10 -> 26 ]];
        v4.useEffect(function() --[[ Line: 91 ]]
            -- upvalues: v25 (ref), v17 (ref), l_v46_0 (copy), v36 (copy), v44 (ref), v15 (ref), l_media_0 (copy), v16 (ref)
            if v25 then
                v17(l_v46_0, v36.virtualEvent.id):andThen(function(v49) --[[ Line: 93 ]]
                    -- upvalues: v44 (ref), v15 (ref), l_media_0 (ref)
                    local v50 = {};
                    if v49 then
                        table.insert(v50, {
                            imageId = v49, 
                            isYouTubeVideo = false
                        });
                    end;
                    if #v50 > 0 then
                        v44(v50);
                        return;
                    else
                        v44(v15(l_media_0));
                        return;
                    end;
                end, function() --[[ Line: 110 ]]
                    -- upvalues: v44 (ref), v15 (ref), l_media_0 (ref)
                    v44(v15(l_media_0));
                end);
                return;
            else
                v16(l_v46_0, v36.virtualEvent.id):andThen(function(v51) --[[ Line: 114 ]]
                    -- upvalues: v44 (ref), v15 (ref), l_media_0 (ref)
                    local v52 = {};
                    if v51 then
                        for _, v54 in v51 do
                            if v54.mediaId then
                                table.insert(v52, {
                                    imageId = "rbxassetid://" .. v54.mediaId, 
                                    isYouTubeVideo = false
                                });
                            end;
                        end;
                    end;
                    if #v52 > 0 then
                        v44(v52);
                        return;
                    else
                        v44(v15(l_media_0));
                        return;
                    end;
                end, function() --[[ Line: 135 ]]
                    -- upvalues: v44 (ref), v15 (ref), l_media_0 (ref)
                    v44(v15(l_media_0));
                end);
                return;
            end;
        end, {
            v36.virtualEvent.id, 
            l_media_0
        });
    else
        v43 = v4.useMemo(function() --[[ Line: 141 ]]
            -- upvalues: v15 (ref), l_media_0 (copy)
            return v15(l_media_0);
        end, {
            l_media_0
        });
        v45 = if l_media_0 then v14(l_media_0) else nil;
    end;
    local v62 = l_useMutation_0(v23.UPDATE_RSVP_STATUS, {
        variables = {
            virtualEventId = v36.virtualEvent.id
        }, 
        update = function(_, v56, v57) --[[ Line: 151 ]] --[[ Name: update ]]
            -- upvalues: v3 (ref)
            local l_virtualEvent_0 = v57.data.virtualEventRsvp.virtualEvent;
            v56:modify({
                id = v56:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v60) --[[ Line: 157 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v3 (ref)
                        local v61 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v3.Dictionary.join(v60, {
                            going = v60.going + v61
                        });
                    end
                }
            });
        end
    });
    local v63 = v4.useMemo(function() --[[ Line: 168 ]]
        -- upvalues: v13 (ref), v37 (copy)
        return v13(v37.virtualEvent, v37.currentTime);
    end, {
        v37.virtualEvent, 
        v37.currentTime
    });
    local v67 = v4.useCallback(function(v64) --[[ Line: 172 ]]
        -- upvalues: l_calcMediaGallerySizesFromWidth_0 (ref), v40 (copy), v41 (copy)
        local l_X_0 = v64.AbsoluteSize.X;
        local l_Offset_0 = l_calcMediaGallerySizesFromWidth_0(l_X_0, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v40 then
            v41(l_Offset_0);
        end;
    end, {
        v40
    });
    local v70 = v4.useCallback(function() --[[ Line: 181 ]]
        -- upvalues: v37 (copy), v62 (copy)
        local v68 = nil;
        v68 = v37.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing";
        v62[1]({
            variables = {
                rsvpStatus = v68
            }
        }):andThen(function(v69) --[[ Line: 195 ]]
            -- upvalues: v37 (ref)
            if v37.onRsvpChanged then
                v37.onRsvpChanged(v69.data.virtualEventRsvp.virtualEvent.userRsvpStatus, v69.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal);
            end;
        end);
    end, {
        v37.virtualEvent
    });
    local v71 = v4.useRef(nil);
    v71.current = v10.usePreferredInput();
    local v72 = v71.current == v10.Input.Directional;
    local v73, v74 = v11.useMostRecentOrDefaultFocusBehavior();
    local v75 = l_useCloseWithBackButton_0(v74, v36.onClose);
    local v76 = v11.useFocusGuiObject();
    local v77, v78 = v4.useState(nil);
    local v80 = v4.useCallback(function(v79) --[[ Line: 221 ]]
        -- upvalues: v78 (copy), v73 (copy)
        v78(v79);
        if typeof(v73) == "function" then
            v73(v79);
        end;
    end, {
        v73
    });
    v4.useEffect(function() --[[ Line: 230 ]]
        -- upvalues: v77 (copy), v71 (copy), v10 (ref), v76 (copy)
        if v77 and v71.current == v10.Input.Directional then
            v76(v77);
        end;
    end, {
        v77, 
        v76
    });
    local v81 = v18(v37.virtualEvent, v63, {
        onClose = v37.onClose, 
        onJoinEvent = v37.onJoinEvent, 
        onShare = v37.onShare, 
        onRsvpChanged = v70
    }, v80);
    local v82 = v4.useMemo(function() --[[ Line: 243 ]]
        -- upvalues: v81 (copy)
        return v81.button or #v81.icons > 0;
    end, {
        v81
    });
    local v83 = {
        Attendance = if v63 ~= "Elapsed" then {
            portraitLayoutOrder = 1, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 253 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v22 (ref), v37 (copy), v63 (copy)
                return v4.createElement(v22, {
                    virtualEvent = v37.virtualEvent, 
                    eventStatus = v63
                });
            end
        } else nil, 
        MediaGallery = {
            portraitLayoutOrder = 2, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 265 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v40 (copy), v67 (copy), l_MediaGalleryPreview_0 (ref), v43 (ref)
                return v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v40), 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v67
                }, {
                    Gallery = v4.createElement(l_MediaGalleryPreview_0, {
                        items = v43, 
                        numberOfThumbnails = 5
                    })
                });
            end
        }, 
        Description = {
            portraitLayoutOrder = 3, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 282 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v20 (ref), v37 (copy), l_experienceDetails_0 (copy), v35 (ref), v45 (ref)
                return v4.createElement(v20, {
                    description = v37.virtualEvent.description, 
                    experienceName = if l_experienceDetails_0 then l_experienceDetails_0.name else nil, 
                    experienceThumbnail = if v35 then ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(v37.virtualEvent.universeId) else v45, 
                    onExperienceTileActivated = v37.onExperienceTileActivated
                });
            end
        }, 
        EventInfo = if v37.virtualEvent.host then {
            portraitLayoutOrder = 4, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 298 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), l_ListTable_0 (ref), v21 (ref), v37 (copy)
                return v4.createElement(l_ListTable_0, {
                    cells = {
                        v4.createElement(v21, {
                            host = v37.virtualEvent.host, 
                            onActivated = v37.onHostActivated
                        })
                    }
                });
            end
        } else nil
    };
    return v4.createElement(l_DetailsPageTemplate_0, {
        deviceType = v42, 
        titleText = v36.virtualEvent.eventStatus == "moderated" and "[CONTENT MODERATED]" or v37.virtualEvent.title, 
        thumbnailImageUrl = v45, 
        thumbnailAspectRatio = Vector2.new(16, 9), 
        renderInfoContent = function() --[[ Line: 319 ]] --[[ Name: renderInfoContent ]]
            -- upvalues: v4 (ref), v19 (ref), v37 (copy), v63 (copy)
            return v4.createElement(v19, {
                virtualEvent = v37.virtualEvent, 
                status = v63, 
                currentTime = v37.currentTime
            });
        end, 
        actionBarProps = if v82 then v81 else nil, 
        componentList = if v36.virtualEvent.eventStatus ~= "cancelled" and v36.virtualEvent.eventStatus ~= "moderated" then v83 else {}, 
        onClose = v37.onClose, 
        disableStickyActionBar = v72, 
        containerRef = v75
    });
end;
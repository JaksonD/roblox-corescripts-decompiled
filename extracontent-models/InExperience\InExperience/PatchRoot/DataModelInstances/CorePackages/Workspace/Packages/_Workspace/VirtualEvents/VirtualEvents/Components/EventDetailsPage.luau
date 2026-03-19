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
local v14 = require(l_script_FirstAncestor_0.Common.getGalleryItems);
local v15 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnailList);
local v16 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnail);
local v17 = require(l_script_FirstAncestor_0.Hooks.useActionBarProps);
local v18 = require(l_script_FirstAncestor_0.Components.EventTimer);
local v19 = require(l_script_FirstAncestor_0.Components.EventDescription);
local v20 = require(l_script_FirstAncestor_0.Components.EventHostedBy);
local v21 = require(l_script_FirstAncestor_0.Components.Attendance);
local v22 = require(l_script_FirstAncestor_0.requests);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v24 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppLimitEventThumbnailToOne);
local l_useMutation_0 = v1.useMutation;
local v26 = require(l_script_FirstAncestor_0.Parent.AppBlox);
local l_DetailsPageTemplate_0 = v26.DetailsPageTemplate;
local l_ContentPosition_0 = v26.ContentPosition;
local l_MediaGalleryPreview_0 = v26.MediaGalleryPreview;
local l_calcMediaGallerySizesFromWidth_0 = v26.calcMediaGallerySizesFromWidth;
local l_ListTable_0 = v5.App.Table.ListTable;
local function v32() --[[ Line: 40 ]]

end;
local v33 = {
    onClose = v32, 
    onJoinEvent = v32, 
    onShare = v32
};
return function(v34) --[[ Line: 71 ]] --[[ Name: EventDetailsPage ]]
    -- upvalues: v3 (copy), v33 (copy), v4 (copy), l_useDeviceType_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v24 (copy), v16 (copy), v14 (copy), v15 (copy), l_useMutation_0 (copy), v22 (copy), v13 (copy), l_calcMediaGallerySizesFromWidth_0 (copy), v10 (copy), v11 (copy), l_useCloseWithBackButton_0 (copy), v17 (copy), l_ContentPosition_0 (copy), v21 (copy), l_MediaGalleryPreview_0 (copy), v19 (copy), l_ListTable_0 (copy), v20 (copy), l_DetailsPageTemplate_0 (copy), v18 (copy)
    local v35 = v3.Dictionary.join(v33, v34);
    local l_media_0 = v34.virtualEvent.media;
    local l_experienceDetails_0 = v34.virtualEvent.experienceDetails;
    local v38, v39 = v4.useState(0);
    local v40 = l_useDeviceType_0();
    local v41, v42 = v4.useState({});
    local v43 = if v41[1] then v41[1].imageId else nil;
    local v44 = l_useRoactService_0(l_RoactNetworking_0);
    v4.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v24 (ref), v16 (ref), v44 (copy), v34 (copy), v42 (copy), v14 (ref), l_media_0 (copy), v15 (ref)
        if v24 then
            v16(v44, v34.virtualEvent.id):andThen(function(v45) --[[ Line: 88 ]]
                -- upvalues: v42 (ref), v14 (ref), l_media_0 (ref)
                local v46 = {};
                if v45 then
                    table.insert(v46, {
                        imageId = v45, 
                        isYouTubeVideo = false
                    });
                end;
                if #v46 > 0 then
                    v42(v46);
                    return;
                else
                    v42(v14(l_media_0));
                    return;
                end;
            end, function() --[[ Line: 105 ]]
                -- upvalues: v42 (ref), v14 (ref), l_media_0 (ref)
                v42(v14(l_media_0));
            end);
            return;
        else
            v15(v44, v34.virtualEvent.id):andThen(function(v47) --[[ Line: 109 ]]
                -- upvalues: v42 (ref), v14 (ref), l_media_0 (ref)
                local v48 = {};
                if v47 then
                    for _, v50 in v47 do
                        if v50.mediaId then
                            table.insert(v48, {
                                imageId = "rbxassetid://" .. v50.mediaId, 
                                isYouTubeVideo = false
                            });
                        end;
                    end;
                end;
                if #v48 > 0 then
                    v42(v48);
                    return;
                else
                    v42(v14(l_media_0));
                    return;
                end;
            end, function() --[[ Line: 130 ]]
                -- upvalues: v42 (ref), v14 (ref), l_media_0 (ref)
                v42(v14(l_media_0));
            end);
            return;
        end;
    end, {
        v34.virtualEvent.id, 
        l_media_0
    });
    local v58 = l_useMutation_0(v22.UPDATE_RSVP_STATUS, {
        variables = {
            virtualEventId = v34.virtualEvent.id
        }, 
        update = function(_, v52, v53) --[[ Line: 140 ]] --[[ Name: update ]]
            -- upvalues: v3 (ref)
            local l_virtualEvent_0 = v53.data.virtualEventRsvp.virtualEvent;
            v52:modify({
                id = v52:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v56) --[[ Line: 146 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v3 (ref)
                        local v57 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v3.Dictionary.join(v56, {
                            going = v56.going + v57
                        });
                    end
                }
            });
        end
    });
    local v59 = v4.useMemo(function() --[[ Line: 157 ]]
        -- upvalues: v13 (ref), v35 (copy)
        return v13(v35.virtualEvent, v35.currentTime);
    end, {
        v35.virtualEvent, 
        v35.currentTime
    });
    local v63 = v4.useCallback(function(v60) --[[ Line: 161 ]]
        -- upvalues: l_calcMediaGallerySizesFromWidth_0 (ref), v38 (copy), v39 (copy)
        local l_X_0 = v60.AbsoluteSize.X;
        local l_Offset_0 = l_calcMediaGallerySizesFromWidth_0(l_X_0, 5).contentSize.Y.Offset;
        if l_Offset_0 ~= v38 then
            v39(l_Offset_0);
        end;
    end, {
        v38
    });
    local v66 = v4.useCallback(function() --[[ Line: 170 ]]
        -- upvalues: v35 (copy), v58 (copy)
        local v64 = nil;
        v64 = v35.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing";
        v58[1]({
            variables = {
                rsvpStatus = v64
            }
        }):andThen(function(v65) --[[ Line: 184 ]]
            -- upvalues: v35 (ref)
            if v35.onRsvpChanged then
                v35.onRsvpChanged(v65.data.virtualEventRsvp.virtualEvent.userRsvpStatus, v65.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal);
            end;
        end);
    end, {
        v35.virtualEvent
    });
    local v67 = v4.useRef(nil);
    v67.current = v10.usePreferredInput();
    local v68 = v67.current == v10.Input.Directional;
    local v69, v70 = v11.useMostRecentOrDefaultFocusBehavior();
    local v71 = l_useCloseWithBackButton_0(v70, v34.onClose);
    local v72 = v11.useFocusGuiObject();
    local v73, v74 = v4.useState(nil);
    local v76 = v4.useCallback(function(v75) --[[ Line: 210 ]]
        -- upvalues: v74 (copy), v69 (copy)
        v74(v75);
        if typeof(v69) == "function" then
            v69(v75);
        end;
    end, {
        v69
    });
    v4.useEffect(function() --[[ Line: 219 ]]
        -- upvalues: v73 (copy), v67 (copy), v10 (ref), v72 (copy)
        if v73 and v67.current == v10.Input.Directional then
            v72(v73);
        end;
    end, {
        v73, 
        v72
    });
    local v77 = v17(v35.virtualEvent, v59, {
        onClose = v35.onClose, 
        onJoinEvent = v35.onJoinEvent, 
        onShare = v35.onShare, 
        onRsvpChanged = v66
    }, v76);
    local v78 = v4.useMemo(function() --[[ Line: 232 ]]
        -- upvalues: v77 (copy)
        return v77.button or #v77.icons > 0;
    end, {
        v77
    });
    local v79 = {
        Attendance = if v59 ~= "Elapsed" then {
            portraitLayoutOrder = 1, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 242 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v21 (ref), v35 (copy), v59 (copy)
                return v4.createElement(v21, {
                    virtualEvent = v35.virtualEvent, 
                    eventStatus = v59
                });
            end
        } else nil, 
        MediaGallery = {
            portraitLayoutOrder = 2, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 1, 
            renderComponent = function() --[[ Line: 254 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v38 (copy), v63 (copy), l_MediaGalleryPreview_0 (ref), v41 (copy)
                return v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v38), 
                    BackgroundTransparency = 1, 
                    [v4.Change.AbsoluteSize] = v63
                }, {
                    Gallery = v4.createElement(l_MediaGalleryPreview_0, {
                        items = v41, 
                        numberOfThumbnails = 5
                    })
                });
            end
        }, 
        Description = {
            portraitLayoutOrder = 3, 
            landscapePosition = l_ContentPosition_0.Left, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 271 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), v19 (ref), v35 (copy), l_experienceDetails_0 (copy)
                return v4.createElement(v19, {
                    description = v35.virtualEvent.description, 
                    experienceName = if l_experienceDetails_0 then l_experienceDetails_0.name else nil, 
                    experienceThumbnail = ("rbxthumb://type=GameIcon&id=%s&w=150&h=150"):format(v35.virtualEvent.universeId), 
                    onExperienceTileActivated = v35.onExperienceTileActivated
                });
            end
        }, 
        EventInfo = if v35.virtualEvent.host then {
            portraitLayoutOrder = 4, 
            landscapePosition = l_ContentPosition_0.Right, 
            landscapeLayoutOrder = 2, 
            renderComponent = function() --[[ Line: 285 ]] --[[ Name: renderComponent ]]
                -- upvalues: v4 (ref), l_ListTable_0 (ref), v20 (ref), v35 (copy)
                return v4.createElement(l_ListTable_0, {
                    cells = {
                        v4.createElement(v20, {
                            host = v35.virtualEvent.host, 
                            onActivated = v35.onHostActivated
                        })
                    }
                });
            end
        } else nil
    };
    return v4.createElement(l_DetailsPageTemplate_0, {
        deviceType = v40, 
        titleText = v34.virtualEvent.eventStatus == "moderated" and "[CONTENT MODERATED]" or v35.virtualEvent.title, 
        thumbnailImageUrl = v43, 
        thumbnailAspectRatio = Vector2.new(16, 9), 
        renderInfoContent = function() --[[ Line: 306 ]] --[[ Name: renderInfoContent ]]
            -- upvalues: v4 (ref), v18 (ref), v35 (copy), v59 (copy)
            return v4.createElement(v18, {
                virtualEvent = v35.virtualEvent, 
                status = v59, 
                currentTime = v35.currentTime
            });
        end, 
        actionBarProps = if v78 then v77 else nil, 
        componentList = if v34.virtualEvent.eventStatus ~= "cancelled" and v34.virtualEvent.eventStatus ~= "moderated" then v79 else {}, 
        onClose = v35.onClose, 
        disableStickyActionBar = v68, 
        containerRef = v71
    });
end;
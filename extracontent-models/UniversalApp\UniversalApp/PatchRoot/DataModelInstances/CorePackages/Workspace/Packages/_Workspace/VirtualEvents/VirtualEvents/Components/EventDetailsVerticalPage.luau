local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v6 = require(l_script_FirstAncestor_0.Parent.FocusNavigationUtils);
local l_useRoactService_0 = require(l_script_FirstAncestor_0.Parent.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_script_FirstAncestor_0.Parent.RoactServiceTags).RoactNetworking;
local l_FormFactor_0 = require(l_script_FirstAncestor_0.Parent.FormFactor).Enums.FormFactor;
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local v11 = require(l_script_FirstAncestor_0.Common.getEventTimerStatus);
local v12 = require(l_script_FirstAncestor_0.Common.findFirstImageInMedia);
local v13 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnail);
local v14 = require(l_script_FirstAncestor_0.Components.EventDetailsContainer);
local v15 = require(l_script_FirstAncestor_0.Hooks.useCTAProps);
local v16 = require(l_script_FirstAncestor_0.Hooks.useAnimation);
local v17 = require(l_script_FirstAncestor_0.requests);
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v19 = require(l_script_FirstAncestor_0.constants);
local l_useMutation_0 = v1.useMutation;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_UtilityActionIcon_0 = v5.App.Button.UtilityActionIcon;
local l_LoadableImage_0 = v5.App.Loading.LoadableImage;
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_FocusNavigableSurfaceWrapper_0 = v6.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local v28 = l_Images_0["icons/navigation/close_small"];
local function v29() --[[ Line: 45 ]]

end;
local v30 = {
    onClose = v29, 
    onJoinEvent = v29, 
    onShare = v29
};
return function(v31) --[[ Line: 71 ]] --[[ Name: EventDetailsVerticalPage ]]
    -- upvalues: v3 (copy), v30 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), v4 (copy), v12 (copy), v13 (copy), v19 (copy), l_useMutation_0 (copy), v17 (copy), v11 (copy), v15 (copy), v16 (copy), l_withStyle_0 (copy), l_UtilityActionIcon_0 (copy), l_ImageSetLabel_0 (copy), v28 (copy), l_LoadableImage_0 (copy), v14 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v32 = v3.Dictionary.join(v30, v31);
    local v33 = l_useRoactService_0(l_RoactNetworking_0);
    local v35 = l_useSelector_0(function(v34) --[[ Line: 76 ]]
        return v34.FormFactor;
    end) == l_FormFactor_0.WIDE;
    local l_media_0 = v31.virtualEvent.media;
    local v37, v38 = v4.useState(0);
    local v39, v40 = v4.useState(0);
    local v41, v42 = v4.useState(nil);
    local v43 = if l_media_0 then v12(l_media_0) else nil;
    v4.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: v13 (ref), v33 (copy), v31 (copy), v43 (copy), v42 (copy)
        local v44 = true;
        v13(v33, v31.virtualEvent.id, v43):andThen(function(v45) --[[ Line: 90 ]]
            -- upvalues: v44 (ref), v42 (ref)
            if v44 then
                v42(v45);
            end;
        end);
        return function() --[[ Line: 95 ]]
            -- upvalues: v44 (ref)
            v44 = false;
        end;
    end, {
        v31.virtualEvent.id, 
        v43
    });
    local v49 = v4.useCallback(function(v46) --[[ Line: 100 ]]
        -- upvalues: v19 (ref), v37 (copy), v38 (copy), v39 (copy), v40 (copy)
        local v47 = math.min(v19.HORIZONTAL_ASPECT_RATIO * v46.AbsoluteSize.X, v46.AbsoluteSize.Y);
        if v47 ~= v37 then
            v38(v47);
        end;
        local v48 = v46.AbsoluteSize.Y - v47 + 40;
        if v48 ~= v39 then
            v40(v48);
        end;
    end, {
        v37, 
        v39
    });
    local v57 = l_useMutation_0(v17.UPDATE_RSVP_STATUS, {
        variables = {
            virtualEventId = v31.virtualEvent.id
        }, 
        update = function(_, v51, v52) --[[ Line: 116 ]] --[[ Name: update ]]
            -- upvalues: v3 (ref)
            local l_virtualEvent_0 = v52.data.virtualEventRsvp.virtualEvent;
            v51:modify({
                id = v51:identify(l_virtualEvent_0), 
                fields = {
                    rsvpCounters = function(_, v55) --[[ Line: 122 ]] --[[ Name: rsvpCounters ]]
                        -- upvalues: l_virtualEvent_0 (copy), v3 (ref)
                        local v56 = l_virtualEvent_0.userRsvpStatus == "going" and 1 or -1;
                        return v3.Dictionary.join(v55, {
                            going = v55.going + v56
                        });
                    end
                }
            });
        end
    });
    local v58 = v4.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v11 (ref), v32 (copy)
        return v11(v32.virtualEvent, v32.currentTime);
    end, {
        v32.virtualEvent, 
        v32.currentTime
    });
    local v61 = v4.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v32 (copy), v57 (copy)
        local v59 = nil;
        v59 = v32.virtualEvent.userRsvpStatus ~= "going" and "going" or "notGoing";
        v57[1]({
            variables = {
                rsvpStatus = v59
            }
        }):andThen(function(v60) --[[ Line: 151 ]]
            -- upvalues: v32 (ref)
            if v32.onRsvpChanged then
                v32.onRsvpChanged(v60.data.virtualEventRsvp.virtualEvent.userRsvpStatus, v60.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal);
            end;
        end);
    end, {
        v32.virtualEvent
    });
    local v62 = v15(v32.virtualEvent, v58, v31.notifyMeUseEmphasisVariant, {
        onClose = v32.onClose, 
        onJoinEvent = v32.onJoinEvent, 
        onRsvpChanged = v61, 
        onShare = v32.onShare
    });
    local v63, v64 = v4.useState(v19.CONTAINER_WIDTH);
    v16({
        startOffset = v63, 
        endOffset = 0, 
        duration = 0.1, 
        easingStyle = "linear", 
        setAnimationOffset = v64
    });
    return l_withStyle_0(function(v65) --[[ Line: 178 ]]
        -- upvalues: v4 (ref), v35 (copy), l_UtilityActionIcon_0 (ref), v31 (copy), l_ImageSetLabel_0 (ref), v28 (ref), v49 (copy), l_LoadableImage_0 (ref), v37 (copy), v41 (copy), v14 (ref), v58 (copy), v62 (copy), v39 (copy), l_FocusNavigableSurfaceWrapper_0 (ref), l_FocusNavigableSurfaceIdentifierEnum_0 (ref), v63 (copy), v19 (ref)
        local v66 = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            CloseButtonContainer = v4.createElement("Frame", {
                ZIndex = 3, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromOffset(48, 48), 
                Position = if v35 then UDim2.new(1, -64, 0, 16) else UDim2.fromOffset(16, 16)
            }, {
                CloseButton = v4.createElement(l_UtilityActionIcon_0, {
                    ZIndex = 1, 
                    onActivated = v31.onClose, 
                    onMedia = true
                }), 
                CloseIcon = v4.createElement(l_ImageSetLabel_0, {
                    ZIndex = 2, 
                    Size = UDim2.fromOffset(24, 24), 
                    Image = v28, 
                    ImageColor3 = v65.Theme.IconEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    Position = UDim2.fromOffset(12, 12)
                })
            }), 
            MediaContainer = v4.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1), 
                [v4.Change.AbsoluteSize] = v49, 
                ZIndex = 1
            }, {
                Thumbnail = v4.createElement(l_LoadableImage_0, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.new(1, 0, 0, v37), 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Crop, 
                    Image = v41, 
                    useShimmerAnimationWhileLoading = true, 
                    showFailedStateWhenLoadingFailed = true
                })
            }), 
            EventContainer = v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                ZIndex = 2
            }, {
                EventDetailsContainer = v4.createElement(v14, {
                    virtualEvent = v31.virtualEvent, 
                    eventStatus = v58, 
                    isWideMode = v35, 
                    ctaProps = v62, 
                    bottomHeight = v39, 
                    onExperienceTileActivated = v31.onExperienceTileActivated
                })
            })
        });
        return v4.createElement("ImageButton", {
            ZIndex = 4, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.fromRGB(0, 0, 0), 
            Active = true, 
            AutoButtonColor = false, 
            [v4.Event.Activated] = v31.onClose
        }, {
            EventDetailsWindow = v4.createElement(l_FocusNavigableSurfaceWrapper_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                isIsolated = true, 
                frameProps = {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, v63, 0, 0), 
                    Size = if v35 then UDim2.new(0, v19.CONTAINER_WIDTH, 1, 0) else UDim2.fromScale(1, 1), 
                    BackgroundTransparency = v65.Theme.BackgroundDefault.Transparency, 
                    BackgroundColor3 = v65.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0
                }
            }, {
                EventDetailsWrapper = v4.createElement("ScrollingFrame", {
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.fromScale(0, 0), 
                    ScrollBarThickness = 0, 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    Selectable = false
                }, {
                    EventDetailsVerticalPage = v66
                })
            })
        });
    end);
end;
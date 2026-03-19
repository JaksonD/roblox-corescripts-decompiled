local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.Localization);
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.UIBlox);
local l_useScreenSize_0 = require(l_Parent_1.CoreScriptsRoactCommon).useScreenSize;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_1.RoactServiceTags).RoactNetworking;
local v10 = require(l_Parent_1.NotificationModalsManager);
local v11 = require(l_Parent_1.GameTile);
local l_MouseIconOverrideService_0 = require(l_Parent_1.CoreScriptsCommon).MouseIconOverrideService;
local l_useDesignTokens_0 = require(l_Parent_1.Style).useDesignTokens;
local v14 = require(l_Parent_0.constants);
local v15 = require(l_Parent_0.Common.postRsvpStatus);
local v16 = require(l_Parent_0.Common.formatDateLocalized);
local v17 = require(l_Parent_0.Components.CoreUI.ServiceOverrideContext);
local l_useContext_0 = v5.useContext;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_LoadableImage_0 = v6.App.Loading.LoadableImage;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_GameTileThumbnailBadges_0 = v11.GameTileThumbnailBadges;
local l_ScrollView_0 = v3.ScrollView;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
return function(v28) --[[ Line: 69 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_MouseIconOverrideService_0 (copy), v14 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v16 (copy), l_useContext_0 (copy), v17 (copy), v15 (copy), v10 (copy), l_ButtonType_0 (copy), l_TextService_0 (copy), l_useDesignTokens_0 (copy), l_LoadableImage_0 (copy), l_GameTileThumbnailBadges_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_InteractiveAlert_0 (copy)
    local v29 = l_useScreenSize_0();
    local v30 = v28.enableInputDelayed == nil or v28.enableInputDelayed;
    local v31 = l_useLocalization_0({
        joinEvent = "Feature.VirtualEvents.JoinEvent", 
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        notNowButton = "Feature.VirtualEvents.NotNowButton", 
        dateAtTime = "Feature.VirtualEvents.Label.DateAtTime", 
        toastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
    });
    v5.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: l_MouseIconOverrideService_0 (ref)
        l_MouseIconOverrideService_0.push("RSVPPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        return function() --[[ Line: 86 ]]
            -- upvalues: l_MouseIconOverrideService_0 (ref)
            l_MouseIconOverrideService_0.pop("RSVPPromptOverride");
        end;
    end, {});
    local l_eventDetails_0 = v28.promptData.eventDetails;
    local l_displayTitle_0 = l_eventDetails_0.displayTitle;
    local l_displayDescription_0 = l_eventDetails_0.displayDescription;
    local l_thumbnails_0 = l_eventDetails_0.thumbnails;
    local l_DEFAULT_EVENT_MEDIA_ID_0 = v14.DEFAULT_EVENT_MEDIA_ID;
    if l_thumbnails_0 and l_thumbnails_0[1] and l_thumbnails_0[1].mediaId then
        l_DEFAULT_EVENT_MEDIA_ID_0 = l_thumbnails_0[1].mediaId;
    end;
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local v38 = l_eventDetails_0.userRsvpStatus == "going";
    local l_None_0 = Enum.RsvpStatus.None;
    if l_eventDetails_0.userRsvpStatus == "going" then
        l_None_0 = Enum.RsvpStatus.Going;
    elseif l_eventDetails_0.userRsvpStatus == "notGoing" then
        l_None_0 = Enum.RsvpStatus.NotGoing;
    end;
    local l_notifyMe_0 = v31.notifyMe;
    if v38 then
        l_notifyMe_0 = v31.unfollowEvent;
    end;
    local v41 = nil;
    local v42 = nil;
    if l_eventDetails_0.eventTime and l_eventDetails_0.eventTime.startUtc then
        v41 = DateTime.fromIsoDate(l_eventDetails_0.eventTime.startUtc);
        if v41 then
            v42 = v16(v31.dateAtTime, v41);
        end;
    end;
    local l_joinEvent_0 = v31.joinEvent;
    if v38 then
        l_joinEvent_0 = v31.unfollowEvent;
    end;
    local l_socialService_0 = l_useContext_0(v17).socialService;
    local v48 = v5.useCallback(function() --[[ Line: 137 ]]
        -- upvalues: v38 (copy), v15 (ref), v37 (copy), v28 (copy), l_socialService_0 (copy), l_None_0 (ref), v31 (copy), l_displayTitle_0 (copy), v42 (ref), v10 (ref)
        if v38 then
            v15(v37, v28.promptData.eventId, "notGoing"):andThen(function() --[[ Line: 139 ]]
                -- upvalues: l_socialService_0 (ref), v28 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v28.promptData.eventId, true, Enum.RsvpStatus.NotGoing, l_None_0);
            end, function(v45) --[[ Line: 146 ]]
                -- upvalues: l_socialService_0 (ref), v28 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v28.promptData.eventId, false, Enum.RsvpStatus.None, l_None_0);
                warn("Error updating rsvp status: ", v45);
            end);
        else
            v15(v37, v28.promptData.eventId, "going"):andThen(function() --[[ Line: 156 ]]
                -- upvalues: l_socialService_0 (ref), v28 (ref), l_None_0 (ref), v31 (ref), l_displayTitle_0 (ref), v42 (ref), v10 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v28.promptData.eventId, true, Enum.RsvpStatus.Going, l_None_0);
                local v46 = v31.toastText:gsub("{(.-)}", {
                    eventName = l_displayTitle_0, 
                    eventTime = v42
                });
                v10.SetUIBloxToast({
                    toastTitle = v46, 
                    sequenceNumber = DateTime.now().UnixTimestamp
                });
            end, function(v47) --[[ Line: 173 ]]
                -- upvalues: l_socialService_0 (ref), v28 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v28.promptData.eventId, false, Enum.RsvpStatus.None, l_None_0);
                warn("Error updating rsvp status: ", v47);
            end);
        end;
        v28.closePrompt();
    end, {
        l_socialService_0, 
        v28.closePrompt, 
        v38
    });
    local v50 = v5.useCallback(function() --[[ Line: 186 ]]
        -- upvalues: l_eventDetails_0 (copy), l_socialService_0 (copy), v28 (copy), l_None_0 (ref)
        local l_None_1 = Enum.RsvpStatus.None;
        if l_eventDetails_0.userRsvpStatus == "notGoing" then
            l_None_1 = Enum.RsvpStatus.NotGoing;
        elseif l_eventDetails_0.userRsvpStatus == "going" then
            l_None_1 = Enum.RsvpStatus.Going;
        end;
        l_socialService_0:PromptRsvpToEventCompleted(v28.promptData.eventId, true, l_None_1, l_None_0);
        v28.closePrompt();
    end, {
        l_socialService_0, 
        v28.closePrompt, 
        l_eventDetails_0.userRsvpStatus
    });
    local v51 = v5.useMemo(function() --[[ Line: 198 ]]
        -- upvalues: l_ButtonType_0 (ref), v30 (copy), v48 (copy), l_notifyMe_0 (ref)
        return {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v30, 
                        isDelayedInput = v30, 
                        onActivated = v48, 
                        text = l_notifyMe_0
                    }
                }
            }
        };
    end, {
        v31, 
        v48, 
        v30, 
        l_notifyMe_0
    });
    local v52, v53 = v5.useState(Vector2.new(0, 0));
    local v55 = v5.useCallback(function(v54) --[[ Line: 217 ]]
        -- upvalues: v53 (copy)
        v53(v54.AbsoluteSize);
    end, {
        v53
    });
    local v56, v57 = v5.useState(0);
    local v58 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 225 ]]
        -- upvalues: v58 (copy), l_displayDescription_0 (copy), l_TextService_0 (ref), v57 (copy)
        if not v58.current then
            return;
        else
            local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
            l_GetTextBoundsParams_0.Text = l_displayDescription_0;
            l_GetTextBoundsParams_0.Font = v58.current.FontFace;
            l_GetTextBoundsParams_0.Size = v58.current.TextSize;
            l_GetTextBoundsParams_0.Width = v58.current.AbsoluteSize.X;
            local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
            v57(l_l_TextService_0_TextBoundsAsync_0.Y * v58.current.LineHeight);
            return;
        end;
    end, {
        v58, 
        v52, 
        l_displayDescription_0
    });
    local l_Space_150_0 = l_useDesignTokens_0().Global.Space_150;
    local v71 = v5.useCallback(function() --[[ Line: 244 ]]
        -- upvalues: v29 (copy), v28 (copy), v52 (copy), v14 (ref), v56 (copy), v5 (ref), l_LoadableImage_0 (ref), l_DEFAULT_EVENT_MEDIA_ID_0 (ref), v41 (ref), l_GameTileThumbnailBadges_0 (ref), v42 (ref), l_ScrollView_0 (ref), l_ScrollBarVisibility_0 (ref), l_Text_0 (ref), l_displayDescription_0 (copy), v58 (copy), l_View_0 (ref), v55 (copy), l_displayTitle_0 (copy)
        local v62 = v29.Y - 80 - 200;
        if v62 < 80 then
            v62 = 80;
        end;
        local v63 = v28.overrideUseWideMode or v29.Y < 600 and v29.X > v29.Y;
        if v63 then
            local v64 = v52.X * 0.6;
            if v64 * 1 / v14.THUMBNAIL_ASPECT_RATIO < v62 then
                v62 = v64 * 1 / v14.THUMBNAIL_ASPECT_RATIO;
            end;
        end;
        local v65 = math.min(v56, v62);
        local l_v62_0 = v62;
        if not v63 then
            v65 = v56;
            if v56 > v62 * 0.4 then
                v65 = v62 * 0.4;
            end;
            l_v62_0 = v62 - v65;
        end;
        local v67 = UDim2.new(1, 0, 0, l_v62_0);
        if v63 then
            v67 = UDim2.new(0.6, 0, 0, l_v62_0);
        end;
        local v68 = v5.createElement("Frame", {
            AutomaticSize = if v63 then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
            Size = v67, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Thumbnail = v5.createElement(l_LoadableImage_0, {
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                Image = "rbxassetid://" .. l_DEFAULT_EVENT_MEDIA_ID_0, 
                useShimmerAnimationWhileLoading = true, 
                showFailedStateWhenLoadingFailed = true, 
                cornerRadius = UDim.new(0, 8)
            }), 
            AspectRatioConstraint = v5.createElement("UIAspectRatioConstraint", {
                AspectRatio = v14.THUMBNAIL_ASPECT_RATIO, 
                DominantAxis = Enum.DominantAxis.Width, 
                AspectType = Enum.AspectType.FitWithinMaxSize
            }), 
            Overlay = if v41 then v5.createElement("Frame", {
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Badge = v5.createElement(l_GameTileThumbnailBadges_0, {
                    tileBadgesByPosition = {
                        ImageTopLeft = {
                            {
                                tileBadgeType = "Text", 
                                text = v42
                            }
                        }
                    }
                })
            }) else nil
        });
        local v69 = UDim2.new(1, 0, 0, v65);
        if v63 then
            v69 = UDim2.new(0.4, 0, 0, v65);
        end;
        local v70 = v5.createElement(l_ScrollView_0, {
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(1, 0), 
                scrollBarVisibility = l_ScrollBarVisibility_0.Auto, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            }, 
            tag = "col align-y-top", 
            LayoutOrder = 3, 
            Size = v69
        }, {
            Body = v5.createElement(l_Text_0, {
                tag = "size-full-0 text-body-large text-align-y-top text-align-x-left", 
                Text = l_displayDescription_0, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, v56), 
                padding = Vector2.new(0, 0), 
                ref = v58
            })
        });
        if v63 then
            return v5.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                tag = "col align-x-center size-full-0 auto-y gap-medium", 
                onAbsoluteSizeChanged = v55
            }, {
                Title = v5.createElement(l_Text_0, {
                    tag = "size-full-0 auto-y text-title-large text-align-x-left", 
                    Text = l_displayTitle_0, 
                    LayoutOrder = 1
                }), 
                Contents = v5.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row align-y-center size-full-0 gap-medium", 
                    Size = UDim2.new(1, 0, 0, l_v62_0)
                }, {
                    ThumbnailFrame = v68, 
                    BodyScrollView = v70
                })
            });
        else
            return v5.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                tag = "col align-x-center size-full-0 auto-y gap-medium", 
                onAbsoluteSizeChanged = v55
            }, {
                ThumbnailFrame = v68, 
                Title = v5.createElement(l_Text_0, {
                    tag = "size-full-0 auto-y text-title-large text-align-x-left", 
                    Text = l_displayTitle_0, 
                    LayoutOrder = 2
                }), 
                BodyScrollView = v70
            });
        end;
    end, {
        l_DEFAULT_EVENT_MEDIA_ID_0, 
        l_displayTitle_0, 
        l_displayDescription_0, 
        v42, 
        v52, 
        v56, 
        v55, 
        v29, 
        l_Space_150_0
    });
    return v5.createElement(l_InteractiveAlert_0, {
        onCloseClicked = v50, 
        buttonStackInfo = v51, 
        isMiddleContentFocusable = false, 
        middleContent = v71, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v29, 
        title = l_joinEvent_0
    });
end;
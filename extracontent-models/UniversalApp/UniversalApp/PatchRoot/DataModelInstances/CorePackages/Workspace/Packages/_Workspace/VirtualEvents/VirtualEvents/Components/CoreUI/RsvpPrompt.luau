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
local l_useTokens_0 = v3.Hooks.useTokens;
local l_GameTileThumbnailBadges_0 = v11.GameTileThumbnailBadges;
local l_ScrollView_0 = v3.ScrollView;
local l_ScrollBarVisibility_0 = v3.Enums.ScrollBarVisibility;
local v29 = game:DefineFastFlag("LuaAppFixRsvpPromptDescriptionScrolling", false);
return function(v30) --[[ Line: 74 ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_MouseIconOverrideService_0 (copy), v14 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), v16 (copy), l_useContext_0 (copy), v17 (copy), v15 (copy), v10 (copy), l_ButtonType_0 (copy), l_useDesignTokens_0 (copy), l_useTokens_0 (copy), v29 (copy), l_TextService_0 (copy), l_LoadableImage_0 (copy), l_GameTileThumbnailBadges_0 (copy), l_ScrollView_0 (copy), l_ScrollBarVisibility_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_InteractiveAlert_0 (copy)
    local v31 = l_useScreenSize_0();
    local v32 = v30.enableInputDelayed == nil or v30.enableInputDelayed;
    local v33 = l_useLocalization_0({
        joinEvent = "Feature.VirtualEvents.JoinEvent", 
        notifyMe = "Feature.VirtualEvents.NotifyMe", 
        unfollowEvent = "Feature.VirtualEvents.UnfollowEvent", 
        notNowButton = "Feature.VirtualEvents.NotNowButton", 
        dateAtTime = "Feature.VirtualEvents.Label.DateAtTime", 
        toastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
    });
    v5.useEffect(function() --[[ Line: 88 ]]
        -- upvalues: l_MouseIconOverrideService_0 (ref)
        l_MouseIconOverrideService_0.push("RSVPPromptOverride", Enum.OverrideMouseIconBehavior.ForceShow);
        return function() --[[ Line: 91 ]]
            -- upvalues: l_MouseIconOverrideService_0 (ref)
            l_MouseIconOverrideService_0.pop("RSVPPromptOverride");
        end;
    end, {});
    local l_eventDetails_0 = v30.promptData.eventDetails;
    local l_displayTitle_0 = l_eventDetails_0.displayTitle;
    local l_displayDescription_0 = l_eventDetails_0.displayDescription;
    local l_thumbnails_0 = l_eventDetails_0.thumbnails;
    local l_DEFAULT_EVENT_MEDIA_ID_0 = v14.DEFAULT_EVENT_MEDIA_ID;
    if l_thumbnails_0 and l_thumbnails_0[1] and l_thumbnails_0[1].mediaId then
        l_DEFAULT_EVENT_MEDIA_ID_0 = l_thumbnails_0[1].mediaId;
    end;
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    local v40 = l_eventDetails_0.userRsvpStatus == "going";
    local l_None_0 = Enum.RsvpStatus.None;
    if l_eventDetails_0.userRsvpStatus == "going" then
        l_None_0 = Enum.RsvpStatus.Going;
    elseif l_eventDetails_0.userRsvpStatus == "notGoing" then
        l_None_0 = Enum.RsvpStatus.NotGoing;
    end;
    local l_notifyMe_0 = v33.notifyMe;
    if v40 then
        l_notifyMe_0 = v33.unfollowEvent;
    end;
    local v43 = nil;
    local v44 = nil;
    if l_eventDetails_0.eventTime and l_eventDetails_0.eventTime.startUtc then
        v43 = DateTime.fromIsoDate(l_eventDetails_0.eventTime.startUtc);
        if v43 then
            v44 = v16(v33.dateAtTime, v43);
        end;
    end;
    local l_joinEvent_0 = v33.joinEvent;
    if v40 then
        l_joinEvent_0 = v33.unfollowEvent;
    end;
    local l_socialService_0 = l_useContext_0(v17).socialService;
    local v50 = v5.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v40 (copy), v15 (ref), v39 (copy), v30 (copy), l_socialService_0 (copy), l_None_0 (ref), v33 (copy), l_displayTitle_0 (copy), v44 (ref), v10 (ref)
        if v40 then
            v15(v39, v30.promptData.eventId, "notGoing"):andThen(function() --[[ Line: 144 ]]
                -- upvalues: l_socialService_0 (ref), v30 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v30.promptData.eventId, true, Enum.RsvpStatus.NotGoing, l_None_0);
            end, function(v47) --[[ Line: 151 ]]
                -- upvalues: l_socialService_0 (ref), v30 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v30.promptData.eventId, false, Enum.RsvpStatus.None, l_None_0);
                warn("Error updating rsvp status: ", v47);
            end);
        else
            v15(v39, v30.promptData.eventId, "going"):andThen(function() --[[ Line: 161 ]]
                -- upvalues: l_socialService_0 (ref), v30 (ref), l_None_0 (ref), v33 (ref), l_displayTitle_0 (ref), v44 (ref), v10 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v30.promptData.eventId, true, Enum.RsvpStatus.Going, l_None_0);
                local v48 = v33.toastText:gsub("{(.-)}", {
                    eventName = l_displayTitle_0, 
                    eventTime = v44
                });
                v10.SetUIBloxToast({
                    toastTitle = v48, 
                    sequenceNumber = DateTime.now().UnixTimestamp
                });
            end, function(v49) --[[ Line: 178 ]]
                -- upvalues: l_socialService_0 (ref), v30 (ref), l_None_0 (ref)
                l_socialService_0:PromptRsvpToEventCompleted(v30.promptData.eventId, false, Enum.RsvpStatus.None, l_None_0);
                warn("Error updating rsvp status: ", v49);
            end);
        end;
        v30.closePrompt();
    end, {
        l_socialService_0, 
        v30.closePrompt, 
        v40
    });
    local v52 = v5.useCallback(function() --[[ Line: 191 ]]
        -- upvalues: l_eventDetails_0 (copy), l_socialService_0 (copy), v30 (copy), l_None_0 (ref)
        local l_None_1 = Enum.RsvpStatus.None;
        if l_eventDetails_0.userRsvpStatus == "notGoing" then
            l_None_1 = Enum.RsvpStatus.NotGoing;
        elseif l_eventDetails_0.userRsvpStatus == "going" then
            l_None_1 = Enum.RsvpStatus.Going;
        end;
        l_socialService_0:PromptRsvpToEventCompleted(v30.promptData.eventId, true, l_None_1, l_None_0);
        v30.closePrompt();
    end, {
        l_socialService_0, 
        v30.closePrompt, 
        l_eventDetails_0.userRsvpStatus
    });
    local v53 = v5.useMemo(function() --[[ Line: 203 ]]
        -- upvalues: l_ButtonType_0 (ref), v32 (copy), v50 (copy), l_notifyMe_0 (ref)
        return {
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        delayInputSeconds = 2, 
                        enableInputDelayed = v32, 
                        isDelayedInput = v32, 
                        onActivated = v50, 
                        text = l_notifyMe_0
                    }
                }
            }
        };
    end, {
        v33, 
        v50, 
        v32, 
        l_notifyMe_0
    });
    local v54, v55 = v5.useState(Vector2.new(0, 0));
    local v57 = v5.useCallback(function(v56) --[[ Line: 222 ]]
        -- upvalues: v55 (copy)
        v55(v56.AbsoluteSize);
    end, {
        v55
    });
    local v58, v59 = v5.useState(0);
    local v60, v61 = v5.useState(0);
    local v62 = v5.useRef(nil);
    local v63 = v5.useRef(nil);
    local v67 = v5.useCallback(function(v64) --[[ Line: 232 ]]
        -- upvalues: v59 (copy)
        local v65 = math.ceil(v64.TextBounds.Y);
        if v65 > 0 then
            v59(function(v66) --[[ Line: 235 ]]
                -- upvalues: v65 (copy)
                if v65 ~= v66 then
                    return v65;
                else
                    return v66;
                end;
            end);
        end;
    end, {
        v59
    });
    local l_Space_150_0 = l_useDesignTokens_0().Global.Space_150;
    local v69 = l_useTokens_0();
    local l_BodyLarge_0 = v69.Typography.BodyLarge;
    local v71 = v30.overrideUseWideMode or v31.Y < 600 and v31.X > v31.Y;
    v5.useEffect(function() --[[ Line: 255 ]]
        -- upvalues: v29 (ref), v59 (copy)
        if v29 then
            v59(0);
        end;
    end, {
        v71, 
        l_displayDescription_0
    });
    v5.useEffect(function() --[[ Line: 261 ]]
        -- upvalues: v29 (ref), v63 (copy), v61 (copy), v62 (copy), l_displayDescription_0 (copy), l_TextService_0 (ref), v59 (copy)
        if v29 then
            if v63.current then
                v61(v63.current.AbsoluteSize.Y);
            end;
            return;
        elseif not v62.current then
            return;
        else
            local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
            l_GetTextBoundsParams_0.Text = l_displayDescription_0;
            l_GetTextBoundsParams_0.Font = v62.current.FontFace;
            l_GetTextBoundsParams_0.Size = v62.current.TextSize;
            l_GetTextBoundsParams_0.Width = v62.current.AbsoluteSize.X;
            local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
            v59(l_l_TextService_0_TextBoundsAsync_0.Y * v62.current.LineHeight);
            if v63.current then
                v61(v63.current.AbsoluteSize.Y);
            end;
            return;
        end;
    end, {
        v62, 
        v54.X, 
        l_displayDescription_0, 
        v71
    });
    local v85 = v5.useCallback(function() --[[ Line: 288 ]]
        -- upvalues: v31 (copy), v71 (copy), v54 (copy), v14 (ref), v29 (ref), v60 (copy), l_Space_150_0 (copy), v58 (copy), v5 (ref), l_LoadableImage_0 (ref), l_DEFAULT_EVENT_MEDIA_ID_0 (ref), v43 (ref), l_GameTileThumbnailBadges_0 (ref), v44 (ref), l_displayDescription_0 (copy), l_BodyLarge_0 (copy), v69 (copy), v67 (copy), v62 (copy), l_ScrollView_0 (ref), l_ScrollBarVisibility_0 (ref), l_Text_0 (ref), l_View_0 (ref), v57 (copy), l_displayTitle_0 (copy), v63 (copy)
        local v74 = v31.Y - 80 - 200;
        if v74 < 80 then
            v74 = 80;
        end;
        if v71 then
            local v75 = v54.X * 0.6;
            if v75 * 1 / v14.THUMBNAIL_ASPECT_RATIO < v74 then
                v74 = v75 * 1 / v14.THUMBNAIL_ASPECT_RATIO;
            end;
            if v29 then
                v74 = math.max(v74 - v60 - l_Space_150_0, 80);
            end;
        end;
        local v76 = v29 and v58 == 0 and 80 or v58;
        local v77 = math.min(v76, v74);
        local l_v74_0 = v74;
        if not v71 then
            local l_v74_1 = v74;
            if v29 then
                l_v74_1 = math.max(v74 - v60 - l_Space_150_0 * 2, 80);
            end;
            v77 = if v29 then math.min(v76, l_v74_1 * 0.4) else math.min(v58, l_v74_1 * 0.4);
            l_v74_0 = l_v74_1 - v77;
        end;
        local v80 = UDim2.new(1, 0, 0, l_v74_0);
        if v71 then
            v80 = UDim2.new(0.6, 0, 0, l_v74_0);
        end;
        local v81 = v5.createElement("Frame", {
            AutomaticSize = if v71 then Enum.AutomaticSize.X else Enum.AutomaticSize.Y, 
            Size = v80, 
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
            Overlay = if v43 then v5.createElement("Frame", {
                ZIndex = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                Badge = v5.createElement(l_GameTileThumbnailBadges_0, {
                    tileBadgesByPosition = {
                        ImageTopLeft = {
                            {
                                tileBadgeType = "Text", 
                                text = v44
                            }
                        }
                    }
                })
            }) else nil
        });
        local v82 = UDim2.new(1, 0, 0, v77);
        if v71 then
            v82 = if v29 then UDim2.new(0.4, -l_Space_150_0, 0, v77) else UDim2.new(0.4, 0, 0, v77);
        end;
        local v83 = nil;
        if v29 then
            local v84 = if v58 > 0 then v58 else 10000;
            v83 = v5.createElement("ScrollingFrame", {
                LayoutOrder = 3, 
                Size = v82, 
                CanvasSize = UDim2.new(0, 0, 0, v84 + 2), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollBarThickness = 0, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = true
            }, {
                Body = v5.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, v84), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_displayDescription_0, 
                    TextTruncate = Enum.TextTruncate.None, 
                    TextWrapped = true, 
                    FontFace = Font.fromEnum(l_BodyLarge_0.Font), 
                    TextSize = l_BodyLarge_0.FontSize, 
                    LineHeight = l_BodyLarge_0.LineHeight, 
                    TextColor3 = v69.Color.Content.Emphasis.Color3, 
                    TextTransparency = v69.Color.Content.Emphasis.Transparency, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    [v5.Change.TextBounds] = v67, 
                    ref = v62
                })
            });
        else
            v83 = v5.createElement(l_ScrollView_0, {
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    CanvasSize = UDim2.fromScale(1, 0), 
                    scrollBarVisibility = l_ScrollBarVisibility_0.Auto, 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
                }, 
                tag = "col align-y-top", 
                LayoutOrder = 3, 
                Size = v82
            }, {
                Body = v5.createElement(l_Text_0, {
                    tag = "size-full-0 text-body-large text-align-y-top text-align-x-left", 
                    Text = l_displayDescription_0, 
                    TextWrapped = true, 
                    Size = UDim2.new(1, 0, 0, v58), 
                    padding = Vector2.new(0, 0), 
                    ref = v62
                })
            });
        end;
        if v71 then
            return v5.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                tag = "col align-x-center size-full-0 auto-y gap-medium", 
                onAbsoluteSizeChanged = v57
            }, {
                Title = v5.createElement(l_Text_0, {
                    tag = "size-full-0 auto-y text-title-large text-align-x-left", 
                    Text = l_displayTitle_0, 
                    LayoutOrder = 1, 
                    ref = v63
                }), 
                Contents = v5.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = {
                        ["row align-y-top gap-medium size-full-0"] = v29, 
                        ["row align-y-center gap-medium size-full-0"] = not v29
                    }, 
                    Size = UDim2.new(1, 0, 0, l_v74_0)
                }, {
                    ThumbnailFrame = v81, 
                    BodyScrollView = v83
                })
            });
        else
            return v5.createElement(l_View_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                tag = "col align-x-center size-full-0 auto-y gap-medium", 
                onAbsoluteSizeChanged = v57
            }, {
                ThumbnailFrame = v81, 
                Title = v5.createElement(l_Text_0, {
                    tag = "size-full-0 auto-y text-title-large text-align-x-left", 
                    Text = l_displayTitle_0, 
                    LayoutOrder = 2, 
                    ref = v63
                }), 
                BodyScrollView = v83
            });
        end;
    end, {
        l_DEFAULT_EVENT_MEDIA_ID_0, 
        l_displayTitle_0, 
        l_displayDescription_0, 
        v43, 
        v44, 
        v54, 
        v58, 
        v57, 
        v31, 
        l_Space_150_0, 
        v60, 
        v69, 
        l_BodyLarge_0, 
        v67, 
        v71, 
        v30.overrideUseWideMode
    });
    return v5.createElement(l_InteractiveAlert_0, {
        onCloseClicked = v52, 
        buttonStackInfo = v53, 
        isMiddleContentFocusable = false, 
        middleContent = v85, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v31, 
        title = l_joinEvent_0
    });
end;
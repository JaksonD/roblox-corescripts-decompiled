local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.GameTile);
local _ = require(l_Parent_0.GraphQLServer);
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_ImpressionsTagUtility_0 = require(l_Parent_0.Impressions).ImpressionsTagUtility;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_Parent_0.GamePlayButton);
local v10 = require(l_Parent_0.NotificationModalsManager);
local v11 = require(l_Parent_0.Style);
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_useDesignTokens_0 = v11.useDesignTokens;
local l_HoldDetector_0 = require(l_Parent_0.HoldToPlay).HoldDetector;
local l_FocusNavigationEventNameEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigationEventNameEnum;
local l_GameTileView_0 = v3.GameTileView;
local l_GridTileTextFooter_0 = v3.GridTileTextFooter;
local l_GameTileThumbnailBadges_0 = v3.GameTileThumbnailBadges;
local l_FooterCornerButtonStyle_0 = v3.FooterCornerButtonStyle;
local l_usePlayButtonState_0 = v9.usePlayButtonState;
local l_PlayButtonStates_0 = v9.PlayButtonStates;
local v22 = require(l_script_FirstAncestor_0.Common.formatDateLocalized);
local v23 = require(l_script_FirstAncestor_0.Common.getVirtualEventDates);
local v24 = require(l_script_FirstAncestor_0.Common.fetchEventThumbnail);
local v25 = require(l_script_FirstAncestor_0.Components.EventsListCarousel.EventWideFooterButton);
local l_useEffect_0 = v2.useEffect;
local l_useState_0 = v2.useState;
local l_useMemo_0 = v2.useMemo;
local l_useCallback_0 = v2.useCallback;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
return function(v31) --[[ Line: 56 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTextSizeOffset_0 (copy), v23 (copy), l_useMemo_0 (copy), l_FooterCornerButtonStyle_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_PlayButtonStates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), l_useLocalization_0 (copy), l_useCallback_0 (copy), v2 (copy), l_useEffect_0 (copy), v22 (copy), v10 (copy), l_useState_0 (copy), v24 (copy), l_ImpressionsTagUtility_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), l_GameTileView_0 (copy), l_GridTileTextFooter_0 (copy), l_GameTileThumbnailBadges_0 (copy), v25 (copy), l_HoldDetector_0 (copy)
    local v32 = l_useDesignTokens_0();
    local v33 = l_useTextSizeOffset_0();
    local l_Event_0 = v31.Event;
    local v35 = v23(l_Event_0);
    local v36 = DateTime.now().UnixTimestamp >= v35.startDate.UnixTimestamp;
    local v37 = l_Event_0.userRsvpStatus == "going";
    local v38 = l_useMemo_0(function() --[[ Line: 64 ]]
        -- upvalues: v36 (copy), l_FooterCornerButtonStyle_0 (ref), v37 (copy)
        if v36 then
            return l_FooterCornerButtonStyle_0.Play;
        elseif v37 then
            return l_FooterCornerButtonStyle_0.Following;
        else
            return l_FooterCornerButtonStyle_0.Follow;
        end;
    end, {
        v36, 
        v37
    });
    local v39 = l_useRoactService_0(l_RoactNetworking_0);
    local v40 = l_usePlayButtonState_0(v39, v31.Event.universeId or "");
    local v41 = true;
    if v40.playButtonState ~= l_PlayButtonStates_0.Playable then
        v41 = l_GetFFlagIsSquadEnabled_0() and v40.playButtonState == l_PlayButtonStates_0.PlayableWithParty;
    end;
    local v42 = l_useLocalization_0({
        HappeningNow = "Feature.Home.Label.HappeningNow", 
        DateAtTime = "Feature.VirtualEvents.Label.DateAtTime", 
        ToastText = "Feature.VirtualEvents.Label.ReminderSetForEventTime"
    });
    local v44 = l_useCallback_0(function() --[[ Line: 85 ]]
        -- upvalues: v41 (copy), v36 (copy), v31 (copy), l_Event_0 (copy)
        if not v41 then
            return;
        elseif v36 then
            v31.onJoinEvent(l_Event_0);
            return;
        else
            local v43 = nil;
            v43 = l_Event_0.userRsvpStatus ~= "going" and "going" or "notGoing";
            if v31.onRsvpChanged then
                v31.onRsvpChanged(l_Event_0, v43);
            end;
            return;
        end;
    end, {
        v36, 
        v31.onJoinEvent, 
        v31.onRsvpChanged, 
        l_Event_0.userRsvpStatus, 
        l_Event_0, 
        v41
    });
    local v45 = v2.useRef(l_Event_0.userRsvpStatus);
    l_useEffect_0(function() --[[ Line: 107 ]]
        -- upvalues: v45 (copy), l_Event_0 (copy), v22 (ref), v42 (copy), v35 (copy), v10 (ref)
        if v45.current and v45.current ~= "going" and l_Event_0.userRsvpStatus == "going" then
            local v46 = v22(v42.DateAtTime, v35.startDate);
            local v47 = v42.ToastText:gsub("{(.-)}", {
                eventName = l_Event_0.displayTitle, 
                eventTime = v46
            });
            v10.SetUIBloxToast({
                toastTitle = v47, 
                sequenceNumber = DateTime.now().UnixTimestamp
            });
        end;
        v45.current = l_Event_0.userRsvpStatus;
    end, {
        l_Event_0.userRsvpStatus, 
        l_Event_0.displayTitle, 
        v35.startDate, 
        v42.DateAtTime, 
        v42.ToastText
    });
    local v48, v49 = l_useState_0(nil);
    l_useEffect_0(function() --[[ Line: 133 ]]
        -- upvalues: v24 (ref), v39 (copy), l_Event_0 (copy), v31 (copy), v49 (copy)
        local v50 = true;
        v24(v39, l_Event_0.id, v31.DefaultThumbnail):andThen(function(v51) --[[ Line: 135 ]]
            -- upvalues: v50 (ref), v49 (ref)
            if v50 then
                v49(v51);
            end;
        end);
        return function() --[[ Line: 140 ]]
            -- upvalues: v50 (ref)
            v50 = false;
        end;
    end, {
        l_Event_0.id, 
        v31.DefaultThumbnail
    });
    local v52 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 146 ]]
        -- upvalues: l_ImpressionsTagUtility_0 (ref), v52 (copy), v31 (copy)
        l_ImpressionsTagUtility_0.AddTag(v52, v31.impressionsTag, v31.layoutOrder);
        return function() --[[ Line: 148 ]]
            -- upvalues: l_ImpressionsTagUtility_0 (ref), v52 (ref), v31 (ref)
            l_ImpressionsTagUtility_0.RemoveTag(v52, v31.impressionsTag, v31.layoutOrder);
        end;
    end, {
        v52, 
        v31.impressionsTag, 
        v31.layoutOrder
    });
    local v53 = nil;
    local v54 = v2.useRef(nil);
    local v55 = v2.useRef(false);
    local v57 = v2.useCallback(function(v56) --[[ Line: 157 ]]
        -- upvalues: v55 (copy)
        v55.current = v56;
    end, {});
    v53 = if v38 == l_FooterCornerButtonStyle_0.Follow then l_FocusNavigationEventNameEnum_0.HoldToNotifyMe else if v38 == l_FooterCornerButtonStyle_0.Following then l_FocusNavigationEventNameEnum_0.HoldToUnfollowEvent else l_FocusNavigationEventNameEnum_0.HoldToJoinEvent;
    local v58 = l_useCallback_0(function() --[[ Line: 169 ]]
        -- upvalues: v55 (copy), v31 (copy)
        if v55.current then
            return;
        else
            v31.onTileActivated(v31.Event);
            return;
        end;
    end, {
        v31.onTileActivated, 
        v31.Event
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v31.layoutOrder, 
        Size = v31.size, 
        ref = v52
    }, {
        GameTile = v2.createElement(l_GameTileView_0, {
            forwardRef = v54, 
            imageAspectRatio = 1.7777777777777777, 
            image = v48, 
            isContained = true, 
            Size = UDim2.fromScale(1, 1), 
            title = l_Event_0.displayTitle or "", 
            onActivated = v58, 
            footerMetadata = v2.createElement(l_GridTileTextFooter_0, {
                text = l_Event_0.displaySubtitle or l_Event_0.displayDescription or "", 
                useLargerFont = true
            }), 
            thumbnailOverlay = v2.createElement(l_GameTileThumbnailBadges_0, {
                tileBadgesByPosition = {
                    ImageTopLeft = {
                        {
                            tileBadgeType = "Text", 
                            text = if v36 then v42.HappeningNow else v22(v42.DateAtTime, v35.startDate)
                        }
                    }
                }
            }), 
            hidePlayButton = true, 
            isHovered = false, 
            extraFooterSpace = if not v31.disableButtons then v32.Global.Size_350 + v32.Global.Space_100 else nil, 
            extraFooterContent = if not v31.disableButtons then v2.createElement(v25, {
                buttonStyle = v38, 
                disabled = not v41, 
                onActivated = v44, 
                key = "WideFooterButton"
            }) else nil, 
            textSizeOffset = v33
        }), 
        HoldDetector = if v54 and v54.current then v2.createElement(l_HoldDetector_0, {
            guiObject = v54.current, 
            onHoldDetected = v44, 
            setDisabledForHold = v57, 
            keyCode = Enum.KeyCode.ButtonA, 
            focusNavigationEventName = v53
        }) else nil
    });
end;
local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.Responsive);
local v5 = require(l_script_FirstAncestor_0.Parent.CollectionViews);
local v6 = require(l_script_FirstAncestor_0.Common.sortEventsByStartDate);
local l_useGetGameTileHeight_0 = require(l_script_FirstAncestor_0.Parent.GameCollections).useGetGameTileHeight;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Parent.Style);
local l_useTextSizeOffset_0 = require(l_script_FirstAncestor_0.Parent.UIBlox).Core.Style.useTextSizeOffset;
local l_useDesignTokens_0 = v9.useDesignTokens;
local l_FrameBoundsImpressionsTracker_0 = require(l_script_FirstAncestor_0.Parent.Impressions).FrameBoundsImpressionsTracker;
local l_CollectionCarousel_0 = v5.CollectionCarousel;
local l_useCollectionImpressionsSignal_0 = v5.useCollectionImpressionsSignal;
local l_flaggedMutedError_0 = require(l_script_FirstAncestor_0.Parent.Loggers).flaggedMutedError;
local l_DiscoveryEventErrorLogger_0 = require(l_script_FirstAncestor_0.Parent.DiscoveryUtils).DiscoveryEventErrorLogger;
local v17 = require(script.Parent.EventTile);
local l_useCallback_0 = v3.useCallback;
local l_useEffect_0 = v3.useEffect;
local l_FFlagLuaAppEventsListImpressionToEventError_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagLuaAppEventsListImpressionToEventError;
return function(v21) --[[ Line: 48 ]]
    -- upvalues: l_useTextSizeOffset_0 (copy), l_useDesignTokens_0 (copy), v4 (copy), v3 (copy), l_HttpService_0 (copy), l_useCallback_0 (copy), v17 (copy), l_useGetGameTileHeight_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_FFlagLuaAppEventsListImpressionToEventError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), l_flaggedMutedError_0 (copy), l_useCollectionImpressionsSignal_0 (copy), l_useEffect_0 (copy), l_CollectionCarousel_0 (copy), l_FrameBoundsImpressionsTracker_0 (copy)
    local v22 = l_useTextSizeOffset_0();
    local v23 = l_useDesignTokens_0();
    local v24 = v4.usePreferredInput() == v4.Input.Directional;
    local v25 = v3.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v21 (copy), l_HttpService_0 (ref)
        return (("EventsListCarousel_%*%*"):format(v21.universeId, (l_HttpService_0:GenerateGUID())));
    end, {
        v21.universeId
    });
    local v30 = l_useCallback_0(function(v26, v27, v28, _) --[[ Line: 58 ]]
        -- upvalues: v3 (ref), v17 (ref), v21 (copy), v25 (copy), v24 (copy)
        return v3.createElement(v17, {
            Event = v26, 
            DefaultThumbnail = v21.defaultThumbnail, 
            onJoinEvent = v21.onJoinEvent, 
            onRsvpChanged = v21.onRsvpChanged, 
            onTileActivated = v21.onTileActivated, 
            impressionsTag = v25, 
            layoutOrder = v27, 
            size = v28, 
            disableButtons = v24
        }), v26.id;
    end, {
        v21.defaultThumbnail, 
        v21.onJoinEvent, 
        v21.onRsvpChanged, 
        v21.onTileActivated, 
        v25, 
        v24
    });
    local v31 = l_useGetGameTileHeight_0(false, "Event", true, false, false, v22, if not v24 then v23.Global.Size_350 + v23.Global.Space_100 else 0);
    local v32 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EventsListTitle"
    });
    local v33 = v6(v21.virtualEvents);
    local v34 = v3.useRef({});
    local v39 = l_useCallback_0(function(v35) --[[ Line: 99 ]]
        -- upvalues: v33 (copy), v34 (copy), v21 (copy), l_FFlagLuaAppEventsListImpressionToEventError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), l_flaggedMutedError_0 (ref)
        for _, v37 in v35 do
            local v38 = v33[v37];
            if v38 ~= nil then
                if not v34.current[v38.id] then
                    v34.current[v38.id] = true;
                    v21.onEventImpression(v38);
                end;
            elseif l_FFlagLuaAppEventsListImpressionToEventError_0 then
                l_DiscoveryEventErrorLogger_0.reportError("EventsListCarouselNilViewedEvent", ("Viewed event at index %* was nil when sending Event Tile impressions with referral source %*"):format(v37, v21.referralSource), {
                    index = v37, 
                    referralSource = v21.referralSource
                });
            else
                l_flaggedMutedError_0("EventsListCarouselNilViewedEvent", (("Viewed event at index $%* was nil when sending Event Tile impressions with referral source $%*"):format(v37, v21.referralSource)));
            end;
        end;
    end, {
        v21.onEventImpression, 
        v33, 
        v21.referralSource
    });
    local v40 = v3.useRef(nil);
    local v41, v42 = l_useCollectionImpressionsSignal_0();
    local v43, v44 = v3.useState(os.clock());
    l_useEffect_0(function() --[[ Line: 137 ]]
        -- upvalues: v44 (copy)
        v44(os.clock());
    end, {
        v21.virtualEvents
    });
    if #v21.virtualEvents == 0 then
        return nil;
    else
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            ClipsDescendants = not v21.peekViewFormat, 
            LayoutOrder = v21.layoutOrder
        }, {
            EventsCarousel = v3.createElement(l_CollectionCarousel_0, {
                scrollingFrameRef = v40, 
                title = v32.title, 
                hideHeaderButton = true, 
                items = v33, 
                renderItem = v30, 
                getItemHeight = v31, 
                onViewableItemsChanged = v42, 
                onChangeCanvasPosition = v42, 
                numColumns = v21.peekViewFormat and 1 or 2, 
                columnGap = v23.Global.Space_150, 
                fractionalItemAmount = 0.33, 
                sideMargin = 0
            }), 
            FrameBoundsImpressionsTracker = v3.createElement(l_FrameBoundsImpressionsTracker_0, {
                pageContext = v21.referralSource, 
                parentRef = v40, 
                impressionsTag = v25, 
                scrollViewPositionChangedSignal = v41, 
                sendImpressions = v39, 
                dataUpdatedTimestamp = v43
            })
        });
    end;
end;
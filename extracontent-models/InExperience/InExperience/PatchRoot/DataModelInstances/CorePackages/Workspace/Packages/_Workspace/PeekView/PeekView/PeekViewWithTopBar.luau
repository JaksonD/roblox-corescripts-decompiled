local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_useRouteName_0 = require(l_Parent_0.Navigation).useRouteName;
local l_AppEventIngestService_0 = require(l_Parent_0.RoactServiceTags).AppEventIngestService;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local v7 = require(script.Parent.PeekView);
local v8 = require(script.Parent.PeekViewState);
local v9 = require(script.Parent.analytics.peekViewDismissedEvent);
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
return function(v11) --[[ Line: 47 ]] --[[ Name: PeekViewWithTopBar ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_useRouteName_0 (copy), l_useStyle_0 (copy), v2 (copy), v8 (copy), v9 (copy), v1 (copy), v7 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy)
    local v12 = l_useRoactService_0(l_AppEventIngestService_0);
    local v13 = l_useRouteName_0();
    local v14 = l_useStyle_0();
    local l_onClosed_0 = v11.onClosed;
    local l_onViewStateChanged_0 = v11.onViewStateChanged;
    local v21 = v2.useCallback(function(v17, v18, v19) --[[ Line: 54 ]]
        -- upvalues: v8 (ref), l_onClosed_0 (copy), v12 (copy), v11 (copy), v9 (ref), v1 (ref), v13 (copy), l_onViewStateChanged_0 (copy)
        if v17 == v8.Closed then
            if l_onClosed_0 then
                l_onClosed_0();
            end;
            if v19.dismissMethod and v12 then
                local v20 = v11.viewChangedEventMeta or {};
                v9.logEvent(v12, "PeekView", v1.Dictionary.join(v20, v19, {
                    page = v13
                }));
            end;
        end;
        if l_onViewStateChanged_0 then
            l_onViewStateChanged_0(v17, v18);
        end;
    end, {
        l_onClosed_0, 
        l_onViewStateChanged_0, 
        v11.viewChangedEventMeta, 
        v12, 
        v13
    });
    local v22, v23 = v2.useBinding(0);
    return v2.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(v11.viewWidth or UDim.new(1, 0), UDim.new(1, 0)), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PeekViewTopBar = v2.createElement("CanvasGroup", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, v11.topBarHeight), 
            BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
            Active = false, 
            BackgroundTransparency = 0, 
            BorderColor3 = v14.Tokens.Semantic.Color.Common.Placeholder.Color3, 
            BorderSizePixel = 0, 
            GroupTransparency = v22:map(function(v24) --[[ Line: 100 ]]
                return 1 - v24;
            end), 
            ZIndex = 2
        }, {
            PeekViewTopBarInner = v11.topBarSlot
        }), 
        PeekViewContainer = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            PeekView = v2.createElement(v7, {
                hasScrim = true, 
                fullViewContentHeight = v11.fullViewContentHeight, 
                briefViewContentHeight = v11.briefViewContentHeight, 
                bottomDockedContainerHeight = v11.bottomDockedContainerHeight, 
                bottomDockedContainerContent = {
                    PeekViewBottomBar = v11.bottomBarSlot
                }, 
                mountAsFullView = v11.mountAsFullView, 
                mountAnimation = v11.mountAnimation, 
                viewStateChanged = v21, 
                briefToFullTransitionPercent = function(v25) --[[ Line: 79 ]]
                    -- upvalues: v23 (copy), v11 (copy)
                    v23(v25);
                    if v11.transitionPercentCallback then
                        v11.transitionPercentCallback(v25);
                    end;
                end, 
                hasSolidDragger = if l_FFlagProfilePlatformNewProfileHeader_0 then v11.hasSolidDragger else nil
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = v11.contentSlot
            })
        })
    });
end;
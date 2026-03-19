local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local v3 = require(l_Parent_0.PeekView);
local l_PeekViewState_0 = v3.PeekViewState;
local l_PeekView_0 = v3.PeekView;
local l_useStyle_0 = v2.Core.Style.useStyle;
return function(v7) --[[ Line: 25 ]]
    -- upvalues: l_useStyle_0 (copy), v1 (copy), l_PeekViewState_0 (copy), l_PeekView_0 (copy)
    local v8 = l_useStyle_0();
    local v9, v10 = v1.useState(0);
    local v12 = v1.useCallback(function(v11) --[[ Line: 29 ]]
        -- upvalues: v10 (copy)
        v10(v11);
    end, {});
    local v16 = v1.useCallback(function(v13, _) --[[ Line: 33 ]]
        -- upvalues: v7 (copy), l_PeekViewState_0 (ref)
        local l_onPeekViewClosed_0 = v7.onPeekViewClosed;
        if v13 == l_PeekViewState_0.Closed and l_onPeekViewClosed_0 then
            l_onPeekViewClosed_0();
        end;
    end, {
        v7.onPeekViewClosed
    });
    local l_viewWidth_0 = v7.viewWidth;
    local v18 = UDim2.new(0, l_viewWidth_0, 1, 0);
    local l_topBarHeight_0 = v7.topBarHeight;
    local v20 = v9 > 0.95;
    local v21 = false;
    if v9 > 0 then
        v21 = not v20;
    end;
    return v1.createElement("Frame", {
        Position = UDim2.fromOffset(0, 0), 
        Size = v18, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PeekViewTopBar = if v20 then v7.renderTopBar() else nil, 
        PeekViewTopBarEffectHolder = if v21 then v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_topBarHeight_0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundColor3 = v8.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1 - v9
        }) else nil, 
        PeekViewContainer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -l_topBarHeight_0 + 6), 
            Position = UDim2.new(0, 0, 0, l_topBarHeight_0 - 6), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            PeekView = v1.createElement(l_PeekView_0, {
                briefViewContentHeight = v7.briefViewContentHeight, 
                bottomDockedContainerHeight = 0, 
                mountAsFullView = v7.mountAsFullView, 
                viewStateChanged = v16, 
                briefToFullTransitionPercent = v12
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }), 
                Content = v7.renderContent()
            })
        })
    });
end;
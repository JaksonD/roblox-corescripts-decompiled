local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.PeekView);
local l_PeekView_0 = v2.PeekView;
local l_PeekViewState_0 = v2.PeekViewState;
local v5 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_useTokens_0 = v1.Hooks.useTokens;
return function(v10) --[[ Line: 25 ]] --[[ Name: InfoPeekView ]]
    -- upvalues: l_useNavigationProps_0 (copy), v5 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_PeekViewState_0 (copy), l_dependencyArray_0 (copy), l_PeekView_0 (copy)
    local v13 = l_useNavigationProps_0(function(_, v12) --[[ Line: 26 ]]
        return {
            title = v12.title, 
            body = v12.body
        };
    end);
    local v14 = v5.useRef(nil);
    local v15 = l_useNavigation_0();
    local v16 = l_useTokens_0();
    local v17 = v10.title or v13.title;
    local v18 = v10.body or v13.body;
    local l_HeadingSmall_0 = v16.Typography.HeadingSmall;
    local l_Emphasis_0 = v16.Color.Content.Emphasis;
    local l_BodyLarge_0 = v16.Typography.BodyLarge;
    local l_Default_0 = v16.Color.Content.Default;
    local v25 = v5.useCallback(function(v23, _) --[[ Line: 46 ]]
        -- upvalues: l_PeekViewState_0 (ref), v15 (copy)
        if v23 == l_PeekViewState_0.Closed or v23 == l_PeekViewState_0.Hidden then
            v15.goBack();
        end;
    end, l_dependencyArray_0(v15));
    return v5.createElement(l_PeekView_0, {
        briefViewContentHeight = UDim.new(0, 0), 
        contentFrameRef = v14, 
        hasScrim = true, 
        mountAsFullView = true, 
        returnToFullView = true, 
        showDraggerInClosedState = false, 
        thumbstickScrollEnabled = true, 
        viewStateChanged = v25
    }, {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v16.Padding.Medium)
        }), 
        ContentPadding = v5.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v16.Padding.XXLarge), 
            PaddingLeft = UDim.new(0, v16.Padding.XXLarge), 
            PaddingRight = UDim.new(0, v16.Padding.XXLarge), 
            PaddingBottom = UDim.new(0, v16.Padding.XXLarge)
        }), 
        TitleText = v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v17, 
            Font = l_HeadingSmall_0.Font, 
            TextSize = l_HeadingSmall_0.FontSize, 
            TextColor3 = l_Emphasis_0.Color3, 
            TextTransparency = l_Emphasis_0.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }), 
        BodyText = v5.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v18, 
            Font = l_BodyLarge_0.Font, 
            TextSize = l_BodyLarge_0.FontSize, 
            TextColor3 = l_Default_0.Color3, 
            TextTransparency = l_Default_0.Transparency, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 2
        })
    });
end;
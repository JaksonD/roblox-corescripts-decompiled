local l_Parent_0 = script:FindFirstAncestor("UserList").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.RobloxAppHooks);
local v3 = require(l_Parent_0.PeekView);
local l_PeekViewWithTopBar_0 = v3.PeekViewWithTopBar;
local l_PeekViewState_0 = v3.PeekViewState;
local v6 = require(l_Parent_0.RoactUtils);
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local v9 = require(script.Parent.UserList);
local v10 = require(l_Parent_0.Foundation);
local l_Button_0 = v10.Button;
local l_useTopBarHeight_0 = v2.useTopBarHeight;
local v13 = require(script.Parent.UserListPeekViewTopBar);
local l_View_0 = v10.View;
local l_Text_0 = v10.Text;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v17) --[[ Line: 30 ]]
    -- upvalues: l_useTopBarHeight_0 (copy), l_useDispatch_0 (copy), v1 (copy), l_NavigateBack_0 (copy), l_PeekViewState_0 (copy), l_useLocalization_0 (copy), l_PeekViewWithTopBar_0 (copy), v13 (copy), l_View_0 (copy), l_Text_0 (copy), v9 (copy), l_Button_0 (copy)
    local v18 = UDim.new(0.55, 0);
    local v19 = l_useTopBarHeight_0();
    local v20 = l_useDispatch_0();
    local v21 = v1.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v20 (copy), l_NavigateBack_0 (ref)
        v20(l_NavigateBack_0(true));
    end, {
        v20
    });
    local v25 = v1.useCallback(function(v22, _, _) --[[ Line: 39 ]]
        -- upvalues: l_PeekViewState_0 (ref), v21 (copy)
        if v22 == l_PeekViewState_0.Closed then
            v21();
        end;
    end, {
        v21
    });
    local v26 = l_useLocalization_0({
        showMore = "Feature.Friends.Action.ShowMore"
    });
    return v1.createElement(l_PeekViewWithTopBar_0, {
        briefViewContentHeight = v18, 
        fullViewContentHeight = UDim.new(1, -v19), 
        onViewStateChanged = v25, 
        topBarHeight = v19, 
        topBarSlot = v1.createElement(v13, {
            navigateBack = v21
        }), 
        contentSlot = v1.createElement(l_View_0, {
            Size = UDim2.new(1, 0, 1, -v19), 
            tag = "auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large"
        }, {
            Title = if v17.title then v1.createElement(l_Text_0, {
                LayoutOrder = 1, 
                tag = "text-heading-small size-full-0 text-align-x-left content-emphasis auto-y", 
                Text = v17.title
            }) else nil, 
            UserList = v1.createElement(v9, {
                userIds = v17.users, 
                onUserSelected = v17.onUserSelected, 
                layoutOrder = 2
            }), 
            ButtonContainer = v1.createElement(l_View_0, {
                LayoutOrder = 3, 
                tag = "size-full-0 auto-y align-x-center col padding-top-xlarge padding-x-xlarge padding-bottom-large gap-large"
            }, {
                ShowMoreButton = if v17.hasMore and v17.onLoadMore then v1.createElement(l_Button_0, {
                    onActivated = v17.onLoadMore, 
                    text = v26.showMore
                }) else nil
            })
        })
    });
end;
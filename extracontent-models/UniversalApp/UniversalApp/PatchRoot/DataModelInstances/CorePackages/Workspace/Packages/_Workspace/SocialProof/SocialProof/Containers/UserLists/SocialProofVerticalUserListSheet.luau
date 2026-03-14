local l_Parent_0 = script:FindFirstAncestor("SocialProof").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.RoactUtils);
local v4 = require(l_Parent_0.UserList);
local l_VerticalUserList_0 = v4.VerticalUserList.VerticalUserList;
local l_EntityType_0 = v4.Enums.EntityType;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_NavigateBack_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateBack;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local v16 = require(l_Parent_0.Dash);
local v17 = {
    0.7
};
return function() --[[ Line: 35 ]] --[[ Name: SocialProofVerticalUserListSheet ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigationProps_0 (copy), l_useTokens_0 (copy), v1 (copy), v16 (copy), l_EntityType_0 (copy), l_NavigateBack_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), l_Sheet_0 (copy), v17 (copy), l_View_0 (copy), l_Text_0 (copy), l_VerticalUserList_0 (copy)
    local v18 = l_useDispatch_0();
    local v21 = l_useNavigationProps_0(function(_, v20) --[[ Line: 37 ]]
        return {
            userIds = v20.userIds, 
            title = v20.title
        };
    end);
    local v22 = l_useTokens_0();
    local l_title_0 = v21.title;
    local v25 = v1.useMemo(function() --[[ Line: 49 ]]
        -- upvalues: v16 (ref), v21 (copy), l_EntityType_0 (ref)
        return v16.map(v21.userIds, function(v24) --[[ Line: 50 ]]
            -- upvalues: l_EntityType_0 (ref)
            return {
                id = tostring(v24), 
                type = l_EntityType_0.User
            };
        end);
    end, {
        v21.userIds
    });
    local v28 = v1.useCallback(function(v26, _) --[[ Line: 59 ]]
        -- upvalues: v18 (copy), l_NavigateBack_0 (ref), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_EntityType_0 (ref)
        v18(l_NavigateBack_0(true));
        v18(l_NavigateDown_0({
            name = l_AppPage_0.ProfilePlatform, 
            detail = v26, 
            extraProps = {
                profileType = l_EntityType_0.User
            }
        }, true));
    end, {
        v18, 
        l_NavigateBack_0, 
        l_NavigateDown_0
    });
    local v30 = v1.useCallback(function(v29) --[[ Line: 70 ]]
        -- upvalues: v18 (copy), l_NavigateBack_0 (ref)
        v18(l_NavigateBack_0(v29));
    end, {
        v18, 
        l_NavigateBack_0
    });
    return v1.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        onClose = v30, 
        snapPoints = v17
    }, {
        Header = v1.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = true
        }, {
            Title = v1.createElement(l_View_0, {
                tag = "size-full auto-xy align-x-center"
            }, {
                TitleText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-x-left", 
                    Text = l_title_0, 
                    fontStyle = v22.Typography.HeadingSmall, 
                    textStyle = v22.Color.Content.Emphasis, 
                    RichText = true
                })
            })
        }), 
        Content = v1.createElement(l_Sheet_0.Content, nil, {
            UserListContainer = v1.createElement(l_View_0, {
                tag = "size-full auto-y"
            }, {
                UserList = v1.createElement(l_VerticalUserList_0, {
                    entities = v25, 
                    onRowSelected = v28, 
                    initialRowCount = #v21.userIds
                })
            })
        })
    });
end;
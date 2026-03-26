local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Common.Constants);
local v6 = require(l_script_FirstAncestor_0.Contexts.useSocialCarouselContext);
local l_Text_0 = v3.Text;
local l_View_0 = v3.View;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
return function(v10) --[[ Line: 21 ]] --[[ Name: FriendsHintTile ]]
    -- upvalues: v6 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v5 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v11 = v6();
    local v12 = l_useLocalization_0({
        friendsHintTitle = if l_FFlagConnectionsToFriendsRename_0 then v5.LOCALIZATION.FRIENDS_HINT_TITLE else v5.LOCALIZATION.CONNECTIONS_HINT_TITLE, 
        friendsHintBody = if l_FFlagConnectionsToFriendsRename_0 then v5.LOCALIZATION.FRIENDS_HINT_BODY else v5.LOCALIZATION.CONNECTIONS_HINT_BODY
    });
    v2.useEffect(function() --[[ Line: 32 ]]
        -- upvalues: v11 (copy), v5 (ref)
        v11.onSuccessfulRender(v5.ANALYTICS.UI_LOADING_EVENTS.EMPTY_HINT);
    end, {});
    return v2.createElement(l_View_0, {
        Size = UDim2.new(v10.itemSize.X.Scale, v10.itemSize.X.Offset + v5.TILE_TEXT_WIDTH, v10.itemSize.Y.Scale, v10.itemSize.Y.Offset - v5.TILE_TEXT_HEIGHT), 
        LayoutOrder = v10.index, 
        BackgroundTransparency = 1, 
        tag = "col auto-none align-y-center"
    }, {
        Content = v2.createElement(l_View_0, {
            BackgroundTransparency = 1, 
            tag = "col gap-xxsmall auto-xy"
        }, {
            Title = v2.createElement(l_Text_0, {
                Text = v12.friendsHintTitle, 
                tag = "text-title-medium text-align-x-left auto-xy text-wrap", 
                LayoutOrder = 1
            }), 
            Subtitle = v2.createElement(l_Text_0, {
                Text = v12.friendsHintBody, 
                tag = "text-body-small text-align-x-left auto-xy text-wrap", 
                LayoutOrder = 2
            })
        })
    });
end;
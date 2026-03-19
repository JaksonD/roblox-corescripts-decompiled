local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v2.Roact;
local l_withStyle_0 = v2.UIBlox.Style.withStyle;
local l_Text_0 = v2.Text;
local l_t_0 = v2.t;
local l_llama_0 = v2.llama;
local l_Mock_0 = v2.Mock;
local v9 = require(l_script_FirstAncestor_0.User);
local v10 = require(l_script_FirstAncestor_0.Logger);
local v11 = require(l_script_FirstAncestor_0.EnumScreens);
local v12 = require(script.Parent.AddFriendsTile);
local v13 = require(script.Parent.UserTile);
local v14 = require(script.Parent.UserCarouselHeader);
local v15 = require(script.Parent.UIBloxCarouselAdaptor);
local l_Sources_0 = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.Sources;
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagUserCarouselPaddingFixEnabled)() and 12 or 8;
local v18 = l_Roact_0.PureComponent:extend("UserCarousel");
v18.defaultProps = {
    accountProviderName = "", 
    addFriendOnActivated = function() --[[ Line: 36 ]] --[[ Name: addFriendOnActivated ]]

    end, 
    enableDisplayNamePolicy = false, 
    friends = {}, 
    friendThumbnailSize = 96, 
    LayoutOrder = 0, 
    Logger = v10, 
    onFriendSelected = function() --[[ Line: 42 ]] --[[ Name: onFriendSelected ]]

    end, 
    peopleListFrozen = false, 
    screenSize = Vector2.new(1000, 1000), 
    shouldInviteFromAccountProvider = false, 
    wideMode = false, 
    hasFriendRequests = false
};
v18.validateProps = l_t_0.interface({
    analytics = l_t_0.table, 
    accountProviderName = l_t_0.optional(l_t_0.string), 
    addFriendOnActivated = l_t_0.optional(l_t_0.callback), 
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    friends = l_t_0.array(v9.validateUser), 
    friendThumbnailSize = l_t_0.optional(l_t_0.number), 
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    onFriendSelected = l_t_0.optional(l_t_0.callback), 
    peopleListFrozen = l_t_0.optional(l_t_0.boolean), 
    screenSize = l_t_0.optional(l_t_0.union(l_t_0.Vector2, l_Mock_0.MagicMock.is)), 
    shouldInviteFromAccountProvider = l_t_0.optional(l_t_0.boolean), 
    wideMode = l_t_0.optional(l_t_0.boolean), 
    hasFriendRequests = l_t_0.boolean, 
    navigateToLuaAppPages = l_t_0.optional(l_t_0.table), 
    goToFriendsLanding = l_t_0.optional(l_t_0.callback), 
    goToAddFriends = l_t_0.optional(l_t_0.callback), 
    isLuaProfilePageEnabled = l_t_0.optional(l_t_0.boolean), 
    luaAddFriendsPageEnabled = l_t_0.optional(l_t_0.boolean)
});
v18.init = function(v19) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: l_llama_0 (copy), l_Sources_0 (copy), v11 (copy)
    v19.state = {
        friends = {}
    };
    v19.onFriendSelected = function(v20) --[[ Line: 76 ]]
        -- upvalues: v19 (copy), l_llama_0 (ref), l_Sources_0 (ref), v11 (ref)
        v19.props.Logger:info("Going to ViewUser");
        v19.props.analytics:buttonClick("UserTile", {
            friendId = v20.user.id, 
            position = v20.positionIndex, 
            subpage = v19.props.isLuaProfilePageEnabled and "peekView" or nil, 
            page = v19.props.isLuaProfilePageEnabled and "playerProfile" or nil
        });
        if v19.props.isLuaProfilePageEnabled then
            v19.props.analytics:navigate("ViewUserProfile");
        end;
        local v21 = l_llama_0.Dictionary.join(v20, {
            onOpen = function() --[[ Line: 89 ]] --[[ Name: onOpen ]]
                -- upvalues: v19 (ref)
                v19.props.setPeopleListFrozen(true);
            end, 
            onClose = function() --[[ Line: 92 ]] --[[ Name: onClose ]]
                -- upvalues: v19 (ref)
                v19.props.setPeopleListFrozen(false);
            end
        });
        if v19.props.isLuaProfilePageEnabled then
            local v22 = {
                contextualMenuProps = v21, 
                profilePeekViewProps = {
                    absolutePosition = v20.absolutePosition, 
                    source = l_Sources_0.SocialTab
                }, 
                openJoinable = true
            };
            v19.props.navigateToLuaAppPages[v11.ViewUserProfile](v20.user.id, v22);
            return;
        else
            v19.props.navigateToLuaAppPages[v11.ViewUser](v21);
            return;
        end;
    end;
    v19.goToFriendRequestsPage = function() --[[ Line: 112 ]]
        -- upvalues: v19 (copy), v11 (ref)
        local v23 = v19.props.enableFriendFinder and v11.FriendFinder or v11.AddFriends;
        v19.props.navigateToLuaAppPages[v23]();
    end;
    v19.goToFriendsPage = function() --[[ Line: 118 ]]
        -- upvalues: v19 (copy), v11 (ref)
        v19.props.Logger:info("Going to FriendsPage");
        v19.props.analytics:buttonClick("CarouselTitle");
        v19.props.analytics:navigate("CarouselTitle");
        if v19.props.goToFriendsLanding then
            v19.props.analytics:buttonClick("friendsLanding");
            v19.props.analytics:navigate("FriendsLandingPage");
        end;
        if v19.props.goToFriendsLanding then
            v19.props.goToFriendsLanding();
            return;
        else
            v19.props.navigateToLuaAppPages[v11.AddFriends]();
            return;
        end;
    end;
    v19.activatedAddFriendsTile = function() --[[ Line: 135 ]]
        -- upvalues: v19 (copy)
        v19.props.Logger:info("Going to AddFriends");
        v19.props.analytics:buttonClick("AddFriends");
        v19.props.analytics:navigate("AddFriends");
        v19.props.goToAddFriends();
    end;
    v19.activatedFriendRequestsButton = function() --[[ Line: 142 ]]
        -- upvalues: v19 (copy)
        v19.props.Logger:info("Going to FriendRequests");
        v19.props.analytics:buttonClick("FriendRequests", {
            isBadgeShown = v19.props.hasFriendRequests
        });
        v19.props.analytics:navigate("FriendRequests");
        v19.props.goToAddFriends();
    end;
end;
v18.getDerivedStateFromProps = function(v24) --[[ Line: 152 ]] --[[ Name: getDerivedStateFromProps ]]
    if not v24.peopleListFrozen then
        return {
            friends = v24.friends
        };
    else
        return nil;
    end;
end;
v18.render = function(v25) --[[ Line: 162 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Text_0 (copy), v17 (copy), l_Roact_0 (copy), v12 (copy), v13 (copy), v15 (copy), v14 (copy)
    return l_withStyle_0(function(v26) --[[ Line: 163 ]]
        -- upvalues: l_Text_0 (ref), v25 (copy), v17 (ref), l_Roact_0 (ref), v12 (ref), v13 (ref), v15 (ref), v14 (ref)
        local l_Font_0 = v26.Font.CaptionHeader.Font;
        local v28 = v26.Font.CaptionHeader.RelativeSize * v26.Font.BaseSize;
        local v29 = l_Text_0.GetTextBounds("SampleText", l_Font_0, v28, Vector2.new(10000, 10000));
        local v30 = v25.props.friendThumbnailSize + v29.Y + v17;
        local function v31() --[[ Line: 169 ]] --[[ Name: createAddFriendButton ]]
            -- upvalues: l_Roact_0 (ref), v12 (ref), v25 (ref), v30 (copy)
            return l_Roact_0.createElement(v12, {
                accountProviderName = v25.props.getAccountProviderName, 
                layoutOrder = 1, 
                onActivated = v25.activatedAddFriendsTile, 
                shouldInviteFromAccountProvider = v25.props.shouldInviteFromAccountProvider, 
                thumbnailSize = v25.props.friendThumbnailSize, 
                totalHeight = v30
            });
        end;
        local function v33(v32) --[[ Line: 180 ]] --[[ Name: createUserEntry ]]
            -- upvalues: v31 (copy), l_Roact_0 (ref), v13 (ref), v25 (ref), v30 (copy)
            if v32.user == nil then
                return v31();
            else
                return l_Roact_0.createElement(v13, {
                    enableDisplayNamePolicy = v25.props.enableDisplayNamePolicy, 
                    height = v30, 
                    layoutOrder = v32.index, 
                    onActivated = v25.onFriendSelected, 
                    thumbnailSize = v25.props.friendThumbnailSize, 
                    user = v32.user, 
                    absolutePosition = v32.absolutePosition
                });
            end;
        end;
        local v34 = l_Roact_0.createElement(v15, {
            createUserEntry = v33, 
            friends = v25.state.friends, 
            friendThumbnailSize = v25.props.friendThumbnailSize, 
            LayoutOrder = 2, 
            wideMode = v25.props.wideMode, 
            tileHeight = v30
        });
        return l_Roact_0.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v25.props.LayoutOrder, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v30)
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 0)
            }), 
            UserCarouselHeader = l_Roact_0.createElement(v14, {
                layoutOrder = 1, 
                friendCount = #v25.state.friends, 
                hasFriendRequests = v25.props.hasFriendRequests, 
                goToFriendRequestsPage = v25.activatedFriendRequestsButton, 
                goToFriendsPage = v25.goToFriendsPage
            }), 
            UserCarousel = v34
        });
    end);
end;
return v18;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_withStyle_0 = v3.Style.withStyle;
local l_RoactAnalyticsCommonGameEvents_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v8 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v9 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local v10 = require(l_CorePackages_0.Packages.Cryo);
local l_useSelector_0 = v8.Hooks.RoactRodux.useSelector;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v14 = require(l_Modules_0.LuaApp.Constants);
local v15 = require(l_Modules_0.LuaApp.withLocalization);
local v16 = require(l_Modules_0.LuaApp.Components.FitImageTextButton);
local v17 = require(l_Modules_0.LuaApp.Models.User);
local l_FriendIcon_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).FriendIcon;
local v19 = require(l_Modules_0.LuaApp.Util.joinGame);
local v20 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_AvatarSize_0 = v14.PlacesList.ContextualMenu.AvatarSize;
local l_HorizontalInnerPadding_0 = v14.PlacesList.ContextualMenu.HorizontalInnerPadding;
local l_HorizontalOuterPadding_0 = v14.PlacesList.ContextualMenu.HorizontalOuterPadding;
local v25 = l_HorizontalOuterPadding_0 + l_AvatarSize_0 + l_HorizontalInnerPadding_0;
local v26 = v2.PureComponent:extend("JoinableFriendEntry");
v26.defaultProps = {
    layoutOrder = 0
};
v26.init = function(v27) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v19 (copy), v14 (copy)
    v27.state = {
        joinButtonWidth = 60
    };
    v27.joinButtonRef = v2.createRef();
    v27.onJoinButtonActivated = function() --[[ Line: 58 ]]
        -- upvalues: v27 (copy), v19 (ref), v14 (ref)
        local l_analytics_0 = v27.props.analytics;
        local l_upToDateUser_0 = v27.props.upToDateUser;
        local l_universePlaceInfo_0 = v27.props.universePlaceInfo;
        local l_placeId_0 = l_universePlaceInfo_0.placeId;
        local l_universeRootPlaceId_0 = l_universePlaceInfo_0.universeRootPlaceId;
        v19:ByUser(l_upToDateUser_0, v14.AnalyticsContext.GamePlayIntentInPlacesList, function(v33) --[[ Line: 66 ]]
            -- upvalues: l_analytics_0 (copy), l_upToDateUser_0 (copy), l_placeId_0 (copy), l_universeRootPlaceId_0 (copy)
            l_analytics_0.reportJoinGameInPlacesList(l_upToDateUser_0.id, l_placeId_0, l_universeRootPlaceId_0, l_upToDateUser_0.gameInstanceId, v33);
        end);
    end;
    v27.updateJoinButtonWidth = function() --[[ Line: 77 ]]
        -- upvalues: v27 (copy)
        local l_current_0 = v27.joinButtonRef.current;
        if l_current_0 then
            local l_X_0 = l_current_0.AbsoluteSize.X;
            v27:setState({
                joinButtonWidth = l_X_0
            });
        end;
    end;
end;
v26.didMount = function(v36) --[[ Line: 88 ]] --[[ Name: didMount ]]
    v36.updateJoinButtonWidth();
end;
v26.render = function(v37) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_HorizontalInnerPadding_0 (copy), l_HorizontalOuterPadding_0 (copy), l_AvatarSize_0 (copy), v14 (copy), l_SourceSans_0 (copy), v17 (copy), v2 (copy), l_FriendIcon_0 (copy), v25 (copy), l_Skeleton_0 (copy), v16 (copy), l_withStyle_0 (copy), v20 (copy), v15 (copy)
    local l_upToDateUser_1 = v37.props.upToDateUser;
    local l_layoutOrder_0 = v37.props.layoutOrder;
    local l_entryHeight_0 = v37.props.entryHeight;
    local l_entryWidth_0 = v37.props.entryWidth;
    local l_universeId_0 = v37.props.universeId;
    local l_localization_0 = v37.props.localization;
    local l_universePlaceInfo_1 = v37.props.universePlaceInfo;
    local l_joinButtonWidth_0 = v37.state.joinButtonWidth;
    local v46 = nil;
    local v47 = l_universePlaceInfo_1 and l_universePlaceInfo_1.isPlayable or false;
    v46 = if l_entryWidth_0 then math.max((l_entryWidth_0 - l_HorizontalInnerPadding_0) / 2 - l_HorizontalInnerPadding_0, 60) else 60;
    local v48 = l_HorizontalOuterPadding_0 * 2 + l_AvatarSize_0 + l_HorizontalInnerPadding_0 * 2 + l_joinButtonWidth_0;
    local function v64(v49, v50) --[[ Line: 116 ]]
        -- upvalues: v14 (ref), l_SourceSans_0 (ref), v37 (copy), l_upToDateUser_1 (copy), v17 (ref), l_universeId_0 (copy), v47 (copy), v2 (ref), l_entryWidth_0 (copy), l_entryHeight_0 (copy), l_layoutOrder_0 (copy), l_AvatarSize_0 (ref), l_HorizontalOuterPadding_0 (ref), l_FriendIcon_0 (ref), v48 (copy), v25 (ref), l_Skeleton_0 (ref), v16 (ref), v46 (ref)
        local v51 = nil;
        local l_GREEN_PRIMARY_0 = v14.Color.GREEN_PRIMARY;
        local v53 = 0;
        local l_WHITE_0 = v14.Color.WHITE;
        local v55 = 0;
        local l_l_SourceSans_0_0 = l_SourceSans_0;
        local l_l_SourceSans_0_1 = l_SourceSans_0;
        local l_BLACK_0 = v14.Color.BLACK;
        local v59 = 0;
        local v60 = 22;
        local l_WHITE_1 = v14.Color.WHITE;
        local v62 = 0;
        local v63 = nil;
        v63 = if v37.props.enableDisplayNamePolicy then v37.props.combinedName else v37.props.userName;
        if v49 then
            l_GREEN_PRIMARY_0 = v49.Theme.ContextualPrimaryDefault.Color;
            v53 = v49.Theme.ContextualPrimaryDefault.Transparency;
            l_WHITE_0 = v49.Theme.ContextualPrimaryContent.Color;
            v55 = v49.Theme.ContextualPrimaryContent.Transparency;
            l_l_SourceSans_0_0 = v49.Font.Header2.Font;
            l_l_SourceSans_0_1 = v49.Font.Body.Font;
            l_BLACK_0 = v49.Theme.TextDefault.Color;
            v59 = v49.Theme.TextDefault.Transparency;
            v60 = v49.Font.BaseSize * v49.Font.Body.RelativeSize;
            l_WHITE_1 = v49.Theme.BackgroundUIDefault.Color;
            v62 = v49.Theme.BackgroundUIDefault.Transparency;
        end;
        if l_upToDateUser_1.presence == v17.PresenceType.IN_GAME and tostring(l_upToDateUser_1.universeId) == tostring(l_universeId_0) and v47 then
            v51 = v37.onJoinButtonActivated;
        else
            v51 = nil;
            if v49 then
                v53 = v53 * 0.5;
                v55 = v55 * 0.5;
            else
                l_GREEN_PRIMARY_0 = v14.Color.GREEN_DISABLED;
            end;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_entryWidth_0, 0, l_entryHeight_0), 
            BackgroundColor3 = l_WHITE_1, 
            BackgroundTransparency = v62, 
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0
        }, {
            AvatarHolder = v2.createElement("Frame", {
                Size = UDim2.new(0, l_AvatarSize_0, 0, l_AvatarSize_0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, l_HorizontalOuterPadding_0, 0.5, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                Avatar = v2.createElement(l_FriendIcon_0, {
                    user = l_upToDateUser_1, 
                    itemSize = l_AvatarSize_0, 
                    layoutOrder = 1, 
                    maskColor = l_WHITE_1
                })
            }), 
            Username = v2.createElement("Frame", {
                Size = UDim2.new(1, -v48, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v25, 0.5, 0)
            }, {
                Text = if not v37.props.shouldShimmerName then v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v63, 
                    TextSize = v60, 
                    Font = l_l_SourceSans_0_1, 
                    TextColor3 = l_BLACK_0, 
                    TextTransparency = v59, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) else nil, 
                ShimmerName = if v37.props.shouldShimmerName then v2.createElement(l_Skeleton_0, {
                    Size = UDim2.fromScale(0.8, 0.5), 
                    Position = UDim2.new(0, 0, 0.25, 0)
                }) else nil
            }), 
            JoinButton = v2.createElement(v16, {
                backgroundColor = l_GREEN_PRIMARY_0, 
                backgroundTransparency = v53, 
                backgroundImage = "LuaApp/9-slice/input-default", 
                leftIconEnabled = false, 
                height = 32, 
                minWidth = 60, 
                maxWidth = v46, 
                text = v50.joinText, 
                textFont = l_l_SourceSans_0_0, 
                textColor = l_WHITE_0, 
                textTransparency = v55, 
                anchorPoint = Vector2.new(1, 0.5), 
                position = UDim2.new(1, -l_HorizontalOuterPadding_0, 0.5, 0), 
                onActivated = v51, 
                [v2.Ref] = v37.joinButtonRef, 
                [v2.Change.AbsoluteSize] = v37.updateJoinButtonWidth
            })
        });
    end;
    local function v67(v65) --[[ Line: 238 ]]
        -- upvalues: l_withStyle_0 (ref), v64 (copy)
        return l_withStyle_0(function(v66) --[[ Line: 239 ]]
            -- upvalues: v64 (ref), v65 (copy)
            return v64(v66, v65);
        end);
    end;
    if v20() then
        return v15({
            joinText = "Feature.Chat.Drawer.Join"
        })(v67);
    else
        return v67({
            joinText = l_localization_0:Format("Feature.Chat.Drawer.Join")
        });
    end;
end;
return function(v68) --[[ Line: 256 ]] --[[ Name: JoinableFriendEntryWrapper ]]
    -- upvalues: l_useSelector_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v7 (copy), l_useAppPolicy_0 (copy), v9 (copy), v2 (copy), v26 (copy), v10 (copy)
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local v75 = l_useSelector_0(function(v72) --[[ Line: 259 ]]
        -- upvalues: v68 (copy)
        local l_id_0 = v68.user.id;
        local l_universeId_1 = v68.universeId;
        return {
            upToDateUser = v72.Users[l_id_0], 
            universePlaceInfo = v72.UniversePlaceInfos[l_universeId_1]
        };
    end);
    local v76 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v77 = l_useRoactService_0(v7);
    local v79 = l_useAppPolicy_0(function(v78) --[[ Line: 272 ]]
        return v78.getShowDisplayName();
    end);
    local v80 = v9.Hooks.useUserProfilesFetch({
        userIds = {
            v68.user.id
        }, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v70 = if v80 and v80.data then v9.Selectors.getUsernameFromId(v80.data, v68.user.id) else nil;
    v71 = if v80 and v80.data then v9.Selectors.getCombinedNameFromId(v80.data, v68.user.id) else nil;
    v69 = not v80 or (v80.loading or v80.error) and true or false;
    return v2.createElement(v26, v10.Dictionary.join(v68, {
        upToDateUser = v75.upToDateUser, 
        universePlaceInfo = v75.universePlaceInfo, 
        analytics = v76, 
        localization = v77, 
        enableDisplayNamePolicy = v79, 
        userName = v70, 
        combinedName = v71, 
        shouldShimmerName = v69
    }));
end;
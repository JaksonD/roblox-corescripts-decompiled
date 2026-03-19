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
local l_ShimmerPanel_0 = v3.App.Loading.ShimmerPanel;
local v18 = require(l_Modules_0.LuaApp.Models.User);
local l_FriendIcon_0 = require(l_CorePackages_0.Workspace.Packages.GameTile).FriendIcon;
local v20 = require(l_Modules_0.LuaApp.Util.joinGame);
local v21 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization);
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppMigrateShimmerPanelToSkeleton);
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_AvatarSize_0 = v14.PlacesList.ContextualMenu.AvatarSize;
local l_HorizontalInnerPadding_0 = v14.PlacesList.ContextualMenu.HorizontalInnerPadding;
local l_HorizontalOuterPadding_0 = v14.PlacesList.ContextualMenu.HorizontalOuterPadding;
local v27 = l_HorizontalOuterPadding_0 + l_AvatarSize_0 + l_HorizontalInnerPadding_0;
local v28 = v2.PureComponent:extend("JoinableFriendEntry");
v28.defaultProps = {
    layoutOrder = 0
};
v28.init = function(v29) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v20 (copy), v14 (copy)
    v29.state = {
        joinButtonWidth = 60
    };
    v29.joinButtonRef = v2.createRef();
    v29.onJoinButtonActivated = function() --[[ Line: 60 ]]
        -- upvalues: v29 (copy), v20 (ref), v14 (ref)
        local l_analytics_0 = v29.props.analytics;
        local l_upToDateUser_0 = v29.props.upToDateUser;
        local l_universePlaceInfo_0 = v29.props.universePlaceInfo;
        local l_placeId_0 = l_universePlaceInfo_0.placeId;
        local l_universeRootPlaceId_0 = l_universePlaceInfo_0.universeRootPlaceId;
        v20:ByUser(l_upToDateUser_0, v14.AnalyticsContext.GamePlayIntentInPlacesList, function(v35) --[[ Line: 68 ]]
            -- upvalues: l_analytics_0 (copy), l_upToDateUser_0 (copy), l_placeId_0 (copy), l_universeRootPlaceId_0 (copy)
            l_analytics_0.reportJoinGameInPlacesList(l_upToDateUser_0.id, l_placeId_0, l_universeRootPlaceId_0, l_upToDateUser_0.gameInstanceId, v35);
        end);
    end;
    v29.updateJoinButtonWidth = function() --[[ Line: 79 ]]
        -- upvalues: v29 (copy)
        local l_current_0 = v29.joinButtonRef.current;
        if l_current_0 then
            local l_X_0 = l_current_0.AbsoluteSize.X;
            v29:setState({
                joinButtonWidth = l_X_0
            });
        end;
    end;
end;
v28.didMount = function(v38) --[[ Line: 90 ]] --[[ Name: didMount ]]
    v38.updateJoinButtonWidth();
end;
v28.render = function(v39) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: l_HorizontalInnerPadding_0 (copy), l_HorizontalOuterPadding_0 (copy), l_AvatarSize_0 (copy), v14 (copy), l_SourceSans_0 (copy), v18 (copy), v2 (copy), l_FriendIcon_0 (copy), v27 (copy), v22 (copy), l_Skeleton_0 (copy), l_ShimmerPanel_0 (copy), v16 (copy), l_withStyle_0 (copy), v21 (copy), v15 (copy)
    local l_upToDateUser_1 = v39.props.upToDateUser;
    local l_layoutOrder_0 = v39.props.layoutOrder;
    local l_entryHeight_0 = v39.props.entryHeight;
    local l_entryWidth_0 = v39.props.entryWidth;
    local l_universeId_0 = v39.props.universeId;
    local l_localization_0 = v39.props.localization;
    local l_universePlaceInfo_1 = v39.props.universePlaceInfo;
    local l_joinButtonWidth_0 = v39.state.joinButtonWidth;
    local v48 = nil;
    local v49 = l_universePlaceInfo_1 and l_universePlaceInfo_1.isPlayable or false;
    v48 = if l_entryWidth_0 then math.max((l_entryWidth_0 - l_HorizontalInnerPadding_0) / 2 - l_HorizontalInnerPadding_0, 60) else 60;
    local v50 = l_HorizontalOuterPadding_0 * 2 + l_AvatarSize_0 + l_HorizontalInnerPadding_0 * 2 + l_joinButtonWidth_0;
    local function v66(v51, v52) --[[ Line: 118 ]]
        -- upvalues: v14 (ref), l_SourceSans_0 (ref), v39 (copy), l_upToDateUser_1 (copy), v18 (ref), l_universeId_0 (copy), v49 (copy), v2 (ref), l_entryWidth_0 (copy), l_entryHeight_0 (copy), l_layoutOrder_0 (copy), l_AvatarSize_0 (ref), l_HorizontalOuterPadding_0 (ref), l_FriendIcon_0 (ref), v50 (copy), v27 (ref), v22 (ref), l_Skeleton_0 (ref), l_ShimmerPanel_0 (ref), v16 (ref), v48 (ref)
        local v53 = nil;
        local l_GREEN_PRIMARY_0 = v14.Color.GREEN_PRIMARY;
        local v55 = 0;
        local l_WHITE_0 = v14.Color.WHITE;
        local v57 = 0;
        local l_l_SourceSans_0_0 = l_SourceSans_0;
        local l_l_SourceSans_0_1 = l_SourceSans_0;
        local l_BLACK_0 = v14.Color.BLACK;
        local v61 = 0;
        local v62 = 22;
        local l_WHITE_1 = v14.Color.WHITE;
        local v64 = 0;
        local v65 = nil;
        v65 = if v39.props.enableDisplayNamePolicy then v39.props.combinedName else v39.props.userName;
        if v51 then
            l_GREEN_PRIMARY_0 = v51.Theme.ContextualPrimaryDefault.Color;
            v55 = v51.Theme.ContextualPrimaryDefault.Transparency;
            l_WHITE_0 = v51.Theme.ContextualPrimaryContent.Color;
            v57 = v51.Theme.ContextualPrimaryContent.Transparency;
            l_l_SourceSans_0_0 = v51.Font.Header2.Font;
            l_l_SourceSans_0_1 = v51.Font.Body.Font;
            l_BLACK_0 = v51.Theme.TextDefault.Color;
            v61 = v51.Theme.TextDefault.Transparency;
            v62 = v51.Font.BaseSize * v51.Font.Body.RelativeSize;
            l_WHITE_1 = v51.Theme.BackgroundUIDefault.Color;
            v64 = v51.Theme.BackgroundUIDefault.Transparency;
        end;
        if l_upToDateUser_1.presence == v18.PresenceType.IN_GAME and tostring(l_upToDateUser_1.universeId) == tostring(l_universeId_0) and v49 then
            v53 = v39.onJoinButtonActivated;
        else
            v53 = nil;
            if v51 then
                v55 = v55 * 0.5;
                v57 = v57 * 0.5;
            else
                l_GREEN_PRIMARY_0 = v14.Color.GREEN_DISABLED;
            end;
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(0, l_entryWidth_0, 0, l_entryHeight_0), 
            BackgroundColor3 = l_WHITE_1, 
            BackgroundTransparency = v64, 
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
                Size = UDim2.new(1, -v50, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, v27, 0.5, 0)
            }, {
                Text = if not v39.props.shouldShimmerName then v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v65, 
                    TextSize = v62, 
                    Font = l_l_SourceSans_0_1, 
                    TextColor3 = l_BLACK_0, 
                    TextTransparency = v61, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }) else nil, 
                ShimmerName = if v39.props.shouldShimmerName then v2.createElement(if v22 then l_Skeleton_0 else l_ShimmerPanel_0, {
                    Size = UDim2.fromScale(0.8, 0.5), 
                    Position = UDim2.new(0, 0, 0.25, 0)
                }) else nil
            }), 
            JoinButton = v2.createElement(v16, {
                backgroundColor = l_GREEN_PRIMARY_0, 
                backgroundTransparency = v55, 
                backgroundImage = "LuaApp/9-slice/input-default", 
                leftIconEnabled = false, 
                height = 32, 
                minWidth = 60, 
                maxWidth = v48, 
                text = v52.joinText, 
                textFont = l_l_SourceSans_0_0, 
                textColor = l_WHITE_0, 
                textTransparency = v57, 
                anchorPoint = Vector2.new(1, 0.5), 
                position = UDim2.new(1, -l_HorizontalOuterPadding_0, 0.5, 0), 
                onActivated = v53, 
                [v2.Ref] = v39.joinButtonRef, 
                [v2.Change.AbsoluteSize] = v39.updateJoinButtonWidth
            })
        });
    end;
    local function v69(v67) --[[ Line: 243 ]]
        -- upvalues: l_withStyle_0 (ref), v66 (copy)
        return l_withStyle_0(function(v68) --[[ Line: 244 ]]
            -- upvalues: v66 (ref), v67 (copy)
            return v66(v68, v67);
        end);
    end;
    if v21() then
        return v15({
            joinText = "Feature.Chat.Drawer.Join"
        })(v69);
    else
        return v69({
            joinText = l_localization_0:Format("Feature.Chat.Drawer.Join")
        });
    end;
end;
return function(v70) --[[ Line: 261 ]] --[[ Name: JoinableFriendEntryWrapper ]]
    -- upvalues: l_useSelector_0 (copy), l_useRoactService_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), v7 (copy), l_useAppPolicy_0 (copy), v9 (copy), v2 (copy), v28 (copy), v10 (copy)
    local v71 = nil;
    local v72 = nil;
    local v73 = nil;
    local v77 = l_useSelector_0(function(v74) --[[ Line: 264 ]]
        -- upvalues: v70 (copy)
        local l_id_0 = v70.user.id;
        local l_universeId_1 = v70.universeId;
        return {
            upToDateUser = v74.Users[l_id_0], 
            universePlaceInfo = v74.UniversePlaceInfos[l_universeId_1]
        };
    end);
    local v78 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v79 = l_useRoactService_0(v7);
    local v81 = l_useAppPolicy_0(function(v80) --[[ Line: 277 ]]
        return v80.getShowDisplayName();
    end);
    local v82 = v9.Hooks.useUserProfilesFetch({
        userIds = {
            v70.user.id
        }, 
        query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v72 = if v82 and v82.data then v9.Selectors.getUsernameFromId(v82.data, v70.user.id) else nil;
    v73 = if v82 and v82.data then v9.Selectors.getCombinedNameFromId(v82.data, v70.user.id) else nil;
    v71 = not v82 or (v82.loading or v82.error) and true or false;
    return v2.createElement(v28, v10.Dictionary.join(v70, {
        upToDateUser = v77.upToDateUser, 
        universePlaceInfo = v77.universePlaceInfo, 
        analytics = v78, 
        localization = v79, 
        enableDisplayNamePolicy = v81, 
        userName = v72, 
        combinedName = v73, 
        shouldShimmerName = v71
    }));
end;
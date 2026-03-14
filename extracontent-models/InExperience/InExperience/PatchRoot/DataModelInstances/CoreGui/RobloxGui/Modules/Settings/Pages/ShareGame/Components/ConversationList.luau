local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_sortFriendsByCorrectedPresenceAndRank_0 = require(l_CorePackages_0.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local v8 = require(l_CorePackages_0.Packages.Roact);
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_ShareGame_0 = l_RobloxGui_0.Modules.Settings.Pages.ShareGame;
local v12 = require(l_Modules_0.Settings.Theme);
local v13 = require(l_ShareGame_0.Constants);
local l_GameInviteEvents_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteEvents;
local v15 = require(l_ShareGame_0.Components.ConversationEntry);
local v16 = require(l_ShareGame_0.Components.InviteListEntry);
local v17 = require(l_ShareGame_0.Components.FriendsErrorPage);
local v18 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceId);
local v19 = require(l_ShareGame_0.Thunks.InviteUserIdToPlaceIdCustomized);
local v20 = require(l_ShareGame_0.NewInviteMenuExperimentManager);
local v21 = require(l_ShareGame_0.Components.LoadingFriendsPage);
local v22 = require(l_ShareGame_0.Components.NoFriendsPage);
local v23 = require(l_CoreGui_0.RobloxGui.Modules.InGameMenu.Utility.PlayerSearchPredicate);
local v24 = require(l_Modules_0.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData);
local v25 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenu);
local v26 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteSendEndpoint);
local l_UserModel_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Models.UserModel;
local v28 = require(l_Modules_0.Common.httpRequest);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_GetFFlagInviteListRerank_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagInviteListRerank;
local v32 = require(l_ShareGame_0.getTranslator)();
local v33 = v12.font(Enum.Font.SourceSans);
local l_GRAY3_0 = v13.Color.GRAY3;
local v35 = v12.textSize(19);
local v36 = {
    [l_UserModel_0.PresenceType.ONLINE] = 3, 
    [l_UserModel_0.PresenceType.IN_GAME] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
local v37 = {
    SORT_BY_FREQUENCY = 1, 
    SORT_BY_PRESENCE_AND_FREQUENCY = 2
};
local v38 = v8.PureComponent:extend("ConversationList");
v38.defaultProps = {
    entryHeight = 62, 
    entryPadding = 16
};
v38.init = function(v39) --[[ Line: 76 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v39.scrollingRef = v8.createRef();
    v39.inviteUser = function(v40) --[[ Line: 78 ]]
        -- upvalues: v39 (copy)
        return v39.props.inviteUser(v40, v39.props.analytics, v39.props.trigger, v39.props.inviteMessageId, v39.props.launchData);
    end;
end;
v38.render = function(v41) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v26 (copy), v25 (copy), v23 (copy), v16 (copy), l_UserInputService_0 (copy), v15 (copy), l_RetrievalStatus_0 (copy), v21 (copy), v22 (copy), v17 (copy), v33 (copy), v32 (copy), l_GRAY3_0 (copy), v35 (copy)
    local l_analytics_0 = v41.props.analytics;
    local v43 = v41.props[v8.Children] or {};
    local l_entryHeight_0 = v41.props.entryHeight;
    local l_entryPadding_0 = v41.props.entryPadding;
    local l_friends_0 = v41.props.friends;
    local l_friendsRetrievalStatus_0 = v41.props.friendsRetrievalStatus;
    local l_layoutOrder_0 = v41.props.layoutOrder;
    local l_size_0 = v41.props.size;
    local l_zIndex_0 = v41.props.zIndex;
    local l_topPadding_0 = v41.props.topPadding;
    local l_invites_0 = v41.props.invites;
    local l_inviteUser_0 = v41.props.inviteUser;
    local l_searchText_0 = v41.props.searchText;
    if v26() then
        l_inviteUser_0 = v41.inviteUser;
    end;
    local v55 = v25();
    v43.RowListLayout = v8.createElement("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Padding = UDim.new(0, l_entryPadding_0)
    });
    local v56 = 0;
    for v57, v58 in ipairs(l_friends_0) do
        local v59 = v23(l_searchText_0, v58.name, v58.displayName);
        if v55 then
            v43["User-" .. tostring(v57)] = v8.createElement(v16, {
                analytics = l_analytics_0, 
                user = v58, 
                visible = v59, 
                layoutOrder = v57, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v58.id], 
                isFullRowActivatable = l_UserInputService_0.GamepadEnabled, 
                trigger = v41.props.trigger, 
                inviteMessageId = v41.props.inviteMessageId, 
                launchData = v41.props.launchData
            });
        else
            v43["User-" .. tostring(v57)] = v8.createElement(v15, {
                analytics = l_analytics_0, 
                visible = v59, 
                size = UDim2.new(1, 0, 0, l_entryHeight_0), 
                layoutOrder = v57, 
                zIndex = l_zIndex_0, 
                title = v58.displayName, 
                subtitle = "@" .. v58.name, 
                presence = v58.presence, 
                users = {
                    v58
                }, 
                inviteUser = l_inviteUser_0, 
                inviteStatus = l_invites_0[v58.id]
            });
        end;
        if v59 then
            v56 = v56 + 1;
        end;
    end;
    if #l_friends_0 == 0 or l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Fetching then
        local l_v21_0 = v21;
        if l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Done then
            l_v21_0 = v22;
        elseif l_friendsRetrievalStatus_0 == l_RetrievalStatus_0.Failed then
            l_v21_0 = v17;
        end;
        return v8.createElement(l_v21_0, {
            BorderSizePixel = 0, 
            LayoutOrder = l_layoutOrder_0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0), 
            ZIndex = l_zIndex_0
        });
    elseif v56 == 0 then
        return v8.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Font = v33, 
            Size = UDim2.new(1, 0, 0, l_entryHeight_0), 
            Text = v32:FormatByKey("Feature.SettingsHub.Label.InviteSearchNoResults"), 
            TextColor3 = l_GRAY3_0, 
            TextSize = v35, 
            TextTransparency = 0.22, 
            ZIndex = l_zIndex_0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0)
        });
    else
        return v8.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            LayoutOrder = l_layoutOrder_0, 
            Size = l_size_0, 
            BorderSizePixel = 0, 
            Position = UDim2.new(0, 0, 0, l_topPadding_0), 
            CanvasSize = if v55 then UDim2.new() else UDim2.new(0, 0, 0, v56 * (l_entryHeight_0 + l_entryPadding_0)), 
            AutomaticCanvasSize = if v55 then Enum.AutomaticSize.Y else nil, 
            ScrollBarThickness = 0, 
            ZIndex = l_zIndex_0, 
            Selectable = false, 
            [v8.Ref] = v41.scrollingRef
        }, v43);
    end;
end;
local function v65(v61) --[[ Line: 211 ]] --[[ Name: handleBinding ]]
    -- upvalues: v25 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if v25() and not l_UserInputService_0.GamepadEnabled then
        return;
    else
        local v62 = v61.scrollingRef:getValue();
        if v62 and v62:FindFirstAncestorOfClass("ScreenGui").Enabled and l_GuiService_0.SelectedCoreObject == nil then
            l_GuiService_0:AddSelectionParent("invitePrompt", v62);
            for _, v64 in ipairs(v62:GetChildren()) do
                if v64:IsA("GuiObject") and v64.LayoutOrder == 1 then
                    l_GuiService_0.SelectedCoreObject = v64;
                    return;
                end;
            end;
        end;
        return;
    end;
end;
v38.didUpdate = v65;
if v26() then
    v38.didMount = function(v66) --[[ Line: 237 ]] --[[ Name: didMount ]]
        -- upvalues: v13 (copy), l_GameInviteEvents_0 (copy), v24 (copy), v65 (copy)
        if v66.props.analytics and v66.props.trigger == v13.Triggers.GameMenu then
            local v67 = false;
            if v66.props.launchData ~= nil then
                v67 = v66.props.launchData ~= "";
            end;
            v66.props.analytics:sendEvent(v66.props.trigger, l_GameInviteEvents_0.ModalOpened, if v24() then {
                isLaunchDataProvided = v67
            } else nil);
        end;
        v65(v66);
    end;
else
    v38.didMount = v65;
end;
local v77 = l_memoize_0(function(v68) --[[ Line: 256 ]]
    -- upvalues: v36 (copy)
    local v69 = {};
    local function v74(v70, v71) --[[ Line: 258 ]] --[[ Name: friendPreference ]]
        -- upvalues: v36 (ref)
        local v72 = v36[v70.presence];
        local v73 = v36[v71.presence];
        if v72 == v73 then
            return v70.name:lower() < v71.name:lower();
        else
            return v73 < v72;
        end;
    end;
    for _, v76 in pairs(v68) do
        if v76.isFriend then
            v69[#v69 + 1] = v76;
        end;
    end;
    table.sort(v69, v74);
    return v69;
end);
local v82 = l_memoize_0(function(v78) --[[ Line: 280 ]]
    -- upvalues: l_sortFriendsByCorrectedPresenceAndRank_0 (copy)
    local v79 = {};
    for _, v81 in pairs(v78) do
        if v81.isFriend then
            v79[#v79 + 1] = v81;
        end;
    end;
    table.sort(v79, l_sortFriendsByCorrectedPresenceAndRank_0);
    return v79;
end);
local v92 = l_memoize_0(function(v83) --[[ Line: 293 ]]
    local v84 = {};
    local function v89(v85, v86) --[[ Line: 295 ]] --[[ Name: friendPreference ]]
        local v87 = tonumber(v85.friendFrequentRank) or 0;
        local v88 = tonumber(v86.friendFrequentRank) or 0;
        if v87 == v88 then
            return v85.name:lower() < v86.name:lower();
        else
            return v87 < v88;
        end;
    end;
    for _, v91 in pairs(v83) do
        if v91.isFriend then
            v84[#v84 + 1] = v91;
        end;
    end;
    table.sort(v84, v89);
    return v84;
end);
local function _() --[[ Line: 317 ]]
    -- upvalues: v20 (copy), v37 (copy), v92 (copy), v82 (copy), v77 (copy)
    local v93 = v20.default:getInviteListSortOrder() or 0;
    if v93 == v37.SORT_BY_FREQUENCY then
        return v92;
    elseif v93 == v37.SORT_BY_PRESENCE_AND_FREQUENCY then
        return v82;
    else
        return v77;
    end;
end;
return v9.UNSTABLE_connect2(function(v95, _) --[[ Line: 329 ]]
    -- upvalues: v77 (copy), l_GetFFlagInviteListRerank_0 (copy), v20 (copy), v37 (copy), v92 (copy), v82 (copy), l_Players_0 (copy)
    local l_v77_0 = v77;
    if l_GetFFlagInviteListRerank_0() then
        local v98 = v20.default:getInviteListSortOrder() or 0;
        l_v77_0 = if v98 == v37.SORT_BY_FREQUENCY then v92 else if v98 == v37.SORT_BY_PRESENCE_AND_FREQUENCY then v82 else v77;
    end;
    return {
        friends = l_v77_0(v95.Users), 
        friendsRetrievalStatus = v95.Friends.retrievalStatus[tostring(l_Players_0.LocalPlayer.UserId)], 
        invites = v95.Invites
    };
end, function(v99) --[[ Line: 341 ]]
    -- upvalues: v28 (copy), l_HttpRbxApiService_0 (copy), v26 (copy), v19 (copy), v18 (copy)
    return {
        inviteUser = function(v100, v101, v102, v103, v104) --[[ Line: 343 ]] --[[ Name: inviteUser ]]
            -- upvalues: v28 (ref), l_HttpRbxApiService_0 (ref), v26 (ref), v99 (copy), v19 (ref), v18 (ref)
            local v105 = v28(l_HttpRbxApiService_0);
            local v106 = tostring(game.PlaceId);
            if v26() then
                return v99(v19(v105, v100, v106, v101, v102, v103, v104));
            else
                return v99(v18(v105, v100, v106));
            end;
        end
    };
end)(v38);
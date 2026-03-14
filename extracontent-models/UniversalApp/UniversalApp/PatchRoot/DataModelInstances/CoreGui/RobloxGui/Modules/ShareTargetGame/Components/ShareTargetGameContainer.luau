local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_Modules_0.LuaApp.withLocalization);
local v7 = require(script:FindFirstAncestor("ShareTargetGame").dependencies);
local l_compose_0 = v7.SocialLibraries.RoduxTools.compose;
local l_UniversalAppPolicy_0 = v7.UniversalAppPolicy;
local v10 = require(script.Parent.ShareTargetGame);
local v11 = require(script.Parent.ShareTargetGameTopBar);
local v12 = v3.PureComponent:extend("ShareTargetGameContainer");
local v13 = require(script.Parent.Parent.mapStateToProps);
local v14 = require(script.Parent.Parent.mapDispatchToProps);
local v15 = require(script.Parent.Parent.Utils.keepConversationOrderSame);
v12.defaultProps = {
    analytics = nil, 
    networkImpl = nil
};
v12.init = function(v16) --[[ Line: 29 ]] --[[ Name: init ]]
    v16.hasAllInformation = function() --[[ Line: 30 ]]
        -- upvalues: v16 (copy)
        if v16.props.appLoaded and v16.props.placeInfo and v16.props.gameCreator and v16.props.gameThumbnail then
            return true;
        else
            return false;
        end;
    end;
    v16.state = {
        conversationSendingStatuses = {}
    };
end;
v12.getDerivedStateFromProps = function(v17, v18) --[[ Line: 41 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v15 (copy)
    return {
        formattedConversations = v15(v17.conversations, v18.formattedConversations)
    };
end;
getChatRecipient = function(v19, v20) --[[ Line: 47 ]] --[[ Name: getChatRecipient ]]
    for _, v22 in v19 do
        if v22 ~= v20 then
            return v22;
        end;
    end;
    return nil;
end;
v12.render = function(v23) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v11 (copy), v10 (copy), v6 (copy)
    return v4.Style.withStyle(function(v24) --[[ Line: 58 ]]
        -- upvalues: v23 (copy), v2 (ref), v3 (ref), v11 (ref), v10 (ref), v6 (ref)
        local function v28(v25) --[[ Line: 59 ]] --[[ Name: renderFrame ]]
            -- upvalues: v23 (ref), v2 (ref), v3 (ref), v24 (copy), v11 (ref), v10 (ref)
            local function v27(v26) --[[ Line: 60 ]]
                -- upvalues: v23 (ref), v2 (ref)
                v23:setState({
                    conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                        [v26.conversationId] = "sending"
                    })
                });
                return v23.props.sendGameLinkToConversation(v26.conversationId, tostring(v23.props.placeInfo.universeId), true, if game:DefineFastFlag("ExperienceInviteNotification", false) then getChatRecipient(v26.participants, v23.props.senderId) else nil, v23.props.placeInfo.universeRootPlaceId):andThen(function() --[[ Line: 77 ]]
                    -- upvalues: v23 (ref), v26 (copy), v2 (ref)
                    v23.props.analytics:onActivatedInviteSent(tostring(v23.props.placeInfo.universeRootPlaceId), tostring(v23.props.placeInfo.universeId), tostring(v23.props.senderId), v26.conversationId, v26.participants);
                    v23:setState({
                        conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                            [v26.conversationId] = "sent"
                        })
                    });
                end, function() --[[ Line: 91 ]]
                    -- upvalues: v23 (ref), v2 (ref), v26 (copy)
                    v23:setState({
                        conversationSendingStatuses = v2.Dictionary.join(v23.state.conversationSendingStatuses, {
                            [v26.conversationId] = "failed"
                        })
                    });
                end);
            end;
            return v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                shareTargetGame = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
                    BorderSizePixel = 0
                }, {
                    layout = v3.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    topBar = v3.createElement(v11, {
                        LayoutOrder = 1
                    }), 
                    content = v3.createElement(v10, v2.Dictionary.join(v23.props, v25, {
                        onSendButtonActivated = v27, 
                        formattedConversations = v23.state.formattedConversations, 
                        conversationSendingStatuses = v23.state.conversationSendingStatuses, 
                        LayoutOrder = 2, 
                        isLoading = not v23.hasAllInformation()
                    }))
                })
            });
        end;
        return v6({
            byBuilderText = {
                "Feature.Chat.Label.ByBuilder"; 
                USERNAME = v23.props.gameCreator
            }, 
            filterBoxPlaceHolderText = "Feature.Chat.Label.SearchForFriendsAndChat", 
            sentText = "Feature.Chat.Label.Sent", 
            sendText = "Feature.Chat.Action.Send", 
            sendingText = "Feature.Chat.Response.Sending", 
            failedText = "Feature.Chat.Response.Failed", 
            offlinePresence = "Common.Presence.Label.Offline", 
            onlinePresence = "Common.Presence.Label.Online"
        })(function(v29) --[[ Line: 149 ]]
            -- upvalues: v28 (copy)
            return v28(v29);
        end);
    end);
end;
v12.didMount = function(v30) --[[ Line: 155 ]] --[[ Name: didMount ]]
    if not v30.props.placeInfo.universeId then
        v30.props.fetchPlaceInfos(v30.props.networkImpl, v30.props.placeId);
    else
        v30.props.fetchGameData(v30.props.networkImpl, v30.props.placeInfo.universeId);
    end;
    if not v30.props.appLoaded then
        spawn(function() --[[ Line: 164 ]]
            -- upvalues: v30 (copy)
            v30.props.fetchConversations(1):andThen(function() --[[ Line: 165 ]]
                -- upvalues: v30 (ref)
                v30.props.setAppLoaded();
            end);
        end);
    end;
    v30.props.analytics:inputShareGameEntryPoint(v30.props.placeId, v30.props.placeInfo.universeId);
end;
return l_compose_0(v5.connect(v13, v14), l_UniversalAppPolicy_0.connect(function(v31) --[[ Line: 176 ]]
    return {
        shouldShowCreatorName = v31.shouldShowCreatorName()
    };
end))(v12);
local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v5 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v8 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local l_withTextSizeOffset_0 = v12.Core.Style.withTextSizeOffset;
local l_LoadableImage_0 = v12.App.Loading.LoadableImage;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_Text_0 = require(l_CorePackages_0.Packages.Foundation).Text;
local l_Follow_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.Follow;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveDefault;
local l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2SduiInterleaveIxp;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v27 = require(l_Modules_0.LuaApp.Thunks.SendGameFollow);
local v28 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailNotificationsButton);
local v29 = require(script.Parent.Parent.ExperienceDetails.useExperienceDetailsNavigation);
local v30 = require(script.Parent.Parent.ExperienceDetails.Hooks.useEdpServerIxpVariables);
local v31 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsExperimentation);
local l_GetNotificationsExperienceDetailsVariant_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant;
local l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability;
local v34 = require(l_Modules_0.LuaApp.Flags.FFlagEnableCreatorSubtitleNavigation);
local v35 = require(l_Modules_0.LuaApp.Flags.FFlagCreatorSubtitleNavigationIXPEnabled);
local v36 = require(l_Modules_0.LuaApp.Flags.FStringCreatorSubtitleNavigationExperimentLayer);
local v37 = v2.PureComponent:extend("GameHeader");
v37.init = function(v38) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_Follow_0 (copy), v35 (copy), l_IXPServiceWrapper_0 (copy), v36 (copy), v2 (copy), v34 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v31 (copy), v8 (copy)
    v38.toggleFollowExperience = function() --[[ Line: 64 ]]
        -- upvalues: v38 (copy), l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (ref), l_Follow_0 (ref)
        local l_gameFollowings_0 = v38.props.gameFollowings;
        local l_universeId_0 = v38.props.universeId;
        local l_rootPlaceId_0 = v38.props.rootPlaceId;
        if l_gameFollowings_0 == nil or l_rootPlaceId_0 == nil or l_universeId_0 == nil then
            return;
        else
            local l_isFollowed_0 = l_gameFollowings_0.isFollowed;
            local v43 = v38.props.notificationsEnabled.count or 0;
            local v44 = v38.props.notificationsEnabled.limit or 0;
            local l_networking_0 = v38.props.networking;
            local l_eventIngest_0 = v38.props.eventIngest;
            local v47 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v38.props.enableNotificationsDiscoverability;
            v38.props.sendGameFollow(l_networking_0, l_universeId_0, not l_isFollowed_0, v47, v43, v44);
            l_Follow_0(l_eventIngest_0, "GameDetailsGameHeader", l_rootPlaceId_0, not l_isFollowed_0);
            return;
        end;
    end;
    v38.renderSubtitle = function(v48, v49, v50, v51) --[[ Line: 94 ]]
        -- upvalues: v35 (ref), l_IXPServiceWrapper_0 (ref), v36 (ref), v2 (ref), v34 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v31 (ref), v38 (copy), v8 (ref)
        local function v53(v52) --[[ Line: 95 ]]
            -- upvalues: v35 (ref), l_IXPServiceWrapper_0 (ref), v36 (ref), v2 (ref), v34 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v31 (ref), v38 (ref), v50 (copy), v49 (copy), v48 (copy)
            if v35 then
                l_IXPServiceWrapper_0:LogFlagLinkedUserLayerExposure(v36);
            end;
            return v2.createElement(v34 and "TextButton" or "TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Text = v52, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                Font = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v38.props.showAgeMaturityInHeader then v38.props.foundationTokens.Typography.BodyMedium.Font else v50.Tokens.Semantic.Typography.Body.Font, 
                TextSize = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v38.props.showAgeMaturityInHeader then v38.props.foundationTokens.Typography.BodyMedium.FontSize else v50.Tokens.Global.FontSize_75, 
                TextColor3 = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v38.props.showAgeMaturityInHeader then v38.props.foundationTokens.Color.Content.Default.Color3 else v50.Tokens.Semantic.Color.Text.Muted.Color3, 
                TextTransparency = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v38.props.showAgeMaturityInHeader then v38.props.foundationTokens.Color.Content.Default.Transparency else v50.Tokens.Semantic.Color.Text.Muted.Transparency, 
                LayoutOrder = v49, 
                RichText = false, 
                LineHeight = 1, 
                [v2.Event.Activated] = v34 and function() --[[ Line: 145 ]]
                    -- upvalues: v48 (ref), v38 (ref)
                    if v48.type == "User" then
                        v38.props.openUserProfilePage(v48.id, "GameDetailsGameHeader");
                        return;
                    else
                        if v48.type == "Group" then
                            v38.props.openCommunityProfilePage(v48.id, "GameDetailsGameHeader");
                        end;
                        return;
                    end;
                end or nil
            });
        end;
        local v54 = v50.Tokens.Global.FontSize_75 + v51;
        local l_hasVerifiedBadge_0 = v48.hasVerifiedBadge;
        return v2.createElement(v8.EmojiWrapper, {
            emoji = if l_hasVerifiedBadge_0 then v8.emoji.verified else "", 
            layoutOrder = v49, 
            maximumEmojiSize = v54
        }, {
            subtitleText = v53(v48.name)
        });
    end;
end;
v37.render = function(v56) --[[ Line: 168 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagNotificationsForceEnableEDPDiscoverability_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v31 (copy), l_withLocalization_0 (copy), l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy), v2 (copy), l_LoadableImage_0 (copy), l_Text_0 (copy), v28 (copy)
    local v57 = l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() and true or v56.props.enableNotificationsDiscoverability;
    local l_gameDetail_0 = v56.props.gameDetail;
    local l_gameInfo_0 = v56.props.gameInfo;
    local v60 = l_gameDetail_0 and l_gameDetail_0.creator;
    local v61 = nil;
    v61 = if v57 then v56.props.rootPlaceId else nil;
    local l_LayoutOrder_0 = v56.props.LayoutOrder;
    local l_showSubtitle_0 = v56.props.showSubtitle;
    local v64 = l_gameDetail_0 and l_gameDetail_0.name or l_gameInfo_0 and l_gameInfo_0.name or nil;
    local v65 = v56.props.showNotificationButton and -116 or -68;
    local v66 = nil;
    if (l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v56.props.showAgeMaturityInHeader and v56.props.ageRecommendations then
        local l_summary_0 = v56.props.ageRecommendations.summary;
        local v68 = l_summary_0 and l_summary_0.ageRecommendation or nil;
        if v68 then
            v66 = v68.displayNameWithHeaderShort or v68.displayName;
        end;
    end;
    return l_withLocalization_0({
        containsStrongLanguageText = "Feature.GameDetails.Label.ContainsStrongLanguagePillWarning"
    })(function(_) --[[ Line: 208 ]]
        -- upvalues: l_withTextSizeOffset_0 (ref), l_withStyle_0 (ref), v2 (ref), l_LayoutOrder_0 (copy), l_LoadableImage_0 (ref), v56 (copy), v65 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v31 (ref), l_Text_0 (ref), v64 (copy), l_showSubtitle_0 (copy), v60 (copy), v66 (ref), v57 (copy), v28 (ref), v61 (ref)
        return l_withTextSizeOffset_0(function(v70) --[[ Line: 209 ]]
            -- upvalues: l_withStyle_0 (ref), v2 (ref), l_LayoutOrder_0 (ref), l_LoadableImage_0 (ref), v56 (ref), v65 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v31 (ref), l_Text_0 (ref), v64 (ref), l_showSubtitle_0 (ref), v60 (ref), v66 (ref), v57 (ref), v28 (ref), v61 (ref)
            return l_withStyle_0(function(v71) --[[ Line: 210 ]]
                -- upvalues: v2 (ref), l_LayoutOrder_0 (ref), l_LoadableImage_0 (ref), v56 (ref), v65 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (ref), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (ref), v31 (ref), l_Text_0 (ref), v64 (ref), l_showSubtitle_0 (ref), v60 (ref), v70 (copy), v66 (ref), v57 (ref), v28 (ref), v61 (ref)
                return v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12), 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    GameIcon = v2.createElement(l_LoadableImage_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(56, 56), 
                        Image = v56.props.gameIcon and v56.props.gameIcon.url, 
                        cornerRadius = UDim.new(0, 8)
                    }), 
                    HeaderText = v2.createElement("Frame", {
                        Size = UDim2.new(1, v65, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2
                    }, {
                        TextListLayout = v2.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 4)
                        }), 
                        Title = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v56.props.showAgeMaturityInHeader then v2.createElement(l_Text_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Text = v64, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = true, 
                            fontStyle = v56.props.foundationTokens.Typography.HeadingSmall, 
                            textStyle = v56.props.foundationTokens.Color.Content.Emphasis, 
                            LayoutOrder = 1
                        }) else v2.createElement("TextLabel", {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Text = v64, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = true, 
                            BackgroundTransparency = 1, 
                            Font = v71.Tokens.Semantic.Typography.Header.Font, 
                            TextSize = v71.Tokens.Semantic.Typography.Header.FontSize, 
                            TextColor3 = v71.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                            TextTransparency = v71.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                            LayoutOrder = 1
                        }), 
                        Subtitle = l_showSubtitle_0 and v60 and v56.renderSubtitle(v60, 2, v71, v70, if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui() then v56.props.foundationTokens else nil), 
                        AgeMaturity = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v56.props.showAgeMaturityInHeader and v66 then v2.createElement(l_Text_0, {
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextWrapped = true, 
                            textStyle = v56.props.foundationTokens.Color.Content.Default, 
                            fontStyle = v56.props.foundationTokens.Typography.BodyMedium, 
                            Text = v66, 
                            LayoutOrder = 3
                        }) else nil
                    }), 
                    NotificationsFrame = if v56.props.showNotificationButton and v57 then v2.createElement("Frame", {
                        Size = UDim2.fromScale(0, 1), 
                        Position = UDim2.new(1, -36, 0, 0), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        LayoutOrder = 3
                    }, {
                        GameDetailNotificationsButton = v2.createElement(v28, {
                            universeId = v56.props.universeId, 
                            gameFollowings = v56.props.gameFollowings, 
                            rootPlaceId = v61, 
                            toggleFollowExperience = v56.toggleFollowExperience
                        })
                    }) else nil
                });
            end);
        end);
    end);
end;
v37 = v3.connect(function(v72, v73) --[[ Line: 332 ]]
    -- upvalues: l_GameInfosReducer_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameIconReducer_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v31 (copy)
    local v74 = v72.Personalization[l_GameInfosReducer_0.key][v73.universeId];
    local v75 = nil;
    local v76 = nil;
    if l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v73.shouldHydrateLegacyIxp then
        v75 = v72.GameDetailsV2[v73.universeId];
        v76 = if v72[l_GameIconReducer_0.key][v73.universeId] == nil then {
            url = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", v73.universeId)
        } else v72[l_GameIconReducer_0.key][v73.universeId];
    else
        v76 = v72[l_GameIconReducer_0.key][v73.universeId];
        v75 = v72.GameDetails[v73.universeId];
    end;
    return {
        gameDetail = v75, 
        gameInfo = v74, 
        gameIcon = v76, 
        gameFollowings = v72.GameFollowings[v73.universeId], 
        rootPlaceId = v75 and v75.rootPlaceId or v74 and v74.placeId, 
        notificationsEnabled = v72.ExperienceNotificationsEnabled or {}, 
        ageRecommendations = if (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v73.showAgeMaturityInHeader then v72.AgeRecommendations[v73.universeId] else nil
    };
end, function(v77) --[[ Line: 371 ]]
    -- upvalues: v27 (copy)
    return {
        sendGameFollow = function(v78, v79, v80, v81, v82, v83) --[[ Line: 373 ]] --[[ Name: sendGameFollow ]]
            -- upvalues: v77 (copy), v27 (ref)
            return v77(v27(v78, v79, v80, v81, v82, v83));
        end
    };
end)(v37);
v37 = l_RoactServices_0.connect({
    networking = l_RoactNetworking_0, 
    eventIngest = l_AppEventIngestService_0
})(v37);
v37 = l_RoactAppPolicy_0.connect(function(v84, _) --[[ Line: 400 ]]
    return {
        showSubtitle = v84.getGameDetailsSubtitle()
    };
end)(v37);
if not l_GetFFlagNotificationsForceEnableEDPDiscoverability_0() then
    v37 = v5.connectUserLayer({
        l_AppUserLayers_0.ExperienceDetailsPageLayer
    }, function(v86, _) --[[ Line: 409 ]]
        -- upvalues: l_AppUserLayers_0 (copy), l_GetNotificationsExperienceDetailsVariant_0 (copy)
        return {
            enableNotificationsDiscoverability = ((v86[l_AppUserLayers_0.ExperienceDetailsPageLayer] or {})[l_GetNotificationsExperienceDetailsVariant_0.getNotificationsVariantFieldName] or -1) == 2
        };
    end)(v37);
end;
if v34 or l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
    local l_v37_0 = v37;
    v37 = function(v89) --[[ Line: 425 ]]
        -- upvalues: v34 (copy), v29 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 (copy), l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 (copy), v30 (copy), l_useTokens_0 (copy), v31 (copy), v1 (copy), v2 (copy), l_v37_0 (copy)
        local v90 = nil;
        if v34 then
            v90 = v29(if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v89.shouldHydrateLegacyIxp else nil);
        end;
        local v91 = nil;
        local v92 = nil;
        if l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then
            v91 = v30();
            v92 = l_useTokens_0();
        end;
        local v93 = {
            openCommunityProfilePage = if v34 then v90.openCommunityProfilePage else nil, 
            openUserProfilePage = if v34 then v90.openUserProfilePage else nil, 
            edpServerIxpVariables = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v91 else nil, 
            foundationTokens = if not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 then v92 else nil, 
            showAgeMaturityInHeader = (not not l_FFlagLuaAppEdpBackendV2SduiInterleaveDefault_0 or l_FFlagLuaAppEdpBackendV2SduiInterleaveIxp_0 and v31.getShouldInterleaveSdui()) and v91 and v91.showAgeMaturityInHeader == true or nil
        };
        v89 = v1.join(v89, v93);
        return v2.createElement(l_v37_0, v89);
    end;
end;
return v37;
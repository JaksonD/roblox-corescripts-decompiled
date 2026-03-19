local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v10 = require(l_CorePackages_0.Packages.Cryo);
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v11.App.ImageSet.Images;
local l_useStyle_0 = v11.Core.Style.useStyle;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v16 = require(l_CorePackages_0.Workspace.Packages.VerifiedBadges);
local l_GuildedLogoWhiteAsset_0 = require(l_CorePackages_0.Workspace.Packages.CommunityLinks).Constants.GuildedLogoWhiteAsset;
local v18 = require(l_CorePackages_0.Workspace.Packages.ProfilePlatform);
local l_ProfileTypes_0 = v18.ProfileTypes;
local l_EnableCommunityProfilePageIXP_0 = v18.EnableCommunityProfilePageIXP;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_navigateToBadgesSeeAll_0 = require(l_CorePackages_0.Workspace.Packages.Badges).navigateToBadgesSeeAll;
local l_GameDetailsSubpage_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.GameDetailsSubpage;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v25 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v26 = require(l_Modules_0.LuaApp.Components.LocalizedTextLabel);
local v27 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v28 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local v29 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForExperienceGuidelines);
local v30 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert);
local l_OpenCloseOnlyInteractiveAlert_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).OpenCloseOnlyInteractiveAlert;
local l_GetFFlagUseVoiceExitBetaLanguage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseVoiceExitBetaLanguage;
local v33 = require(l_Modules_0.Personalization.Flags.FStringLuaAppGenreTooltipStage);
local l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents;
local v35 = game:DefineFastFlag("LuaAppRemoveDeadGameInfoRowTooltipBranch", false);
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local l_FStringLuaAppBadgesSeeAllIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer;
local l_FFlagLuaAppBadgesSeeAllLogExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure;
local v39 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local v40 = l_Images_0["icons/actions/cycleRight"];
local v41 = v2.PureComponent:extend("GameInfoRow");
v41.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v41.init = function(v42) --[[ Line: 71 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_GameDetailsSubpage_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_AppPage_0 (copy), v39 (copy), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_navigateToBadgesSeeAll_0 (copy), v35 (copy), v33 (copy), l_EnableCommunityProfilePageIXP_0 (copy), v27 (copy)
    v42.infoNameTextLabelRef = v2.createRef();
    local v43, v44 = v2.createBinding(0);
    v42.maxRightContentWidth = v43;
    v42.setMaxRightContentWidth = v44;
    v42.state = {
        buttonPressed = false
    };
    v42.onAbsoluteSizeChange = function(v45) --[[ Line: 79 ]]
        -- upvalues: v42 (copy)
        local l_X_0 = v45.AbsoluteSize.X;
        v42.setMaxRightContentWidth((math.floor(l_X_0 - (v42.props.leftPadding + v42.props.rightPadding))));
    end;
    v42.onInputBegan = function(_, v48) --[[ Line: 84 ]]
        -- upvalues: v42 (copy)
        if v48.UserInputState == Enum.UserInputState.Begin and (v48.UserInputType == Enum.UserInputType.Touch or v48.UserInputType == Enum.UserInputType.MouseButton1) and not v42.state.buttonPressed then
            v42:setState({
                buttonPressed = true
            });
        end;
    end;
    v42.onInputEnded = function() --[[ Line: 100 ]]
        -- upvalues: v42 (copy)
        if v42.state.buttonPressed then
            v42:setState({
                buttonPressed = false
            });
        end;
    end;
    v42.onActivated = function() --[[ Line: 108 ]]
        -- upvalues: v42 (copy), l_GameDetailsSubpage_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), l_AppPage_0 (ref), v39 (ref), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (ref), l_FFlagLuaAppBadgesSeeAllEnabled_0 (ref), l_navigateToBadgesSeeAll_0 (ref), v35 (ref), v33 (ref), l_EnableCommunityProfilePageIXP_0 (ref), v27 (ref)
        local l_linkPage_0 = v42.props.linkPage;
        local l_linkView_0 = v42.props.linkView;
        local l_linkUrl_0 = v42.props.linkUrl;
        if not l_linkPage_0 and not l_linkView_0 and not l_linkUrl_0 then
            return;
        else
            local l_eventIngest_0 = v42.props.eventIngest;
            local l_universeId_0 = v42.props.universeId;
            if l_linkUrl_0 then
                v42.props.openLeaveRobloxAlert(function() --[[ Line: 121 ]]
                    -- upvalues: v42 (ref), l_linkUrl_0 (copy)
                    v42.props.linking:openURL(l_linkUrl_0);
                    v42.props.closeAlert();
                    local l_linkClickCallback_0 = v42.props.linkClickCallback;
                    if l_linkClickCallback_0 then
                        l_linkClickCallback_0();
                    end;
                end);
                return;
            else
                local l_placeId_0 = v42.props.placeId;
                local l_analyticsSubPage_0 = v42.props.analyticsSubPage;
                l_GameDetailsSubpage_0(l_eventIngest_0, "GameInfoRow", l_placeId_0, l_analyticsSubPage_0, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then l_universeId_0 else nil);
                local l_Text_0 = v42.infoNameTextLabelRef.current.Text;
                if l_linkView_0 == l_AppPage_0.ExperienceGuidelinesExplained then
                    v42.props.openExperienceGuidelinesExplained(l_universeId_0);
                    return;
                elseif l_linkView_0 == l_AppPage_0.PassesPage then
                    v42.props.navigateDown({
                        name = l_AppPage_0.PassesPage, 
                        detail = l_universeId_0, 
                        extraProps = if v39() then {
                            viewWidth = v42.props.viewWidth
                        } else nil
                    });
                    return;
                else
                    if l_FFlagLuaAppBadgesSeeAllLogExposure_0 and l_analyticsSubPage_0 == "Badges" then
                        l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppBadgesSeeAllIxpLayer_0);
                    end;
                    if l_FFlagLuaAppBadgesSeeAllEnabled_0 and l_linkView_0 == l_AppPage_0.BadgesSeeAll then
                        l_navigateToBadgesSeeAll_0(v42.props.navigation, l_universeId_0);
                        return;
                    else
                        if not v35 then
                            if l_linkView_0 == "UpdatedGenre" then
                                local l_localization_0 = v42.props.localization;
                                v42.props.openCloseOnlyInteractiveAlert(v42.props.infoData, l_localization_0:Format("Feature.GameDetails.Label.GenreInProgress"), v42.props.closeAlert);
                                return;
                            elseif l_linkView_0 == "GenreUnderConstruction" then
                                local l_localization_1 = v42.props.localization;
                                local v60 = nil;
                                if v33 == "UnderConstruction" then
                                    v60 = l_localization_1:Format("Feature.GameDetails.Label.GenreUnderConstruction");
                                elseif v33 == "InProgress" then
                                    v60 = l_localization_1:Format("Feature.GameDetails.Label.GenreInProgress");
                                end;
                                if v60 then
                                    v42.props.openCloseOnlyInteractiveAlert(l_localization_1:Format("Feature.GameDetails.Label.Unavailable"), v60, v42.props.closeAlert);
                                end;
                                return;
                            end;
                        end;
                        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and (l_analyticsSubPage_0 == "Developer" or l_analyticsSubPage_0 == "Group") then
                            l_EnableCommunityProfilePageIXP_0.logExposure();
                        end;
                        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and l_linkView_0 == "CommunityProfilePlatform" and v42.props.linkViewData ~= nil then
                            local l_linkViewData_0 = v42.props.linkViewData;
                            v42.props.openCommunityProfilePage(l_linkViewData_0, (("ExperienceDetailsPage:%*"):format(l_analyticsSubPage_0)));
                            return;
                        elseif l_linkView_0 == "UserProfilePlatform" and v42.props.linkViewData ~= nil then
                            local l_linkViewData_1 = v42.props.linkViewData;
                            v42.props.openUserProfilePage(l_linkViewData_1, (("ExperienceDetailsPage:%*"):format(l_analyticsSubPage_0)));
                            return;
                        else
                            v42.props.navigateDown({
                                name = l_AppPage_0.GenericWebPage, 
                                detail = l_linkPage_0, 
                                extraProps = {
                                    title = l_Text_0, 
                                    transitionAnimation = v27.SlideInFromRight
                                }
                            });
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v41.render = function(v63) --[[ Line: 229 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GuildedLogoWhiteAsset_0 (copy), v2 (copy), v3 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v40 (copy), v26 (copy)
    local l_Cells_0 = v63.props.appTheme.GameDetails.GameInfoList.Cells;
    local l_Size_0 = v63.props.Size;
    local l_Position_0 = v63.props.Position;
    local l_LayoutOrder_0 = v63.props.LayoutOrder;
    local l_buttonPressed_0 = v63.state.buttonPressed;
    local l_infoName_0 = v63.props.infoName;
    local v70 = v63.props.infoData or "";
    local l_infoIcon_0 = v63.props.infoIcon;
    local v72 = false;
    if l_GetFFlagUseVoiceExitBetaLanguage_0() then
        v72 = v63.props.infoIcon ~= nil;
    elseif l_infoIcon_0 == l_GuildedLogoWhiteAsset_0 then
        v72 = true;
    end;
    local v73 = true;
    if v63.props.linkPage == nil then
        v73 = v63.props.linkView or v63.props.linkUrl;
    end;
    local l_leftPadding_0 = v63.props.leftPadding;
    local l_rightPadding_0 = v63.props.rightPadding;
    local l_topPadding_0 = v63.props.topPadding;
    local l_bottomPadding_0 = v63.props.bottomPadding;
    if not v73 then
        l_buttonPressed_0 = false;
    end;
    local function v80(_, v79) --[[ Line: 257 ]] --[[ Name: getInfoDataTextLabel ]]
        -- upvalues: v2 (ref), v70 (copy), v3 (ref), v63 (copy)
        return v2.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v79.Font.Header2.Font, 
            TextSize = v79.Font.BaseSize * v79.Font.Header2.RelativeSize, 
            TextColor3 = v79.Theme.TextEmphasis.Color, 
            TextTransparency = v79.Theme.TextEmphasis.Transparency, 
            Text = v70, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = false, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            [v3.Tag] = if v63.props.testId then ("data-testid=%*"):format(v63.props.testId) else nil
        });
    end;
    local l_style_0 = v63.props.style;
    return v2.createElement("ImageButton", {
        Size = l_Size_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = l_Position_0, 
        AutoButtonColor = false, 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = l_buttonPressed_0 and l_Cells_0.Background.Transparency.Pressed or l_Cells_0.Background.Transparency.Default, 
        BackgroundColor3 = l_Cells_0.Background.Color, 
        [v2.Event.InputBegan] = v63.onInputBegan, 
        [v2.Event.InputEnded] = v63.onInputEnded, 
        [v2.Event.Activated] = v63.onActivated, 
        [v2.Change.AbsoluteSize] = v63.onAbsoluteSizeChange
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Wraps = true, 
            Padding = UDim.new(0, l_style_0.Tokens.Global.Size_100)
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_leftPadding_0), 
            PaddingRight = UDim.new(0, l_rightPadding_0), 
            PaddingTop = UDim.new(0, l_topPadding_0), 
            PaddingBottom = UDim.new(0, l_bottomPadding_0)
        }), 
        RightContent = v2.createElement("Frame", {
            Size = UDim2.new(0, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 11), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                HorizontalFlex = Enum.UIFlexAlignment.Fill
            }), 
            UISizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = v63.maxRightContentWidth:map(function(v82) --[[ Line: 322 ]]
                    return Vector2.new(v82, 1e999);
                end)
            }), 
            InfoIcon = v72 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                Image = v63.props.infoIcon, 
                ImageColor3 = l_style_0.Theme.IconEmphasis.Color, 
                ImageTransparency = l_style_0.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            InfoDataTextLabelVerifiedBadge = v63.props.useVerifiedBadgeEmojiWrapper and v2.createElement(v16.EmojiWrapper, {
                emoji = if v63.props.useVerifiedBadgeEmojiWrapper then v16.emoji.verified else "", 
                size = UDim2.new(0, 0, 0, 0), 
                anchorPoint = Vector2.new(1, 0), 
                automaticSize = Enum.AutomaticSize.XY, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                verticalAlignment = Enum.VerticalAlignment.Center, 
                layoutOrder = 1
            }, {
                InfoDataTextLabel = v80(true, l_style_0)
            }), 
            InfoDataTextLabel = if not v63.props.useVerifiedBadgeEmojiWrapper and v70 ~= "" then v80(false, l_style_0) else nil, 
            LinkArrow = v73 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 14, 0, 14), 
                Image = v40, 
                ImageColor3 = l_style_0.Theme.IconEmphasis.Color, 
                ImageTransparency = l_style_0.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                [v3.Tag] = if v63.props.testId then ("data-testid=%*"):format(v63.props.testId) else nil
            })
        }), 
        InfoNameTextLabel = v2.createElement(v63.props.disableInfoNameLocalization and "TextLabel" or v26, {
            Size = UDim2.new(v70 ~= "" and 0 or 1, v70 ~= "" and 0 or -25, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = l_style_0.Font.Body.Font, 
            TextSize = l_style_0.Font.BaseSize * l_style_0.Font.Body.RelativeSize, 
            TextColor3 = l_style_0.Theme.TextDefault.Color, 
            TextTransparency = l_style_0.Theme.TextDefault.Transparency, 
            Text = l_infoName_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true, 
            [v2.Ref] = v63.infoNameTextLabelRef, 
            LayoutOrder = 1
        })
    });
end;
local v83 = v28(v41);
v41 = v4.connect(nil, function(v84) --[[ Line: 403 ]]
    -- upvalues: l_NavigateDown_0 (copy), v29 (copy), v30 (copy), v35 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_CloseCentralOverlay_0 (copy), l_EnableCommunityProfilePageIXP_0 (copy), l_AppPage_0 (copy), l_ProfileTypes_0 (copy)
    return {
        navigateDown = function(v85) --[[ Line: 405 ]] --[[ Name: navigateDown ]]
            -- upvalues: v84 (copy), l_NavigateDown_0 (ref)
            return v84(l_NavigateDown_0(v85));
        end, 
        openExperienceGuidelinesExplained = function(v86) --[[ Line: 408 ]] --[[ Name: openExperienceGuidelinesExplained ]]
            -- upvalues: v84 (copy), v29 (ref)
            v84(v29(v86, false));
        end, 
        openLeaveRobloxAlert = function(v87) --[[ Line: 411 ]] --[[ Name: openLeaveRobloxAlert ]]
            -- upvalues: v84 (copy), v30 (ref)
            v84(v30(v87));
        end, 
        openCloseOnlyInteractiveAlert = if v35 then nil else function(v88, v89, v90) --[[ Line: 416 ]]
            -- upvalues: v84 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref)
            v84(l_OpenCloseOnlyInteractiveAlert_0(v88, v89, v90, nil, false));
        end, 
        closeAlert = if v35 then nil else function() --[[ Line: 421 ]]
            -- upvalues: v84 (copy), l_CloseCentralOverlay_0 (ref)
            v84(l_CloseCentralOverlay_0());
        end, 
        openCommunityProfilePage = l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and function(v91, v92) --[[ Line: 425 ]]
            -- upvalues: v84 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
            v84(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v91, 
                extraProps = {
                    profileType = l_ProfileTypes_0.Community, 
                    source = v92
                }
            }));
        end or nil, 
        openUserProfilePage = function(v93, v94) --[[ Line: 436 ]] --[[ Name: openUserProfilePage ]]
            -- upvalues: v84 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
            v84(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v93, 
                extraProps = {
                    profileType = l_ProfileTypes_0.User, 
                    source = v94
                }
            }));
        end
    };
end)(function(v95) --[[ Line: 392 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_useNavigation_0 (copy), v10 (copy), v2 (copy), v83 (copy)
    local v96 = l_useStyle_0();
    local v97 = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then l_useNavigation_0() else nil;
    local v98 = v10.Dictionary.join(v95, {
        style = v96, 
        navigation = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then v97 else nil
    });
    return v2.createElement(v83, v98);
end);
return l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    linking = l_AppLinking_0, 
    localization = v25
})(v41);
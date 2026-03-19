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
local l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppAddTestIdsForEdpInfoTable;
local l_FFlagLuaAppBadgesSeeAllEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllEnabled;
local l_FStringLuaAppBadgesSeeAllIxpLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer;
local l_FFlagLuaAppBadgesSeeAllLogExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure;
local v40 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local v41 = l_Images_0["icons/actions/cycleRight"];
local v42 = v2.PureComponent:extend("GameInfoRow");
v42.defaultProps = {
    leftPadding = 0, 
    rightPadding = 0
};
v42.init = function(v43) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_GameDetailsSubpage_0 (copy), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (copy), l_AppPage_0 (copy), v40 (copy), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (copy), l_IXPService_0 (copy), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_navigateToBadgesSeeAll_0 (copy), v35 (copy), v33 (copy), l_EnableCommunityProfilePageIXP_0 (copy), v27 (copy)
    v43.infoNameTextLabelRef = v2.createRef();
    local v44, v45 = v2.createBinding(0);
    v43.maxRightContentWidth = v44;
    v43.setMaxRightContentWidth = v45;
    v43.state = {
        buttonPressed = false
    };
    v43.onAbsoluteSizeChange = function(v46) --[[ Line: 81 ]]
        -- upvalues: v43 (copy)
        local l_X_0 = v46.AbsoluteSize.X;
        v43.setMaxRightContentWidth((math.floor(l_X_0 - (v43.props.leftPadding + v43.props.rightPadding))));
    end;
    v43.onInputBegan = function(_, v49) --[[ Line: 86 ]]
        -- upvalues: v43 (copy)
        if v49.UserInputState == Enum.UserInputState.Begin and (v49.UserInputType == Enum.UserInputType.Touch or v49.UserInputType == Enum.UserInputType.MouseButton1) and not v43.state.buttonPressed then
            v43:setState({
                buttonPressed = true
            });
        end;
    end;
    v43.onInputEnded = function() --[[ Line: 102 ]]
        -- upvalues: v43 (copy)
        if v43.state.buttonPressed then
            v43:setState({
                buttonPressed = false
            });
        end;
    end;
    v43.onActivated = function() --[[ Line: 110 ]]
        -- upvalues: v43 (copy), l_GameDetailsSubpage_0 (ref), l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 (ref), l_AppPage_0 (ref), v40 (ref), l_FFlagLuaAppBadgesSeeAllLogExposure_0 (ref), l_IXPService_0 (ref), l_FStringLuaAppBadgesSeeAllIxpLayer_0 (ref), l_FFlagLuaAppBadgesSeeAllEnabled_0 (ref), l_navigateToBadgesSeeAll_0 (ref), v35 (ref), v33 (ref), l_EnableCommunityProfilePageIXP_0 (ref), v27 (ref)
        local l_linkPage_0 = v43.props.linkPage;
        local l_linkView_0 = v43.props.linkView;
        local l_linkUrl_0 = v43.props.linkUrl;
        if not l_linkPage_0 and not l_linkView_0 and not l_linkUrl_0 then
            return;
        else
            local l_eventIngest_0 = v43.props.eventIngest;
            local l_universeId_0 = v43.props.universeId;
            if l_linkUrl_0 then
                v43.props.openLeaveRobloxAlert(function() --[[ Line: 123 ]]
                    -- upvalues: v43 (ref), l_linkUrl_0 (copy)
                    v43.props.linking:openURL(l_linkUrl_0);
                    v43.props.closeAlert();
                    local l_linkClickCallback_0 = v43.props.linkClickCallback;
                    if l_linkClickCallback_0 then
                        l_linkClickCallback_0();
                    end;
                end);
                return;
            else
                local l_placeId_0 = v43.props.placeId;
                local l_analyticsSubPage_0 = v43.props.analyticsSubPage;
                l_GameDetailsSubpage_0(l_eventIngest_0, "GameInfoRow", l_placeId_0, l_analyticsSubPage_0, if l_FFlagLuaAppAddUniverseIdToGameDetailsEvents_0 then l_universeId_0 else nil);
                local l_Text_0 = v43.infoNameTextLabelRef.current.Text;
                if l_linkView_0 == l_AppPage_0.ExperienceGuidelinesExplained then
                    v43.props.openExperienceGuidelinesExplained(l_universeId_0);
                    return;
                elseif l_linkView_0 == l_AppPage_0.PassesPage then
                    v43.props.navigateDown({
                        name = l_AppPage_0.PassesPage, 
                        detail = l_universeId_0, 
                        extraProps = if v40() then {
                            viewWidth = v43.props.viewWidth
                        } else nil
                    });
                    return;
                else
                    if l_FFlagLuaAppBadgesSeeAllLogExposure_0 and l_analyticsSubPage_0 == "Badges" then
                        l_IXPService_0:LogFlagLinkedUserLayerExposure(l_FStringLuaAppBadgesSeeAllIxpLayer_0);
                    end;
                    if l_FFlagLuaAppBadgesSeeAllEnabled_0 and l_linkView_0 == l_AppPage_0.BadgesSeeAll then
                        l_navigateToBadgesSeeAll_0(v43.props.navigation, l_universeId_0);
                        return;
                    else
                        if not v35 then
                            if l_linkView_0 == "UpdatedGenre" then
                                local l_localization_0 = v43.props.localization;
                                v43.props.openCloseOnlyInteractiveAlert(v43.props.infoData, l_localization_0:Format("Feature.GameDetails.Label.GenreInProgress"), v43.props.closeAlert);
                                return;
                            elseif l_linkView_0 == "GenreUnderConstruction" then
                                local l_localization_1 = v43.props.localization;
                                local v61 = nil;
                                if v33 == "UnderConstruction" then
                                    v61 = l_localization_1:Format("Feature.GameDetails.Label.GenreUnderConstruction");
                                elseif v33 == "InProgress" then
                                    v61 = l_localization_1:Format("Feature.GameDetails.Label.GenreInProgress");
                                end;
                                if v61 then
                                    v43.props.openCloseOnlyInteractiveAlert(l_localization_1:Format("Feature.GameDetails.Label.Unavailable"), v61, v43.props.closeAlert);
                                end;
                                return;
                            end;
                        end;
                        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and (l_analyticsSubPage_0 == "Developer" or l_analyticsSubPage_0 == "Group") then
                            l_EnableCommunityProfilePageIXP_0.logExposure();
                        end;
                        if l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and l_linkView_0 == "CommunityProfilePlatform" and v43.props.linkViewData ~= nil then
                            local l_linkViewData_0 = v43.props.linkViewData;
                            v43.props.openCommunityProfilePage(l_linkViewData_0, (("ExperienceDetailsPage:%*"):format(l_analyticsSubPage_0)));
                            return;
                        elseif l_linkView_0 == "UserProfilePlatform" and v43.props.linkViewData ~= nil then
                            local l_linkViewData_1 = v43.props.linkViewData;
                            v43.props.openUserProfilePage(l_linkViewData_1, (("ExperienceDetailsPage:%*"):format(l_analyticsSubPage_0)));
                            return;
                        else
                            v43.props.navigateDown({
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
v42.render = function(v64) --[[ Line: 231 ]] --[[ Name: render ]]
    -- upvalues: l_GetFFlagUseVoiceExitBetaLanguage_0 (copy), l_GuildedLogoWhiteAsset_0 (copy), v2 (copy), v3 (copy), l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 (copy), l_ImageSetLabel_0 (copy), v16 (copy), v41 (copy), v26 (copy)
    local l_Cells_0 = v64.props.appTheme.GameDetails.GameInfoList.Cells;
    local l_Size_0 = v64.props.Size;
    local l_Position_0 = v64.props.Position;
    local l_LayoutOrder_0 = v64.props.LayoutOrder;
    local l_buttonPressed_0 = v64.state.buttonPressed;
    local l_infoName_0 = v64.props.infoName;
    local v71 = v64.props.infoData or "";
    local l_infoIcon_0 = v64.props.infoIcon;
    local v73 = false;
    if l_GetFFlagUseVoiceExitBetaLanguage_0() then
        v73 = v64.props.infoIcon ~= nil;
    elseif l_infoIcon_0 == l_GuildedLogoWhiteAsset_0 then
        v73 = true;
    end;
    local v74 = true;
    if v64.props.linkPage == nil then
        v74 = v64.props.linkView or v64.props.linkUrl;
    end;
    local l_leftPadding_0 = v64.props.leftPadding;
    local l_rightPadding_0 = v64.props.rightPadding;
    local l_topPadding_0 = v64.props.topPadding;
    local l_bottomPadding_0 = v64.props.bottomPadding;
    if not v74 then
        l_buttonPressed_0 = false;
    end;
    local function v81(_, v80) --[[ Line: 259 ]] --[[ Name: getInfoDataTextLabel ]]
        -- upvalues: v2 (ref), v71 (copy), v3 (ref), l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 (ref), v64 (copy)
        return v2.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 0), 
            TextTruncate = Enum.TextTruncate.SplitWord, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Font = v80.Font.Header2.Font, 
            TextSize = v80.Font.BaseSize * v80.Font.Header2.RelativeSize, 
            TextColor3 = v80.Theme.TextEmphasis.Color, 
            TextTransparency = v80.Theme.TextEmphasis.Transparency, 
            Text = v71, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = false, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1, 
            [v3.Tag] = if l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 and v64.props.testId then ("data-testid=%*"):format(v64.props.testId) else nil
        });
    end;
    local l_style_0 = v64.props.style;
    return v2.createElement("ImageButton", {
        Size = l_Size_0, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Position = l_Position_0, 
        AutoButtonColor = false, 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = l_buttonPressed_0 and l_Cells_0.Background.Transparency.Pressed or l_Cells_0.Background.Transparency.Default, 
        BackgroundColor3 = l_Cells_0.Background.Color, 
        [v2.Event.InputBegan] = v64.onInputBegan, 
        [v2.Event.InputEnded] = v64.onInputEnded, 
        [v2.Event.Activated] = v64.onActivated, 
        [v2.Change.AbsoluteSize] = v64.onAbsoluteSizeChange
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
                MaxSize = v64.maxRightContentWidth:map(function(v83) --[[ Line: 326 ]]
                    return Vector2.new(v83, 1e999);
                end)
            }), 
            InfoIcon = v73 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 20, 0, 20), 
                Image = v64.props.infoIcon, 
                ImageColor3 = l_style_0.Theme.IconEmphasis.Color, 
                ImageTransparency = l_style_0.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }), 
            InfoDataTextLabelVerifiedBadge = v64.props.useVerifiedBadgeEmojiWrapper and v2.createElement(v16.EmojiWrapper, {
                emoji = if v64.props.useVerifiedBadgeEmojiWrapper then v16.emoji.verified else "", 
                size = UDim2.new(0, 0, 0, 0), 
                anchorPoint = Vector2.new(1, 0), 
                automaticSize = Enum.AutomaticSize.XY, 
                horizontalAlignment = Enum.HorizontalAlignment.Left, 
                verticalAlignment = Enum.VerticalAlignment.Center, 
                layoutOrder = 1
            }, {
                InfoDataTextLabel = v81(true, l_style_0)
            }), 
            InfoDataTextLabel = if not v64.props.useVerifiedBadgeEmojiWrapper and v71 ~= "" then v81(false, l_style_0) else nil, 
            LinkArrow = v74 and v2.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0, 14, 0, 14), 
                Image = v41, 
                ImageColor3 = l_style_0.Theme.IconEmphasis.Color, 
                ImageTransparency = l_style_0.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                [v3.Tag] = if l_FFlagLuaAppAddTestIdsForEdpInfoTable_0 and v64.props.testId then ("data-testid=%*"):format(v64.props.testId) else nil
            })
        }), 
        InfoNameTextLabel = v2.createElement(v64.props.disableInfoNameLocalization and "TextLabel" or v26, {
            Size = UDim2.new(v71 ~= "" and 0 or 1, v71 ~= "" and 0 or -25, 0, 0), 
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
            [v2.Ref] = v64.infoNameTextLabelRef, 
            LayoutOrder = 1
        })
    });
end;
local v84 = v28(v42);
v42 = v4.connect(nil, function(v85) --[[ Line: 409 ]]
    -- upvalues: l_NavigateDown_0 (copy), v29 (copy), v30 (copy), v35 (copy), l_OpenCloseOnlyInteractiveAlert_0 (copy), l_CloseCentralOverlay_0 (copy), l_EnableCommunityProfilePageIXP_0 (copy), l_AppPage_0 (copy), l_ProfileTypes_0 (copy)
    return {
        navigateDown = function(v86) --[[ Line: 411 ]] --[[ Name: navigateDown ]]
            -- upvalues: v85 (copy), l_NavigateDown_0 (ref)
            return v85(l_NavigateDown_0(v86));
        end, 
        openExperienceGuidelinesExplained = function(v87) --[[ Line: 414 ]] --[[ Name: openExperienceGuidelinesExplained ]]
            -- upvalues: v85 (copy), v29 (ref)
            v85(v29(v87, false));
        end, 
        openLeaveRobloxAlert = function(v88) --[[ Line: 417 ]] --[[ Name: openLeaveRobloxAlert ]]
            -- upvalues: v85 (copy), v30 (ref)
            v85(v30(v88));
        end, 
        openCloseOnlyInteractiveAlert = if v35 then nil else function(v89, v90, v91) --[[ Line: 422 ]]
            -- upvalues: v85 (copy), l_OpenCloseOnlyInteractiveAlert_0 (ref)
            v85(l_OpenCloseOnlyInteractiveAlert_0(v89, v90, v91, nil, false));
        end, 
        closeAlert = if v35 then nil else function() --[[ Line: 427 ]]
            -- upvalues: v85 (copy), l_CloseCentralOverlay_0 (ref)
            v85(l_CloseCentralOverlay_0());
        end, 
        openCommunityProfilePage = l_EnableCommunityProfilePageIXP_0.FFlagIsSetupEnabled and function(v92, v93) --[[ Line: 431 ]]
            -- upvalues: v85 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
            v85(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v92, 
                extraProps = {
                    profileType = l_ProfileTypes_0.Community, 
                    source = v93
                }
            }));
        end or nil, 
        openUserProfilePage = function(v94, v95) --[[ Line: 442 ]] --[[ Name: openUserProfilePage ]]
            -- upvalues: v85 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), l_ProfileTypes_0 (ref)
            v85(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v94, 
                extraProps = {
                    profileType = l_ProfileTypes_0.User, 
                    source = v95
                }
            }));
        end
    };
end)(function(v96) --[[ Line: 398 ]]
    -- upvalues: l_useStyle_0 (copy), l_FFlagLuaAppBadgesSeeAllEnabled_0 (copy), l_useNavigation_0 (copy), v10 (copy), v2 (copy), v84 (copy)
    local v97 = l_useStyle_0();
    local v98 = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then l_useNavigation_0() else nil;
    local v99 = v10.Dictionary.join(v96, {
        style = v97, 
        navigation = if l_FFlagLuaAppBadgesSeeAllEnabled_0 then v98 else nil
    });
    return v2.createElement(v84, v99);
end);
return l_RoactServices_0.connect({
    eventIngest = l_AppEventIngestService_0, 
    linking = l_AppLinking_0, 
    localization = v25
})(v42);
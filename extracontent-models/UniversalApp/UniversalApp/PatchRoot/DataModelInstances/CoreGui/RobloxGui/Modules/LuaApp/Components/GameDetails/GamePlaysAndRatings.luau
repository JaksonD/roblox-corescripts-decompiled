local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v5 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_abbreviateCount_0 = require(l_CorePackages_0.Workspace.Packages.Localization).abbreviateCount;
local v7 = require(l_Modules_0.LuaApp.Components.PrimaryStatWidget);
local v8 = require(l_Modules_0.LuaApp.Components.GameDetails.GameRatings);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v10 = require(l_Modules_0.LuaApp.withTheme_DEPRECATED);
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_GamePlayerFeedbackPrompt_0 = require(l_CorePackages_0.Workspace.Packages.PlayerFeedback).GamePlayerFeedbackPrompt;
local v13 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_SetCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local v17 = require(l_CorePackages_0.Workspace.Packages.GameVotesRodux);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_GetGamePlayerFeedbackMetadata_0 = require(l_CorePackages_0.Workspace.Packages.PlayerFeedback).Thunks.GetGamePlayerFeedbackMetadata;
local l_VoteStatus_0 = v17.Enums.VoteStatus;
local l_GetFFlagEdpPlayerFeedbackEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackEnabled;
local l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEdpPlayerFeedbackLogIXPExposure;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_IXPService_0 = game:GetService("IXPService");
local v27 = v2.PureComponent:extend("GamePlaysAndRatings");
if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
    v27.init = function(v28) --[[ Line: 43 ]] --[[ Name: init ]]
        -- upvalues: l_Logging_0 (copy), l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_VoteStatus_0 (copy)
        v28.state = {
            isFeedbackPromptOpen = false
        };
        v28.openInlineFeedbackPrompt = function() --[[ Line: 47 ]]
            -- upvalues: v28 (copy)
            v28:setState({
                isFeedbackPromptOpen = true
            });
        end;
        v28.closeInlineFeedbackPrompt = function() --[[ Line: 52 ]]
            -- upvalues: v28 (copy)
            v28:setState({
                isFeedbackPromptOpen = false
            });
        end;
        v28.onClickFeedbackPromptButton = function() --[[ Line: 57 ]]
            -- upvalues: v28 (copy), l_Logging_0 (ref)
            if not v28.state.playerFeedbackMetadata then
                l_Logging_0.warn("Player feedback metadata is not available from feedback prompt");
                return;
            else
                v28.props.openFeedbackForm(v28.props.universeId, v28.state.playerFeedbackMetadata, v28.closeInlineFeedbackPrompt);
                return;
            end;
        end;
        v28.onVoteSuccess = function(v29) --[[ Line: 68 ]]
            -- upvalues: l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v28 (copy), l_VoteStatus_0 (ref), l_Logging_0 (ref)
            if l_GetFFlagEdpPlayerFeedbackLogIXPExposure_0() then
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer);
            end;
            if not v28.props.enablePlayerFeedback then
                return;
            else
                local l_universeId_0 = v28.props.universeId;
                local l_networking_0 = v28.props.networking;
                local l_rootPlaceId_0 = v28.props.rootPlaceId;
                if v29 == l_VoteStatus_0.NotVoted then
                    v28.closeInlineFeedbackPrompt();
                    return;
                else
                    v28.props.getGamePlayerFeedbackMetadata(l_networking_0, l_universeId_0, l_rootPlaceId_0, v29):andThen(function(v33) --[[ Line: 87 ]]
                        -- upvalues: v28 (ref), l_universeId_0 (copy)
                        if v33 and v33.canSubmitReview then
                            if v28.props.showInlineFeedbackPrompt then
                                v28:setState({
                                    playerFeedbackMetadata = v33
                                });
                                v28.openInlineFeedbackPrompt();
                                return;
                            else
                                v28.props.openFeedbackForm(l_universeId_0, v33);
                            end;
                        end;
                    end, function() --[[ Line: 98 ]]
                        -- upvalues: l_Logging_0 (ref)
                        l_Logging_0.warn("Failed to get player feedback metadata");
                    end);
                    return;
                end;
            end;
        end;
    end;
end;
v27.getLayoutInfo = function(v34, v35, v36, v37, v38, v39) --[[ Line: 106 ]] --[[ Name: getLayoutInfo ]]
    -- upvalues: v7 (copy)
    local l_appTheme_0 = v34.props.appTheme;
    local l_containerWidth_0 = v34.props.containerWidth;
    local v42 = nil;
    local v43 = nil;
    if v39 then
        v42 = v7.GetMinimumWidthRethemed(v35, v36, v39);
        v43 = v7.GetMinimumWidthRethemed(v37, v38, v39);
    else
        v42 = v7.GetMinimumWidth(v35, v36, l_appTheme_0.GameDetails.Text.BoldFont);
        v43 = v7.GetMinimumWidth(v37, v38, l_appTheme_0.GameDetails.Text.BoldFont);
    end;
    if math.max(v42, v43) * 2 > l_containerWidth_0 / 2 then
        return {
            isOneRow = false, 
            subSectionWidth = l_containerWidth_0, 
            widgetWidth = l_containerWidth_0 / 2
        };
    else
        return {
            isOneRow = true, 
            subSectionWidth = l_containerWidth_0 / 2, 
            widgetWidth = l_containerWidth_0 / 4
        };
    end;
end;
v27.render = function(v44) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_abbreviateCount_0 (copy), v2 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), v8 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v7 (copy), l_GamePlayerFeedbackPrompt_0 (copy)
    return l_withStyle_0(function(v45) --[[ Line: 147 ]]
        -- upvalues: v44 (copy), l_abbreviateCount_0 (ref), v2 (ref), l_GetFFlagEdpPlayerFeedbackEnabled_0 (ref), v8 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), v7 (ref), l_GamePlayerFeedbackPrompt_0 (ref)
        local l_showGlobalCounters_0 = v44.props.showGlobalCounters;
        local l_showLikesFavoritesCount_0 = v44.props.showLikesFavoritesCount;
        local l_containerWidth_1 = v44.props.containerWidth;
        local l_rowPadding_0 = v44.props.rowPadding;
        local l_playing_0 = v44.props.playing;
        local l_visits_0 = v44.props.visits;
        local l_universeId_1 = v44.props.universeId;
        local l_LayoutOrder_0 = v44.props.LayoutOrder;
        local l_localization_0 = v44.props.localization;
        local l_hideVisits_0 = v44.props.hideVisits;
        local v56 = l_abbreviateCount_0(l_playing_0, l_localization_0:GetLocale());
        local v57 = string.upper(l_localization_0:Format("Feature.GameDetails.Label.Playing"));
        local v58 = l_abbreviateCount_0(l_visits_0, l_localization_0:GetLocale());
        local v59 = string.upper(l_localization_0:Format("Feature.GameDetails.Label.Visits"));
        local v60 = v44:getLayoutInfo(v56, v57, v58, v59, v45);
        local l_isOneRow_0 = v60.isOneRow;
        local l_subSectionWidth_0 = v60.subSectionWidth;
        local l_widgetWidth_0 = v60.widgetWidth;
        local v64 = v2.createElement("Frame", {
            Size = UDim2.new(0, l_containerWidth_1, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_GetFFlagEdpPlayerFeedbackEnabled_0() and 1 or l_LayoutOrder_0, 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = l_isOneRow_0 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, l_isOneRow_0 and 0 or l_rowPadding_0)
            }), 
            Ratings = v2.createElement(v8, {
                LayoutOrder = l_isOneRow_0 and 1 or 2, 
                universeId = l_universeId_1, 
                width = l_subSectionWidth_0, 
                showGlobalCounters = l_showGlobalCounters_0, 
                showLikesFavoritesCount = l_showLikesFavoritesCount_0, 
                onVoteSuccess = if l_GetFFlagEdpPlayerFeedbackEnabled_0() then v44.onVoteSuccess else nil, 
                shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v44.props.shouldHydrateLegacyIxp else nil
            }), 
            PlaysAndVisitsSection = not l_hideVisits_0 and l_showGlobalCounters_0 and v2.createElement("Frame", {
                Size = UDim2.new(0, l_subSectionWidth_0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_isOneRow_0 and 2 or 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                PlaySection = v2.createElement(v7, {
                    icon = "LuaApp/icons/GameDetails/playing_large", 
                    number = v56, 
                    label = v57, 
                    width = l_widgetWidth_0, 
                    LayoutOrder = 1
                }), 
                VisitsSection = v2.createElement(v7, {
                    icon = "LuaApp/icons/GameDetails/sessions_large", 
                    number = v58, 
                    label = v59, 
                    width = l_widgetWidth_0, 
                    LayoutOrder = 2
                })
            })
        });
        if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
            return v2.createElement("Frame", {
                Size = UDim2.new(0, l_containerWidth_1, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = l_LayoutOrder_0, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                ListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, l_rowPadding_0)
                }), 
                GamePlayerAndRatingsFrame = v64, 
                PlayerFeedbackPrompt = if v44.state.isFeedbackPromptOpen then v2.createElement(l_GamePlayerFeedbackPrompt_0, {
                    placeId = v44.props.rootPlaceId, 
                    width = l_containerWidth_1, 
                    backgroundColor3 = v45.Tokens.Semantic.Color.Ui.Emphasis.Color3, 
                    backgroundTransparency = v45.Tokens.Semantic.Color.Ui.Emphasis.Transparency, 
                    LayoutOrder = 2, 
                    onDimiss = v44.closeInlineFeedbackPrompt, 
                    onButtonClick = v44.onClickFeedbackPromptButton
                }) else nil
            });
        else
            return v64;
        end;
    end);
end;
v27 = v10(v27);
v27 = v3.connect(function(v65, v66) --[[ Line: 255 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), l_GameInfosReducer_0 (copy), l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy)
    local v67 = nil;
    v67 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v66.shouldHydrateLegacyIxp then v65.GameDetailsV2[v66.universeId] else v65.GameDetails[v66.universeId];
    local v68 = v65.Personalization[l_GameInfosReducer_0.key][v66.universeId];
    local v69 = v67 and v67.playing or v68 and v68.playerCount or 0;
    local v70 = v67 and v67.visits or 0;
    local v71 = nil;
    if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
        v71 = v67 and v67.rootPlaceId or v68 and v68.placeId or nil;
    end;
    return {
        playing = v69, 
        visits = v70, 
        rootPlaceId = v71
    };
end, function(v72) --[[ Line: 279 ]]
    -- upvalues: l_GetFFlagEdpPlayerFeedbackEnabled_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_GetGamePlayerFeedbackMetadata_0 (copy)
    return {
        openFeedbackForm = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v73, v74, v75) --[[ Line: 282 ]]
            -- upvalues: v72 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
            return v72(l_SetCentralOverlay_0(l_CentralOverlayType_0.GamePlayerFeedbackForm, {
                universeId = v73, 
                playerFeedbackMetadata = v74, 
                onSubmitted = v75
            }));
        end or nil, 
        getGamePlayerFeedbackMetadata = l_GetFFlagEdpPlayerFeedbackEnabled_0() and function(v76, v77, v78, v79) --[[ Line: 291 ]]
            -- upvalues: v72 (copy), l_GetGamePlayerFeedbackMetadata_0 (ref)
            return v72(l_GetGamePlayerFeedbackMetadata_0.Get(v76, v77, v78, v79));
        end or nil
    };
end)(v27);
if l_GetFFlagEdpPlayerFeedbackEnabled_0() then
    v27 = v13.connectUserLayer({
        l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer
    }, function(v80, _) --[[ Line: 301 ]]
        -- upvalues: l_AppUserLayers_0 (copy)
        local v82 = v80[l_AppUserLayers_0.EDPPlayerFeedbackExposureLayer] or {};
        return {
            enablePlayerFeedback = v82.ShowFeedbackForm, 
            showInlineFeedbackPrompt = v82.ShowInlinePrompt
        };
    end, false)(v27);
end;
return (l_RoactServices_0.connect({
    localization = v5, 
    networking = if l_GetFFlagEdpPlayerFeedbackEnabled_0() then l_RoactNetworking_0 else nil
})(v27));
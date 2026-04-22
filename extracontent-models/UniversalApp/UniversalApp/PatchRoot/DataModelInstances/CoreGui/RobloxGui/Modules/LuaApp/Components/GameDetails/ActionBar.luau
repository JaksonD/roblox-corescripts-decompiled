local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.GamePlayButton);
local l_PlayButton_0 = v4.PlayButton;
local l_usePlayButtonState_0 = v4.usePlayButtonState;
local l_usePlayButtonContextualMessage_0 = v4.usePlayButtonContextualMessage;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_ButtonSize_0 = require(l_CorePackages_0.Packages.Foundation).Enums.ButtonSize;
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v13 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v17 = require(l_Modules_0.LuaApp.Components.Games.PlayButtonContainer);
local v18 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailMoreButton);
local v19 = require(l_Modules_0.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsButton);
local l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonMobileEdp;
local l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp;
local l_GetFFlagUIBloxUseFoundationButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local l_FFlagLuaAppEnableCustomSpawnSponsored_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnableCustomSpawnSponsored;
local l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 = v13.Constants.GAME_DETAILS_ACTION_BAR_HEIGHT;
local v26 = v2.PureComponent:extend("ActionBar");
v26.defaultProps = {
    bottomPadding = 0, 
    showMorePage = true
};
v26.validateProps = v3.strictInterface({
    leftPadding = v3.number, 
    rightPadding = v3.number, 
    bottomPadding = v3.number, 
    universeId = v3.string, 
    referralSource = v3.optional(v3.string), 
    experienceJoinData = v3.optional(v3.table), 
    placeIdOverride = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v3.optional(v3.string) else nil, 
    containerRef = v3.optional(v3.table), 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v3.optional(v3.boolean) else nil, 
    showMorePage = v3.optional(v3.boolean), 
    shouldShowPlayWithFriendsPolicy = v3.optional(v3.boolean), 
    contextualMessage = v3.optional(v3.string), 
    hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v3.optional(v3.boolean) else nil, 
    unifyToUIBloxIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v3.optional(v3.boolean) else nil
});
v26.init = function(_) --[[ Line: 71 ]] --[[ Name: init ]]

end;
v26.willUnmount = function(_) --[[ Line: 73 ]] --[[ Name: willUnmount ]]

end;
v26.render = function(v29) --[[ Line: 75 ]] --[[ Name: render ]]
    -- upvalues: l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (copy), l_withStyle_0 (copy), v2 (copy), l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy), l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (copy), v18 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v19 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), v17 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (copy), l_PlayButton_0 (copy), l_ButtonSize_0 (copy)
    local l_leftPadding_0 = v29.props.leftPadding;
    local l_rightPadding_0 = v29.props.rightPadding;
    local l_bottomPadding_0 = v29.props.bottomPadding;
    local l_universeId_0 = v29.props.universeId;
    local l_experienceJoinData_0 = v29.props.experienceJoinData;
    local l_showMorePage_0 = v29.props.showMorePage;
    local l_shouldShowPlayWithFriendsPolicy_0 = v29.props.shouldShowPlayWithFriendsPolicy;
    local v37 = l_showMorePage_0 and l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 or 0;
    local v38 = l_showMorePage_0 and 10 or 0;
    local v39 = -v37 - v38;
    if l_shouldShowPlayWithFriendsPolicy_0 then
        v39 = 2 * v39;
    end;
    return l_withStyle_0(function(v40) --[[ Line: 95 ]]
        -- upvalues: v2 (ref), v29 (copy), l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 (ref), l_GetFFlagUIBloxUseFoundationButton_0 (ref), l_leftPadding_0 (copy), l_rightPadding_0 (copy), l_bottomPadding_0 (copy), l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 (ref), v38 (copy), l_showMorePage_0 (copy), v18 (ref), l_universeId_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref), l_shouldShowPlayWithFriendsPolicy_0 (copy), v19 (ref), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (ref), v17 (ref), v39 (ref), l_experienceJoinData_0 (copy), l_FFlagLuaAppEnableCustomSpawnSponsored_0 (ref), l_PlayButton_0 (ref), l_ButtonSize_0 (ref)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v2.Ref] = v29.props.containerRef
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Gradient = v2.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 0, 40), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png", 
                ImageColor3 = v40.Theme.BackgroundDefault.Color, 
                LayoutOrder = 1, 
                ZIndex = (not not l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 or l_GetFFlagUIBloxUseFoundationButton_0()) and 1 or nil
            }), 
            ContentFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = 2, 
                BackgroundColor3 = v40.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                ZIndex = (not not l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 or l_GetFFlagUIBloxUseFoundationButton_0()) and 2 or nil
            }, {
                ContentListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, v40.Tokens.Global.Space_150)
                }), 
                ContentPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_leftPadding_0), 
                    PaddingRight = UDim.new(0, l_rightPadding_0), 
                    PaddingBottom = UDim.new(0, l_bottomPadding_0)
                }), 
                ActionBar = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, l_GAME_DETAILS_ACTION_BAR_HEIGHT_0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    ActionListLayout = v2.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = if not not l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 or l_GetFFlagUIBloxUseFoundationButton_0() then Enum.VerticalAlignment.Center else nil, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v38)
                    }), 
                    MoreButton = l_showMorePage_0 and v2.createElement(v18, {
                        universeId = l_universeId_0, 
                        leftPadding = l_leftPadding_0, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v29.props.shouldHydrateLegacyIxp else nil, 
                        testId = "--experience-details--more-button"
                    }), 
                    PlayWithFriendsButton = l_shouldShowPlayWithFriendsPolicy_0 and v2.createElement(v19, {
                        universeId = l_universeId_0, 
                        leftPadding = l_leftPadding_0, 
                        shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v29.props.shouldHydrateLegacyIxp else nil
                    }) or nil, 
                    PlayButtonContainer = if l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v29.props.hasUnifiedPlayButtonIxp) then nil else v2.createElement(v17, {
                        Size = UDim2.new(1, v39, l_GetFFlagUIBloxUseFoundationButton_0() and 0 or 1, if l_GetFFlagUIBloxUseFoundationButton_0() then l_GAME_DETAILS_ACTION_BAR_HEIGHT_0 else 0), 
                        LayoutOrder = 4, 
                        universeId = l_universeId_0, 
                        referralSource = v29.props.referralSource, 
                        experienceJoinData = l_experienceJoinData_0, 
                        placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v29.props.placeIdOverride else nil, 
                        testId = "--experience-details--play-button"
                    }), 
                    PlayButton = if l_FFlagLuaAppUnifyPlayButtonMobileEdp_0 and (not l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 or v29.props.hasUnifiedPlayButtonIxp) then v2.createElement(l_PlayButton_0, {
                        universeId = l_universeId_0, 
                        referralSource = v29.props.referralSource, 
                        launchSource = "LuaGameCard", 
                        experienceJoinData = l_experienceJoinData_0, 
                        placeId = if l_FFlagLuaAppEnableCustomSpawnSponsored_0 then v29.props.placeIdOverride else nil, 
                        buttonSize = l_ButtonSize_0.Large, 
                        width = UDim.new(1, v39), 
                        useUIBloxButton = v29.props.unifyToUIBloxIxp, 
                        LayoutOrder = 4, 
                        testId = "--experience-details--play-button"
                    }) else nil
                }), 
                ContextLabel = if v29.props.contextualMessage then v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Text = v29.props.contextualMessage, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    BackgroundTransparency = 1, 
                    Font = v40.Tokens.Semantic.Typography.CaptionHeader.Font, 
                    TextSize = v40.Tokens.Semantic.Typography.CaptionHeader.FontSize, 
                    TextColor3 = v40.Tokens.Semantic.Color.Text.Emphasis.Color3, 
                    TextTransparency = v40.Tokens.Semantic.Color.Text.Emphasis.Transparency, 
                    LayoutOrder = 2
                }) else nil
            })
        });
    end);
end;
local v43 = l_RoactAppPolicy_0.connect(function(v41, _) --[[ Line: 222 ]]
    return {
        showMorePage = v41.getGameDetailsMorePage(), 
        shouldShowPlayWithFriendsPolicy = v41.getGameDetailsPlayWithFriends()
    };
end)(v26);
return function(v44) --[[ Line: 230 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_usePlayButtonState_0 (copy), l_usePlayButtonContextualMessage_0 (copy), l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v1 (copy), v2 (copy), v43 (copy)
    local v45 = l_useRoactService_0(l_RoactNetworking_0);
    local v46 = l_usePlayButtonState_0(v45, v44.universeId, nil);
    local v47 = l_usePlayButtonContextualMessage_0(v44.universeId, v46.playButtonState, v46.playabilityStatus);
    local v48 = nil;
    local v49 = nil;
    if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then
        local v52, v53 = l_useUserExperiment_0({
            l_AppUserLayers_0.PlayButtonUXExposureLayer
        }, function(v50) --[[ Line: 244 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v51 = v50[l_AppUserLayers_0.PlayButtonUXExposureLayer] or {};
            return v51.HasUnifiedPlayButton, v51.UnifyToUIBlox;
        end, true);
        v48 = v52;
        v49 = v53;
    end;
    local v54 = v1.Dictionary.join(v44, {
        contextualMessage = v47, 
        hasUnifiedPlayButtonIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v48 else nil, 
        unifyToUIBloxIxp = if l_FFlagLuaAppUnifyPlayButtonAllSurfacesIxp_0 then v49 else nil
    });
    return v2.createElement(v43, v54);
end;
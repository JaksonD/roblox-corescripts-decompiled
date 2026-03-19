local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_Skeleton_0 = require(l_CorePackages_0.Packages.Foundation).Skeleton;
local l_withStyle_0 = v9.Style.withStyle;
local l_ImageSetButton_0 = v9.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v9.App.ImageSet.Images;
local l_ShimmerPanel_0 = v9.App.Loading.ShimmerPanel;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v17 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v18 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local v19 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAppMigrateShimmerPanelToSkeleton);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v22 = UDim2.new(0, 44, 0, 44);
local v23 = UDim2.new(0, 37, 0, 37);
local v24 = l_Images_0["component_assets/circle_17"];
local v25 = Rect.new(8, 8, 9, 9);
local v26 = l_Images_0["icons/menu/more_on"];
local v27 = l_Images_0["icons/menu/more_off"];
local v28 = v1.PureComponent:extend("GameDetailMoreButton");
v28.validateProps = v4.strictInterface({
    universeId = v4.string, 
    leftPadding = v4.number, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v4.optional(v4.boolean) else nil, 
    screenWidth = v4.number, 
    isLoading = v4.boolean, 
    isDisabled = v4.boolean, 
    openContextualMenu = v4.callback, 
    testId = v4.optional(v4.string)
});
v28.getMoreMenuPosition = function(v29) --[[ Line: 60 ]] --[[ Name: getMoreMenuPosition ]]
    local l_screenWidth_0 = v29.props.screenWidth;
    local l_leftPadding_0 = v29.props.leftPadding;
    local l_current_0 = v29.moreButtonRef.current;
    if l_current_0 == nil then
        return UDim2.new(0, 0, 0, 0);
    else
        local v33 = l_current_0.AbsolutePosition.x + l_current_0.AbsoluteSize.x / 2;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v35 = (l_screenWidth_0 - 300) / 2;
        local v36 = nil;
        v36 = l_screenWidth_0 < 600 and 0 or if v33 < l_leftPadding_0 + 150 then l_leftPadding_0 - v35 else v33 - 150 - v35;
        local v37 = l_Y_0 - 15;
        return UDim2.new(0, v36, 0, v37);
    end;
end;
v28.init = function(v38) --[[ Line: 92 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    v38.moreButtonRef = v1.createRef();
    v38.deselectMoreButton = function() --[[ Line: 94 ]]
        -- upvalues: v38 (copy)
        v38:setState({
            isMoreButtonSelected = false
        });
    end;
    v38.deselectMoreButton();
    local l_openContextualMenu_0 = v38.props.openContextualMenu;
    v38.onActivated = function() --[[ Line: 104 ]]
        -- upvalues: v38 (copy), l_openContextualMenu_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        local l_universeId_0 = v38.props.universeId;
        if v38.props.isDisabled then
            return;
        else
            v38:setState({
                isMoreButtonSelected = true
            });
            local v41 = v38:getMoreMenuPosition();
            l_openContextualMenu_0(l_universeId_0, v41, v38.deselectMoreButton, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v38.props.shouldHydrateLegacyIxp else nil);
            return;
        end;
    end;
end;
v28.render = function(v42) --[[ Line: 126 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v43) --[[ Line: 127 ]]
        -- upvalues: v42 (copy)
        return v42:renderWithStyle(v43);
    end);
end;
v28.renderWithStyle = function(v44, v45) --[[ Line: 132 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v26 (copy), v27 (copy), v19 (copy), v1 (copy), l_Skeleton_0 (copy), l_ShimmerPanel_0 (copy), l_ImageSetLabel_0 (copy), v23 (copy), l_ImageSetButton_0 (copy), v2 (copy), v22 (copy), v24 (copy), v25 (copy)
    local l_isLoading_0 = v44.props.isLoading;
    local l_isDisabled_0 = v44.props.isDisabled;
    local l_Theme_0 = v45.Theme;
    local v49 = (not not l_isLoading_0 or l_isDisabled_0) and 0.5 or l_Theme_0.BackgroundDefault.Transparency;
    local v50 = nil;
    local v51 = if v44.state.isMoreButtonSelected then v26 else v27;
    v50 = if l_isLoading_0 then if v19 then v1.createElement(l_Skeleton_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    }) else v1.createElement(l_ShimmerPanel_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        shimmerSpeed = 1.5
    }) else v1.createElement(l_ImageSetLabel_0, {
        Size = v23, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Image = v51, 
        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
        ImageColor3 = l_Theme_0.IconEmphasis.Color
    });
    return v1.createElement(l_ImageSetButton_0, {
        [v2.Tag] = if v44.props.testId then ("data-testid=%*"):format(v44.props.testId) else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v22, 
        Image = v24, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v25, 
        ImageTransparency = v49, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v1.Event.Activated] = v44.onActivated, 
        [v1.Ref] = v44.moreButtonRef
    }, {
        v50
    });
end;
local function _(v52) --[[ Line: 186 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v53 = true;
    if v52 ~= l_RetrievalStatus_0.NotStarted then
        v53 = v52 == l_RetrievalStatus_0.Fetching;
    end;
    return v53;
end;
local function _(v55, v56, v57) --[[ Line: 190 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    return v55 == l_RetrievalStatus_0.Failed and not v57 or v56 == l_CentralOverlayType_0.GameDetailMore or v56 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
end;
return v3.connect(function(v59, v60) --[[ Line: 196 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v17 (copy), l_ApiFetchGameDetails_0 (copy), l_GameInfosReducer_0 (copy), l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    local v61 = nil;
    v61 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v60.shouldHydrateLegacyIxp then v17.GetFetchingStatus(v59, v60.universeId) else l_ApiFetchGameDetails_0.GetFetchingStatus(v59, v60.universeId);
    local v62 = v59.Personalization[l_GameInfosReducer_0.key][v60.universeId];
    local l_OverlayType_0 = v59.CentralOverlay.OverlayType;
    local v64 = {
        screenWidth = v59.ScreenSize.X
    };
    local l_v61_0 = v61;
    local v66 = true;
    if l_v61_0 ~= l_RetrievalStatus_0.NotStarted then
        v66 = l_v61_0 == l_RetrievalStatus_0.Fetching;
    end;
    v64.isLoading = v66;
    v64.isDisabled = v61 == l_RetrievalStatus_0.Failed and not v62 or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailMore or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
    return v64;
end, function(v67) --[[ Line: 216 ]]
    -- upvalues: v18 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return {
        openContextualMenu = function(v68, v69, v70, v71) --[[ Line: 218 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v67 (copy), v18 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            v67(v18(v68, v69, v70, nil, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v71 else nil));
        end
    };
end)(v28);
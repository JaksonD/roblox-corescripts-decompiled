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
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v16 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v17 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v20 = UDim2.new(0, 44, 0, 44);
local v21 = UDim2.new(0, 37, 0, 37);
local v22 = l_Images_0["component_assets/circle_17"];
local v23 = Rect.new(8, 8, 9, 9);
local v24 = l_Images_0["icons/menu/more_on"];
local v25 = l_Images_0["icons/menu/more_off"];
local v26 = v1.PureComponent:extend("GameDetailMoreButton");
v26.validateProps = v4.strictInterface({
    universeId = v4.string, 
    leftPadding = v4.number, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v4.optional(v4.boolean) else nil, 
    screenWidth = v4.number, 
    isLoading = v4.boolean, 
    isDisabled = v4.boolean, 
    openContextualMenu = v4.callback, 
    testId = v4.optional(v4.string)
});
v26.getMoreMenuPosition = function(v27) --[[ Line: 58 ]] --[[ Name: getMoreMenuPosition ]]
    local l_screenWidth_0 = v27.props.screenWidth;
    local l_leftPadding_0 = v27.props.leftPadding;
    local l_current_0 = v27.moreButtonRef.current;
    if l_current_0 == nil then
        return UDim2.new(0, 0, 0, 0);
    else
        local v31 = l_current_0.AbsolutePosition.x + l_current_0.AbsoluteSize.x / 2;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v33 = (l_screenWidth_0 - 300) / 2;
        local v34 = nil;
        v34 = l_screenWidth_0 < 600 and 0 or if v31 < l_leftPadding_0 + 150 then l_leftPadding_0 - v33 else v31 - 150 - v33;
        local v35 = l_Y_0 - 15;
        return UDim2.new(0, v34, 0, v35);
    end;
end;
v26.init = function(v36) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    v36.moreButtonRef = v1.createRef();
    v36.deselectMoreButton = function() --[[ Line: 92 ]]
        -- upvalues: v36 (copy)
        v36:setState({
            isMoreButtonSelected = false
        });
    end;
    v36.deselectMoreButton();
    local l_openContextualMenu_0 = v36.props.openContextualMenu;
    v36.onActivated = function() --[[ Line: 102 ]]
        -- upvalues: v36 (copy), l_openContextualMenu_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        local l_universeId_0 = v36.props.universeId;
        if v36.props.isDisabled then
            return;
        else
            v36:setState({
                isMoreButtonSelected = true
            });
            local v39 = v36:getMoreMenuPosition();
            l_openContextualMenu_0(l_universeId_0, v39, v36.deselectMoreButton, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v36.props.shouldHydrateLegacyIxp else nil);
            return;
        end;
    end;
end;
v26.render = function(v40) --[[ Line: 124 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v41) --[[ Line: 125 ]]
        -- upvalues: v40 (copy)
        return v40:renderWithStyle(v41);
    end);
end;
v26.renderWithStyle = function(v42, v43) --[[ Line: 130 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v24 (copy), v25 (copy), v1 (copy), l_Skeleton_0 (copy), l_ImageSetLabel_0 (copy), v21 (copy), l_ImageSetButton_0 (copy), v2 (copy), v20 (copy), v22 (copy), v23 (copy)
    local l_isLoading_0 = v42.props.isLoading;
    local l_isDisabled_0 = v42.props.isDisabled;
    local l_Theme_0 = v43.Theme;
    local v47 = (not not l_isLoading_0 or l_isDisabled_0) and 0.5 or l_Theme_0.BackgroundDefault.Transparency;
    local v48 = nil;
    local v49 = if v42.state.isMoreButtonSelected then v24 else v25;
    v48 = if l_isLoading_0 then v1.createElement(l_Skeleton_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0)
    }) else v1.createElement(l_ImageSetLabel_0, {
        Size = v21, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Image = v49, 
        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
        ImageColor3 = l_Theme_0.IconEmphasis.Color
    });
    return v1.createElement(l_ImageSetButton_0, {
        [v2.Tag] = if v42.props.testId then ("data-testid=%*"):format(v42.props.testId) else nil, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v20, 
        Image = v22, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v23, 
        ImageTransparency = v47, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v1.Event.Activated] = v42.onActivated, 
        [v1.Ref] = v42.moreButtonRef
    }, {
        v48
    });
end;
local function _(v50) --[[ Line: 176 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v51 = true;
    if v50 ~= l_RetrievalStatus_0.NotStarted then
        v51 = v50 == l_RetrievalStatus_0.Fetching;
    end;
    return v51;
end;
local function _(v53, v54, v55) --[[ Line: 180 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    return v53 == l_RetrievalStatus_0.Failed and not v55 or v54 == l_CentralOverlayType_0.GameDetailMore or v54 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
end;
return v3.connect(function(v57, v58) --[[ Line: 186 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v16 (copy), l_ApiFetchGameDetails_0 (copy), l_GameInfosReducer_0 (copy), l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    local v59 = nil;
    v59 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v58.shouldHydrateLegacyIxp then v16.GetFetchingStatus(v57, v58.universeId) else l_ApiFetchGameDetails_0.GetFetchingStatus(v57, v58.universeId);
    local v60 = v57.Personalization[l_GameInfosReducer_0.key][v58.universeId];
    local l_OverlayType_0 = v57.CentralOverlay.OverlayType;
    local v62 = {
        screenWidth = v57.ScreenSize.X
    };
    local l_v59_0 = v59;
    local v64 = true;
    if l_v59_0 ~= l_RetrievalStatus_0.NotStarted then
        v64 = l_v59_0 == l_RetrievalStatus_0.Fetching;
    end;
    v62.isLoading = v64;
    v62.isDisabled = v59 == l_RetrievalStatus_0.Failed and not v60 or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailMore or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
    return v62;
end, function(v65) --[[ Line: 206 ]]
    -- upvalues: v17 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return {
        openContextualMenu = function(v66, v67, v68, v69) --[[ Line: 208 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v65 (copy), v17 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            v65(v17(v66, v67, v68, nil, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v69 else nil));
        end
    };
end)(v26);
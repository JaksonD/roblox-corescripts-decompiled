local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.t);
local l_CentralOverlayType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).CentralOverlayType;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_ApiFetchGameDetails_0 = require(l_CorePackages_0.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_ImageSetButton_0 = v7.Core.ImageSet.ImageSetButton;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v7.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_GameInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameInfosRodux).GameInfosReducer;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v14 = require(l_Modules_0.LuaApp.Thunks.ApiFetchExperienceDetailsPage);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends);
local l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault;
local l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp;
local v18 = UDim2.new(0, 44, 0, 44);
local v19 = UDim2.new(0, 37, 0, 37);
local v20 = Rect.new(8, 8, 9, 9);
local v21 = v1.PureComponent:extend("GameDetailsPlayWithFriendsButton");
v21.validateProps = v3.strictInterface({
    universeId = v3.string, 
    leftPadding = v3.number, 
    shouldHydrateLegacyIxp = if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v3.optional(v3.boolean) else nil, 
    screenWidth = v3.number, 
    isLoading = v3.boolean, 
    isDisabled = v3.boolean, 
    openContextualMenu = v3.callback
});
v21.getMoreMenuPosition = function(v22) --[[ Line: 51 ]] --[[ Name: getMoreMenuPosition ]]
    local l_screenWidth_0 = v22.props.screenWidth;
    local l_leftPadding_0 = v22.props.leftPadding;
    local l_current_0 = v22.moreButtonRef.current;
    if l_current_0 == nil then
        return UDim2.new(0, 0, 0, 0);
    else
        local v26 = l_current_0.AbsolutePosition.X + l_current_0.AbsoluteSize.X / 2;
        local l_Y_0 = l_current_0.AbsolutePosition.Y;
        local v28 = (l_screenWidth_0 - 300) / 2;
        local v29 = nil;
        v29 = l_screenWidth_0 < 600 and 0 or if v26 < l_leftPadding_0 + 150 then l_leftPadding_0 - v28 else v26 - 150 - v28;
        local v30 = l_Y_0 - 15;
        return UDim2.new(0, v29, 0, v30);
    end;
end;
v21.init = function(v31) --[[ Line: 83 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    v31.moreButtonRef = v1.createRef();
    local l_openContextualMenu_0 = v31.props.openContextualMenu;
    v31.onActivated = function() --[[ Line: 88 ]]
        -- upvalues: v31 (copy), l_openContextualMenu_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
        local l_universeId_0 = v31.props.universeId;
        if v31.props.isDisabled then
            return;
        else
            local v34 = v31:getMoreMenuPosition();
            l_openContextualMenu_0(l_universeId_0, v34, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v31.props.shouldHydrateLegacyIxp else nil);
            return;
        end;
    end;
end;
v21.render = function(v35) --[[ Line: 105 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v36) --[[ Line: 106 ]]
        -- upvalues: v35 (copy)
        return v35:renderWithStyle(v36);
    end);
end;
v21.renderWithStyle = function(v37, v38) --[[ Line: 111 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v1 (copy), l_ImageSetButton_0 (copy), v18 (copy), l_Images_0 (copy), v20 (copy), l_ImageSetLabel_0 (copy), v19 (copy)
    local l_Theme_0 = v38.Theme;
    local l_isLoading_0 = v37.props.isLoading;
    local l_isDisabled_0 = v37.props.isDisabled;
    local v42 = (not not l_isLoading_0 or l_isDisabled_0) and 0.5 or l_Theme_0.BackgroundDefault.Transparency;
    return v1.createElement(l_ImageSetButton_0, {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v18, 
        Image = l_Images_0["component_assets/circle_17"], 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v20, 
        ImageTransparency = v42, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = 1, 
        ClipsDescendants = false, 
        [v1.Event.Activated] = v37.onActivated, 
        [v1.Ref] = v37.moreButtonRef
    }, {
        Icon = v1.createElement(l_ImageSetLabel_0, {
            Size = v19, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/actions/friends/friendsplaying"], 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        })
    });
end;
local function _(v43) --[[ Line: 144 ]]
    -- upvalues: l_RetrievalStatus_0 (copy)
    local v44 = true;
    if v43 ~= l_RetrievalStatus_0.NotStarted then
        v44 = v43 == l_RetrievalStatus_0.Fetching;
    end;
    return v44;
end;
local function _(v46, v47, v48) --[[ Line: 148 ]]
    -- upvalues: l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    return v46 == l_RetrievalStatus_0.Failed and not v48 or v47 == l_CentralOverlayType_0.GameDetailMore or v47 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
end;
return v2.connect(function(v50, v51) --[[ Line: 154 ]]
    -- upvalues: l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy), v14 (copy), l_ApiFetchGameDetails_0 (copy), l_GameInfosReducer_0 (copy), l_RetrievalStatus_0 (copy), l_CentralOverlayType_0 (copy)
    local v52 = nil;
    v52 = if not not l_FFlagLuaAppEdpBackendV2HydrateLegacyDefault_0 or l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 and v51.shouldHydrateLegacyIxp then v14.GetFetchingStatus(v50, v51.universeId) else l_ApiFetchGameDetails_0.GetFetchingStatus(v50, v51.universeId);
    local l_OverlayType_0 = v50.CentralOverlay.OverlayType;
    local v54 = v50.Personalization[l_GameInfosReducer_0.key][v51.universeId];
    local v55 = {
        screenWidth = v50.ScreenSize.X
    };
    local l_v52_0 = v52;
    local v57 = true;
    if l_v52_0 ~= l_RetrievalStatus_0.NotStarted then
        v57 = l_v52_0 == l_RetrievalStatus_0.Fetching;
    end;
    v55.isLoading = v57;
    v55.isDisabled = v52 == l_RetrievalStatus_0.Failed and not v54 or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailMore or l_OverlayType_0 == l_CentralOverlayType_0.GameDetailsPlayWithFriends;
    return v55;
end, function(v58) --[[ Line: 173 ]]
    -- upvalues: v15 (copy), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (copy)
    return {
        openContextualMenu = function(v59, v60, v61) --[[ Line: 175 ]] --[[ Name: openContextualMenu ]]
            -- upvalues: v58 (copy), v15 (ref), l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 (ref)
            v58(v15(v59, v60, nil, if l_FFlagLuaAppEdpBackendV2HydrateLegacyIxp_0 then v61 else nil));
        end
    };
end)(v21);
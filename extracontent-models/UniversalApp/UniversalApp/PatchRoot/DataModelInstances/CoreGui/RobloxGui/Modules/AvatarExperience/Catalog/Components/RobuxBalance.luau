local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactNavigation);
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_withNavigation_0 = v8.withNavigation;
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_withSelectionCursorProvider_0 = v11.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v11.App.SelectionImage.CursorKind;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_RobuxBalance_0 = v9.Components.RobuxBalance;
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_Images_0 = v11.App.ImageSet.Images;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v21 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v22 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_withStyle_0 = v11.Style.withStyle;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local l_ImageSetButton_0 = v11.Core.ImageSet.ImageSetButton;
local l_Interactable_0 = v11.Core.Control.Interactable;
local l_ControlState_0 = v11.Core.Control.Enum.ControlState;
local v29 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v30 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v31 = game:DefineFastFlag("RobuxCounterBorderHover", false);
local v32 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)() and game:DefineFastFlag("AXNewRobuxBalanceButton2", false);
local v33 = l_Images_0["component_assets/circle_17"];
local v34 = l_Images_0["component_assets/circle_17_stroke_1"];
local v35 = l_Images_0["icons/common/goldrobux"];
local v36 = v5.PureComponent:extend("RobuxBalance");
local v37 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v38 = require(l_Modules_0.LuaApp.Constants);
local v39 = if v31 then l_Interactable_0 else l_ImageSetButton_0;
v36.defaultProps = {
    LayoutOrder = 1
};
v36.init = function(v40) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v31 (copy)
    if v31 then
        v40.state = {
            hovered = false
        };
    end;
    v40.fetchRobuxBalance = function() --[[ Line: 79 ]]
        -- upvalues: v40 (copy)
        local l_localUserId_0 = v40.props.localUserId;
        local l_networking_0 = v40.props.networking;
        if typeof(l_localUserId_0) == "string" and l_localUserId_0 ~= "" then
            v40.props.requestRobuxInfo(l_networking_0, l_localUserId_0);
        end;
    end;
    v40.openPurchaseRobuxPage = function() --[[ Line: 88 ]]
        -- upvalues: v40 (copy)
        local l_navigation_0 = v40.props.navigation;
        local l_disableIAPEntryPoint_0 = v40.props.disableIAPEntryPoint;
        local l_networking_1 = v40.props.networking;
        v40.props.openPurchaseRobuxPage(l_navigation_0, l_disableIAPEntryPoint_0, l_networking_1);
    end;
end;
v36.didMount = function(v46) --[[ Line: 96 ]] --[[ Name: didMount ]]
    v46.fetchRobuxBalance();
end;
local function _(v47) --[[ Line: 100 ]] --[[ Name: isCatalogPageOpen ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v47.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog;
end;
v36.didUpdate = function(v49, v50, _) --[[ Line: 104 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    if v49.props.localUserId ~= v50.localUserId then
        v49.fetchRobuxBalance();
        return;
    else
        local v52 = v49.props.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog;
        if not (v50.avatarRoute.opaque.name == l_AvatarScreen_0.Catalog) and v52 then
            v49.fetchRobuxBalance();
        end;
        return;
    end;
end;
v36.render = function(v53) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: l_NumberLocalization_0 (copy), v32 (copy), v5 (copy), l_Focusable_0 (copy), l_RobuxBalance_0 (copy), l_withStyle_0 (copy), l_TextService_0 (copy), l_withSelectionCursorProvider_0 (copy), v39 (copy), v33 (copy), v31 (copy), l_ControlState_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v34 (copy), v35 (copy)
    local l_userRobuxBalance_0 = v53.props.userRobuxBalance;
    local l_localization_0 = v53.props.localization;
    local v56 = l_userRobuxBalance_0 and l_NumberLocalization_0.abbreviate(l_userRobuxBalance_0, l_localization_0:GetLocale()) or "-";
    if v32 then
        return v5.createElement(l_Focusable_0[l_RobuxBalance_0], {
            text = v56, 
            onActivated = v53.openPurchaseRobuxPage, 
            ref = v53.props.forwardRef, 
            NextSelectionLeft = v53.props.NextSelectionLeft
        });
    else
        return l_withStyle_0(function(v57) --[[ Line: 136 ]]
            -- upvalues: l_TextService_0 (ref), v56 (copy), l_withSelectionCursorProvider_0 (ref), v53 (copy), v5 (ref), l_Focusable_0 (ref), v39 (ref), v33 (ref), v31 (ref), l_ControlState_0 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v34 (ref), v35 (ref)
            local l_Font_0 = v57.Font;
            local l_Theme_0 = v57.Theme;
            local l_Font_1 = l_Font_0.CaptionHeader.Font;
            local v61 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
            local v62 = 40 + l_TextService_0:GetTextSize(v56, v61, l_Font_1, Vector2.new(1e999, v61)).X + 8;
            return l_withSelectionCursorProvider_0(function(v63) --[[ Line: 148 ]]
                -- upvalues: v53 (ref), v5 (ref), l_Focusable_0 (ref), v39 (ref), v33 (ref), l_Theme_0 (copy), v62 (copy), v31 (ref), l_ControlState_0 (ref), l_CursorKind_0 (ref), l_ImageSetLabel_0 (ref), v34 (ref), v35 (ref), v56 (ref), l_Font_1 (copy), v61 (copy)
                local l_forwardRef_0 = v53.props.forwardRef;
                return v5.createElement(l_Focusable_0[v39], {
                    BackgroundTransparency = 1, 
                    Image = v33, 
                    ImageColor3 = l_Theme_0.BackgroundUIDefault.Color, 
                    ImageTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = Rect.new(8, 8, 9, 9), 
                    Size = UDim2.new(0, v62, 0, 40), 
                    [v5.Event.Activated] = v53.openPurchaseRobuxPage, 
                    [v5.Ref] = l_forwardRef_0, 
                    onStateChanged = v31 and function(_, v66) --[[ Line: 163 ]]
                        -- upvalues: v53 (ref), l_ControlState_0 (ref)
                        v53:setState({
                            hovered = v66 == l_ControlState_0.Hover
                        });
                    end or nil, 
                    NextSelectionLeft = v53.props.NextSelectionLeft, 
                    SelectionImageObject = v63(l_CursorKind_0.RoundedRectNoInset)
                }, {
                    Border = v5.createElement(l_ImageSetLabel_0, {
                        BackgroundTransparency = 1, 
                        Image = v34, 
                        ImageColor3 = if v31 and v53.state.hovered then l_Theme_0.SecondaryOnHover.Color else l_Theme_0.Divider.Color, 
                        ImageTransparency = if v31 and v53.state.hovered then l_Theme_0.SecondaryOnHover.Transparency else l_Theme_0.Divider.Transparency, 
                        ScaleType = Enum.ScaleType.Slice, 
                        SliceCenter = Rect.new(8, 8, 9, 9), 
                        Size = UDim2.new(1, 0, 1, 0)
                    }), 
                    Content = v5.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 1, 0)
                    }, {
                        UIListLayout = v5.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 4)
                        }), 
                        RobuxIcon = v5.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.new(0, 28, 0, 28), 
                            BackgroundTransparency = 1, 
                            Image = v35, 
                            LayoutOrder = 1
                        }), 
                        RobuxInfo = v5.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            BackgroundTransparency = 1, 
                            Text = v56, 
                            Font = l_Font_1, 
                            TextSize = v61, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            LayoutOrder = 2
                        })
                    })
                });
            end);
        end);
    end;
end;
local function v70(v67, _) --[[ Line: 221 ]] --[[ Name: mapStateToProps ]]
    local l_LocalUserId_0 = v67.LocalUserId;
    return {
        localUserId = l_LocalUserId_0, 
        userRobuxBalance = v67.UserRobux[l_LocalUserId_0]
    };
end;
local function v78(v71, _) --[[ Line: 230 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v37 (copy), v38 (copy), v30 (copy), v29 (copy)
    return {
        openPurchaseRobuxPage = function(_, v74, v75) --[[ Line: 232 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v71 (copy), v37 (ref), v38 (ref), v30 (ref)
            if v74 then
                v71(v37(v38.WEBVIEWS_UNAVAILABLE_TOAST));
                return;
            else
                return v71(v30(nil, v75));
            end;
        end, 
        requestRobuxInfo = function(v76, v77) --[[ Line: 240 ]] --[[ Name: requestRobuxInfo ]]
            -- upvalues: v71 (copy), v29 (ref)
            return v71(v29(v76, v77, false));
        end
    };
end;
v36 = l_RoactServices_0.connect({
    localization = v21, 
    networking = v22
})(v36);
v36 = l_RoactAppPolicy_0.connect(function(v79) --[[ Line: 251 ]]
    return {
        disableIAPEntryPoint = v79.getDisableIAPEntryPoint()
    };
end)(v36);
v36 = v23((l_withNavigation_0((v7.connect(v70, v78)(v36)))));
return v5.forwardRef(function(v80, v81) --[[ Line: 263 ]]
    -- upvalues: v5 (copy), v36 (ref), v4 (copy)
    return v5.createElement(v36, v4.Dictionary.join(v80, {
        forwardRef = v81
    }));
end);
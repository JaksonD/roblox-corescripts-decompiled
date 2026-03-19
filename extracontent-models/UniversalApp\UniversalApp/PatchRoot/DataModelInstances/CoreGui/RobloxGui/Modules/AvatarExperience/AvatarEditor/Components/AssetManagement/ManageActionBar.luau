local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.FitFrame);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v9.Focusable;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_withStyle_0 = v7.Style.withStyle;
local l_getPageMargin_0 = v7.App.Container.getPageMargin;
local l_Images_0 = v7.App.ImageSet.Images;
local l_IconButton_0 = v7.App.Button.IconButton;
local l_IconSize_0 = v7.App.ImageSet.Enum.IconSize;
local l_FitTextLabel_0 = v8.FitTextLabel;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement;
local v22 = require(script.Parent.AssetManagementConstants);
local v23 = l_Images_0["icons/actions/edit/edit"];
local v24 = l_Images_0["icons/actions/edit/delete"];
local v25 = v3.PureComponent:extend("ManageActionBar");
v25.validateProps = v5.strictInterface({
    gradientFade = v5.optional(v5.boolean), 
    multiSelect = v5.optional(v5.boolean), 
    selectedOutfits = v5.array(v5.string), 
    deleteOutfit = v5.callback, 
    renameOutfit = v5.callback, 
    bottomPadding = v5.optional(v5.number), 
    ZIndex = v5.integer, 
    NextSelectionUp = v5.optional(v5.table), 
    forwardRef = v5.optional(v5.table), 
    showCustomOutfitNames = v5.boolean, 
    isPortrait = v5.boolean
});
v25.defaultProps = {
    gradientFade = false, 
    multiSelect = false
};
v25.init = function(v26) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_getPageMargin_0 (copy)
    v26.renameButtonRef = v3.createRef();
    v26.deleteButtonRef = v3.createRef();
    local v27, v28 = v3.createBinding(UDim.new(0, 24));
    v26.marginBinding = v27;
    v26.updateMarginBinding = v28;
    v26.absoluteSizeChanged = function(v29) --[[ Line: 83 ]]
        -- upvalues: l_getPageMargin_0 (ref), v26 (copy)
        local v30 = l_getPageMargin_0(v29.AbsoluteSize.X);
        v26.updateMarginBinding(UDim.new(0, v30));
    end;
end;
v25.renderBarItems = function(v31, v32, v33, _) --[[ Line: 90 ]] --[[ Name: renderBarItems ]]
    -- upvalues: v3 (copy), l_FitTextLabel_0 (copy), l_IconButton_0 (copy), v23 (copy), l_IconSize_0 (copy), v24 (copy)
    local v35 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = v31.marginBinding, 
            PaddingRight = v31.marginBinding
        })
    };
    local l_Theme_0 = v33.Theme;
    if v31.props.gradientFade then
        v35.UIGradient = v3.createElement("UIGradient", {
            Rotation = 270, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(0.8, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(1, 1)
            })
        });
    end;
    if v31.props.multiSelect then
        local l_Font_0 = v33.Font.Header2.Font;
        local v38 = v33.Font.BaseSize * v33.Font.Header2.RelativeSize;
        local l_selectItem_0 = v32.selectItem;
        if #v31.props.selectedOutfits > 0 then
            l_selectItem_0 = v32.countSelected;
        end;
        v35.SelectedCountTextLabel = v3.createElement(l_FitTextLabel_0, {
            width = l_FitTextLabel_0.Width.FitToText, 
            BackgroundTransparency = 1, 
            Text = l_selectItem_0, 
            Font = l_Font_0, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            TextColor3 = v33.Theme.TextEmphasis.Color, 
            TextSize = v38
        });
    elseif v31.props.showCustomOutfitNames then
        v35.RenameButton = v3.createElement(l_IconButton_0, {
            anchorPoint = Vector2.new(0, 0.5), 
            position = UDim2.fromScale(0, 0.5), 
            size = UDim2.new(0, 44, 1, 0), 
            icon = v23, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onActivated = v31.props.renameOutfit, 
            buttonRef = v31.renameButtonRef, 
            NextSelectionRight = v31.deleteButtonRef
        });
    end;
    local v40 = #v31.props.selectedOutfits > 0;
    v35.DeleteButton = v3.createElement(l_IconButton_0, {
        anchorPoint = Vector2.new(1, 0.5), 
        position = UDim2.fromScale(1, 0.5), 
        size = UDim2.new(0, 44, 1, 0), 
        icon = v24, 
        iconSize = l_IconSize_0.Medium, 
        iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
        iconTransparency = v40 and l_Theme_0.SystemPrimaryDefault.Transparency or 0.5, 
        onActivated = v40 and v31.props.deleteOutfit or nil, 
        buttonRef = v31.deleteButtonRef, 
        NextSelectionLeft = not v31.props.multiSelect and v31.renameButtonRef or nil
    });
    return v35;
end;
v25.renderWithProviders = function(v41, v42, v43, v44) --[[ Line: 163 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v22 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), v3 (copy), l_Focusable_0 (copy)
    local l_Theme_1 = v43.Theme;
    local l_ActionBarHeight_0 = v22.ActionBarHeight;
    if v41.props.isPortrait then
        l_ActionBarHeight_0 = l_ActionBarHeight_0 + 24;
    end;
    if v41.props.bottomPadding then
        l_ActionBarHeight_0 = l_ActionBarHeight_0 + v41.props.bottomPadding;
    end;
    local v47 = v41:renderBarItems(v42, v43, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v44);
    local l_deleteButtonRef_0 = v41.deleteButtonRef;
    if not v41.props.multiSelect and v41.props.showCustomOutfitNames then
        l_deleteButtonRef_0 = v41.renameButtonRef;
    end;
    local l_forwardRef_0 = v41.props.forwardRef;
    local v50 = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 then v41.props.isPortrait and 24 or if v41.props.bottomPadding then v41.props.bottomPadding else nil else nil;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_ActionBarHeight_0), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = v41.props.ZIndex, 
        [v3.Change.AbsoluteSize] = v41.absoluteSizeChanged, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_deleteButtonRef_0, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v41.props.NextSelectionUp, 
        [v3.Ref] = l_forwardRef_0
    }, {
        Background = v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v22.ActionBarHeight)
        }, v47), 
        GapFiller = if l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 and v50 then v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v50), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }) else if v41.props.isPortrait then v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 24), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }) else nil
    });
end;
v25.render = function(v51) --[[ Line: 235 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v9 (copy)
    return l_withLocalization_0({
        countSelected = {
            "Feature.Avatar.Label.CountSelected"; 
            itemCount = #v51.props.selectedOutfits
        }, 
        selectItem = "Feature.Avatar.Label.SelectItem"
    })(function(v52) --[[ Line: 242 ]]
        -- upvalues: l_withStyle_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v51 (copy), v9 (ref)
        return l_withStyle_0(function(v53) --[[ Line: 243 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v51 (ref), v52 (copy), v9 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v51:renderWithProviders(v52, v53);
            else
                return v9.withFocusController(function(v54) --[[ Line: 247 ]]
                    -- upvalues: v51 (ref), v52 (ref), v53 (copy)
                    return v51:renderWithProviders(v52, v53, v54);
                end);
            end;
        end);
    end);
end;
v25 = l_RoactAppPolicy_0.connect(function(v55, _) --[[ Line: 254 ]]
    return {
        showCustomOutfitNames = v55.getCustomOutfitNames()
    };
end)(v25);
v25 = v4.connect(function(v57, _) --[[ Line: 260 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return {
        isPortrait = v57.DeviceOrientation == l_DeviceOrientationMode_0.Portrait
    };
end, nil)(v25);
return v3.forwardRef(function(v59, v60) --[[ Line: 271 ]]
    -- upvalues: v3 (copy), v25 (ref), v2 (copy)
    return v3.createElement(v25, v2.Dictionary.join(v59, {
        forwardRef = v60
    }));
end);
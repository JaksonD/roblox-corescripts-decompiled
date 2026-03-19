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
local v21 = l_Images_0["icons/actions/edit/edit"];
local v22 = l_Images_0["icons/actions/edit/delete"];
local v23 = v3.PureComponent:extend("ManageActionBar");
v23.validateProps = v5.strictInterface({
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
v23.defaultProps = {
    gradientFade = false, 
    multiSelect = false
};
v23.init = function(v24) --[[ Line: 73 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_getPageMargin_0 (copy)
    v24.renameButtonRef = v3.createRef();
    v24.deleteButtonRef = v3.createRef();
    local v25, v26 = v3.createBinding(UDim.new(0, 24));
    v24.marginBinding = v25;
    v24.updateMarginBinding = v26;
    v24.absoluteSizeChanged = function(v27) --[[ Line: 79 ]]
        -- upvalues: l_getPageMargin_0 (ref), v24 (copy)
        local v28 = l_getPageMargin_0(v27.AbsoluteSize.X);
        v24.updateMarginBinding(UDim.new(0, v28));
    end;
end;
v23.renderBarItems = function(v29, v30, v31, _) --[[ Line: 86 ]] --[[ Name: renderBarItems ]]
    -- upvalues: v3 (copy), l_FitTextLabel_0 (copy), l_IconButton_0 (copy), v21 (copy), l_IconSize_0 (copy), v22 (copy)
    local v33 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = v29.marginBinding, 
            PaddingRight = v29.marginBinding
        })
    };
    local l_Theme_0 = v31.Theme;
    if v29.props.gradientFade then
        v33.UIGradient = v3.createElement("UIGradient", {
            Rotation = 270, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(0.8, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(1, 1)
            })
        });
    end;
    if v29.props.multiSelect then
        local l_Font_0 = v31.Font.Header2.Font;
        local v36 = v31.Font.BaseSize * v31.Font.Header2.RelativeSize;
        local l_selectItem_0 = v30.selectItem;
        if #v29.props.selectedOutfits > 0 then
            l_selectItem_0 = v30.countSelected;
        end;
        v33.SelectedCountTextLabel = v3.createElement(l_FitTextLabel_0, {
            width = l_FitTextLabel_0.Width.FitToText, 
            BackgroundTransparency = 1, 
            Text = l_selectItem_0, 
            Font = l_Font_0, 
            Position = UDim2.fromScale(0, 0.5), 
            AnchorPoint = Vector2.new(0, 0.5), 
            TextColor3 = v31.Theme.TextEmphasis.Color, 
            TextSize = v36
        });
    elseif v29.props.showCustomOutfitNames then
        v33.RenameButton = v3.createElement(l_IconButton_0, {
            anchorPoint = Vector2.new(0, 0.5), 
            position = UDim2.fromScale(0, 0.5), 
            size = UDim2.new(0, 44, 1, 0), 
            icon = v21, 
            iconSize = l_IconSize_0.Medium, 
            iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
            iconTransparency = l_Theme_0.SystemPrimaryDefault.Transparency, 
            onActivated = v29.props.renameOutfit, 
            buttonRef = v29.renameButtonRef, 
            NextSelectionRight = v29.deleteButtonRef
        });
    end;
    local v38 = #v29.props.selectedOutfits > 0;
    v33.DeleteButton = v3.createElement(l_IconButton_0, {
        anchorPoint = Vector2.new(1, 0.5), 
        position = UDim2.fromScale(1, 0.5), 
        size = UDim2.new(0, 44, 1, 0), 
        icon = v22, 
        iconSize = l_IconSize_0.Medium, 
        iconColor3 = l_Theme_0.SystemPrimaryDefault.Color, 
        iconTransparency = v38 and l_Theme_0.SystemPrimaryDefault.Transparency or 0.5, 
        onActivated = v38 and v29.props.deleteOutfit or nil, 
        buttonRef = v29.deleteButtonRef, 
        NextSelectionLeft = not v29.props.multiSelect and v29.renameButtonRef or nil
    });
    return v33;
end;
v23.renderWithProviders = function(v39, v40, v41, v42) --[[ Line: 159 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v3 (copy), l_Focusable_0 (copy)
    local l_Theme_1 = v41.Theme;
    local v44 = 64;
    if v39.props.isPortrait then
        v44 = v44 + 24;
    end;
    if v39.props.bottomPadding then
        v44 = v44 + v39.props.bottomPadding;
    end;
    local v45 = v39:renderBarItems(v40, v41, if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v42);
    local l_deleteButtonRef_0 = v39.deleteButtonRef;
    if not v39.props.multiSelect and v39.props.showCustomOutfitNames then
        l_deleteButtonRef_0 = v39.renameButtonRef;
    end;
    local l_forwardRef_0 = v39.props.forwardRef;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v44), 
        Position = UDim2.fromScale(0, 1), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = v39.props.ZIndex, 
        [v3.Change.AbsoluteSize] = v39.absoluteSizeChanged, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_deleteButtonRef_0, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v39.props.NextSelectionUp, 
        [v3.Ref] = l_forwardRef_0
    }, {
        Background = v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 64)
        }, v45), 
        GapFiller = v39.props.isPortrait and v3.createElement("Frame", {
            BackgroundColor3 = l_Theme_1.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_1.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, 24), 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        })
    });
end;
v23.render = function(v48) --[[ Line: 213 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v9 (copy)
    return l_withLocalization_0({
        countSelected = {
            "Feature.Avatar.Label.CountSelected"; 
            itemCount = #v48.props.selectedOutfits
        }, 
        selectItem = "Feature.Avatar.Label.SelectItem"
    })(function(v49) --[[ Line: 220 ]]
        -- upvalues: l_withStyle_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v48 (copy), v9 (ref)
        return l_withStyle_0(function(v50) --[[ Line: 221 ]]
            -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v48 (ref), v49 (copy), v9 (ref)
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                return v48:renderWithProviders(v49, v50);
            else
                return v9.withFocusController(function(v51) --[[ Line: 225 ]]
                    -- upvalues: v48 (ref), v49 (ref), v50 (copy)
                    return v48:renderWithProviders(v49, v50, v51);
                end);
            end;
        end);
    end);
end;
v23 = l_RoactAppPolicy_0.connect(function(v52, _) --[[ Line: 232 ]]
    return {
        showCustomOutfitNames = v52.getCustomOutfitNames()
    };
end)(v23);
v23 = v4.connect(function(v54, _) --[[ Line: 238 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy)
    return {
        isPortrait = v54.DeviceOrientation == l_DeviceOrientationMode_0.Portrait
    };
end, nil)(v23);
return v3.forwardRef(function(v56, v57) --[[ Line: 249 ]]
    -- upvalues: v3 (copy), v23 (ref), v2 (copy)
    return v3.createElement(v23, v2.Dictionary.join(v56, {
        forwardRef = v57
    }));
end);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_getPageMargin_0 = v3.App.Container.getPageMargin;
local l_ButtonStack_0 = v3.App.Button.ButtonStack;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
return function(v14) --[[ Line: 40 ]] --[[ Name: ResetApplyBar ]]
    -- upvalues: l_useStyle_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_useProperty_0 (copy), l_getPageMargin_0 (copy), v12 (copy), l_ButtonType_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), l_ButtonStack_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v16 = l_useLocalization_0({
        apply = "CommonUI.Messages.Action.Apply", 
        reset = "CommonUI.Messages.Action.Reset"
    });
    local v17 = v2.useRef(nil);
    v17 = v14.frameRef or v17;
    local v18 = l_useProperty_0(v17, "AbsoluteSize");
    local v19 = if v18 then l_getPageMargin_0(v18.X) else 0;
    local v20 = nil;
    if v12() then
        v20 = v2.useMemo(function() --[[ Line: 57 ]]
            -- upvalues: v14 (copy), v16 (copy), l_ButtonType_0 (ref)
            local v21 = {};
            if v14.onReset then
                table.insert(v21, {
                    props = {
                        onActivated = v14.onReset, 
                        text = v16.reset, 
                        isDisabled = not v14.canReset
                    }, 
                    isDefaultChild = v14.onApply == nil
                });
            end;
            if v14.onApply then
                table.insert(v21, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14.onApply, 
                        text = v16.apply, 
                        isDisabled = not v14.canApply
                    }, 
                    isDefaultChild = true
                });
            end;
            return v21;
        end, {
            v14.onApply, 
            v14.onReset, 
            v16, 
            v14.canReset, 
            v14.canApply
        });
    end;
    return v2.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundUIDefault.Transparency, 
        Size = UDim2.new(1, 0, 0, v14.height), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v14.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v14.NextSelectionDown, 
        NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v14.NextSelectionRight, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v14.NextSelectionLeft, 
        ref = v17
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v19), 
            PaddingRight = UDim.new(0, v19), 
            PaddingTop = UDim.new(0, 32)
        }), 
        Gradient = v2.createElement("UIGradient", {
            Rotation = 270, 
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(0.8, l_Theme_0.BackgroundDefault.Transparency), 
                NumberSequenceKeypoint.new(1, 1)
            })
        }), 
        Buttons = v2.createElement(l_ButtonStack_0, {
            isRoactGamepadEnabled = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil, 
            buttons = if v12() then v20 else {
                {
                    props = {
                        onActivated = v14.onReset, 
                        text = v16.reset, 
                        isDisabled = not v14.canReset
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v14.onApply, 
                        text = v16.apply, 
                        isDisabled = not v14.canApply
                    }, 
                    isDefaultChild = true
                }
            }
        })
    });
end;
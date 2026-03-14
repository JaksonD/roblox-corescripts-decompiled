local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_Dialog_0 = v2.Dialog;
local l_Orientation_0 = v2.Enums.Orientation;
return v1.memo(function(v6) --[[ Line: 47 ]] --[[ Name: SduiDialog ]]
    -- upvalues: v1 (copy), l_ButtonVariant_0 (copy), l_Dialog_0 (copy), l_Orientation_0 (copy)
    local v7 = v6.bodyText or v6.bodyComponent;
    local v8 = v1.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v6 (copy)
        if v6.primaryButtonAction then
            v6.primaryButtonAction();
            if v6.primaryButtonSideEffectAction then
                v6.primaryButtonSideEffectAction();
            end;
        end;
    end, {
        v6.primaryButtonAction, 
        v6.primaryButtonSideEffectAction
    });
    local v9 = v1.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v6 (copy)
        if v6.secondaryButtonAction then
            v6.secondaryButtonAction();
            if v6.secondaryButtonSideEffectAction then
                v6.secondaryButtonSideEffectAction();
            end;
        end;
    end, {
        v6.secondaryButtonAction, 
        v6.secondaryButtonSideEffectAction
    });
    local v10 = nil;
    if v6.primaryButtonAction or v6.primaryButtonText or v6.primaryButtonIcon then
        v10 = v10 or {};
        table.insert(v10, {
            testId = "--sdui-dialog-primary-button", 
            variant = l_ButtonVariant_0.Emphasis, 
            text = v6.primaryButtonText, 
            icon = v6.primaryButtonIcon, 
            onActivated = v8, 
            inputDelay = v6.primaryButtonInputDelay
        });
    end;
    if v6.secondaryButtonAction or v6.secondaryButtonText or v6.secondaryButtonIcon then
        v10 = v10 or {};
        table.insert(v10, {
            testId = "--sdui-dialog-secondary-button", 
            variant = l_ButtonVariant_0.Standard, 
            text = v6.secondaryButtonText, 
            icon = v6.secondaryButtonIcon, 
            onActivated = v9, 
            inputDelay = v6.secondaryButtonInputDelay
        });
    end;
    return v1.createElement(l_Dialog_0.Root, {
        size = v6.size, 
        onClose = v6.onClose, 
        disablePortal = v6.disablePortal == nil or v6.disablePortal, 
        hasBackdrop = v6.hasBackdrop == nil or v6.hasBackdrop
    }, {
        DialogTitle = v6.titleText and v1.createElement(l_Dialog_0.Title, {
            text = v6.titleText
        }) or nil, 
        DialogMedia = v6.image and v1.createElement(l_Dialog_0.HeroMedia, {
            media = v6.image, 
            aspectRatio = v6.imageAspectRatio or 1.7777777777777777
        }) or nil, 
        DialogContent = v7 and v1.createElement(l_Dialog_0.Content, {
            LayoutOrder = 2
        }, {
            BodyContent = if v6.bodyComponent then v6.bodyComponent else if v6.bodyText then v1.createElement(l_Dialog_0.Text, {
                Text = v6.bodyText
            }) else nil
        }) or nil, 
        DialogActions = v10 and v1.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 3, 
            actions = v10, 
            label = v6.actionsLabel, 
            orientation = v6.actionsOrientation or l_Orientation_0.Horizontal
        }) or nil
    });
end);
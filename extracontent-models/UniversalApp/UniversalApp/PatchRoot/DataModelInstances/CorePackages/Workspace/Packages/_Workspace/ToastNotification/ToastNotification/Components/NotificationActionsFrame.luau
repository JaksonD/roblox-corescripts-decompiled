local l_Parent_0 = script.Parent.Parent;
local l_context_0 = l_Parent_0.context;
local l_Hooks_0 = l_Parent_0.Hooks;
local l_utils_0 = l_Parent_0.utils;
local v4 = require(l_Parent_0.dependencies);
local l_UIBlox_0 = v4.UIBlox;
local l_useLocalization_0 = v4.Localization.Hooks.useLocalization;
local v7 = require(l_Parent_0.type);
local l_ButtonStack_0 = l_UIBlox_0.App.Button.ButtonStack;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v10 = require(l_Parent_0.constants);
local l_DefaultContentPadding_0 = v10.DefaultContentPadding;
local l_DefaultButtonHeight_0 = v10.DefaultButtonHeight;
local l_Parent_1 = l_Parent_0.Parent;
local v14 = require(l_Parent_1.React);
local l_useFocusGuiObject_0 = require(l_Parent_1.ReactFocusNavigation).useFocusGuiObject;
local v16 = require(l_Parent_1.FocusNavigationUtils);
local l_FocusRoot_0 = v16.FocusRoot;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v16.FocusNavigableSurfaceIdentifierEnum;
local l_getTimerFromCardData_0 = require(l_utils_0.toastNotificationHelper).getTimerFromCardData;
local v20 = require(l_context_0.useNotificationCardState);
local v21 = require(l_context_0.useNotificationCardData);
local v22 = require(l_Hooks_0.useTimeRemainingMap);
local function _(v23) --[[ Line: 32 ]]
    -- upvalues: v7 (copy), l_ButtonType_0 (copy)
    if v23 == v7.SENDERButtonStyleEnum.Growth then
        return l_ButtonType_0.PrimaryContextual;
    elseif v23 == v7.SENDERButtonStyleEnum.Primary then
        return l_ButtonType_0.PrimarySystem;
    elseif v23 == v7.SENDERButtonStyleEnum.Secondary then
        return l_ButtonType_0.Secondary;
    elseif v23 == v7.SENDERButtonStyleEnum.Alert then
        return l_ButtonType_0.Alert;
    else
        return l_ButtonType_0.Secondary;
    end;
end;
local function v40(v25, v26, v27, v28) --[[ Line: 46 ]]
    -- upvalues: v21 (copy), l_getTimerFromCardData_0 (copy), v22 (copy), v7 (copy), l_ButtonType_0 (copy)
    local v29 = v21();
    local v30 = nil;
    local v31 = {};
    for _, v33 in ipairs(v25) do
        if v33.timer and v33.timer.showTimeOnElement then
            v31[v33.timer.showTimeOnElement] = l_getTimerFromCardData_0(v29, v33.timer.showTimeOnElement);
        end;
    end;
    v30 = v22(v31, v29);
    local v34 = {};
    if v25 then
        for _, v36 in ipairs(v25) do
            local v37 = nil;
            v37 = if v36 and v36.timer and v36.timer.showTimeOnElement then ("%* (%*%*)"):format(v36.label.text, v30[v36.timer.showTimeOnElement], v26.secondsAbbreviated) else v36 and v36.label and v36.label.text or "";
            local l_buttonStyle_0 = v36.buttonStyle;
            local v39 = if l_buttonStyle_0 == v7.SENDERButtonStyleEnum.Growth then l_ButtonType_0.PrimaryContextual else if l_buttonStyle_0 == v7.SENDERButtonStyleEnum.Primary then l_ButtonType_0.PrimarySystem else if l_buttonStyle_0 == v7.SENDERButtonStyleEnum.Secondary then l_ButtonType_0.Secondary else if l_buttonStyle_0 == v7.SENDERButtonStyleEnum.Alert then l_ButtonType_0.Alert else l_ButtonType_0.Secondary;
            table.insert(v34, {
                buttonType = v39, 
                props = {
                    text = v37, 
                    onActivated = function() --[[ Line: 80 ]] --[[ Name: onActivated ]]
                        -- upvalues: v27 (copy), v36 (copy)
                        if v27 then
                            v27(v36);
                        end;
                    end, 
                    buttonRef = if v39 == l_ButtonType_0.PrimaryContextual then v28 else nil
                }
            });
        end;
    end;
    return v34;
end;
return function(v41) --[[ Line: 98 ]]
    -- upvalues: v20 (copy), v21 (copy), l_useLocalization_0 (copy), v14 (copy), l_useFocusGuiObject_0 (copy), v40 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_ButtonStack_0 (copy), l_DefaultButtonHeight_0 (copy), l_DefaultContentPadding_0 (copy)
    local v42 = v20("button");
    local l_handleActions_0 = v21().handleActions;
    local v44 = l_useLocalization_0({
        secondsAbbreviated = "Feature.Notifications.Label.SecondsAbbreviated"
    });
    local l_shouldAutoFocus_0 = v41.shouldAutoFocus;
    local v46 = v14.useRef(nil);
    local v47 = l_useFocusGuiObject_0();
    v14.useEffect(function() --[[ Line: 111 ]]
        -- upvalues: l_shouldAutoFocus_0 (copy), v46 (copy), v47 (copy)
        if not l_shouldAutoFocus_0 then
            return;
        else
            local l_current_0 = v46.current;
            if not l_current_0 then
                return;
            else
                v47(l_current_0);
                return function() --[[ Line: 123 ]]
                    -- upvalues: v47 (ref)
                    v47(nil);
                end;
            end;
        end;
    end, {
        l_shouldAutoFocus_0, 
        v47
    });
    local v49 = v40(v42, v44, l_handleActions_0, v46);
    if #v49 > 0 then
        return (v14.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, {
            FocusRoot = v14.createElement(l_FocusRoot_0, {
                surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
                isIsolated = true, 
                isFocusable = l_shouldAutoFocus_0, 
                isAutoFocusRoot = l_shouldAutoFocus_0
            }, {
                ActionButtons = v49 and v14.createElement(l_ButtonStack_0, {
                    buttonHeight = l_DefaultButtonHeight_0, 
                    buttons = v49, 
                    marginBetween = l_DefaultContentPadding_0
                })
            })
        }));
    else
        return nil;
    end;
end;
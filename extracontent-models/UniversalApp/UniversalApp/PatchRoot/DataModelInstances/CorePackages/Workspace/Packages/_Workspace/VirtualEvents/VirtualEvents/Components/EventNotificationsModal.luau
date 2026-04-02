local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useSelector_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigation_0 = require(l_script_FirstAncestor_0.Parent.Navigation).useNavigation;
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local l_dependencyArray_0 = require(l_script_FirstAncestor_0.Parent.RoactUtils).Hooks.dependencyArray;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_PartialPageModal_0 = v2.App.Dialog.Modal.PartialPageModal;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local v12 = UDim.new(0, 24);
local v13 = UDim.new(0, 12);
local function v15(v14) --[[ Line: 21 ]] --[[ Name: selectScreenSize ]]
    return v14.ScreenSize;
end;
return function(v16) --[[ Line: 30 ]] --[[ Name: EventNotificationsModal ]]
    -- upvalues: l_useStyle_0 (copy), l_useNavigation_0 (copy), l_useSelector_0 (copy), v15 (copy), l_useLocalization_0 (copy), v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), v12 (copy), v13 (copy), l_StyledTextLabel_0 (copy)
    local v17 = l_useStyle_0();
    local v18 = l_useNavigation_0();
    local v19 = l_useSelector_0(v15);
    local v20 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EnableNotificationsModalTitle", 
        body = "Feature.VirtualEvents.EnableNotificationsModalBody", 
        notNow = "Feature.VirtualEvents.NotNowButton", 
        getNotified = "Feature.VirtualEvents.GetNotifiedButton"
    });
    local v21 = v1.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v16 (copy), v18 (copy)
        if v16.onClose then
            v16.onClose();
        end;
        v18.goBack();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16.onClose, 
        v18
    } else l_dependencyArray_0(v16.onClose, v18));
    local v22 = v1.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v16 (copy), v21 (copy)
        if v16.onConfirm then
            v16.onConfirm();
        end;
        v21();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v16.onConfirm, 
        v21
    } else l_dependencyArray_0(v16.onConfirm, v21));
    return v1.createElement(l_PartialPageModal_0, {
        position = UDim2.fromScale(0.5, 0.5), 
        anchorPoint = Vector2.new(0.5, 0.5), 
        title = v20.title, 
        screenSize = v19, 
        buttonStackProps = {
            buttons = {
                {
                    buttonType = l_ButtonType_0.Secondary, 
                    props = {
                        onActivated = v21, 
                        text = v20.notNow
                    }
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v22, 
                        text = v20.getNotified
                    }
                }
            }
        }, 
        contentPadding = v12, 
        onCloseClicked = v21
    }, {
        Wrapper = v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = v13
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = v13 + v13, 
                PaddingBottom = v13
            }), 
            Body = v1.createElement(l_StyledTextLabel_0, {
                text = v20.body, 
                textXAlignment = Enum.TextXAlignment.Center, 
                fontStyle = v17.Font.Body, 
                colorStyle = v17.Theme.TextMuted, 
                size = UDim2.fromScale(1, 0), 
                automaticSize = Enum.AutomaticSize.Y, 
                fluidSizing = false
            })
        })
    });
end;
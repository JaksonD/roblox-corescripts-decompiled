local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.Foundation);
local l_Button_0 = v4.Button;
local l_View_0 = v4.View;
local l_Text_0 = v4.Text;
local l_ButtonVariant_0 = v4.Enums.ButtonVariant;
local l_InputSize_0 = v4.Enums.InputSize;
local l_ModalWindow_0 = v3.App.Dialog.Modal.ModalWindow;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_IconButton_0 = v4.IconButton;
local l_IconSize_0 = v4.Enums.IconSize;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_CrossDeviceLogin_0 = require(l_Parent_0.AuthCommon).Thunks.CrossDeviceLogin;
local l_MagicLoginPhaseType_0 = require(l_script_FirstAncestor_0.Enums).MagicLoginPhaseType;
local l_SetMagicLoginAdvertisement_0 = require(l_script_FirstAncestor_0.Thunks).SetMagicLoginAdvertisement;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v21) --[[ Line: 34 ]] --[[ Name: MagicLoginApprovePopup ]]
    -- upvalues: v2 (copy), l_MagicLoginPhaseType_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_SetMagicLoginAdvertisement_0 (copy), l_CrossDeviceLogin_0 (copy), l_Logger_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_ModalWindow_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v22, v23 = v2.useState(v21.phase or l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL);
    local v24, v25 = v2.useState("If you still want to sign in, try again from your other device.");
    local v26, v27 = v2.useState({});
    local v28, v29 = v2.useState(false);
    local v30, v31 = v2.useState(false);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 42 ]]
        return v32.ScreenSize;
    end);
    local v34 = l_useDispatch_0();
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = {};
    v2.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: l_SetMagicLoginAdvertisement_0 (ref)
        l_SetMagicLoginAdvertisement_0(false);
        return function() --[[ Line: 52 ]]
            -- upvalues: l_SetMagicLoginAdvertisement_0 (ref)
            l_SetMagicLoginAdvertisement_0(true);
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v21 (copy), v27 (copy)
        local v37 = {};
        local v38 = {};
        math.randomseed(os.time());
        local v39 = math.random(1, 3);
        v37[v21.authenticationDigits] = true;
        for v40 = 1, 3 do
            if v40 == v39 then
                table.insert(v38, v21.authenticationDigits);
            else
                local v41 = nil;
                repeat
                    v41 = tostring(math.random(10, 99));
                until not v37[v41];
                v37[v41] = true;
                table.insert(v38, v41);
            end;
        end;
        v27(v38);
    end, {
        v21.authenticationDigits
    });
    local v44 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v29 (copy), l_CrossDeviceLogin_0 (ref), v35 (copy), v21 (copy), v34 (copy), v23 (copy), l_MagicLoginPhaseType_0 (ref), l_Logger_0 (ref)
        v29(true);
        l_CrossDeviceLogin_0.EnterCode(v35, v21.authCode)(v34):andThen(function(v42) --[[ Line: 81 ]]
            -- upvalues: v23 (ref), l_MagicLoginPhaseType_0 (ref), v29 (ref)
            if v42 and v42.DeviceInfo then
                v23(l_MagicLoginPhaseType_0.MATCH_CHALLENGE);
            else
                v23(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
            end;
            v29(false);
        end, function(v43) --[[ Line: 88 ]]
            -- upvalues: l_Logger_0 (ref), v23 (ref), l_MagicLoginPhaseType_0 (ref), v29 (ref)
            l_Logger_0:warning("Magic login enter code failed: " .. tostring(v43));
            v23(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
            v29(false);
        end);
    end, {
        v21.authCode
    });
    local v47 = v2.useCallback(function() --[[ Line: 95 ]]
        -- upvalues: v29 (copy), l_CrossDeviceLogin_0 (ref), v35 (copy), v21 (copy), v34 (copy), l_Logger_0 (ref)
        v29(true);
        l_CrossDeviceLogin_0.CancelLoginCode(v35, v21.authCode)(v34):andThen(function(_) --[[ Line: 97 ]]
            -- upvalues: v29 (ref)
            v29(false);
        end, function(v46) --[[ Line: 99 ]]
            -- upvalues: l_Logger_0 (ref), v29 (ref)
            l_Logger_0:warning("Magic login cancel failed: " .. tostring(v46));
            v29(false);
        end);
        if v21.closeCentralOverlayThunk then
            v34(v21.closeCentralOverlayThunk());
        end;
    end, {
        v21.authCode, 
        v28
    });
    local v50 = v2.useCallback(function(v48) --[[ Line: 108 ]]
        -- upvalues: v31 (copy), v21 (copy), l_CrossDeviceLogin_0 (ref), v35 (copy), v34 (copy), v23 (copy), l_MagicLoginPhaseType_0 (ref), l_Logger_0 (ref), v25 (copy)
        v31(true);
        if v48 == v21.authenticationDigits then
            l_CrossDeviceLogin_0.ConfirmDeviceAccess(v35, v21.authCode)(v34):andThen(function() --[[ Line: 111 ]]
                -- upvalues: v23 (ref), l_MagicLoginPhaseType_0 (ref)
                v23(l_MagicLoginPhaseType_0.SUCCESS);
            end, function(v49) --[[ Line: 113 ]]
                -- upvalues: l_Logger_0 (ref), v23 (ref), l_MagicLoginPhaseType_0 (ref), v31 (ref)
                l_Logger_0:warning("Magic login confirm failed: " .. tostring(v49));
                v23(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
                v31(false);
            end);
            return;
        else
            v25("The number you selected does not match the number on your other device. If you still want to sign in, try again from your other device.");
            v23(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
            v31(false);
            l_CrossDeviceLogin_0.CancelLoginCode(v35, v21.authCode)(v34);
            return;
        end;
    end, {
        v21.authCode, 
        v21.authenticationDigits
    });
    local v51 = v2.useCallback(function() --[[ Line: 128 ]]
        -- upvalues: v34 (copy), v21 (copy), v22 (copy), l_MagicLoginPhaseType_0 (ref), l_CrossDeviceLogin_0 (ref), v35 (copy)
        v34(v21.closeCentralOverlayThunk());
        if v22 == l_MagicLoginPhaseType_0.MATCH_CHALLENGE then
            l_CrossDeviceLogin_0.CancelLoginCode(v35, v21.authCode)(v34);
        end;
    end, {
        v21.closeCentralOverlayThunk, 
        v21.authCode, 
        v22
    });
    local v54 = v2.useCallback(function() --[[ Line: 135 ]]
        -- upvalues: v2 (ref), l_Button_0 (ref), v26 (copy), l_ButtonVariant_0 (ref), v50 (copy), v30 (copy), l_InputSize_0 (ref)
        local v52 = {};
        for v53 = 1, 3 do
            table.insert(v52, v2.createElement(l_Button_0, {
                text = tostring(v26[v53]), 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = function() --[[ Line: 143 ]] --[[ Name: onActivated ]]
                    -- upvalues: v50 (ref), v26 (ref), v53 (copy)
                    v50(v26[v53]);
                end, 
                isLoading = v30, 
                size = l_InputSize_0.Large, 
                width = UDim.new(0.315, 1), 
                LayoutOrder = 0
            }));
        end;
        return v52;
    end, {
        v26, 
        v30
    });
    if v22 == l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL then
        v36 = {
            TitleText = v2.createElement(l_Text_0, {
                Text = "Trying to sign in from another device?", 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left ", 
                LayoutOrder = 0
            }), 
            DescriptionText = v2.createElement(l_Text_0, {
                Text = string.format("Someone is requesting to sign in on <b>%s (%s)</b>. If it's you, press Yes to continue.", v21.endpointName, v21.endpointType), 
                RichText = true, 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            PositiveButton = v2.createElement(l_Button_0, {
                text = "Yes", 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = v44, 
                isLoading = v28, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 1), 
                LayoutOrder = 2
            }), 
            NegativeButton = v2.createElement(l_Button_0, {
                text = "No", 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = v47, 
                isLoading = v28, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 1), 
                LayoutOrder = 3
            })
        };
    elseif v22 == l_MagicLoginPhaseType_0.MATCH_CHALLENGE then
        v36 = {
            TitleText = v2.createElement(l_Text_0, {
                Text = "Which number do you see on your other device?", 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge", 
                LayoutOrder = 0
            }), 
            DescriptionText = v2.createElement(l_Text_0, {
                Text = string.format("Click the number that matches what is shown on <b>%s (%s)</b>.", v21.endpointName, v21.endpointType), 
                RichText = true, 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            ButtonContainer = v2.createElement(l_View_0, {
                tag = "row gap-small auto-y size-full-0", 
                LayoutOrder = 2
            }, (v54()))
        };
    elseif v22 == l_MagicLoginPhaseType_0.SUCCESS then
        v36 = {
            TitleText = v2.createElement(l_Text_0, {
                Text = string.format("You're signed in on %s", v21.endpointName), 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge", 
                LayoutOrder = 0
            }), 
            DescriptionText = v2.createElement(l_Text_0, {
                Text = "Feel free to explore Roblox.", 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            DoneButton = v2.createElement(l_Button_0, {
                text = "Done", 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = v51, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 1), 
                LayoutOrder = 2
            })
        };
    elseif v22 == l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED then
        v36 = {
            TitleText = v2.createElement(l_Text_0, {
                Text = "Couldn't sign you in", 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge", 
                LayoutOrder = 0
            }), 
            DescriptionText = v2.createElement(l_Text_0, {
                Text = v24, 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            OkayButton = v2.createElement(l_Button_0, {
                text = "Okay", 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = v51, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 1), 
                LayoutOrder = 2
            })
        };
    end;
    return v2.createElement(l_View_0, {
        tag = "size-full bg-action-alert padding-large"
    }, {
        ContentModal = v2.createElement(l_ModalWindow_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            isFullHeight = false, 
            screenSize = v33 + Vector2.new(-30, 0), 
            anchorPoint = Vector2.new(0.5, 0.5)
        }, {
            OverlayContent = v2.createElement(l_View_0, {
                tag = "auto-y size-full-0"
            }, {
                CloseButtonContainer = if v22 == l_MagicLoginPhaseType_0.MATCH_CHALLENGE then v2.createElement(l_View_0, {
                    tag = "auto-xy position-top-right padding-large anchor-top-right"
                }, {
                    CloseButton = v2.createElement(l_IconButton_0, {
                        size = l_IconSize_0.Medium, 
                        icon = "icons/navigation/close", 
                        onActivated = v51, 
                        tag = ""
                    })
                }) else nil, 
                ContentContainer = v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 padding-xxlarge"
                }, v36)
            })
        })
    });
end;
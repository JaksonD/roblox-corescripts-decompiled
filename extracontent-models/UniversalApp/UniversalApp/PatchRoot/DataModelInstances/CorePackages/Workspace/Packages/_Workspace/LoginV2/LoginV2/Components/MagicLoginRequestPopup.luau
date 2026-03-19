local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_AccountService_0 = game:GetService("AccountService");
local l_game_EngineFeature_0 = game:GetEngineFeature("MagicLogin");
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_Parent_0.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_ModalWindow_0 = v5.App.Dialog.Modal.ModalWindow;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_IconButton_0 = v6.IconButton;
local l_IconSize_0 = v6.Enums.IconSize;
local l_Button_0 = v6.Button;
local l_ButtonVariant_0 = v6.Enums.ButtonVariant;
local l_InputSize_0 = v6.Enums.InputSize;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_CrossDeviceLogin_0 = require(l_Parent_0.AuthCommon).Thunks.CrossDeviceLogin;
local l_PollMagicLoginStatus_0 = require(l_script_FirstAncestor_0.Thunks).PollMagicLoginStatus;
local l_HttpService_0 = game:GetService("HttpService");
local v22 = require(script.Parent.Constants);
local l_MagicLoginPhaseType_0 = require(l_script_FirstAncestor_0.Enums).MagicLoginPhaseType;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
return function(v25) --[[ Line: 38 ]] --[[ Name: MagicLoginRequestPopup ]]
    -- upvalues: v4 (copy), l_MagicLoginPhaseType_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_PollMagicLoginStatus_0 (copy), l_CrossDeviceLogin_0 (copy), l_AccountService_0 (copy), l_game_EngineFeature_0 (copy), l_HttpService_0 (copy), v22 (copy), l_Logger_0 (copy), l_Text_0 (copy), l_View_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_ModalWindow_0 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v26, v27 = v4.useState("");
    local v28, v29 = v4.useState(l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL);
    local v30, v31 = v4.useState(nil);
    local v33 = l_useSelector_0(function(v32) --[[ Line: 42 ]]
        return v32.ScreenSize;
    end);
    local v34 = l_useDispatch_0();
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = v4.useRef(true);
    local function _(v37, v38) --[[ Line: 49 ]]
        -- upvalues: v34 (copy), l_PollMagicLoginStatus_0 (ref), v35 (copy), v36 (copy), v25 (copy), v29 (copy), l_MagicLoginPhaseType_0 (ref)
        v34(l_PollMagicLoginStatus_0(v35, v37, v38, v36, v25.launchApp, function() --[[ Line: 50 ]]
            -- upvalues: v29 (ref), l_MagicLoginPhaseType_0 (ref)
            v29(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
        end));
    end;
    local v40 = v4.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v34 (copy), v25 (copy), v28 (copy), l_MagicLoginPhaseType_0 (ref), l_CrossDeviceLogin_0 (ref), v35 (copy), v30 (copy)
        v34(v25.closeCentralOverlayThunk());
        if v28 == l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL then
            l_CrossDeviceLogin_0.CancelLoginCode(v35, v30)(v34);
        end;
    end, {
        v25.closeCentralOverlayThunk, 
        v30, 
        v28
    });
    v4.useEffect(function() --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v34 (copy), l_CrossDeviceLogin_0 (ref), v35 (copy), v36 (copy), l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), l_HttpService_0 (ref), v22 (ref), v25 (copy), v31 (copy), l_PollMagicLoginStatus_0 (ref), v29 (copy), l_MagicLoginPhaseType_0 (ref), l_Logger_0 (ref)
        math.randomseed(os.time());
        local v41 = tostring(math.random(10, 99));
        v27(v41);
        v34(l_CrossDeviceLogin_0.FetchDeviceCode(v35)):andThen(function(v42) --[[ Line: 68 ]]
            -- upvalues: v36 (ref), l_AccountService_0 (ref), l_game_EngineFeature_0 (ref), l_HttpService_0 (ref), v22 (ref), v25 (ref), v41 (copy), v31 (ref), v34 (ref), l_PollMagicLoginStatus_0 (ref), v35 (ref), v29 (ref), l_MagicLoginPhaseType_0 (ref)
            if v36.current then
                if l_AccountService_0 and l_game_EngineFeature_0 then
                    local v43 = l_HttpService_0:JSONEncode({
                        magicLoginActionKey = v22.REQUEST_CONNECTION, 
                        endpointId = v25.endpointId, 
                        code = v42.DeviceCode, 
                        authenticationDigits = v41
                    });
                    l_AccountService_0:MagicLogin(v43);
                end;
                v31(v42.DeviceCode);
                local l_DeviceCode_0 = v42.DeviceCode;
                local l_PrivateKey_0 = v42.PrivateKey;
                v34(l_PollMagicLoginStatus_0(v35, l_DeviceCode_0, l_PrivateKey_0, v36, v25.launchApp, function() --[[ Line: 50 ]]
                    -- upvalues: v29 (ref), l_MagicLoginPhaseType_0 (ref)
                    v29(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
                end));
            end;
        end):catch(function(v46) --[[ Line: 83 ]]
            -- upvalues: v36 (ref), l_Logger_0 (ref), v29 (ref), l_MagicLoginPhaseType_0 (ref)
            if v36.current then
                l_Logger_0:warning("Magic login Failed : " .. v46);
                v29(l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED);
            end;
        end);
        return function() --[[ Line: 90 ]]
            -- upvalues: v36 (ref)
            v36.current = false;
        end;
    end, {});
    local v47 = {};
    if v28 == l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL then
        v47 = {
            TitleText = v4.createElement(l_Text_0, {
                Text = string.format("Check your %s", v25.endpointType), 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge", 
                LayoutOrder = 0
            }), 
            DescriptionText = v4.createElement(l_Text_0, {
                Text = string.format("A request has been sent to <b>%s (%s)</b>. Approve the request by tapping yes, then tap the following number on your device.", v25.endpointName, v25.endpointType), 
                RichText = true, 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            NumberContainer = v4.createElement(l_View_0, {
                tag = "auto-y size-full-0 position-center-center padding-xxlarge bg-action-alert radius-medium", 
                LayoutOrder = 2
            }, {
                NumberText = v4.createElement(l_Text_0, {
                    Text = v26, 
                    tag = "auto-y size-full-0 text-display-small text-wrap text-align-x-center"
                })
            })
        };
    elseif v28 == l_MagicLoginPhaseType_0.ERROR_OR_EXPIRED then
        v47 = {
            TitleText = v4.createElement(l_Text_0, {
                Text = "Couldn't sign you in", 
                tag = "auto-xy text-heading-large text-wrap text-align-x-left padding-right-xxlarge", 
                LayoutOrder = 0
            }), 
            DescriptionText = v4.createElement(l_Text_0, {
                Text = "If you still want to sign in, try again.", 
                tag = "auto-xy text-body-large text-wrap text-align-x-left", 
                LayoutOrder = 1
            }), 
            OkayButton = v4.createElement(l_Button_0, {
                text = "Okay", 
                variant = l_ButtonVariant_0.Emphasis, 
                onActivated = v40, 
                size = l_InputSize_0.Medium, 
                width = UDim.new(1, 1), 
                LayoutOrder = 2
            })
        };
    end;
    return v4.createElement(l_View_0, {
        tag = "size-full bg-action-alert padding-large"
    }, {
        ContentModal = v4.createElement(l_ModalWindow_0, {
            position = UDim2.new(0.5, 0, 0.5, 0), 
            isFullHeight = false, 
            screenSize = v33 + Vector2.new(-30, 0), 
            anchorPoint = Vector2.new(0.5, 0.5)
        }, {
            OverlayContent = v4.createElement(l_View_0, {
                tag = "auto-y size-full-0"
            }, {
                VisibilityText = v4.createElement(l_Text_0, {
                    Text = "", 
                    tag = "size-full-0 text-body"
                }), 
                CloseButtonContainer = if v28 == l_MagicLoginPhaseType_0.WAITING_FOR_APPROVAL then v4.createElement(l_View_0, {
                    tag = "auto-xy position-top-right padding-large anchor-top-right"
                }, {
                    CloseButton = v4.createElement(l_IconButton_0, {
                        size = l_IconSize_0.Medium, 
                        icon = "icons/navigation/close", 
                        onActivated = v40, 
                        tag = ""
                    })
                }) else nil, 
                ContentContainer = v4.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 padding-xxlarge"
                }, v47)
            })
        })
    });
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("PhoneUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRef_0 = v2.useRef;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_Images_0 = v3.App.ImageSet.Images;
local v10 = require(l_Parent_0.Cryo);
local l_PostUserOptIn_0 = require(l_Parent_0.VoiceChat).PostUserOptIn;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
local v14 = require(l_Parent_0.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v14.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v14.FocusNavigableSurfaceIdentifierEnum;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v18 = require(l_Parent_0.ToastRodux);
local l_SetCurrentToastMessage_0 = v18.Actions.SetCurrentToastMessage;
local v20 = require(l_script_FirstAncestor_0.Http.Requests.PostUpsellTrialOptIn);
local v21 = {};
local function v28(v22, v23, v24, v25, v26) --[[ Line: 32 ]] --[[ Name: getButtonStackProps ]]
    -- upvalues: l_ButtonType_0 (copy)
    local v27 = {
        {
            buttonType = l_ButtonType_0.PrimarySystem, 
            props = {
                onActivated = v24, 
                text = v22
            }
        }
    };
    if v25 and v25 ~= "" then
        table.insert(v27, 1, {
            buttonType = l_ButtonType_0.Secondary, 
            props = {
                onActivated = v26, 
                text = v25
            }
        });
    end;
    return {
        buttonHeight = v23, 
        buttons = v27
    };
end;
return function(v29) --[[ Line: 64 ]] --[[ Name: VoiceTrialUpsell ]]
    -- upvalues: v10 (copy), v21 (copy), l_useDispatch_0 (copy), l_useRef_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_PostUserOptIn_0 (copy), v20 (copy), l_SetCurrentToastMessage_0 (copy), v18 (copy), l_Images_0 (copy), v2 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_InteractiveAlert_0 (copy), v28 (copy)
    local v30 = v10.Dictionary.union(v21, v29);
    local v31 = {
        titleKey = "Feature.VerificationUpsell.Heading.TryVoiceChat", 
        descriptionKey = "Feature.VerificationUpsell.Description.VoiceLegalConsent2", 
        buttonKey = "Feature.VerificationUpsell.Action.TurnOn", 
        extraButtonKey = "Feature.VerificationUpsell.Action.NotNow.2"
    };
    local v32 = l_useDispatch_0();
    local v33 = l_useRef_0(nil);
    local v34 = l_useStyle_0();
    local l_BaseSize_0 = v34.Font.BaseSize;
    local v36 = l_useLocalization_0(v31);
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local function v39() --[[ Line: 81 ]] --[[ Name: handleTurnOn ]]
        -- upvalues: v30 (copy), l_PostUserOptIn_0 (ref), v37 (copy), v20 (ref), v32 (copy), l_SetCurrentToastMessage_0 (ref), v18 (ref), l_Images_0 (ref), v34 (copy)
        v30.onClose();
        l_PostUserOptIn_0(v37, true, false):andThen(function(_) --[[ Line: 84 ]]
            -- upvalues: v20 (ref), v37 (ref), v30 (ref)
            return v20(v37, v30.upsellCardType);
        end):andThen(function() --[[ Line: 87 ]]
            -- upvalues: v32 (ref), l_SetCurrentToastMessage_0 (ref), v18 (ref), l_Images_0 (ref), v34 (ref), v30 (ref)
            v32(l_SetCurrentToastMessage_0({
                toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatTurnedOn", 
                isLocalized = false, 
                toastType = v18.Enums.ToastType.SuccessConfirmation, 
                toastIcon = l_Images_0["icons/status/success_large"], 
                toastIconColorStyle = {
                    Color = v34.Tokens.Global.Color.Green.Color3
                }, 
                slideIn = true
            }));
            v30.onCompletion();
        end):catch(function() --[[ Line: 100 ]]
            -- upvalues: v32 (ref), l_SetCurrentToastMessage_0 (ref), v18 (ref), v34 (ref)
            v32(l_SetCurrentToastMessage_0({
                toastMessage = "Feature.VerificationUpsell.Heading.VoiceChatJoinFailed", 
                isLocalized = false, 
                toastType = v18.Enums.ToastType.NetworkingError, 
                toastIconColorStyle = {
                    Color = v34.Tokens.Global.Color.Red.Color3
                }, 
                slideIn = true
            }));
        end);
    end;
    return v2.createElement(l_FocusNavigableSurfaceWrapper_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.PopUp, 
        isIsolated = true, 
        frameProps = {
            ref = v33
        }
    }, {
        Modal = v2.createElement(l_InteractiveAlert_0, {
            title = v36.titleKey, 
            screenSize = if v33 and v33.current then v33.current.AbsoluteSize else Vector2.new(500, 500), 
            buttonStackInfo = v28(v36.buttonKey, v34.Tokens.Global.Size_600, v39, v36.extraButtonKey, v30.onClose), 
            onCloseClicked = v30.onClose, 
            middleContent = function() --[[ Line: 132 ]] --[[ Name: middleContent ]]
                -- upvalues: v2 (ref), v36 (copy), l_BaseSize_0 (copy), v34 (copy)
                return v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 0, 0)
                }, {
                    BodyText = v2.createElement("TextLabel", {
                        LayoutOrder = 0, 
                        BackgroundTransparency = 1, 
                        Text = v36.descriptionKey, 
                        TextSize = l_BaseSize_0, 
                        TextColor3 = v34.Theme.TextDefault.Color, 
                        TextTransparency = v34.Theme.TextDefault.Transparency, 
                        Font = v34.Font.Body.Font, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextWrapped = true, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        RichText = true
                    })
                });
            end
        })
    });
end;
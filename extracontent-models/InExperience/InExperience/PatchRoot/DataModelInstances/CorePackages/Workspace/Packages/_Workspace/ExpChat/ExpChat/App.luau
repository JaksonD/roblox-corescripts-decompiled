local l_TextChatService_0 = game:GetService("TextChatService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(script.Parent.Localization);
local v6 = require(script.Parent.GameLocalization);
local v7 = require(script.Parent.AppContainer);
local v8 = require(script.Parent.createStore);
local v9 = game:DefineFastFlag("ExpChatReconcileOnAgeVerifiedChange", false);
local v10 = if v9 then require(script.Parent.ExpChatEventReceiver) else nil;
local v11 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatTelemetryEventTrigger);
local v12 = v3.Component:extend("App");
local v13 = v8();
v12.defaultProps = {
    isChatWindowVisible = true, 
    isChatInputBarVisible = true, 
    isChannelBarVisible = false, 
    isDefaultChatEnabled = true, 
    isSpatialUIEnabled = false, 
    store = v13, 
    translator = {
        FormatByKey = function(_, v15) --[[ Line: 33 ]] --[[ Name: FormatByKey ]]
            return (tostring(v15));
        end
    }, 
    gameTranslator = {
        TranslateGameText = function(_, _, v18) --[[ Line: 38 ]] --[[ Name: TranslateGameText ]]
            return v18;
        end
    }
};
v12.render = function(v19) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v9 (copy), v10 (copy), v7 (copy)
    return v19.props.isDefaultChatEnabled and v3.createElement(v4.StoreProvider, {
        store = v19.props.store
    }, {
        localization = v3.createElement(v5.Provider, {
            value = v19.props.translator
        }, {
            gameLocalization = v3.createElement(v6.Provider, {
                value = v19.props.gameTranslator
            }, {
                eventReceiver = if v9 then v3.createElement(v10) else nil, 
                container = v3.createElement(v7, {
                    isChatInputBarVisible = v19.props.isChatInputBarVisible, 
                    isChatWindowVisible = v19.props.isChatWindowVisible, 
                    isChannelBarVisible = v19.props.isChannelBarVisible, 
                    getIconVoiceIndicator = v19.props.getIconVoiceIndicator, 
                    onClickedVoiceIndicator = v19.props.onClickedVoiceIndicator, 
                    onClickedCameraIndicator = v19.props.onClickedCameraIndicator, 
                    selfViewListenerChanged = v19.props.selfViewListenerChanged, 
                    getPermissions = v19.props.getPermissions, 
                    displayCameraDeniedToast = v19.props.displayCameraDeniedToast, 
                    isCamEnabledForUserAndPlace = v19.props.isCamEnabledForUserAndPlace, 
                    isCameraOnlyUser = v19.props.isCameraOnlyUser, 
                    isVoiceServiceInitialized = v19.props.isVoiceServiceInitialized, 
                    onClickedLikelySpeakingBubble = v19.props.onClickedLikelySpeakingBubble, 
                    isSpatialUIEnabled = v19.props.isSpatialUIEnabled
                })
            })
        })
    });
end;
if v11() then
    v12.didMount = function(v20) --[[ Line: 79 ]] --[[ Name: didMount ]]
        -- upvalues: l_TextChatService_0 (copy)
        local l_expChatLoadStartTime_0 = v20.props.expChatLoadStartTime;
        if l_expChatLoadStartTime_0 then
            l_TextChatService_0:SendExpChatLoadSuccess(os.clock() - l_expChatLoadStartTime_0);
        end;
    end;
end;
return v12;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_Parent_0 = script.Parent.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateChatRodux) then
    return nil;
else
    local v6 = require(l_Parent_0.Actions.UpdateChatVisible);
    local v7 = require(l_Parent_0.Actions.UpdateChatMessages);
    local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
    local v9 = require(l_RobloxGui_0.Modules.ChatSelector);
    local l_GameSettings_0 = UserSettings().GameSettings;
    local v11 = v2.PureComponent:extend("ChatConnector");
    v11.validateProps = v4.strictInterface({
        isSmallTouchScreen = v4.boolean, 
        updateChatVisible = v4.callback, 
        updateChatMessages = v4.callback
    });
    v11.didMount = function(v12) --[[ Line: 35 ]] --[[ Name: didMount ]]
        -- upvalues: l_GameSettings_0 (copy), v9 (copy)
        local l_ChatVisible_0 = l_GameSettings_0.ChatVisible;
        if v12.props.isSmallTouchScreen then
            l_ChatVisible_0 = false;
        end;
        v9:SetVisible(l_ChatVisible_0);
        v12.props.updateChatMessages(v9:GetMessageCount());
        v12.props.updateChatVisible(v9:GetVisibility());
        v12.chatVisibleConnection = v9.VisibilityStateChanged:connect(function(v14) --[[ Line: 45 ]]
            -- upvalues: v12 (copy)
            v12.props.updateChatVisible(v14);
        end);
        v12.chatMessagesConnection = v9.MessagesChanged:connect(function(v15) --[[ Line: 49 ]]
            -- upvalues: v12 (copy)
            v12.props.updateChatMessages(v15);
        end);
    end;
    v11.render = function(_) --[[ Line: 54 ]] --[[ Name: render ]]
        return nil;
    end;
    v11.willUnmount = function(v17) --[[ Line: 58 ]] --[[ Name: willUnmount ]]
        v17.chatVisibleConnection:disconnect();
        v17.chatMessagesConnection:disconnect();
    end;
    return v3.UNSTABLE_connect2(function(v18) --[[ Line: 63 ]] --[[ Name: mapStateToProps ]]
        return {
            isSmallTouchScreen = v18.displayOptions.isSmallTouchDevice
        };
    end, function(v19) --[[ Line: 69 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v6 (copy), v7 (copy)
        return {
            updateChatVisible = function(v20) --[[ Line: 71 ]] --[[ Name: updateChatVisible ]]
                -- upvalues: v19 (copy), v6 (ref)
                return v19(v6(v20));
            end, 
            updateChatMessages = function(v21) --[[ Line: 75 ]] --[[ Name: updateChatMessages ]]
                -- upvalues: v19 (copy), v7 (ref)
                return v19(v7(v21));
            end
        };
    end)(v11);
end;
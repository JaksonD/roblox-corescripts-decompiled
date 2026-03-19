local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v6 = require(l_script_FirstAncestor_0.Components.Messages.MessageCard);
local v7 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
return function(v8) --[[ Line: 18 ]] --[[ Name: PendingAvatarSwitchMessage ]]
    -- upvalues: l_useSignalState_0 (copy), v7 (copy), l_useLocalization_0 (copy), v2 (copy), v3 (copy), v6 (copy)
    local v9 = l_useSignalState_0(v7);
    local v10 = l_useSignalState_0(v9.getPendingAvatarName);
    local v11 = l_useLocalization_0({
        messageHeader = {
            "Feature.AvatarSwitcher.Heading.AvatarSwitchedConfirmation"; 
            avatarName = v10
        }, 
        messageContent = "Feature.AvatarSwitcher.Message.SwitchingDeferred"
    });
    if v10 == nil then
        return nil;
    else
        return (v2.createElement(v3.View, {
            tag = "size-full-0 auto-y"
        }, {
            WarningMessage = v2.createElement(v6, {
                icon = "Info", 
                headerText = v11.messageHeader, 
                contentText = v11.messageContent, 
                onClose = v9.clearPendingAvatarName, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v8.LayoutOrder
            })
        }));
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v6 = require(l_script_FirstAncestor_0.Components.Messages.MessageCard);
local v7 = require(l_script_FirstAncestor_0.Enums.ExperienceAvatarSupportType);
local v8 = require(l_script_FirstAncestor_0.Stores.getAvatarSwitcherStore);
local l_FFlagAvatarSwitcherUiFixes_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes;
return function(v10) --[[ Line: 21 ]] --[[ Name: AvatarsUnsupportedMessage ]]
    -- upvalues: l_useSignalState_0 (copy), v8 (copy), l_useLocalization_0 (copy), l_FFlagAvatarSwitcherUiFixes_0 (copy), v7 (copy), v2 (copy), v3 (copy), v6 (copy)
    local v11 = l_useSignalState_0(v8);
    local v12 = l_useSignalState_0(v11.getExperienceAvatarSupportType);
    local v13 = l_useLocalization_0(if l_FFlagAvatarSwitcherUiFixes_0 then {
        messageHeader = "Feature.AvatarSwitcher.Heading.PresetAvatars"
    } else {
        messageHeader = "Feature.AvatarSwitcher.Heading.Unsupported", 
        messageContent = "Feature.AvatarSwitcher.Message.Unsupported"
    });
    if v12 ~= v7.NoSupport then
        return nil;
    else
        return (v2.createElement(v3.View, {
            tag = "size-full-0 auto-y", 
            LayoutOrder = v10.LayoutOrder
        }, {
            WarningMessage = v2.createElement(v6, {
                icon = "Info", 
                headerText = v13.messageHeader, 
                contentText = if l_FFlagAvatarSwitcherUiFixes_0 then nil else v13.messageContent, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            })
        }));
    end;
end;
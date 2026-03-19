local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.ExpChatShared);
local v6 = require(l_Parent_0.SharedFlags);
local v7 = require(l_script_FirstAncestor_0.Config);
local l_TargetTextChannelPropertyChanged_0 = v5.Actions.TargetTextChannelPropertyChanged;
local v9 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local l_FFlagExpChatUseChannelTabsStore_0 = v6.FFlagExpChatUseChannelTabsStore;
local l_FFlagExpChatUseChatConfigStore_0 = v6.FFlagExpChatUseChatConfigStore;
local v12 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v13 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
local l_createEffect_0 = require(l_Parent_0.Signals).createEffect;
local v15 = require(script.Parent.UI.ChannelBar);
local v16 = v3.Component:extend("ChannelBarApp");
if l_FFlagExpChatUseChatConfigStore_0 then
    v16.init = function(v17) --[[ Line: 25 ]] --[[ Name: init ]]
        -- upvalues: v12 (copy)
        v17.chatConfigStore = v12(false);
        v17.state = {
            channelTabsSettings = v17.chatConfigStore.getChannelTabsSettings(false)
        };
    end;
    v16.didMount = function(v18) --[[ Line: 32 ]] --[[ Name: didMount ]]
        -- upvalues: l_createEffect_0 (copy)
        v18.updateChannelTabsSettingsEffect = l_createEffect_0(function(v19) --[[ Line: 34 ]]
            -- upvalues: v18 (copy)
            local v20 = v18.chatConfigStore.getChannelTabsSettings(v19);
            v18:setState({
                channelTabsSettings = v20
            });
        end);
    end;
    v16.willUnmount = function(v21) --[[ Line: 42 ]] --[[ Name: willUnmount ]]
        v21.updateChannelTabsSettingsEffect();
        v21.updateChannelTabsSettingsEffect = nil;
    end;
end;
v16.render = function(v22) --[[ Line: 48 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagExpChatUseChatConfigStore_0 (copy), v2 (copy), v15 (copy)
    local v23 = nil;
    v23 = if l_FFlagExpChatUseChatConfigStore_0 then v22.state.channelTabsSettings else v22.props.channelTabsSettings;
    return v2.createElement(v15, {
        channelTabsSettings = v23, 
        chatWindowSettings = v22.props.chatWindowSettings, 
        allChannelTabs = v22.props.allChannelTabs, 
        allTextChannels = v22.props.allTextChannels, 
        selectedTabName = v22.props.selectedTabName, 
        onTabSelected = v22.props.onTabSelected, 
        onHovered = v22.props.onHovered, 
        onUnhovered = v22.props.onUnhovered, 
        visible = v22.props.visible, 
        transparencyValue = v22.props.transparencyValue, 
        topBorderRef = v22.props.topBorderRef
    });
end;
return v4.connect(function(v24) --[[ Line: 72 ]]
    -- upvalues: l_FFlagExpChatUseChatConfigStore_0 (copy), v9 (copy), v7 (copy)
    return {
        channelTabsSettings = if l_FFlagExpChatUseChatConfigStore_0 then nil else v9() and v24.ChatLayout.ChannelTabsSettings or {
            BackgroundTransparency = v7.ChannelTabsSettings.BackgroundTransparency, 
            BackgroundColor3 = v7.ChannelTabsSettings.BackgroundColor3, 
            HoverBackgroundColor3 = v7.ChannelTabsSettings.HoverBackgroundColor3, 
            FontFace = v7.ChannelTabsSettings.FontFace, 
            TextSize = v7.ChannelTabsSettings.TextSize, 
            TextColor3 = v7.ChannelTabsSettings.TextColor3, 
            SelectedTabTextColor3 = v7.ChannelTabsSettings.SelectedTabTextColor3, 
            TextStrokeColor3 = v7.ChannelTabsSettings.TextStrokeColor3, 
            TextStrokeTransparency = v7.ChannelTabsSettings.TextStrokeTransparency
        }, 
        allChannelTabs = v9() and v24.ChannelTabs.allChannelTabs or {}, 
        selectedTabName = v9() and v24.ChannelTabs.selectedTabName or "", 
        allTextChannels = v24.TextChannels.allTextChannels
    };
end, function(v25) --[[ Line: 91 ]]
    -- upvalues: v9 (copy), l_TargetTextChannelPropertyChanged_0 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v13 (copy)
    return {
        onTabSelected = function(v26, v27) --[[ Line: 93 ]] --[[ Name: onTabSelected ]]
            -- upvalues: v9 (ref), v25 (copy), l_TargetTextChannelPropertyChanged_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v13 (ref)
            if v9() then
                v25(l_TargetTextChannelPropertyChanged_0(v26, v27));
                if l_FFlagExpChatUseChannelTabsStore_0 then
                    v13(false).setTargetChannel(v26, v27);
                end;
            end;
        end
    };
end)(v16);
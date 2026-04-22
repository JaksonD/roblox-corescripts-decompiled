local l_TextChatService_0 = game:GetService("TextChatService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v4 = require(l_script_FirstAncestor_0.Parent.ExpChatShared);
local l_Analytics_0 = v4.Analytics;
local v6 = require(l_script_FirstAncestor_0.Config);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v8 = require(l_Actions_0.ConfigurationObjectsLoaded);
local v9 = require(l_Actions_0.ChatInputBarConfigurationEnabled);
local v10 = require(l_Actions_0.ChatWindowConfigurationEnabled);
local v11 = require(l_Actions_0.ChannelTabsConfigurationEnabled);
local l_TargetTextChannelPropertyChanged_0 = v4.Actions.TargetTextChannelPropertyChanged;
local v13 = require(l_Actions_0.BubbleChatSettingsChanged);
local v14 = require(l_Actions_0.ChatLayoutVerticalAlignmentChanged);
local v15 = require(l_Actions_0.ChatLayoutHorizontalAlignmentChanged);
local v16 = require(l_Actions_0.ChatWindowSettingsChanged);
local v17 = require(l_Actions_0.ChatInputBarSettingsChanged);
local v18 = require(l_Actions_0.ChannelTabsSettingsChanged);
local v19 = require(l_Actions_0.DevTextBoxEnabledChanged);
local v20 = require(script.Parent.setUpBubbleChatConfigurationChildren);
local v21 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v22 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v23 = require(l_script_FirstAncestor_0.Stores.GetTransparencyStore);
local v24 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
local v25 = require(l_script_FirstAncestor_0.Stores.GetChatConfigurationStore);
local v26 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = require(l_Parent_0.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs;
local v29 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseChannelTabsStore_0 = v29.FFlagExpChatUseChannelTabsStore;
local l_FFlagExpChatUseChatConfigStore_0 = v29.FFlagExpChatUseChatConfigStore;
local l_FFlagExpChatUseMessagesStore_0 = v29.FFlagExpChatUseMessagesStore;
local v33 = game:DefineFastFlag("ExpChatCheckTailVisibleInitValue", false);
local function _(v34) --[[ Line: 45 ]] --[[ Name: isKeyboardKeyCodeSanitized ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v34);
    if l_l_UserInputService_0_StringForKeyCode_0 == nil or l_l_UserInputService_0_StringForKeyCode_0 == "" or v34 == Enum.KeyCode.Unknown then
        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v34));
        return false;
    else
        return true;
    end;
end;
local function v43(v37, v38) --[[ Line: 58 ]] --[[ Name: shouldReorderTabs ]]
    -- upvalues: l_TextChatService_0 (copy), v6 (copy)
    if v38 == nil or v37[v38.Name] == nil then
        return false;
    else
        local v39 = 0;
        for _ in pairs(v37) do
            v39 = v39 + 1;
        end;
        local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        if not l_ChannelTabsConfiguration_0 then
            return false;
        else
            local l_X_0 = l_ChannelTabsConfiguration_0.AbsoluteSize.X;
            return (not (l_X_0 < v39 * v6.ChannelTabsSettings.MinTabWidth) and v39 or math.floor((l_X_0 - v6.ChannelTabsSettings.DropdownIconContainerWidth) / v6.ChannelTabsSettings.MinTabWidth)) < v37[v38.Name].TabIndex;
        end;
    end;
end;
return function(v44, v45) --[[ Line: 84 ]]
    -- upvalues: l_Analytics_0 (copy), l_TextChatService_0 (copy), v23 (copy), v9 (copy), v22 (copy), v43 (copy), l_TargetTextChannelPropertyChanged_0 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v24 (copy), v19 (copy), v21 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v17 (copy), v10 (copy), v15 (copy), v14 (copy), v16 (copy), v33 (copy), v13 (copy), v20 (copy), v11 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v26 (copy), v18 (copy), v8 (copy)
    if v45.analytics then
        l_Analytics_0.with(v45.analytics);
    end;
    local function v50(v46, v47, v48) --[[ Line: 89 ]]
        -- upvalues: l_Analytics_0 (ref)
        local v49 = nil;
        if type(v48) == "number" or type(v48) == "boolean" or typeof(v48) == "EnumItem" then
            v49 = tostring(v48);
        elseif typeof(v48) == "Color3" then
            v49 = v48:ToHex();
        elseif typeof(v48) == "Font" then
            v49 = tostring((string.gsub(v48.Family, "rbxasset://fonts/families/", ""))) .. " " .. tostring(v48.Weight) .. " " .. tostring(v48.Style);
        else
            return;
        end;
        assert(v49, "should exist");
        l_Analytics_0.FireClientAnalyticsWithEventName(v46, {
            [v47] = v49
        });
    end;
    local function v69() --[[ Line: 108 ]]
        -- upvalues: l_TextChatService_0 (ref), v23 (ref), v44 (copy), v9 (ref), v22 (ref), v43 (ref), l_TargetTextChannelPropertyChanged_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v24 (ref), v45 (copy), v19 (ref), v21 (ref), l_UserInputService_0 (ref), v50 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v17 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        local v52 = {};
        if l_ChatInputBarConfiguration_0 then
            local v53 = v23(false);
            v44:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
            if l_ChatInputBarConfiguration_0.Enabled then
                v53.resetAllTransparency();
            end;
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 117 ]]
                -- upvalues: v44 (ref), v9 (ref), l_ChatInputBarConfiguration_0 (copy), v53 (copy)
                v44:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
                if l_ChatInputBarConfiguration_0.Enabled then
                    v53.resetAllTransparency();
                end;
            end);
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TargetTextChannel"):Connect(function() --[[ Line: 124 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy), v22 (ref), v43 (ref), v44 (ref), l_TargetTextChannelPropertyChanged_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v24 (ref)
                local l_TargetTextChannel_0 = l_ChatInputBarConfiguration_0.TargetTextChannel;
                local v55 = if v22() then v43(v44:getState().ChannelTabs.allChannelTabs, l_TargetTextChannel_0) else false;
                v44:dispatch(l_TargetTextChannelPropertyChanged_0(l_TargetTextChannel_0, v55));
                if l_FFlagExpChatUseChannelTabsStore_0 then
                    v24(false).setTargetChannel(l_TargetTextChannel_0, v55);
                end;
            end);
            if v45.defaultTargetTextChannel then
                l_ChatInputBarConfiguration_0.TargetTextChannel = v45.defaultTargetTextChannel;
            elseif l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
                game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 141 ]]
                    -- upvalues: l_TextChatService_0 (ref), l_ChatInputBarConfiguration_0 (copy)
                    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXGeneral", true);
                    if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                        l_ChatInputBarConfiguration_0.TargetTextChannel = l_l_TextChatService_0_FirstChild_0;
                    end;
                end);
            end;
            v44:dispatch(v19(l_ChatInputBarConfiguration_0.TextBox ~= nil));
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TextBox"):Connect(function() --[[ Line: 150 ]]
                -- upvalues: v44 (ref), v19 (ref), l_ChatInputBarConfiguration_0 (copy)
                v44:dispatch(v19(l_ChatInputBarConfiguration_0.TextBox ~= nil));
            end);
            v44.changed:connect(function(v57, v58) --[[ Line: 155 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy)
                if v57.TextChannels ~= v58.TextChannels and v57.TextChannels.targetTextChannel ~= v58.TextChannels.targetTextChannel then
                    l_ChatInputBarConfiguration_0.TargetTextChannel = v57.TextChannels.targetTextChannel;
                end;
            end);
            local v59 = {
                "BackgroundTransparency", 
                "BackgroundColor3", 
                "TextSize", 
                "TextColor3", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "FontFace", 
                "PlaceholderColor3", 
                "KeyboardKeyCode"
            };
            if v21() and l_ChatInputBarConfiguration_0.AutocompleteEnabled ~= nil then
                table.insert(v59, "AutocompleteEnabled");
            end;
            for _, v61 in ipairs(v59) do
                if l_ChatInputBarConfiguration_0[v61] then
                    local v62 = l_ChatInputBarConfiguration_0[v61];
                    if v61 == "KeyboardKeyCode" then
                        local l_l_UserInputService_0_StringForKeyCode_1 = l_UserInputService_0:GetStringForKeyCode(v62);
                        local v64;
                        if l_l_UserInputService_0_StringForKeyCode_1 == nil or l_l_UserInputService_0_StringForKeyCode_1 == "" or v62 == Enum.KeyCode.Unknown then
                            warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v62));
                            v64 = false;
                        else
                            v64 = true;
                        end;
                        if not v64 then
                            l_ChatInputBarConfiguration_0.KeyboardKeyCode = Enum.KeyCode.Slash;
                            v52[v61] = Enum.KeyCode.Slash;
                            continue;
                        end;
                    end;
                    v52[v61] = v62;
                    v50("ChatInputBarConfigurationLoaded", v61, v62);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v52.TextSize = math.floor(0.5 + v52.TextSize * 1.5);
            end;
            l_ChatInputBarConfiguration_0.Changed:Connect(function(v65) --[[ Line: 207 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy), l_UserInputService_0 (ref), v44 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v17 (ref), v50 (ref)
                local v66 = l_ChatInputBarConfiguration_0[v65];
                if v65 == "KeyboardKeyCode" then
                    local l_l_UserInputService_0_StringForKeyCode_2 = l_UserInputService_0:GetStringForKeyCode(v66);
                    local v68;
                    if l_l_UserInputService_0_StringForKeyCode_2 == nil or l_l_UserInputService_0_StringForKeyCode_2 == "" or v66 == Enum.KeyCode.Unknown then
                        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v66));
                        v68 = false;
                    else
                        v68 = true;
                    end;
                    if not v68 then
                        l_ChatInputBarConfiguration_0.KeyboardKeyCode = v44:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode;
                        return;
                    end;
                end;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChatInputBarProperty(v65, v66);
                else
                    v44:dispatch(v17(v65, v66));
                end;
                v50("ChatInputBarConfigurationChanged", v65, v66);
            end);
            return v52;
        else
            return {};
        end;
    end;
    local function v77() --[[ Line: 232 ]]
        -- upvalues: l_TextChatService_0 (ref), v44 (copy), v10 (ref), v15 (ref), v14 (ref), v50 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v16 (ref)
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        local v71 = {};
        if l_ChatWindowConfiguration_0 then
            v44:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 238 ]]
                -- upvalues: v44 (ref), v10 (ref), l_ChatWindowConfiguration_0 (copy)
                v44:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
            end);
            v44:dispatch(v15(l_ChatWindowConfiguration_0.HorizontalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function() --[[ Line: 243 ]]
                -- upvalues: v44 (ref), v15 (ref), l_ChatWindowConfiguration_0 (copy)
                v44:dispatch(v15(l_ChatWindowConfiguration_0.HorizontalAlignment));
            end);
            v44:dispatch(v14(l_ChatWindowConfiguration_0.VerticalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("VerticalAlignment"):Connect(function() --[[ Line: 248 ]]
                -- upvalues: v44 (ref), v14 (ref), l_ChatWindowConfiguration_0 (copy)
                v44:dispatch(v14(l_ChatWindowConfiguration_0.VerticalAlignment));
            end);
            for _, v73 in ipairs({
                "BackgroundColor3", 
                "BackgroundTransparency", 
                "FontFace", 
                "TextColor3", 
                "TextSize", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "HeightScale", 
                "WidthScale", 
                "HorizontalAlignment", 
                "VerticalAlignment"
            }) do
                if l_ChatWindowConfiguration_0[v73] then
                    local v74 = l_ChatWindowConfiguration_0[v73];
                    v71[v73] = v74;
                    v50("ChatWindowConfigurationLoaded", v73, v74);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v71.TextSize = math.floor(0.5 + v71.TextSize * 1.5);
            end;
            l_ChatWindowConfiguration_0.Changed:Connect(function(v75) --[[ Line: 285 ]]
                -- upvalues: l_ChatWindowConfiguration_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v44 (ref), v16 (ref), v50 (ref)
                local v76 = l_ChatWindowConfiguration_0[v75];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChatWindowProperty(v75, v76);
                else
                    v44:dispatch(v16(v75, v76));
                end;
                v50("ChatWindowConfigurationChanged", v75, v76);
            end);
            return v71;
        else
            return {};
        end;
    end;
    local function v88() --[[ Line: 303 ]]
        -- upvalues: l_TextChatService_0 (ref), v33 (ref), v50 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v44 (copy), v13 (ref), v20 (ref)
        local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
        local v79 = {};
        if l_BubbleChatConfiguration_0 then
            for _, v81 in ipairs({
                "Enabled", 
                "AdorneeName", 
                "BubbleDuration", 
                "BubblesSpacing", 
                "VerticalStudsOffset", 
                "LocalPlayerStudsOffset", 
                "MinimizeDistance", 
                "MaxDistance", 
                "BackgroundColor3", 
                "TextColor3", 
                "TextSize", 
                "FontFace", 
                "MaxBubbles", 
                "TailVisible", 
                "BackgroundTransparency"
            }) do
                if not v33 and l_BubbleChatConfiguration_0[v81] or v33 and l_BubbleChatConfiguration_0[v81] ~= nil then
                    local v82 = l_BubbleChatConfiguration_0[v81];
                    v79[v81] = v82;
                    v50("BubbleChatConfigurationLoaded", v81, v82);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v79.TextSize = math.floor(0.5 + v79.TextSize * 1.5);
            end;
            l_BubbleChatConfiguration_0.Changed:Connect(function(v83) --[[ Line: 347 ]]
                -- upvalues: l_BubbleChatConfiguration_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v44 (ref), v13 (ref), v50 (ref)
                local v84 = l_BubbleChatConfiguration_0[v83];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setBubbleChatProperty(v83, v84);
                else
                    v44:dispatch(v13(v83, v84));
                end;
                v50("BubbleChatConfigurationChanged", v83, v84);
            end);
            local v85 = v20(v44);
            for v86, v87 in pairs(v85) do
                if v87 then
                    v79[v86] = v85[v86];
                end;
            end;
            return v79;
        else
            return {};
        end;
    end;
    local function v98() --[[ Line: 372 ]]
        -- upvalues: l_TextChatService_0 (ref), v44 (copy), v11 (ref), l_FFlagExpChatUseMessagesStore_0 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v26 (ref), v50 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v18 (ref)
        local l_ChannelTabsConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        local v90 = {};
        if l_ChannelTabsConfiguration_1 then
            v44:dispatch(v11(l_ChannelTabsConfiguration_1.Enabled));
            if l_FFlagExpChatUseMessagesStore_0 and l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                local v91 = v26(false);
                if v91 then
                    v91.setChannelTabsConfigurationEnabled(l_ChannelTabsConfiguration_1.Enabled);
                end;
            end;
            l_ChannelTabsConfiguration_1:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 384 ]]
                -- upvalues: v44 (ref), v11 (ref), l_ChannelTabsConfiguration_1 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v26 (ref)
                v44:dispatch(v11(l_ChannelTabsConfiguration_1.Enabled));
                if l_FFlagExpChatUseMessagesStore_0 and l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                    local v92 = v26(false);
                    if v92 then
                        v92.setChannelTabsConfigurationEnabled(l_ChannelTabsConfiguration_1.Enabled);
                    end;
                end;
            end);
            for _, v94 in ipairs({
                "BackgroundTransparency", 
                "BackgroundColor3", 
                "HoverBackgroundColor3", 
                "FontFace", 
                "TextSize", 
                "TextColor3", 
                "SelectedTabTextColor3", 
                "TextStrokeColor3", 
                "TextStrokeTransparency"
            }) do
                if l_ChannelTabsConfiguration_1[v94] then
                    local v95 = l_ChannelTabsConfiguration_1[v94];
                    v90[v94] = v95;
                    v50("ChannelTabsConfigurationLoaded", v94, v95);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v90.TextSize = math.floor(0.5 + v90.TextSize * 1.5);
            end;
            l_ChannelTabsConfiguration_1.Changed:Connect(function(v96) --[[ Line: 425 ]]
                -- upvalues: l_ChannelTabsConfiguration_1 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v44 (ref), v18 (ref), v50 (ref)
                local v97 = l_ChannelTabsConfiguration_1[v96];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChannelTabsProperty(v96, v97);
                else
                    v44:dispatch(v18(v96, v97));
                end;
                v50("ChannelTabsConfigurationChanged", v96, v97);
            end);
            return v90;
        else
            return {};
        end;
    end;
    local v99 = v77();
    local v100 = v88();
    local v101 = v69();
    local v102 = if v22() then v98() else {};
    if l_FFlagExpChatUseChatConfigStore_0 then
        local v103 = v25(false);
        v103.mergeBubbleChatSettings(v100);
        v103.mergeChatWindowSettings(v99);
        v103.mergeChatInputBarSettings(v101);
        v103.mergeChannelTabsSettings(v102);
        return;
    else
        v44:dispatch(v8({
            bubbleChatSettings = v100, 
            chatWindowSettings = v99, 
            chatInputBarSettings = v101, 
            channelTabsSettings = v102
        }));
        return;
    end;
end;
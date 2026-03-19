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
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v27 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseChannelTabsStore_0 = v27.FFlagExpChatUseChannelTabsStore;
local l_FFlagExpChatUseChatConfigStore_0 = v27.FFlagExpChatUseChatConfigStore;
local v30 = game:DefineFastFlag("ExpChatCheckTailVisibleInitValue", false);
local function _(v31) --[[ Line: 40 ]] --[[ Name: isKeyboardKeyCodeSanitized ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_StringForKeyCode_0 = l_UserInputService_0:GetStringForKeyCode(v31);
    if l_l_UserInputService_0_StringForKeyCode_0 == nil or l_l_UserInputService_0_StringForKeyCode_0 == "" or v31 == Enum.KeyCode.Unknown then
        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v31));
        return false;
    else
        return true;
    end;
end;
local function v40(v34, v35) --[[ Line: 53 ]] --[[ Name: shouldReorderTabs ]]
    -- upvalues: l_TextChatService_0 (copy), v6 (copy)
    if v35 == nil or v34[v35.Name] == nil then
        return false;
    else
        local v36 = 0;
        for _ in pairs(v34) do
            v36 = v36 + 1;
        end;
        local l_ChannelTabsConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        if not l_ChannelTabsConfiguration_0 then
            return false;
        else
            local l_X_0 = l_ChannelTabsConfiguration_0.AbsoluteSize.X;
            return (not (l_X_0 < v36 * v6.ChannelTabsSettings.MinTabWidth) and v36 or math.floor((l_X_0 - v6.ChannelTabsSettings.DropdownIconContainerWidth) / v6.ChannelTabsSettings.MinTabWidth)) < v34[v35.Name].TabIndex;
        end;
    end;
end;
return function(v41, v42) --[[ Line: 79 ]]
    -- upvalues: l_Analytics_0 (copy), l_TextChatService_0 (copy), v23 (copy), v9 (copy), v22 (copy), v40 (copy), l_TargetTextChannelPropertyChanged_0 (copy), l_FFlagExpChatUseChannelTabsStore_0 (copy), v24 (copy), v19 (copy), v21 (copy), l_UserInputService_0 (copy), l_GuiService_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (copy), v25 (copy), v17 (copy), v10 (copy), v15 (copy), v14 (copy), v16 (copy), v30 (copy), v13 (copy), v20 (copy), v11 (copy), v18 (copy), v8 (copy)
    if v42.analytics then
        l_Analytics_0.with(v42.analytics);
    end;
    local function v47(v43, v44, v45) --[[ Line: 84 ]]
        -- upvalues: l_Analytics_0 (ref)
        local v46 = nil;
        if type(v45) == "number" or type(v45) == "boolean" or typeof(v45) == "EnumItem" then
            v46 = tostring(v45);
        elseif typeof(v45) == "Color3" then
            v46 = v45:ToHex();
        elseif typeof(v45) == "Font" then
            v46 = tostring((string.gsub(v45.Family, "rbxasset://fonts/families/", ""))) .. " " .. tostring(v45.Weight) .. " " .. tostring(v45.Style);
        else
            return;
        end;
        assert(v46, "should exist");
        l_Analytics_0.FireClientAnalyticsWithEventName(v43, {
            [v44] = v46
        });
    end;
    local function v66() --[[ Line: 103 ]]
        -- upvalues: l_TextChatService_0 (ref), v23 (ref), v41 (copy), v9 (ref), v22 (ref), v40 (ref), l_TargetTextChannelPropertyChanged_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v24 (ref), v42 (copy), v19 (ref), v21 (ref), l_UserInputService_0 (ref), v47 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v17 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        local v49 = {};
        if l_ChatInputBarConfiguration_0 then
            local v50 = v23(false);
            v41:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
            if l_ChatInputBarConfiguration_0.Enabled then
                v50.resetAllTransparency();
            end;
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 112 ]]
                -- upvalues: v41 (ref), v9 (ref), l_ChatInputBarConfiguration_0 (copy), v50 (copy)
                v41:dispatch(v9(l_ChatInputBarConfiguration_0.Enabled));
                if l_ChatInputBarConfiguration_0.Enabled then
                    v50.resetAllTransparency();
                end;
            end);
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TargetTextChannel"):Connect(function() --[[ Line: 119 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy), v22 (ref), v40 (ref), v41 (ref), l_TargetTextChannelPropertyChanged_0 (ref), l_FFlagExpChatUseChannelTabsStore_0 (ref), v24 (ref)
                local l_TargetTextChannel_0 = l_ChatInputBarConfiguration_0.TargetTextChannel;
                local v52 = if v22() then v40(v41:getState().ChannelTabs.allChannelTabs, l_TargetTextChannel_0) else false;
                v41:dispatch(l_TargetTextChannelPropertyChanged_0(l_TargetTextChannel_0, v52));
                if l_FFlagExpChatUseChannelTabsStore_0 then
                    v24(false).setTargetChannel(l_TargetTextChannel_0, v52);
                end;
            end);
            if v42.defaultTargetTextChannel then
                l_ChatInputBarConfiguration_0.TargetTextChannel = v42.defaultTargetTextChannel;
            elseif l_TextChatService_0.ChatVersion == Enum.ChatVersion.LegacyChatService then
                game:GetService("Chat"):GetPropertyChangedSignal("IsAutoMigrated"):Once(function() --[[ Line: 136 ]]
                    -- upvalues: l_TextChatService_0 (ref), l_ChatInputBarConfiguration_0 (copy)
                    local l_l_TextChatService_0_FirstChild_0 = l_TextChatService_0:FindFirstChild("RBXGeneral", true);
                    if l_l_TextChatService_0_FirstChild_0 and l_l_TextChatService_0_FirstChild_0:IsA("TextChannel") then
                        l_ChatInputBarConfiguration_0.TargetTextChannel = l_l_TextChatService_0_FirstChild_0;
                    end;
                end);
            end;
            v41:dispatch(v19(l_ChatInputBarConfiguration_0.TextBox ~= nil));
            l_ChatInputBarConfiguration_0:GetPropertyChangedSignal("TextBox"):Connect(function() --[[ Line: 145 ]]
                -- upvalues: v41 (ref), v19 (ref), l_ChatInputBarConfiguration_0 (copy)
                v41:dispatch(v19(l_ChatInputBarConfiguration_0.TextBox ~= nil));
            end);
            v41.changed:connect(function(v54, v55) --[[ Line: 150 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy)
                if v54.TextChannels ~= v55.TextChannels and v54.TextChannels.targetTextChannel ~= v55.TextChannels.targetTextChannel then
                    l_ChatInputBarConfiguration_0.TargetTextChannel = v54.TextChannels.targetTextChannel;
                end;
            end);
            local v56 = {
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
                table.insert(v56, "AutocompleteEnabled");
            end;
            for _, v58 in ipairs(v56) do
                if l_ChatInputBarConfiguration_0[v58] then
                    local v59 = l_ChatInputBarConfiguration_0[v58];
                    if v58 == "KeyboardKeyCode" then
                        local l_l_UserInputService_0_StringForKeyCode_1 = l_UserInputService_0:GetStringForKeyCode(v59);
                        local v61;
                        if l_l_UserInputService_0_StringForKeyCode_1 == nil or l_l_UserInputService_0_StringForKeyCode_1 == "" or v59 == Enum.KeyCode.Unknown then
                            warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v59));
                            v61 = false;
                        else
                            v61 = true;
                        end;
                        if not v61 then
                            l_ChatInputBarConfiguration_0.KeyboardKeyCode = Enum.KeyCode.Slash;
                            v49[v58] = Enum.KeyCode.Slash;
                            continue;
                        end;
                    end;
                    v49[v58] = v59;
                    v47("ChatInputBarConfigurationLoaded", v58, v59);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v49.TextSize = math.floor(0.5 + v49.TextSize * 1.5);
            end;
            l_ChatInputBarConfiguration_0.Changed:Connect(function(v62) --[[ Line: 202 ]]
                -- upvalues: l_ChatInputBarConfiguration_0 (copy), l_UserInputService_0 (ref), v41 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v17 (ref), v47 (ref)
                local v63 = l_ChatInputBarConfiguration_0[v62];
                if v62 == "KeyboardKeyCode" then
                    local l_l_UserInputService_0_StringForKeyCode_2 = l_UserInputService_0:GetStringForKeyCode(v63);
                    local v65;
                    if l_l_UserInputService_0_StringForKeyCode_2 == nil or l_l_UserInputService_0_StringForKeyCode_2 == "" or v63 == Enum.KeyCode.Unknown then
                        warn("ChatInputBarConfiguration.KeyboardKeyCode has an unsupported keycode for rendering UI:" .. tostring(v63));
                        v65 = false;
                    else
                        v65 = true;
                    end;
                    if not v65 then
                        l_ChatInputBarConfiguration_0.KeyboardKeyCode = v41:getState().ChatLayout.ChatInputBarSettings.KeyboardKeyCode;
                        return;
                    end;
                end;
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChatInputBarProperty(v62, v63);
                else
                    v41:dispatch(v17(v62, v63));
                end;
                v47("ChatInputBarConfigurationChanged", v62, v63);
            end);
            return v49;
        else
            return {};
        end;
    end;
    local function v74() --[[ Line: 227 ]]
        -- upvalues: l_TextChatService_0 (ref), v41 (copy), v10 (ref), v15 (ref), v14 (ref), v47 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v16 (ref)
        local l_ChatWindowConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatWindowConfiguration");
        local v68 = {};
        if l_ChatWindowConfiguration_0 then
            v41:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 233 ]]
                -- upvalues: v41 (ref), v10 (ref), l_ChatWindowConfiguration_0 (copy)
                v41:dispatch(v10(l_ChatWindowConfiguration_0.Enabled));
            end);
            v41:dispatch(v15(l_ChatWindowConfiguration_0.HorizontalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("HorizontalAlignment"):Connect(function() --[[ Line: 238 ]]
                -- upvalues: v41 (ref), v15 (ref), l_ChatWindowConfiguration_0 (copy)
                v41:dispatch(v15(l_ChatWindowConfiguration_0.HorizontalAlignment));
            end);
            v41:dispatch(v14(l_ChatWindowConfiguration_0.VerticalAlignment));
            l_ChatWindowConfiguration_0:GetPropertyChangedSignal("VerticalAlignment"):Connect(function() --[[ Line: 243 ]]
                -- upvalues: v41 (ref), v14 (ref), l_ChatWindowConfiguration_0 (copy)
                v41:dispatch(v14(l_ChatWindowConfiguration_0.VerticalAlignment));
            end);
            for _, v70 in ipairs({
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
                if l_ChatWindowConfiguration_0[v70] then
                    local v71 = l_ChatWindowConfiguration_0[v70];
                    v68[v70] = v71;
                    v47("ChatWindowConfigurationLoaded", v70, v71);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v68.TextSize = math.floor(0.5 + v68.TextSize * 1.5);
            end;
            l_ChatWindowConfiguration_0.Changed:Connect(function(v72) --[[ Line: 280 ]]
                -- upvalues: l_ChatWindowConfiguration_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v41 (ref), v16 (ref), v47 (ref)
                local v73 = l_ChatWindowConfiguration_0[v72];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChatWindowProperty(v72, v73);
                else
                    v41:dispatch(v16(v72, v73));
                end;
                v47("ChatWindowConfigurationChanged", v72, v73);
            end);
            return v68;
        else
            return {};
        end;
    end;
    local function v85() --[[ Line: 298 ]]
        -- upvalues: l_TextChatService_0 (ref), v30 (ref), v47 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v41 (copy), v13 (ref), v20 (ref)
        local l_BubbleChatConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("BubbleChatConfiguration");
        local v76 = {};
        if l_BubbleChatConfiguration_0 then
            for _, v78 in ipairs({
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
                if not v30 and l_BubbleChatConfiguration_0[v78] or v30 and l_BubbleChatConfiguration_0[v78] ~= nil then
                    local v79 = l_BubbleChatConfiguration_0[v78];
                    v76[v78] = v79;
                    v47("BubbleChatConfigurationLoaded", v78, v79);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v76.TextSize = math.floor(0.5 + v76.TextSize * 1.5);
            end;
            l_BubbleChatConfiguration_0.Changed:Connect(function(v80) --[[ Line: 342 ]]
                -- upvalues: l_BubbleChatConfiguration_0 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v41 (ref), v13 (ref), v47 (ref)
                local v81 = l_BubbleChatConfiguration_0[v80];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setBubbleChatProperty(v80, v81);
                else
                    v41:dispatch(v13(v80, v81));
                end;
                v47("BubbleChatConfigurationChanged", v80, v81);
            end);
            local v82 = v20(v41);
            for v83, v84 in pairs(v82) do
                if v84 then
                    v76[v83] = v82[v83];
                end;
            end;
            return v76;
        else
            return {};
        end;
    end;
    local function v93() --[[ Line: 367 ]]
        -- upvalues: l_TextChatService_0 (ref), v41 (copy), v11 (ref), v47 (copy), l_GuiService_0 (ref), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v18 (ref)
        local l_ChannelTabsConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChannelTabsConfiguration");
        local v87 = {};
        if l_ChannelTabsConfiguration_1 then
            v41:dispatch(v11(l_ChannelTabsConfiguration_1.Enabled));
            l_ChannelTabsConfiguration_1:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 373 ]]
                -- upvalues: v41 (ref), v11 (ref), l_ChannelTabsConfiguration_1 (copy)
                v41:dispatch(v11(l_ChannelTabsConfiguration_1.Enabled));
            end);
            for _, v89 in ipairs({
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
                if l_ChannelTabsConfiguration_1[v89] then
                    local v90 = l_ChannelTabsConfiguration_1[v89];
                    v87[v89] = v90;
                    v47("ChannelTabsConfigurationLoaded", v89, v90);
                end;
            end;
            if l_GuiService_0:IsTenFootInterface() then
                v87.TextSize = math.floor(0.5 + v87.TextSize * 1.5);
            end;
            l_ChannelTabsConfiguration_1.Changed:Connect(function(v91) --[[ Line: 408 ]]
                -- upvalues: l_ChannelTabsConfiguration_1 (copy), l_FFlagExpChatUseChatConfigStore_0 (ref), v25 (ref), v41 (ref), v18 (ref), v47 (ref)
                local v92 = l_ChannelTabsConfiguration_1[v91];
                if l_FFlagExpChatUseChatConfigStore_0 then
                    v25(false).setChannelTabsProperty(v91, v92);
                else
                    v41:dispatch(v18(v91, v92));
                end;
                v47("ChannelTabsConfigurationChanged", v91, v92);
            end);
            return v87;
        else
            return {};
        end;
    end;
    local v94 = v74();
    local v95 = v85();
    local v96 = v66();
    local v97 = if v22() then v93() else {};
    if l_FFlagExpChatUseChatConfigStore_0 then
        local v98 = v25(false);
        v98.mergeBubbleChatSettings(v95);
        v98.mergeChatWindowSettings(v94);
        v98.mergeChatInputBarSettings(v96);
        v98.mergeChannelTabsSettings(v97);
        return;
    else
        v41:dispatch(v8({
            bubbleChatSettings = v95, 
            chatWindowSettings = v94, 
            chatInputBarSettings = v96, 
            channelTabsSettings = v97
        }));
        return;
    end;
end;
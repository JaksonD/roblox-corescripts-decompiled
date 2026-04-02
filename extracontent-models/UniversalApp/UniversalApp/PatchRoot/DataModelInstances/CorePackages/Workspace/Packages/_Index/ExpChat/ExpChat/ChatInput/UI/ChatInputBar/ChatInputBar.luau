local l_Players_0 = game:GetService("Players");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.FocusNavigationUtils);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.ReactFocusNavigation);
local v9 = require(l_Parent_0.ExpChatShared);
local l_FocusUtils_0 = require(l_Parent_0.Chrome).FocusUtils;
local v11 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v12 = require(l_Parent_0.UIBlox);
local v13 = require(l_Parent_0.Promise);
local v14 = require(l_Parent_0.Signals);
local v15 = require(l_Parent_0.SignalsReact);
local l_List_0 = require(l_Parent_0.llama).List;
local l_Images_0 = v12.App.ImageSet.Images;
local l_ImageSetLabel_0 = v12.Core.ImageSet.ImageSetLabel;
local l_useCursor_0 = v12.App.SelectionCursor.useCursor;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v21 = require(l_script_FirstAncestor_0.ClientSettings.useInterpolatedClientSettings);
local v22 = require(l_script_FirstAncestor_0.Config);
local v23 = require(l_script_FirstAncestor_0.Stores.GetFocusNavigationStore);
local v24 = v9.Logger:new("ExpChat/" .. script.Name);
local l_autoCastCommand_0 = v9.Commands.autoCastCommand;
local l_RBXWhisperCommand_0 = v9.Commands.Whisper.RBXWhisperCommand;
local l_RBXTeamCommand_0 = v9.Commands.RBXTeamCommand;
local v28 = require(l_script_FirstAncestor_0.Localization);
local v29 = require(l_script_FirstAncestor_0.getOtherDisplayNameInWhisperChannel);
local v30 = require(script.Parent.ChannelChip);
local v31 = require(l_script_FirstAncestor_0.Autocomplete.AutocompleteText);
local v32 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeEmojis);
local v33 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeCommands);
local v34 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initialCommands);
local v35 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortEmojiResultsCallback);
local v36 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortCommandResultsCallback);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatInput");
local v38 = require(l_script_FirstAncestor_1.UI.AutocompleteDropdown);
local v39 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v40 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseMessagesStore_0 = v40.FFlagExpChatUseMessagesStore;
local l_FFlagEnableConsoleExpControls_0 = v40.FFlagEnableConsoleExpControls;
local l_FFlagChromeChatGamepadSupportFix_0 = v40.FFlagChromeChatGamepadSupportFix;
local l_FFlagConsoleChatUseChromeFocusUtils_0 = v40.FFlagConsoleChatUseChromeFocusUtils;
local v45 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusViaLastModeFix);
local v47 = game:DefineFastFlag("ChatOptimizeCommandProcessing", false);
local v48 = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false);
local v49 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatConnectInitCommands);
local v50 = game:DefineFastFlag("ExpChatTextChatCommandRemoved", false);
local v51 = game:DefineFastFlag("ExpChatCheckForNilInputObj", false);
local v52 = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v40.FFlagRemoveDependencyArrayAntipattern;
local l_ActionBindableEvent_0 = v9.ActionBindableEvent;
local v55 = v23(false);
local function v59(v56, v57) --[[ Line: 74 ]] --[[ Name: setTransparency ]]
    return v57:map(function(v58) --[[ Line: 75 ]]
        -- upvalues: v56 (copy)
        return v56 + v58 * (1 - v56);
    end);
end;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local function v74(v64, v65, v66) --[[ Line: 85 ]] --[[ Name: onChatInputBarFocusLost ]]
    -- upvalues: l_UserInputService_0 (copy), v51 (copy), l_GuiService_0 (copy)
    local v67 = {
        Enum.KeyCode.ButtonB
    };
    local v68 = v65 or v67;
    local v69 = nil;
    v69 = l_UserInputService_0.InputBegan:Connect(function(v70) --[[ Line: 89 ]]
        -- upvalues: v51 (ref), v68 (copy), l_GuiService_0 (ref), v66 (copy), v64 (copy), v69 (ref)
        local v71 = if not v51 or v70 then v70.KeyCode else nil;
        for _, v73 in v68 do
            if v71 == v73 then
                l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                v66();
                if v64 then
                    v64();
                else
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                if v69 then
                    v69:Disconnect();
                    v69 = nil;
                    return;
                else
                    break;
                end;
            end;
        end;
    end);
    return v69;
end;
local function v93(v75, v76, v77, v78, v79) --[[ Line: 113 ]] --[[ Name: useEffectChatInputBarFocus ]]
    -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v7 (copy), v45 (copy), v14 (copy), v55 (copy), v48 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v51 (copy), l_FocusUtils_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v74 (copy), l_ActionBindableEvent_0 (copy)
    if l_FFlagConsoleChatUseChromeFocusUtils_0 then
        v7.useEffect(function() --[[ Line: 115 ]]
            -- upvalues: v45 (ref), v14 (ref), v55 (ref), v76 (copy), v75 (copy), v48 (ref), v77 (copy), l_GuiService_0 (ref), v78 (copy), l_UserInputService_0 (ref), v51 (ref), l_FocusUtils_0 (ref), v79 (copy)
            local v80 = {
                [Enum.KeyCode.DPadUp] = not v45 or nil
            };
            local v81 = nil;
            local v86 = v14.createEffect(function(v82) --[[ Line: 121 ]]
                -- upvalues: v55 (ref), v76 (ref), v75 (ref), v48 (ref), v77 (ref), l_GuiService_0 (ref), v78 (ref), v81 (ref), l_UserInputService_0 (ref), v51 (ref), v80 (copy), l_FocusUtils_0 (ref), v79 (ref)
                local v83 = v55.getChatInputBarFocused(v82);
                local v84 = if v76.current then v76.current else v75.current;
                if v48 then
                    v84 = v84 or v77.current;
                end;
                if not v84 then
                    return;
                else
                    if v83 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v78();
                        l_GuiService_0.SelectedCoreObject = v84;
                        if not v81 then
                            v81 = l_UserInputService_0.InputBegan:Connect(function(v85) --[[ Line: 143 ]]
                                -- upvalues: v51 (ref), v80 (ref), l_FocusUtils_0 (ref), v55 (ref)
                                if (not v51 or v85) and v80[v85.KeyCode] then
                                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 146 ]]
                                        -- upvalues: v55 (ref)
                                        v55.unfocusChatInputBar();
                                    end, "chat");
                                end;
                            end);
                            return;
                        end;
                    elseif l_GuiService_0.MenuIsOpen then
                        l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                        v79();
                        if v81 then
                            v81:Disconnect();
                            v81 = nil;
                        end;
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 162 ]]
                -- upvalues: v86 (copy), v81 (ref)
                v86();
                if v81 then
                    v81:Disconnect();
                    v81 = nil;
                end;
            end;
        end, {});
        return;
    else
        if l_FFlagChromeChatGamepadSupportFix_0 then
            v7.useEffect(function() --[[ Line: 172 ]]
                -- upvalues: v76 (copy), v75 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v78 (copy), v74 (ref), v79 (copy), l_ActionBindableEvent_0 (ref)
                local v87 = nil;
                local v88 = nil;
                local function v91(v89) --[[ Line: 176 ]]
                    -- upvalues: v76 (ref), v75 (ref), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v78 (ref), v88 (ref), v87 (ref), v74 (ref), v79 (ref)
                    local v90 = if v76.current then v76.current else v75.current;
                    if l_FFlagEnableConsoleExpControls_0 and v89.type == "ChatTopBarFocusSelect" and v90 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v78();
                        l_GuiService_0.SelectedCoreObject = v90;
                        v88 = task.delay(0, function() --[[ Line: 188 ]]
                            -- upvalues: v88 (ref), v87 (ref), v74 (ref), v89 (copy), v79 (ref)
                            v88 = nil;
                            if v87 then
                                v87:Disconnect();
                            end;
                            v87 = v74(v89.onSelectionLost, v89.keybinds, v79);
                        end);
                    end;
                end;
                local v92 = l_ActionBindableEvent_0.Event:Connect(v91);
                return function() --[[ Line: 202 ]]
                    -- upvalues: v92 (copy), v88 (ref), v87 (ref)
                    v92:disconnect();
                    if v88 then
                        task.cancel(v88);
                        v88 = nil;
                    end;
                    if v87 then
                        v87:Disconnect();
                        v87 = nil;
                    end;
                end;
            end, {
                v75.current, 
                v76.current
            });
        end;
        return;
    end;
end;
local function v280(v94) --[[ Line: 218 ]] --[[ Name: ChatInputBar ]]
    -- upvalues: v7 (copy), v45 (copy), v8 (copy), v46 (copy), v6 (copy), v15 (copy), v55 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v11 (copy), l_TextChatService_0 (copy), v61 (ref), v31 (copy), v33 (copy), v50 (copy), v39 (copy), v60 (ref), v32 (copy), v49 (copy), v34 (copy), v24 (copy), v52 (copy), v51 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v22 (copy), l_Players_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_GuiService_0 (copy), v74 (copy), l_ActionBindableEvent_0 (copy), v93 (copy), v36 (copy), v35 (copy), l_List_0 (copy), v62 (ref), l_RBXTeamCommand_0 (copy), v63 (ref), l_RBXWhisperCommand_0 (copy), v47 (copy), l_autoCastCommand_0 (copy), v13 (copy), l_useCursor_0 (copy), v21 (copy), v38 (copy), v59 (copy), v30 (copy), v48 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v95 = v7.useRef("");
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99 = nil;
    local v100, v101 = v7.useState("");
    local v102, v103 = v7.useState(0);
    v96 = v102;
    v97 = v103;
    v102, v103 = v7.useState(0);
    v98 = v102;
    v99 = v103;
    v102, v103 = v7.useState(false);
    local v104, _ = v7.useState(true);
    local v106, v107 = v7.useBinding(0);
    local v108 = v7.useRef(false);
    local v109 = v7.useRef(nil);
    local v110 = v7.useRef(nil);
    local v111 = v7.useRef(nil);
    local v112 = v7.useRef(nil);
    local v113 = v7.useRef(nil);
    local v114 = v7.useRef(nil);
    local v115 = v7.useRef(false);
    local v116 = if v45 then v8.useFocusGuiObject() else nil;
    local v117 = if not v45 or v46 then nil else v6.useLastInputMode();
    local v118 = if v46 then v15.useSignalState(v55.getChatInputBarFocused) else nil;
    local v119 = nil;
    local v120 = nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        v120 = v11(false);
        v119 = v15.useSignalState(v120.getCanLocalUserChat);
    end;
    local v121 = v7.useRef(false);
    v7.useEffect(function() --[[ Line: 265 ]]
        -- upvalues: v110 (copy), v94 (copy)
        v110.current = v94.chatInputBarSettings.TextBox;
    end, {
        if v94.chatInputBarSettings.TextBox ~= nil then v94.chatInputBarSettings.TextBox else "nil"
    });
    v7.useEffect(function() --[[ Line: 270 ]]
        -- upvalues: v94 (copy), l_TextChatService_0 (ref), v61 (ref), v31 (ref), v33 (ref), v50 (ref), v39 (ref), v60 (ref), v32 (ref), v49 (ref), v34 (ref)
        if not v94.autocompleteEnabled then
            return;
        else
            local v122 = {};
            local v125 = l_TextChatService_0.DescendantAdded:Connect(function(v123) --[[ Line: 275 ]]
                -- upvalues: v61 (ref), v31 (ref), v33 (ref), v122 (copy)
                if v123:IsA("TextChatCommand") and string.sub(v123.PrimaryAlias, 1, 1) == "/" then
                    v61 = v31.new(v33);
                    local v124 = v123:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 281 ]]
                        -- upvalues: v61 (ref), v31 (ref), v33 (ref)
                        v61 = v31.new(v33);
                    end);
                    table.insert(v122, v124);
                end;
            end);
            local v127 = if v50 then l_TextChatService_0.DescendantRemoving:Connect(function(v126) --[[ Line: 289 ]]
                -- upvalues: v61 (ref), v31 (ref), v33 (ref)
                if v126:IsA("TextChatCommand") and string.sub(v126.PrimaryAlias, 1, 1) == "/" then
                    v61 = v31.new(v33);
                end;
            end) else nil;
            if v39() then
                v61 = v31.new(v33);
                v60 = v31.new(v32);
                if v49() then
                    local v128 = v34();
                    if v128 then
                        for _, v130 in v128 do
                            table.insert(v122, (v130:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 305 ]]
                                -- upvalues: v61 (ref), v31 (ref), v33 (ref)
                                v61 = v31.new(v33);
                            end)));
                        end;
                    end;
                end;
            end;
            return function() --[[ Line: 314 ]]
                -- upvalues: v50 (ref), v127 (copy), v125 (copy), v122 (copy)
                if v50 and v127 then
                    v127:Disconnect();
                end;
                v125:Disconnect();
                for _, v132 in ipairs(v122) do
                    v132:Disconnect();
                end;
                table.clear(v122);
            end;
        end;
    end, {});
    local v134 = v7.useCallback(function() --[[ Line: 326 ]]
        -- upvalues: v24 (ref), v100 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v108 (copy), v119 (ref), v94 (copy), v109 (copy), v110 (copy), v101 (copy), v115 (copy)
        v24:trace("onSendActivated with input text: '{}'", v100);
        if l_FFlagExpChatUseMessagesStore_0 then
            if not v108.current or not v119 then
                v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v108.current), v119);
                return;
            end;
        elseif not v108.current or not v94.canLocalUserChat then
            v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v108.current), v94.canLocalUserChat);
            return;
        end;
        if v109.current or v110.current then
            local v133 = if v110.current then v110.current.Text else v109.current.Text;
            if v94.onSendChat and string.find(v133, "%S") ~= nil then
                v94.onSendChat(v133);
            elseif l_FFlagExpChatUseMessagesStore_0 then
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v133, v119);
            else
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v133, v94.canLocalUserChat);
            end;
            if v110.current then
                v110.current.Text = "";
                v110.current:ReleaseFocus();
            end;
            if v109.current then
                v109.current.Text = "";
                v109.current:ReleaseFocus();
            end;
            v101("");
            if v94.targetTextChannel and v94.targetTextChannelDisplayName ~= "" then
                v115.current = true;
                return;
            end;
        else
            v24:debug("onSendActivated could not send message because textBoxRef.current was nil");
        end;
    end, {
        v100, 
        v110.current
    });
    local v143 = v7.useCallback(function(v135) --[[ Line: 390 ]]
        -- upvalues: v94 (copy), v110 (copy), v109 (copy), v96 (ref), v101 (copy), v108 (copy), v46 (ref), v118 (copy), v116 (copy), v117 (copy), v52 (ref), v24 (ref)
        v94.autocompleteDropdownActivated(false);
        v94.autocompleteDropdownResultsChanged({});
        local v136 = if v110.current then v110.current else v109.current;
        if v136 then
            local l_Text_0 = v136.Text;
            local v138 = string.sub(l_Text_0, 1, v96 - 1);
            local v139 = string.sub(l_Text_0, v96, #l_Text_0);
            local v140 = "";
            if v94.autocompleteDropdownReducer.autocompleteType == "emojis" then
                local l_Text_1 = v135.EmojiLabel.Text;
                v140 = string.gsub(v138, ":[^:]*$", l_Text_1);
            elseif v94.autocompleteDropdownReducer.autocompleteType == "commands" then
                local l_Text_2 = v135.TextLabel.Text;
                v140 = string.gsub(v138, "(/.*)", l_Text_2);
            end;
            if v139 ~= "" then
                v140 = v140 .. v139;
            end;
            v136.Text = v140;
            v101(v140);
            if v108.current then
                v136:CaptureFocus();
                if v46 then
                    if v118 then
                        v116(v136);
                    end;
                elseif v117 == "Focus" then
                    v116(v136);
                end;
                if v139 ~= "" and not v52 then
                    v136.CursorPosition = #v140 - #v139 + 1;
                end;
            end;
            v94.autocompleteDropdownDeactivated();
            return;
        else
            v24:error("Could not find textBox");
            return;
        end;
    end, if v45 then {
        if v46 then v118 else nil, 
        v116, 
        v104, 
        v96, 
        if v46 then nil else v117, 
        v94.autocompleteDropdownActivated, 
        v94.autocompleteDropdownDeactivated, 
        v94.autocompleteDropdownReducer and v94.autocompleteDropdownReducer.autocompleteType, 
        v94.autocompleteDropdownResultsChanged
    } else nil);
    v7.useEffect(function() --[[ Line: 461 ]]
        -- upvalues: v108 (copy), v110 (copy), v109 (copy), v24 (ref)
        if v108.current then
            local v144 = if v110.current then v110.current else v109.current;
            if v144 then
                v144:CaptureFocus();
                return;
            else
                v24:error("Could not focus chat input bar because textBox not found");
            end;
        end;
    end, {
        v94.shouldFocusChatInputBar, 
        v110.current
    });
    v7.useEffect(function() --[[ Line: 472 ]]
        -- upvalues: v24 (ref), v108 (copy)
        v24:trace("Mounted");
        v108.current = true;
        return function() --[[ Line: 476 ]]
            -- upvalues: v24 (ref), v108 (ref)
            v24:trace("Unmounting");
            v108.current = false;
        end;
    end, {});
    v7.useEffect(function() --[[ Line: 482 ]]
        -- upvalues: v94 (copy), v110 (copy), v109 (copy), v97 (ref)
        local v145 = nil;
        if v94.autocompleteEnabled then
            local v146 = if v110.current then v110.current else v109.current;
            if v146 then
                v145 = v146:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 487 ]]
                    -- upvalues: v146 (copy), v97 (ref)
                    local l_CursorPosition_0 = v146.CursorPosition;
                    if l_CursorPosition_0 and l_CursorPosition_0 ~= -1 then
                        v97(l_CursorPosition_0);
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 496 ]]
            -- upvalues: v145 (ref)
            if v145 then
                v145:Disconnect();
            end;
        end;
    end, {
        v110.current
    });
    v7.useEffect(function() --[[ Line: 504 ]]
        -- upvalues: v94 (copy), v114 (copy), v51 (ref)
        if v94.autocompleteEnabled then
            v114.current = v94.userInputService.InputBegan:connect(function(v148, _) --[[ Line: 506 ]]
                -- upvalues: v94 (ref), v51 (ref)
                local v150 = v94.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down);
                local v151 = not v51 or v148;
                if v150 then
                    if v151 and v148.KeyCode == Enum.KeyCode.Up and v94.autocompleteDropdownReducer.selectedIndex > 1 then
                        v94.autocompleteDropdownSelectionChanged(v94.autocompleteDropdownReducer.selectedIndex - 1);
                    end;
                    if v151 and v148.KeyCode == Enum.KeyCode.Down and v94.autocompleteDropdownReducer.selectedIndex < #v94.autocompleteDropdownReducer.results then
                        v94.autocompleteDropdownSelectionChanged(v94.autocompleteDropdownReducer.selectedIndex + 1);
                    end;
                end;
            end);
            return function() --[[ Line: 529 ]]
                -- upvalues: v114 (ref)
                local l_current_0 = v114.current;
                if l_current_0 and l_current_0.Connected then
                    l_current_0:Disconnect();
                end;
                v114.current = nil;
            end;
        else
            return function() --[[ Line: 537 ]]

            end;
        end;
    end, {
        v94.userInputService, 
        v94.autocompleteDropdownReducer
    });
    v7.useEffect(function() --[[ Line: 542 ]]
        -- upvalues: v113 (copy), v94 (copy), v51 (ref), v110 (copy), v109 (copy), v115 (copy), v24 (ref), v100 (copy)
        v113.current = v94.userInputService.InputEnded:connect(function(v153, _) --[[ Line: 543 ]]
            -- upvalues: v51 (ref), v110 (ref), v109 (ref), v115 (ref), v94 (ref), v24 (ref), v100 (ref)
            local v155 = not v51 or v153;
            if if v110.current then v110.current and v110.current:IsFocused() and v155 and v153.KeyCode == Enum.KeyCode.Backspace else v109.current and v109.current:IsFocused() and v155 and v153.KeyCode == Enum.KeyCode.Backspace then
                if v115.current and not v94.isChannelBarVisible then
                    v94.resetTargetChannel();
                    v24:debug("ChatInputBar ChatInputBarResetTargetChannel()");
                    v115.current = false;
                    return;
                elseif v100 == "" and v94.targetTextChannelDisplayName ~= "" then
                    v115.current = true;
                end;
            end;
        end);
        return function() --[[ Line: 571 ]]
            -- upvalues: v113 (ref)
            local l_current_1 = v113.current;
            if l_current_1 and l_current_1.Connected then
                l_current_1:Disconnect();
            end;
            v113.current = nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v94.userInputService, 
        v110.current, 
        v94.isChannelBarVisible, 
        v94.targetTextChannelDisplayName, 
        v94.resetTargetChannel
    } else l_dependencyArray_0(v94.userInputService, v110.current, v94.isChannelBarVisible, v94.targetTextChannelDisplayName, v94.resetTargetChannel));
    v7.useEffect(function() --[[ Line: 597 ]]
        -- upvalues: v94 (copy), v51 (ref), v22 (ref), v110 (copy), v109 (copy), v121 (copy)
        local function v161(_, v158, v159) --[[ Line: 598 ]] --[[ Name: handleAction ]]
            -- upvalues: v94 (ref), v51 (ref), v22 (ref), v110 (ref), v109 (ref), v121 (ref)
            if v94.isChatHotkeyEnabled and (not v51 or v159) and (v159.KeyCode == v22.ChatInputBarDefaultFocusKeyCode or v159.KeyCode == v94.devDefinedFocusKeyCode) then
                local v160 = if v110.current then v110.current else v109.current;
                if v160 and v158 == Enum.UserInputState.Begin and v160 and not v160:IsFocused() then
                    task.delay(0, function() --[[ Line: 620 ]]
                        -- upvalues: v160 (copy)
                        v160:CaptureFocus();
                    end);
                    v94.focusChatHotKeyActivated();
                    v121.current = true;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end;
        v94.contextActionService:BindCoreAction("FocusChat", v161, false, Enum.UserInputType.Keyboard);
        return function() --[[ Line: 644 ]]
            -- upvalues: v94 (ref)
            v94.contextActionService:UnbindCoreAction("FocusChat");
        end;
    end, {
        v94.isChatHotkeyEnabled, 
        v94.devDefinedFocusKeyCode, 
        v121.current, 
        v110.current
    });
    local function _(v162) --[[ Line: 651 ]]
        -- upvalues: l_TextChatService_0 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_0 then
            l_ChatInputBarConfiguration_0.IsFocusedWrite = v162;
        end;
    end;
    local v166 = v7.useCallback(function() --[[ Line: 658 ]]
        -- upvalues: v103 (copy), v94 (copy), l_TextChatService_0 (ref)
        v103(true);
        v94.onFocus();
        local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_1 then
            l_ChatInputBarConfiguration_1.IsFocusedWrite = true;
        end;
    end, {
        v94.onFocus
    });
    local v184 = v7.useCallback(function(_, v168, v169) --[[ Line: 664 ]]
        -- upvalues: v24 (ref), v112 (copy), v45 (ref), v94 (copy), v143 (copy), v134 (copy), v108 (copy), v51 (ref), v110 (copy), v109 (copy), v96 (ref), v52 (ref), v103 (copy), l_TextChatService_0 (ref), v121 (copy), l_Players_0 (ref)
        v24:debug("Focus lost with enter: {}", (tostring(v168)));
        local l_current_2 = v112.current;
        if v168 or v45 and v169 and (v169.KeyCode == Enum.KeyCode.Return or v169.KeyCode == Enum.KeyCode.KeypadEnter) then
            if v94.autocompleteEnabled and l_current_2 and v94.autocompleteDropdownReducer.activated and #v94.autocompleteDropdownReducer.results > 0 then
                local l_OffsetFrame_0 = l_current_2.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                for _, v173 in ipairs(l_OffsetFrame_0:GetChildren()) do
                    if v173.ClassName == "Frame" and v173.LayoutOrder == v94.autocompleteDropdownReducer.selectedIndex then
                        v143(v173.TextLabelButton);
                        return;
                    end;
                end;
            else
                v134();
            end;
        end;
        if v108.current then
            if v94.autocompleteEnabled and l_current_2 and v94.autocompleteDropdownReducer.activated then
                if not v51 or v169 then
                    if v169.KeyCode == Enum.KeyCode.Escape then
                        v94.autocompleteDropdownActivated(false);
                        local v174 = if v110.current then v110.current else v109.current;
                        if v174 then
                            local l_v96_0 = v96;
                            v174:CaptureFocus();
                            if not v52 then
                                v174.CursorPosition = l_v96_0;
                            end;
                            return;
                        else
                            v24:error("Could not focus chat input bar because textBox not found");
                        end;
                    else
                        local l_X_0 = v169.Position.X;
                        local l_Y_0 = v169.Position.Y;
                        local l_X_1 = l_current_2.AbsolutePosition.X;
                        local v179 = l_X_1 + l_current_2.AbsoluteSize.X;
                        local l_Y_1 = l_current_2.AbsolutePosition.Y;
                        local v181 = l_Y_1 + l_current_2.AbsoluteSize.Y;
                        if l_X_0 < l_X_1 or v179 < l_X_0 or l_Y_0 < l_Y_1 or v181 < l_Y_0 then
                            v94.autocompleteDropdownActivated(false);
                        end;
                    end;
                end;
            else
                v103(false);
            end;
        end;
        v94.onUnfocus();
        local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_2 then
            l_ChatInputBarConfiguration_2.IsFocusedWrite = false;
        end;
        if v121.current then
            l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
            if l_ChatInputBarConfiguration_2 then
                local l_TextBox_0 = Instance.new("TextBox");
                l_TextBox_0.Visible = false;
                l_TextBox_0.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
                l_TextBox_0:CaptureFocus();
                l_TextBox_0:ReleaseFocus();
                l_TextBox_0:Destroy();
            end;
            v121.current = false;
        end;
    end);
    v7.useEffect(function() --[[ Line: 769 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v110 (copy), v109 (copy), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v166 (copy), v74 (ref), v184 (copy), l_ActionBindableEvent_0 (ref)
        local v185 = nil;
        local v186 = nil;
        local function v189(v187) --[[ Line: 773 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v110 (ref), v109 (ref), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v166 (ref), v186 (ref), v185 (ref), v74 (ref), v184 (ref)
            local v188 = nil;
            if l_FFlagEnableConsoleExpControls_0 then
                v188 = if v110.current then v110.current else v109.current;
            end;
            if v187.type == "ChatTopBarFocusActivated" then
                if not l_FFlagEnableConsoleExpControls_0 then
                    v188 = if v110.current then v110.current else v109.current;
                end;
                if v188 then
                    task.delay(0, function() --[[ Line: 784 ]]
                        -- upvalues: v188 (ref)
                        v188:CaptureFocus();
                    end);
                end;
            elseif not l_FFlagChromeChatGamepadSupportFix_0 and l_FFlagEnableConsoleExpControls_0 and v187.type == "ChatTopBarFocusSelect" and v188 then
                l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                v166();
                l_GuiService_0.SelectedCoreObject = v188;
                v186 = task.delay(0, function() --[[ Line: 799 ]]
                    -- upvalues: v186 (ref), v185 (ref), v74 (ref), v187 (copy), v184 (ref)
                    v186 = nil;
                    if v185 then
                        v185:Disconnect();
                    end;
                    v185 = v74(v187.onSelectionLost, v187.keybinds, v184);
                end);
            end;
        end;
        local v190 = l_ActionBindableEvent_0.Event:Connect(v189);
        return function() --[[ Line: 813 ]]
            -- upvalues: v190 (copy), v186 (ref), v185 (ref)
            v190:disconnect();
            if v186 then
                task.cancel(v186);
                v186 = nil;
            end;
            if v185 then
                v185:Disconnect();
                v185 = nil;
            end;
        end;
    end, {
        v109.current, 
        v110.current
    });
    v93(v109, v110, v111, v166, v184);
    local function v210(v191, v192, v193) --[[ Line: 831 ]] --[[ Name: handleAutocomplete ]]
        -- upvalues: v94 (copy), v61 (ref), v36 (ref), v60 (ref), v35 (ref), v98 (ref), l_List_0 (ref), v101 (copy), v52 (ref), v112 (copy), v143 (copy), v99 (ref)
        if v193 == "/" and v191.CursorPosition == 2 or v94.autocompleteDropdownReducer.autocompleteType == "commands" and v193 ~= ":" then
            v94.autocompleteDropdownTypeChanged("commands");
            v94.autocompleteDropdownActivated(true);
            if v193 ~= "" and v193 ~= " " then
                local v194 = string.sub(v192, 1, v191.CursorPosition - 1):lower();
                local v195 = v61:getResults(v194, v36);
                v94.autocompleteDropdownResultsChanged(v195);
                if v194 == v195[1] then
                    v94.autocompleteDropdownActivated(false);
                    v94.autocompleteDropdownResultsChanged({});
                    return;
                end;
            else
                v94.autocompleteDropdownDeactivated();
            end;
            return;
        elseif (v94.autocompleteDropdownReducer.activated or #v94.autocompleteDropdownReducer.results > 0) and v94.autocompleteDropdownReducer.autocompleteType == "emojis" then
            v94.autocompleteDropdownActivated(true);
            local v196 = string.sub(v192, 1, v191.CursorPosition - 1);
            local v197 = string.find(v196, ":[^:]*$");
            if v193 ~= "" and v193 ~= ":" and v193 ~= " " and v197 then
                local v198 = string.sub(v192, v197 + 1, v191.CursorPosition - 1):lower();
                local v199 = {};
                if v198 and string.len(v198) > 1 then
                    v199 = v60:getResults(v198, v35);
                end;
                v94.autocompleteDropdownResultsChanged(v199);
                return;
            elseif v193 == ":" then
                if v197 ~= v98 then
                    local v200 = string.sub(v192, v98 + 1, v191.CursorPosition - 2):lower();
                    if l_List_0.includes(v94.autocompleteDropdownReducer.results, v200) then
                        local v201 = string.sub(v192, v191.CursorPosition, #v192);
                        local v202 = string.sub(v192, 1, v191.CursorPosition - 2) .. v201;
                        v191.Text = v202;
                        v101(v202);
                        if not v52 then
                            v191.CursorPosition = v191.CursorPosition - 1;
                        end;
                        local l_current_3 = v112.current;
                        if l_current_3 then
                            local l_OffsetFrame_1 = l_current_3.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                            for _, v206 in ipairs(l_OffsetFrame_1:GetChildren()) do
                                if v206.ClassName == "Frame" then
                                    local l_TextLabelButton_0 = v206:FindFirstChild("TextLabelButton");
                                    if l_TextLabelButton_0 then
                                        local l_TextLabel_0 = l_TextLabelButton_0:FindFirstChild("TextLabel");
                                        if l_TextLabel_0 and l_TextLabel_0.Text and l_TextLabel_0.Text == v200 then
                                            v143(l_TextLabelButton_0);
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    else
                        v94.autocompleteDropdownActivated(false);
                        v94.autocompleteDropdownResultsChanged({});
                    end;
                    return;
                else
                    v94.autocompleteDropdownResultsChanged({});
                    return;
                end;
            elseif v193 == " " then
                v94.autocompleteDropdownActivated(false);
                v94.autocompleteDropdownResultsChanged({});
                return;
            else
                v94.autocompleteDropdownDeactivated();
                v99(0);
                return;
            end;
        else
            local v209 = string.find(v192, ":[^:]*$");
            if v193 == ":" then
                v94.autocompleteDropdownTypeChanged("emojis");
                v94.autocompleteDropdownActivated(true);
                v94.autocompleteDropdownResultsChanged({});
                v99(v209);
            end;
            return;
        end;
    end;
    if v50 then
        v7.useEffect(function() --[[ Line: 947 ]]
            -- upvalues: l_TextChatService_0 (ref), v62 (ref), l_RBXTeamCommand_0 (ref), v63 (ref), l_RBXWhisperCommand_0 (ref)
            if l_TextChatService_0.CreateDefaultCommands then
                v62 = l_TextChatService_0:FindFirstChild(l_RBXTeamCommand_0.name, true);
                v63 = l_TextChatService_0:FindFirstChild(l_RBXWhisperCommand_0.name, true);
            end;
        end, {});
    end;
    local v222 = v7.useCallback(function(v211) --[[ Line: 955 ]]
        -- upvalues: v94 (copy), v101 (copy), v24 (ref), v100 (copy), v39 (ref), v210 (copy), v115 (copy), v47 (ref), v95 (copy), v50 (ref), l_autoCastCommand_0 (ref), l_RBXTeamCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v62 (ref), v63 (ref), v13 (ref)
        local l_Text_3 = v211.Text;
        if v94.autocompleteEnabled then
            local v213 = string.find(l_Text_3, "\r");
            local v214 = v211.CursorPosition < #l_Text_3 + 1;
            if v213 then
                local v215 = string.gsub(l_Text_3, "\r", "");
                v211.Text = v215;
                v101(v215);
                if v214 then
                    v211.CursorPosition = v211.CursorPosition - 1;
                end;
                return;
            end;
        end;
        local v216 = string.sub(l_Text_3, v211.CursorPosition - 1, v211.CursorPosition - 1);
        v24:trace("Input: {}", l_Text_3);
        local v217 = if utf8.len(l_Text_3) then utf8.len(utf8.nfcnormalize(l_Text_3)) else string.len(l_Text_3);
        if v217 and v94.messageCharacterLimit < v217 then
            v24:debug("Message is over the character limit of {}", (tostring(v94.messageCharacterLimit)));
            v211.Text = v100;
            return;
        else
            v101(l_Text_3);
            if v39() and v94.autocompleteEnabled then
                v210(v211, l_Text_3, v216);
            end;
            local l_v115_0 = v115;
            local v219 = false;
            if #l_Text_3 == 0 then
                v219 = v115.current;
            end;
            l_v115_0.current = v219;
            if v47 then
                if string.sub(l_Text_3, 1, 1) == "/" and v94.localPlayer and l_Text_3 ~= v95.current then
                    v95.current = l_Text_3;
                    l_v115_0 = v94.localPlayer.UserId;
                    v219 = if v50 then {} else {
                        l_autoCastCommand_0(l_RBXTeamCommand_0, l_v115_0, l_Text_3), 
                        l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v115_0, l_Text_3)
                    };
                    if v50 then
                        if v62 and v62.Enabled then
                            table.insert(v219, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v115_0, l_Text_3));
                        end;
                        if v63 and v63.Enabled then
                            table.insert(v219, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v115_0, l_Text_3));
                        end;
                        if #v219 == 0 then
                            v219 = {
                                v13.reject()
                            };
                        end;
                    end;
                    v13.any(v219):andThen(function() --[[ Line: 1019 ]]
                        -- upvalues: v211 (copy), v101 (ref), v115 (ref)
                        v211.Text = "";
                        v101("");
                        v115.current = true;
                    end):catch(function(v220) --[[ Line: 1025 ]]
                        -- upvalues: v24 (ref)
                        v24:trace("Could not send autoCastCommand. Error: {}", v220);
                    end);
                    return;
                elseif string.sub(l_Text_3, 1, 1) ~= "/" then
                    v95.current = "";
                    return;
                end;
            elseif v94.localPlayer then
                l_v115_0 = v94.localPlayer.UserId;
                v219 = if v50 then {} else {
                    l_autoCastCommand_0(l_RBXTeamCommand_0, l_v115_0, l_Text_3), 
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v115_0, l_Text_3)
                };
                if v50 then
                    if v62 and v62.Enabled then
                        table.insert(v219, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v115_0, l_Text_3));
                    end;
                    if v63 and v63.Enabled then
                        table.insert(v219, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v115_0, l_Text_3));
                    end;
                    if #v219 == 0 then
                        v219 = {
                            v13.reject()
                        };
                    end;
                end;
                v13.any(v219):andThen(function() --[[ Line: 1056 ]]
                    -- upvalues: v211 (copy), v101 (ref), v115 (ref)
                    v211.Text = "";
                    v101("");
                    v115.current = true;
                end):catch(function(v221) --[[ Line: 1062 ]]
                    -- upvalues: v24 (ref)
                    v24:trace("Could not send autoCastCommand. Error: {}", v221);
                end);
            end;
            return;
        end;
    end);
    local v224 = v7.useCallback(function() --[[ Line: 1069 ]]
        -- upvalues: v110 (copy), v109 (copy)
        local v223 = if v110.current then v110.current else v109.current;
        if v223 then
            v223:ReleaseFocus(true);
        end;
    end, {
        v109.current, 
        v110.current
    });
    local v226 = v7.useCallback(function(v225) --[[ Line: 1076 ]]
        -- upvalues: v107 (copy)
        v107(v225.Visible and v225.AbsoluteSize.X or 0);
    end);
    local v227 = if v45 then l_useCursor_0() else nil;
    local v229 = v7.useCallback(function(v228) --[[ Line: 1083 ]]
        -- upvalues: v94 (copy)
        v94.autocompleteDropdownSelectionChanged(v228.LayoutOrder);
    end);
    local v230 = v100 == "";
    local v231 = v230 and not v102;
    local l_chatInputBarSettings_0 = v94.chatInputBarSettings;
    local l_chatWindowSettings_0 = v94.chatWindowSettings;
    local l_BackgroundTransparency_0 = v21(l_chatInputBarSettings_0).BackgroundTransparency;
    local l_BackgroundTransparency_1 = v21(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v21(l_chatWindowSettings_0).BackgroundColor3;
    local l_isSpatialUIEnabled_0 = v94.isSpatialUIEnabled;
    local l_createElement_0 = v7.createElement;
    local v239 = "Frame";
    local v245 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v94.transparencyValue:map(function(v240) --[[ Line: 75 ]]
            -- upvalues: l_BackgroundTransparency_1 (copy)
            return l_BackgroundTransparency_1 + v240 * (1 - l_BackgroundTransparency_1);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v94.LayoutOrder, 
        Size = v94.size, 
        Visible = v94.visible, 
        ZIndex = 2, 
        [v7.Event.MouseEnter] = v94.onHovered, 
        [v7.Event.MouseLeave] = v94.onUnhovered, 
        [v7.Change.AbsoluteSize] = v7.useCallback(function(v241) --[[ Line: 1109 ]]
            -- upvalues: l_TextChatService_0 (ref), v94 (copy)
            local l_ChatInputBarConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_3 and v94.onAbsoluteSizeChanged then
                v94.onAbsoluteSizeChanged(v241, l_ChatInputBarConfiguration_3);
            end;
        end), 
        [v7.Change.AbsolutePosition] = v7.useCallback(function(v243) --[[ Line: 1115 ]]
            -- upvalues: l_TextChatService_0 (ref), v94 (copy)
            local l_ChatInputBarConfiguration_4 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_4 and v94.onAbsolutePositionChanged then
                v94.onAbsolutePositionChanged(v243, l_ChatInputBarConfiguration_4);
            end;
        end)
    };
    local v246 = {
        AutocompleteDropdown = v39() and v94.autocompleteEnabled and v7.createElement(v38, {
            chatInputBarSettings = l_chatInputBarSettings_0, 
            chatWindowSettings = l_chatWindowSettings_0, 
            setTransparency = v59, 
            transparencyValue = v94.transparencyValue, 
            activated = v94.autocompleteDropdownReducer.activated and v102, 
            results = v94.autocompleteDropdownReducer.results, 
            selectedIndex = v94.autocompleteDropdownReducer.selectedIndex, 
            autocompleteType = v94.autocompleteDropdownReducer.autocompleteType, 
            onAutocompleteDropdownHover = v229, 
            onAutocompleteSelected = v143, 
            autocompleteDropdownRef = v112, 
            textBoxRef = if l_chatInputBarSettings_0.TextBox then v110 else v109
        }) or nil, 
        UISizeConstraint = v7.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v22.ChatWindowMaxWidth, 1e999)
        }), 
        UIPadding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = v94.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v7.createElement;
    local v248 = "Frame";
    local v250 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_chatInputBarSettings_0.BackgroundColor3, 
        BackgroundTransparency = v94.transparencyValue:map(function(v249) --[[ Line: 75 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            return l_BackgroundTransparency_0 + v249 * (1 - l_BackgroundTransparency_0);
        end), 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v251 = {};
    local l_createElement_2 = v7.createElement;
    local v253 = "UIStroke";
    local v254 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = v22.ChatInputBarBorderColor3
    };
    local l_ChatInputBarBorderTransparency_0 = v22.ChatInputBarBorderTransparency;
    local l_l_ChatInputBarBorderTransparency_0_0 = l_ChatInputBarBorderTransparency_0 --[[ copy: 59 -> 72 ]];
    v254.Transparency = v94.transparencyValue:map(function(v257) --[[ Line: 75 ]]
        -- upvalues: l_l_ChatInputBarBorderTransparency_0_0 (copy)
        return l_l_ChatInputBarBorderTransparency_0_0 + v257 * (1 - l_l_ChatInputBarBorderTransparency_0_0);
    end);
    v251.Border = l_createElement_2(v253, v254);
    v251.Corner = v7.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    });
    l_createElement_2 = v7.createElement;
    v253 = "Frame";
    v254 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v258 = {};
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    local v259 = "Frame";
    local v260 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        SelectionBehaviorDown = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionGroup = l_FFlagEnableConsoleExpControls_0 and not v45 or nil, 
        Size = UDim2.new(1, -v94.sendButtonContainerWidth, 0, 0)
    };
    local v261 = {};
    local l_createElement_3 = v7.createElement;
    local l_v30_0 = v30;
    local v264 = {};
    local l_transparencyValue_0 = v94.transparencyValue;
    local v266 = 0;
    local l_v266_0 = v266 --[[ copy: 71 -> 73 ]];
    v264.transparency = l_transparencyValue_0:map(function(v268) --[[ Line: 75 ]]
        -- upvalues: l_v266_0 (copy)
        return l_v266_0 + v268 * (1 - l_v266_0);
    end);
    v264.onAbsoluteSizeChanged = v226;
    v264.onChannelChipActivated = v94.resetTargetChannel;
    v264.targetTextChannelDisplayName = v94.targetTextChannelDisplayName or "";
    v264.isChannelBarVisible = v94.isChannelBarVisible;
    v261.TargetChannelChip = l_createElement_3(l_v30_0, v264);
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then not v119 else not v94.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "TextLabel";
        v264 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v22.ChatInputBarFont, 
            Text = v94.disabledChatPlaceholderText, 
            Position = UDim2.fromScale(1, 0), 
            Size = v106:map(function(v269) --[[ Line: 1207 ]]
                return UDim2.new(1, -(v269 + 8), 0, 0);
            end), 
            TextColor3 = v231 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3, 
            TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
        };
        l_transparencyValue_0 = v231 and 0.5 or 0;
        local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 67 -> 75 ]];
        v264.TextTransparency = v94.transparencyValue:map(function(v271) --[[ Line: 75 ]]
            -- upvalues: l_l_transparencyValue_0_0 (copy)
            return l_l_transparencyValue_0_0 + v271 * (1 - l_l_transparencyValue_0_0);
        end);
        v264.Selectable = v48 and true or nil;
        v264.SelectionImageObject = if v48 then v227 else nil;
        v264.TextWrapped = true;
        v264.TextXAlignment = Enum.TextXAlignment.Left;
        v264.TextYAlignment = Enum.TextYAlignment.Top;
        v264.ref = if v48 then v111 else nil;
        l_createElement_3 = l_createElement_3(l_v30_0, v264);
    end;
    v261.DisabledPlaceholderLabel = l_createElement_3;
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then v119 else v94.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "Frame";
        v264 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = v106:map(function(v272) --[[ Line: 1235 ]]
                return UDim2.new(1, -(v272 + 8), 0, 0);
            end)
        };
        local v273 = {};
        l_transparencyValue_0 = if l_FFlagExpChatUseMessagesStore_0 then v119 else v94.canLocalUserChat;
        if l_transparencyValue_0 then
            l_transparencyValue_0 = v7.createElement;
            local v274 = "TextBox";
            local v275 = {
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                FontFace = l_chatInputBarSettings_0.FontFace, 
                PlaceholderText = v231 and v94.placeholderText or "", 
                Selectable = l_FFlagEnableConsoleExpControls_0 and true or nil, 
                SelectionImageObject = v227, 
                Size = UDim2.fromScale(1, 0), 
                Text = "", 
                PlaceholderColor3 = l_chatInputBarSettings_0.PlaceholderColor3, 
                TextColor3 = l_chatInputBarSettings_0.TextColor3, 
                TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
            };
            v266 = v231 and 0.5 or 0;
            local l_v266_1 = v266 --[[ copy: 71 -> 74 ]];
            v275.TextTransparency = v94.transparencyValue:map(function(v277) --[[ Line: 75 ]]
                -- upvalues: l_v266_1 (copy)
                return l_v266_1 + v277 * (1 - l_v266_1);
            end);
            v266 = l_chatInputBarSettings_0.TextStrokeTransparency;
            v275.TextStrokeTransparency = v94.transparencyValue:map(function(v278) --[[ Line: 75 ]]
                -- upvalues: v266 (copy)
                return v266 + v278 * (1 - v266);
            end);
            v275.TextStrokeColor3 = l_chatInputBarSettings_0.TextStrokeColor3;
            v275.TextWrapped = true;
            v275.TextXAlignment = Enum.TextXAlignment.Left;
            v275.TextYAlignment = Enum.TextYAlignment.Top;
            v275.ZIndex = 2;
            v275[v7.Event.Focused] = v166;
            v275[v7.Event.FocusLost] = v184;
            v275[v7.Change.Text] = v222;
            v275[v7.Event.ReturnPressedFromOnScreenKeyboard] = v224;
            v275.ref = if l_chatInputBarSettings_0.TextBox then v110 else v109;
            l_transparencyValue_0 = l_transparencyValue_0(v274, v275);
        end;
        v273.TextBox = l_transparencyValue_0;
        l_createElement_3 = l_createElement_3(l_v30_0, v264, v273);
    end;
    v261.TextBoxContainer = l_createElement_3;
    v261.UIPadding = v7.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10), 
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10)
    });
    v258.TextContainer = l_ChatInputBarBorderTransparency_0(v259, v260, v261);
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    v259 = "TextButton";
    v260 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Selectable = not v45 and nil, 
        Size = UDim2.new(0, v94.sendButtonContainerWidth, 1, 0), 
        Text = "", 
        [v7.Event.Activated] = v134
    };
    v261 = {
        Layout = v7.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    l_createElement_3 = v7.createElement;
    l_v30_0 = l_ImageSetLabel_0;
    v264 = {
        BackgroundTransparency = 1, 
        ImageColor3 = v230 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3
    };
    l_transparencyValue_0 = v230 and 0.5 or 0;
    v264.ImageTransparency = v94.transparencyValue:map(function(v279) --[[ Line: 75 ]]
        -- upvalues: l_transparencyValue_0 (copy)
        return l_transparencyValue_0 + v279 * (1 - l_transparencyValue_0);
    end);
    v264.Image = l_Images_0["icons/actions/send"];
    v264.Size = UDim2.new(0, 30, 0, 30);
    v264.ZIndex = 2;
    v261.SendIcon = l_createElement_3(l_v30_0, v264);
    v258.SendButton = l_ChatInputBarBorderTransparency_0(v259, v260, v261);
    v251.Container = l_createElement_2(v253, v254, v258);
    v246.Background = l_createElement_1(v248, v250, v251);
    return l_createElement_0(v239, v245, v246);
end;
local v287 = v28.connect(function(v281) --[[ Line: 1320 ]]
    -- upvalues: v29 (copy)
    local v282 = nil;
    if v281.targetTextChannel then
        local v283 = {
            RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText", 
            RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
        };
        for v284, v285 in pairs(v283) do
            if string.match(v281.targetTextChannel.Name, v284) then
                if v284 == "RBXWhisper" then
                    local v286 = v29(v281.targetTextChannel, v281.localPlayer);
                    if v286 then
                        v282 = {
                            v285, 
                            {
                                RBX_NAME = v286
                            }
                        };
                    end;
                else
                    v282 = v285;
                end;
            end;
        end;
    end;
    return {
        targetTextChannelDisplayName = v282
    };
end)(v280);
return v7.memo(v287);
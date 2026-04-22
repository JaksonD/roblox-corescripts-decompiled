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
local v34 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initializeGlobalCommands);
local v35 = require(l_script_FirstAncestor_0.Autocomplete.Initializations.initialCommands);
local v36 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortEmojiResultsCallback);
local v37 = require(l_script_FirstAncestor_0.Autocomplete.SortingCallbacks.sortCommandResultsCallback);
local l_script_FirstAncestor_1 = script:FindFirstAncestor("ChatInput");
local v39 = require(l_script_FirstAncestor_1.UI.AutocompleteDropdown);
local v40 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationAutocompleteEnabled);
local v41 = require(l_Parent_0.SharedFlags);
local l_FFlagExpChatUseMessagesStore_0 = v41.FFlagExpChatUseMessagesStore;
local l_FFlagEnableConsoleExpControls_0 = v41.FFlagEnableConsoleExpControls;
local l_FFlagChromeChatGamepadSupportFix_0 = v41.FFlagChromeChatGamepadSupportFix;
local l_FFlagConsoleChatUseChromeFocusUtils_0 = v41.FFlagConsoleChatUseChromeFocusUtils;
local v46 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local v47 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatFocusViaLastModeFix);
local v48 = game:DefineFastFlag("ChatOptimizeCommandProcessing", false);
local v49 = game:DefineFastFlag("ExpChatFocusablePlaceholderText", false);
local v50 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatConnectInitCommands);
local v51 = game:DefineFastFlag("ExpChatTextChatCommandRemoved", false);
local v52 = game:DefineFastFlag("ExpChatCheckForNilInputObj", false);
local v53 = game:DefineFastFlag("ExpChatDoNotSetCursorPosition", false);
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = v9.Flags.GetFFlagTextChatEnableUniverseChatTabs;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v41.FFlagRemoveDependencyArrayAntipattern;
local l_ActionBindableEvent_0 = v9.ActionBindableEvent;
local v57 = v23(false);
local function v61(v58, v59) --[[ Line: 78 ]] --[[ Name: setTransparency ]]
    return v59:map(function(v60) --[[ Line: 79 ]]
        -- upvalues: v58 (copy)
        return v58 + v60 * (1 - v58);
    end);
end;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local function v77(v67, v68, v69) --[[ Line: 90 ]] --[[ Name: onChatInputBarFocusLost ]]
    -- upvalues: l_UserInputService_0 (copy), v52 (copy), l_GuiService_0 (copy)
    local v70 = {
        Enum.KeyCode.ButtonB
    };
    local v71 = v68 or v70;
    local v72 = nil;
    v72 = l_UserInputService_0.InputBegan:Connect(function(v73) --[[ Line: 94 ]]
        -- upvalues: v52 (ref), v71 (copy), l_GuiService_0 (ref), v69 (copy), v67 (copy), v72 (ref)
        local v74 = if not v52 or v73 then v73.KeyCode else nil;
        for _, v76 in v71 do
            if v74 == v76 then
                l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                v69();
                if v67 then
                    v67();
                else
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                if v72 then
                    v72:Disconnect();
                    v72 = nil;
                    return;
                else
                    break;
                end;
            end;
        end;
    end);
    return v72;
end;
local function v96(v78, v79, v80, v81, v82) --[[ Line: 118 ]] --[[ Name: useEffectChatInputBarFocus ]]
    -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v7 (copy), v46 (copy), v14 (copy), v57 (copy), v49 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v52 (copy), l_FocusUtils_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v77 (copy), l_ActionBindableEvent_0 (copy)
    if l_FFlagConsoleChatUseChromeFocusUtils_0 then
        v7.useEffect(function() --[[ Line: 120 ]]
            -- upvalues: v46 (ref), v14 (ref), v57 (ref), v79 (copy), v78 (copy), v49 (ref), v80 (copy), l_GuiService_0 (ref), v81 (copy), l_UserInputService_0 (ref), v52 (ref), l_FocusUtils_0 (ref), v82 (copy)
            local v83 = {
                [Enum.KeyCode.DPadUp] = not v46 or nil
            };
            local v84 = nil;
            local v89 = v14.createEffect(function(v85) --[[ Line: 126 ]]
                -- upvalues: v57 (ref), v79 (ref), v78 (ref), v49 (ref), v80 (ref), l_GuiService_0 (ref), v81 (ref), v84 (ref), l_UserInputService_0 (ref), v52 (ref), v83 (copy), l_FocusUtils_0 (ref), v82 (ref)
                local v86 = v57.getChatInputBarFocused(v85);
                local v87 = if v79.current then v79.current else v78.current;
                if v49 then
                    v87 = v87 or v80.current;
                end;
                if not v87 then
                    return;
                else
                    if v86 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v81();
                        l_GuiService_0.SelectedCoreObject = v87;
                        if not v84 then
                            v84 = l_UserInputService_0.InputBegan:Connect(function(v88) --[[ Line: 148 ]]
                                -- upvalues: v52 (ref), v83 (ref), l_FocusUtils_0 (ref), v57 (ref)
                                if (not v52 or v88) and v83[v88.KeyCode] then
                                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 151 ]]
                                        -- upvalues: v57 (ref)
                                        v57.unfocusChatInputBar();
                                    end, "chat");
                                end;
                            end);
                            return;
                        end;
                    elseif l_GuiService_0.MenuIsOpen then
                        l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                        v82();
                        if v84 then
                            v84:Disconnect();
                            v84 = nil;
                        end;
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 167 ]]
                -- upvalues: v89 (copy), v84 (ref)
                v89();
                if v84 then
                    v84:Disconnect();
                    v84 = nil;
                end;
            end;
        end, {});
        return;
    else
        if l_FFlagChromeChatGamepadSupportFix_0 then
            v7.useEffect(function() --[[ Line: 177 ]]
                -- upvalues: v79 (copy), v78 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v81 (copy), v77 (ref), v82 (copy), l_ActionBindableEvent_0 (ref)
                local v90 = nil;
                local v91 = nil;
                local function v94(v92) --[[ Line: 181 ]]
                    -- upvalues: v79 (ref), v78 (ref), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v81 (ref), v91 (ref), v90 (ref), v77 (ref), v82 (ref)
                    local v93 = if v79.current then v79.current else v78.current;
                    if l_FFlagEnableConsoleExpControls_0 and v92.type == "ChatTopBarFocusSelect" and v93 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v81();
                        l_GuiService_0.SelectedCoreObject = v93;
                        v91 = task.delay(0, function() --[[ Line: 193 ]]
                            -- upvalues: v91 (ref), v90 (ref), v77 (ref), v92 (copy), v82 (ref)
                            v91 = nil;
                            if v90 then
                                v90:Disconnect();
                            end;
                            v90 = v77(v92.onSelectionLost, v92.keybinds, v82);
                        end);
                    end;
                end;
                local v95 = l_ActionBindableEvent_0.Event:Connect(v94);
                return function() --[[ Line: 207 ]]
                    -- upvalues: v95 (copy), v91 (ref), v90 (ref)
                    v95:disconnect();
                    if v91 then
                        task.cancel(v91);
                        v91 = nil;
                    end;
                    if v90 then
                        v90:Disconnect();
                        v90 = nil;
                    end;
                end;
            end, {
                v78.current, 
                v79.current
            });
        end;
        return;
    end;
end;
local function v284(v97) --[[ Line: 223 ]] --[[ Name: ChatInputBar ]]
    -- upvalues: v7 (copy), v46 (copy), v8 (copy), v47 (copy), v6 (copy), v15 (copy), v57 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v11 (copy), l_TextChatService_0 (copy), v63 (ref), v31 (copy), v33 (copy), v51 (copy), v40 (copy), v62 (ref), v32 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v64 (ref), v34 (copy), v50 (copy), v35 (copy), v24 (copy), v53 (copy), v52 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v22 (copy), l_Players_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_GuiService_0 (copy), v77 (copy), l_ActionBindableEvent_0 (copy), v96 (copy), v37 (copy), v36 (copy), l_List_0 (copy), v65 (ref), l_RBXTeamCommand_0 (copy), v66 (ref), l_RBXWhisperCommand_0 (copy), v48 (copy), l_autoCastCommand_0 (copy), v13 (copy), l_useCursor_0 (copy), v21 (copy), v39 (copy), v61 (copy), v30 (copy), v49 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v98 = v7.useRef("");
    local v99 = nil;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103, v104 = v7.useState("");
    local v105, v106 = v7.useState(0);
    v99 = v105;
    v100 = v106;
    v105, v106 = v7.useState(0);
    v101 = v105;
    v102 = v106;
    v105, v106 = v7.useState(false);
    local v107, _ = v7.useState(true);
    local v109, v110 = v7.useBinding(0);
    local v111 = v7.useRef(false);
    local v112 = v7.useRef(nil);
    local v113 = v7.useRef(nil);
    local v114 = v7.useRef(nil);
    local v115 = v7.useRef(nil);
    local v116 = v7.useRef(nil);
    local v117 = v7.useRef(nil);
    local v118 = v7.useRef(false);
    local v119 = if v46 then v8.useFocusGuiObject() else nil;
    local v120 = if not v46 or v47 then nil else v6.useLastInputMode();
    local v121 = if v47 then v15.useSignalState(v57.getChatInputBarFocused) else nil;
    local v122 = nil;
    local v123 = nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        v123 = v11(false);
        v122 = v15.useSignalState(v123.getCanLocalUserChat);
    end;
    local v124 = v7.useRef(false);
    v7.useEffect(function() --[[ Line: 270 ]]
        -- upvalues: v113 (copy), v97 (copy)
        v113.current = v97.chatInputBarSettings.TextBox;
    end, {
        if v97.chatInputBarSettings.TextBox ~= nil then v97.chatInputBarSettings.TextBox else "nil"
    });
    v7.useEffect(function() --[[ Line: 275 ]]
        -- upvalues: v97 (copy), l_TextChatService_0 (ref), v63 (ref), v31 (ref), v33 (ref), v51 (ref), v40 (ref), v62 (ref), v32 (ref), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v64 (ref), v34 (ref), v50 (ref), v35 (ref)
        if not v97.autocompleteEnabled then
            return;
        else
            local v125 = {};
            local v128 = l_TextChatService_0.DescendantAdded:Connect(function(v126) --[[ Line: 280 ]]
                -- upvalues: v63 (ref), v31 (ref), v33 (ref), v125 (copy)
                if v126:IsA("TextChatCommand") and string.sub(v126.PrimaryAlias, 1, 1) == "/" then
                    v63 = v31.new(v33);
                    local v127 = v126:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 286 ]]
                        -- upvalues: v63 (ref), v31 (ref), v33 (ref)
                        v63 = v31.new(v33);
                    end);
                    table.insert(v125, v127);
                end;
            end);
            local v130 = if v51 then l_TextChatService_0.DescendantRemoving:Connect(function(v129) --[[ Line: 294 ]]
                -- upvalues: v63 (ref), v31 (ref), v33 (ref)
                if v129:IsA("TextChatCommand") and string.sub(v129.PrimaryAlias, 1, 1) == "/" then
                    v63 = v31.new(v33);
                end;
            end) else nil;
            if v40() then
                v63 = v31.new(v33);
                v62 = v31.new(v32);
                if l_GetFFlagTextChatEnableUniverseChatTabs_0() then
                    v64 = v31.new(v34);
                end;
                if v50() then
                    local v131 = v35();
                    if v131 then
                        for _, v133 in v131 do
                            table.insert(v125, (v133:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 313 ]]
                                -- upvalues: v63 (ref), v31 (ref), v33 (ref)
                                v63 = v31.new(v33);
                            end)));
                        end;
                    end;
                end;
            end;
            return function() --[[ Line: 322 ]]
                -- upvalues: v51 (ref), v130 (copy), v128 (copy), v125 (copy)
                if v51 and v130 then
                    v130:Disconnect();
                end;
                v128:Disconnect();
                for _, v135 in ipairs(v125) do
                    v135:Disconnect();
                end;
                table.clear(v125);
            end;
        end;
    end, {});
    local v138 = v7.useCallback(function() --[[ Line: 335 ]]
        -- upvalues: v24 (ref), v103 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v111 (copy), v122 (ref), v97 (copy), v112 (copy), v113 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (ref), v104 (copy), v118 (copy)
        v24:trace("onSendActivated with input text: '{}'", v103);
        if l_FFlagExpChatUseMessagesStore_0 then
            if not v111.current or not v122 then
                v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v111.current), v122);
                return;
            end;
        elseif not v111.current or not v97.canLocalUserChat then
            v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v111.current), v97.canLocalUserChat);
            return;
        end;
        if v112.current or v113.current then
            local v136 = if v113.current then v113.current.Text else v112.current.Text;
            local v137 = if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v97.isGlobalChatTabActive and v97.onSendGlobalChat then v97.onSendGlobalChat else v97.onSendChat;
            if v137 and string.find(v136, "%S") ~= nil then
                v137(v136);
            elseif l_FFlagExpChatUseMessagesStore_0 then
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v136, v122);
            else
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v136, v97.canLocalUserChat);
            end;
            if v113.current then
                v113.current.Text = "";
                v113.current:ReleaseFocus();
            end;
            if v112.current then
                v112.current.Text = "";
                v112.current:ReleaseFocus();
            end;
            v104("");
            if v97.targetTextChannel and v97.targetTextChannelDisplayName ~= "" then
                v118.current = true;
                return;
            end;
        else
            v24:debug("onSendActivated could not send message because textBoxRef.current was nil");
        end;
    end, if l_GetFFlagTextChatEnableUniverseChatTabs_0() then {
        v103, 
        v113.current, 
        v97.isGlobalChatTabActive, 
        v97.onSendGlobalChat or false, 
        v97.onSendChat or false, 
        v122, 
        v97.canLocalUserChat, 
        v97.targetTextChannel, 
        v97.targetTextChannelDisplayName
    } else {
        v103, 
        v113.current
    });
    local v147 = v7.useCallback(function(v139) --[[ Line: 421 ]]
        -- upvalues: v97 (copy), v113 (copy), v112 (copy), v99 (ref), v104 (copy), v111 (copy), v47 (ref), v121 (copy), v119 (copy), v120 (copy), v53 (ref), v24 (ref)
        v97.autocompleteDropdownActivated(false);
        v97.autocompleteDropdownResultsChanged({});
        local v140 = if v113.current then v113.current else v112.current;
        if v140 then
            local l_Text_0 = v140.Text;
            local v142 = string.sub(l_Text_0, 1, v99 - 1);
            local v143 = string.sub(l_Text_0, v99, #l_Text_0);
            local v144 = "";
            if v97.autocompleteDropdownReducer.autocompleteType == "emojis" then
                local l_Text_1 = v139.EmojiLabel.Text;
                v144 = string.gsub(v142, ":[^:]*$", l_Text_1);
            elseif v97.autocompleteDropdownReducer.autocompleteType == "commands" then
                local l_Text_2 = v139.TextLabel.Text;
                v144 = string.gsub(v142, "(/.*)", l_Text_2);
            end;
            if v143 ~= "" then
                v144 = v144 .. v143;
            end;
            v140.Text = v144;
            v104(v144);
            if v111.current then
                v140:CaptureFocus();
                if v47 then
                    if v121 then
                        v119(v140);
                    end;
                elseif v120 == "Focus" then
                    v119(v140);
                end;
                if v143 ~= "" and not v53 then
                    v140.CursorPosition = #v144 - #v143 + 1;
                end;
            end;
            v97.autocompleteDropdownDeactivated();
            return;
        else
            v24:error("Could not find textBox");
            return;
        end;
    end, if v46 then {
        if v47 then v121 else nil, 
        v119, 
        v107, 
        v99, 
        if v47 then nil else v120, 
        v97.autocompleteDropdownActivated, 
        v97.autocompleteDropdownDeactivated, 
        v97.autocompleteDropdownReducer and v97.autocompleteDropdownReducer.autocompleteType, 
        v97.autocompleteDropdownResultsChanged
    } else nil);
    v7.useEffect(function() --[[ Line: 492 ]]
        -- upvalues: v111 (copy), v113 (copy), v112 (copy), v24 (ref)
        if v111.current then
            local v148 = if v113.current then v113.current else v112.current;
            if v148 then
                v148:CaptureFocus();
                return;
            else
                v24:error("Could not focus chat input bar because textBox not found");
            end;
        end;
    end, {
        v97.shouldFocusChatInputBar, 
        v113.current
    });
    v7.useEffect(function() --[[ Line: 503 ]]
        -- upvalues: v24 (ref), v111 (copy)
        v24:trace("Mounted");
        v111.current = true;
        return function() --[[ Line: 507 ]]
            -- upvalues: v24 (ref), v111 (ref)
            v24:trace("Unmounting");
            v111.current = false;
        end;
    end, {});
    v7.useEffect(function() --[[ Line: 513 ]]
        -- upvalues: v97 (copy), v113 (copy), v112 (copy), v100 (ref)
        local v149 = nil;
        if v97.autocompleteEnabled then
            local v150 = if v113.current then v113.current else v112.current;
            if v150 then
                v149 = v150:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 518 ]]
                    -- upvalues: v150 (copy), v100 (ref)
                    local l_CursorPosition_0 = v150.CursorPosition;
                    if l_CursorPosition_0 and l_CursorPosition_0 ~= -1 then
                        v100(l_CursorPosition_0);
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 527 ]]
            -- upvalues: v149 (ref)
            if v149 then
                v149:Disconnect();
            end;
        end;
    end, {
        v113.current
    });
    v7.useEffect(function() --[[ Line: 535 ]]
        -- upvalues: v97 (copy), v117 (copy), v52 (ref)
        if v97.autocompleteEnabled then
            v117.current = v97.userInputService.InputBegan:connect(function(v152, _) --[[ Line: 537 ]]
                -- upvalues: v97 (ref), v52 (ref)
                local v154 = v97.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down);
                local v155 = not v52 or v152;
                if v154 then
                    if v155 and v152.KeyCode == Enum.KeyCode.Up and v97.autocompleteDropdownReducer.selectedIndex > 1 then
                        v97.autocompleteDropdownSelectionChanged(v97.autocompleteDropdownReducer.selectedIndex - 1);
                    end;
                    if v155 and v152.KeyCode == Enum.KeyCode.Down and v97.autocompleteDropdownReducer.selectedIndex < #v97.autocompleteDropdownReducer.results then
                        v97.autocompleteDropdownSelectionChanged(v97.autocompleteDropdownReducer.selectedIndex + 1);
                    end;
                end;
            end);
            return function() --[[ Line: 560 ]]
                -- upvalues: v117 (ref)
                local l_current_0 = v117.current;
                if l_current_0 and l_current_0.Connected then
                    l_current_0:Disconnect();
                end;
                v117.current = nil;
            end;
        else
            return function() --[[ Line: 568 ]]

            end;
        end;
    end, {
        v97.userInputService, 
        v97.autocompleteDropdownReducer
    });
    v7.useEffect(function() --[[ Line: 573 ]]
        -- upvalues: v116 (copy), v97 (copy), v52 (ref), v113 (copy), v112 (copy), v118 (copy), v24 (ref), v103 (copy)
        v116.current = v97.userInputService.InputEnded:connect(function(v157, _) --[[ Line: 574 ]]
            -- upvalues: v52 (ref), v113 (ref), v112 (ref), v118 (ref), v97 (ref), v24 (ref), v103 (ref)
            local v159 = not v52 or v157;
            if if v113.current then v113.current and v113.current:IsFocused() and v159 and v157.KeyCode == Enum.KeyCode.Backspace else v112.current and v112.current:IsFocused() and v159 and v157.KeyCode == Enum.KeyCode.Backspace then
                if v118.current and not v97.isChannelBarVisible then
                    v97.resetTargetChannel();
                    v24:debug("ChatInputBar ChatInputBarResetTargetChannel()");
                    v118.current = false;
                    return;
                elseif v103 == "" and v97.targetTextChannelDisplayName ~= "" then
                    v118.current = true;
                end;
            end;
        end);
        return function() --[[ Line: 602 ]]
            -- upvalues: v116 (ref)
            local l_current_1 = v116.current;
            if l_current_1 and l_current_1.Connected then
                l_current_1:Disconnect();
            end;
            v116.current = nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v97.userInputService, 
        v113.current, 
        v97.isChannelBarVisible, 
        v97.targetTextChannelDisplayName, 
        v97.resetTargetChannel
    } else l_dependencyArray_0(v97.userInputService, v113.current, v97.isChannelBarVisible, v97.targetTextChannelDisplayName, v97.resetTargetChannel));
    v7.useEffect(function() --[[ Line: 628 ]]
        -- upvalues: v97 (copy), v52 (ref), v22 (ref), v113 (copy), v112 (copy), v124 (copy)
        local function v165(_, v162, v163) --[[ Line: 629 ]] --[[ Name: handleAction ]]
            -- upvalues: v97 (ref), v52 (ref), v22 (ref), v113 (ref), v112 (ref), v124 (ref)
            if v97.isChatHotkeyEnabled and (not v52 or v163) and (v163.KeyCode == v22.ChatInputBarDefaultFocusKeyCode or v163.KeyCode == v97.devDefinedFocusKeyCode) then
                local v164 = if v113.current then v113.current else v112.current;
                if v164 and v162 == Enum.UserInputState.Begin and v164 and not v164:IsFocused() then
                    task.delay(0, function() --[[ Line: 651 ]]
                        -- upvalues: v164 (copy)
                        v164:CaptureFocus();
                    end);
                    v97.focusChatHotKeyActivated();
                    v124.current = true;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end;
        v97.contextActionService:BindCoreAction("FocusChat", v165, false, Enum.UserInputType.Keyboard);
        return function() --[[ Line: 675 ]]
            -- upvalues: v97 (ref)
            v97.contextActionService:UnbindCoreAction("FocusChat");
        end;
    end, {
        v97.isChatHotkeyEnabled, 
        v97.devDefinedFocusKeyCode, 
        v124.current, 
        v113.current
    });
    local function _(v166) --[[ Line: 682 ]]
        -- upvalues: l_TextChatService_0 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_0 then
            l_ChatInputBarConfiguration_0.IsFocusedWrite = v166;
        end;
    end;
    local v170 = v7.useCallback(function() --[[ Line: 689 ]]
        -- upvalues: v106 (copy), v97 (copy), l_TextChatService_0 (ref)
        v106(true);
        v97.onFocus();
        local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_1 then
            l_ChatInputBarConfiguration_1.IsFocusedWrite = true;
        end;
    end, {
        v97.onFocus
    });
    local v188 = v7.useCallback(function(_, v172, v173) --[[ Line: 695 ]]
        -- upvalues: v24 (ref), v115 (copy), v46 (ref), v97 (copy), v147 (copy), v138 (copy), v111 (copy), v52 (ref), v113 (copy), v112 (copy), v99 (ref), v53 (ref), v106 (copy), l_TextChatService_0 (ref), v124 (copy), l_Players_0 (ref)
        v24:debug("Focus lost with enter: {}", (tostring(v172)));
        local l_current_2 = v115.current;
        if v172 or v46 and v173 and (v173.KeyCode == Enum.KeyCode.Return or v173.KeyCode == Enum.KeyCode.KeypadEnter) then
            if v97.autocompleteEnabled and l_current_2 and v97.autocompleteDropdownReducer.activated and #v97.autocompleteDropdownReducer.results > 0 then
                local l_OffsetFrame_0 = l_current_2.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                for _, v177 in ipairs(l_OffsetFrame_0:GetChildren()) do
                    if v177.ClassName == "Frame" and v177.LayoutOrder == v97.autocompleteDropdownReducer.selectedIndex then
                        v147(v177.TextLabelButton);
                        return;
                    end;
                end;
            else
                v138();
            end;
        end;
        if v111.current then
            if v97.autocompleteEnabled and l_current_2 and v97.autocompleteDropdownReducer.activated then
                if not v52 or v173 then
                    if v173.KeyCode == Enum.KeyCode.Escape then
                        v97.autocompleteDropdownActivated(false);
                        local v178 = if v113.current then v113.current else v112.current;
                        if v178 then
                            local l_v99_0 = v99;
                            v178:CaptureFocus();
                            if not v53 then
                                v178.CursorPosition = l_v99_0;
                            end;
                            return;
                        else
                            v24:error("Could not focus chat input bar because textBox not found");
                        end;
                    else
                        local l_X_0 = v173.Position.X;
                        local l_Y_0 = v173.Position.Y;
                        local l_X_1 = l_current_2.AbsolutePosition.X;
                        local v183 = l_X_1 + l_current_2.AbsoluteSize.X;
                        local l_Y_1 = l_current_2.AbsolutePosition.Y;
                        local v185 = l_Y_1 + l_current_2.AbsoluteSize.Y;
                        if l_X_0 < l_X_1 or v183 < l_X_0 or l_Y_0 < l_Y_1 or v185 < l_Y_0 then
                            v97.autocompleteDropdownActivated(false);
                        end;
                    end;
                end;
            else
                v106(false);
            end;
        end;
        v97.onUnfocus();
        local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_2 then
            l_ChatInputBarConfiguration_2.IsFocusedWrite = false;
        end;
        if v124.current then
            l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
            if l_ChatInputBarConfiguration_2 then
                local l_TextBox_0 = Instance.new("TextBox");
                l_TextBox_0.Visible = false;
                l_TextBox_0.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
                l_TextBox_0:CaptureFocus();
                l_TextBox_0:ReleaseFocus();
                l_TextBox_0:Destroy();
            end;
            v124.current = false;
        end;
    end);
    v7.useEffect(function() --[[ Line: 800 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v113 (copy), v112 (copy), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v170 (copy), v77 (ref), v188 (copy), l_ActionBindableEvent_0 (ref)
        local v189 = nil;
        local v190 = nil;
        local function v193(v191) --[[ Line: 804 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v113 (ref), v112 (ref), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v170 (ref), v190 (ref), v189 (ref), v77 (ref), v188 (ref)
            local v192 = nil;
            if l_FFlagEnableConsoleExpControls_0 then
                v192 = if v113.current then v113.current else v112.current;
            end;
            if v191.type == "ChatTopBarFocusActivated" then
                if not l_FFlagEnableConsoleExpControls_0 then
                    v192 = if v113.current then v113.current else v112.current;
                end;
                if v192 then
                    task.delay(0, function() --[[ Line: 815 ]]
                        -- upvalues: v192 (ref)
                        v192:CaptureFocus();
                    end);
                end;
            elseif not l_FFlagChromeChatGamepadSupportFix_0 and l_FFlagEnableConsoleExpControls_0 and v191.type == "ChatTopBarFocusSelect" and v192 then
                l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                v170();
                l_GuiService_0.SelectedCoreObject = v192;
                v190 = task.delay(0, function() --[[ Line: 830 ]]
                    -- upvalues: v190 (ref), v189 (ref), v77 (ref), v191 (copy), v188 (ref)
                    v190 = nil;
                    if v189 then
                        v189:Disconnect();
                    end;
                    v189 = v77(v191.onSelectionLost, v191.keybinds, v188);
                end);
            end;
        end;
        local v194 = l_ActionBindableEvent_0.Event:Connect(v193);
        return function() --[[ Line: 844 ]]
            -- upvalues: v194 (copy), v190 (ref), v189 (ref)
            v194:disconnect();
            if v190 then
                task.cancel(v190);
                v190 = nil;
            end;
            if v189 then
                v189:Disconnect();
                v189 = nil;
            end;
        end;
    end, {
        v112.current, 
        v113.current
    });
    v96(v112, v113, v114, v170, v188);
    local function v214(v195, v196, v197) --[[ Line: 862 ]] --[[ Name: handleAutocomplete ]]
        -- upvalues: v97 (copy), v64 (ref), v63 (ref), v37 (ref), v62 (ref), v36 (ref), v101 (ref), l_List_0 (ref), v104 (copy), v53 (ref), v115 (copy), v147 (copy), v102 (ref)
        if v197 == "/" and v195.CursorPosition == 2 or v97.autocompleteDropdownReducer.autocompleteType == "commands" and v197 ~= ":" then
            v97.autocompleteDropdownTypeChanged("commands");
            v97.autocompleteDropdownActivated(true);
            if v197 ~= "" and v197 ~= " " then
                local v198 = string.sub(v196, 1, v195.CursorPosition - 1):lower();
                local v199 = (if v97.isGlobalChatTabActive and v64 then v64 else v63):getResults(v198, v37);
                v97.autocompleteDropdownResultsChanged(v199);
                if v198 == v199[1] then
                    v97.autocompleteDropdownActivated(false);
                    v97.autocompleteDropdownResultsChanged({});
                    return;
                end;
            else
                v97.autocompleteDropdownDeactivated();
            end;
            return;
        elseif (v97.autocompleteDropdownReducer.activated or #v97.autocompleteDropdownReducer.results > 0) and v97.autocompleteDropdownReducer.autocompleteType == "emojis" then
            v97.autocompleteDropdownActivated(true);
            local v200 = string.sub(v196, 1, v195.CursorPosition - 1);
            local v201 = string.find(v200, ":[^:]*$");
            if v197 ~= "" and v197 ~= ":" and v197 ~= " " and v201 then
                local v202 = string.sub(v196, v201 + 1, v195.CursorPosition - 1):lower();
                local v203 = {};
                if v202 and string.len(v202) > 1 then
                    v203 = v62:getResults(v202, v36);
                end;
                v97.autocompleteDropdownResultsChanged(v203);
                return;
            elseif v197 == ":" then
                if v201 ~= v101 then
                    local v204 = string.sub(v196, v101 + 1, v195.CursorPosition - 2):lower();
                    if l_List_0.includes(v97.autocompleteDropdownReducer.results, v204) then
                        local v205 = string.sub(v196, v195.CursorPosition, #v196);
                        local v206 = string.sub(v196, 1, v195.CursorPosition - 2) .. v205;
                        v195.Text = v206;
                        v104(v206);
                        if not v53 then
                            v195.CursorPosition = v195.CursorPosition - 1;
                        end;
                        local l_current_3 = v115.current;
                        if l_current_3 then
                            local l_OffsetFrame_1 = l_current_3.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                            for _, v210 in ipairs(l_OffsetFrame_1:GetChildren()) do
                                if v210.ClassName == "Frame" then
                                    local l_TextLabelButton_0 = v210:FindFirstChild("TextLabelButton");
                                    if l_TextLabelButton_0 then
                                        local l_TextLabel_0 = l_TextLabelButton_0:FindFirstChild("TextLabel");
                                        if l_TextLabel_0 and l_TextLabel_0.Text and l_TextLabel_0.Text == v204 then
                                            v147(l_TextLabelButton_0);
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    else
                        v97.autocompleteDropdownActivated(false);
                        v97.autocompleteDropdownResultsChanged({});
                    end;
                    return;
                else
                    v97.autocompleteDropdownResultsChanged({});
                    return;
                end;
            elseif v197 == " " then
                v97.autocompleteDropdownActivated(false);
                v97.autocompleteDropdownResultsChanged({});
                return;
            else
                v97.autocompleteDropdownDeactivated();
                v102(0);
                return;
            end;
        else
            local v213 = string.find(v196, ":[^:]*$");
            if v197 == ":" then
                v97.autocompleteDropdownTypeChanged("emojis");
                v97.autocompleteDropdownActivated(true);
                v97.autocompleteDropdownResultsChanged({});
                v102(v213);
            end;
            return;
        end;
    end;
    if v51 then
        v7.useEffect(function() --[[ Line: 981 ]]
            -- upvalues: l_TextChatService_0 (ref), v65 (ref), l_RBXTeamCommand_0 (ref), v66 (ref), l_RBXWhisperCommand_0 (ref)
            if l_TextChatService_0.CreateDefaultCommands then
                v65 = l_TextChatService_0:FindFirstChild(l_RBXTeamCommand_0.name, true);
                v66 = l_TextChatService_0:FindFirstChild(l_RBXWhisperCommand_0.name, true);
            end;
        end, {});
    end;
    local v226 = v7.useCallback(function(v215) --[[ Line: 989 ]]
        -- upvalues: v97 (copy), v104 (copy), v24 (ref), v103 (copy), v40 (ref), v214 (copy), v118 (copy), v48 (ref), v98 (copy), v51 (ref), l_autoCastCommand_0 (ref), l_RBXTeamCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v65 (ref), v66 (ref), v13 (ref)
        local l_Text_3 = v215.Text;
        if v97.autocompleteEnabled then
            local v217 = string.find(l_Text_3, "\r");
            local v218 = v215.CursorPosition < #l_Text_3 + 1;
            if v217 then
                local v219 = string.gsub(l_Text_3, "\r", "");
                v215.Text = v219;
                v104(v219);
                if v218 then
                    v215.CursorPosition = v215.CursorPosition - 1;
                end;
                return;
            end;
        end;
        local v220 = string.sub(l_Text_3, v215.CursorPosition - 1, v215.CursorPosition - 1);
        v24:trace("Input: {}", l_Text_3);
        local v221 = if utf8.len(l_Text_3) then utf8.len(utf8.nfcnormalize(l_Text_3)) else string.len(l_Text_3);
        if v221 and v97.messageCharacterLimit < v221 then
            v24:debug("Message is over the character limit of {}", (tostring(v97.messageCharacterLimit)));
            v215.Text = v103;
            return;
        else
            v104(l_Text_3);
            if v40() and v97.autocompleteEnabled then
                v214(v215, l_Text_3, v220);
            end;
            local l_v118_0 = v118;
            local v223 = false;
            if #l_Text_3 == 0 then
                v223 = v118.current;
            end;
            l_v118_0.current = v223;
            if v48 then
                if string.sub(l_Text_3, 1, 1) == "/" and v97.localPlayer and l_Text_3 ~= v98.current then
                    v98.current = l_Text_3;
                    l_v118_0 = v97.localPlayer.UserId;
                    v223 = if v51 then {} else {
                        l_autoCastCommand_0(l_RBXTeamCommand_0, l_v118_0, l_Text_3), 
                        l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v118_0, l_Text_3)
                    };
                    if v51 then
                        if v65 and v65.Enabled then
                            table.insert(v223, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v118_0, l_Text_3));
                        end;
                        if v66 and v66.Enabled then
                            table.insert(v223, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v118_0, l_Text_3));
                        end;
                        if #v223 == 0 then
                            v223 = {
                                v13.reject()
                            };
                        end;
                    end;
                    v13.any(v223):andThen(function() --[[ Line: 1053 ]]
                        -- upvalues: v215 (copy), v104 (ref), v118 (ref)
                        v215.Text = "";
                        v104("");
                        v118.current = true;
                    end):catch(function(v224) --[[ Line: 1059 ]]
                        -- upvalues: v24 (ref)
                        v24:trace("Could not send autoCastCommand. Error: {}", v224);
                    end);
                    return;
                elseif string.sub(l_Text_3, 1, 1) ~= "/" then
                    v98.current = "";
                    return;
                end;
            elseif v97.localPlayer then
                l_v118_0 = v97.localPlayer.UserId;
                v223 = if v51 then {} else {
                    l_autoCastCommand_0(l_RBXTeamCommand_0, l_v118_0, l_Text_3), 
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v118_0, l_Text_3)
                };
                if v51 then
                    if v65 and v65.Enabled then
                        table.insert(v223, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v118_0, l_Text_3));
                    end;
                    if v66 and v66.Enabled then
                        table.insert(v223, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v118_0, l_Text_3));
                    end;
                    if #v223 == 0 then
                        v223 = {
                            v13.reject()
                        };
                    end;
                end;
                v13.any(v223):andThen(function() --[[ Line: 1090 ]]
                    -- upvalues: v215 (copy), v104 (ref), v118 (ref)
                    v215.Text = "";
                    v104("");
                    v118.current = true;
                end):catch(function(v225) --[[ Line: 1096 ]]
                    -- upvalues: v24 (ref)
                    v24:trace("Could not send autoCastCommand. Error: {}", v225);
                end);
            end;
            return;
        end;
    end);
    local v228 = v7.useCallback(function() --[[ Line: 1103 ]]
        -- upvalues: v113 (copy), v112 (copy)
        local v227 = if v113.current then v113.current else v112.current;
        if v227 then
            v227:ReleaseFocus(true);
        end;
    end, {
        v112.current, 
        v113.current
    });
    local v230 = v7.useCallback(function(v229) --[[ Line: 1110 ]]
        -- upvalues: v110 (copy)
        v110(v229.Visible and v229.AbsoluteSize.X or 0);
    end);
    local v231 = if v46 then l_useCursor_0() else nil;
    local v233 = v7.useCallback(function(v232) --[[ Line: 1117 ]]
        -- upvalues: v97 (copy)
        v97.autocompleteDropdownSelectionChanged(v232.LayoutOrder);
    end);
    local v234 = v103 == "";
    local v235 = v234 and not v105;
    local l_chatInputBarSettings_0 = v97.chatInputBarSettings;
    local l_chatWindowSettings_0 = v97.chatWindowSettings;
    local l_BackgroundTransparency_0 = v21(l_chatInputBarSettings_0).BackgroundTransparency;
    local l_BackgroundTransparency_1 = v21(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v21(l_chatWindowSettings_0).BackgroundColor3;
    local l_isSpatialUIEnabled_0 = v97.isSpatialUIEnabled;
    local l_createElement_0 = v7.createElement;
    local v243 = "Frame";
    local v249 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v97.transparencyValue:map(function(v244) --[[ Line: 79 ]]
            -- upvalues: l_BackgroundTransparency_1 (copy)
            return l_BackgroundTransparency_1 + v244 * (1 - l_BackgroundTransparency_1);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v97.LayoutOrder, 
        Size = v97.size, 
        Visible = v97.visible, 
        ZIndex = 2, 
        [v7.Event.MouseEnter] = v97.onHovered, 
        [v7.Event.MouseLeave] = v97.onUnhovered, 
        [v7.Change.AbsoluteSize] = v7.useCallback(function(v245) --[[ Line: 1143 ]]
            -- upvalues: l_TextChatService_0 (ref), v97 (copy)
            local l_ChatInputBarConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_3 and v97.onAbsoluteSizeChanged then
                v97.onAbsoluteSizeChanged(v245, l_ChatInputBarConfiguration_3);
            end;
        end), 
        [v7.Change.AbsolutePosition] = v7.useCallback(function(v247) --[[ Line: 1149 ]]
            -- upvalues: l_TextChatService_0 (ref), v97 (copy)
            local l_ChatInputBarConfiguration_4 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_4 and v97.onAbsolutePositionChanged then
                v97.onAbsolutePositionChanged(v247, l_ChatInputBarConfiguration_4);
            end;
        end)
    };
    local v250 = {
        AutocompleteDropdown = v40() and v97.autocompleteEnabled and v7.createElement(v39, {
            chatInputBarSettings = l_chatInputBarSettings_0, 
            chatWindowSettings = l_chatWindowSettings_0, 
            setTransparency = v61, 
            transparencyValue = v97.transparencyValue, 
            activated = v97.autocompleteDropdownReducer.activated and v105, 
            results = v97.autocompleteDropdownReducer.results, 
            selectedIndex = v97.autocompleteDropdownReducer.selectedIndex, 
            autocompleteType = v97.autocompleteDropdownReducer.autocompleteType, 
            onAutocompleteDropdownHover = v233, 
            onAutocompleteSelected = v147, 
            autocompleteDropdownRef = v115, 
            textBoxRef = if l_chatInputBarSettings_0.TextBox then v113 else v112
        }) or nil, 
        UISizeConstraint = v7.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v22.ChatWindowMaxWidth, 1e999)
        }), 
        UIPadding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = v97.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v7.createElement;
    local v252 = "Frame";
    local v254 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_chatInputBarSettings_0.BackgroundColor3, 
        BackgroundTransparency = v97.transparencyValue:map(function(v253) --[[ Line: 79 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            return l_BackgroundTransparency_0 + v253 * (1 - l_BackgroundTransparency_0);
        end), 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v255 = {};
    local l_createElement_2 = v7.createElement;
    local v257 = "UIStroke";
    local v258 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = v22.ChatInputBarBorderColor3
    };
    local l_ChatInputBarBorderTransparency_0 = v22.ChatInputBarBorderTransparency;
    local l_l_ChatInputBarBorderTransparency_0_0 = l_ChatInputBarBorderTransparency_0 --[[ copy: 59 -> 72 ]];
    v258.Transparency = v97.transparencyValue:map(function(v261) --[[ Line: 79 ]]
        -- upvalues: l_l_ChatInputBarBorderTransparency_0_0 (copy)
        return l_l_ChatInputBarBorderTransparency_0_0 + v261 * (1 - l_l_ChatInputBarBorderTransparency_0_0);
    end);
    v255.Border = l_createElement_2(v257, v258);
    v255.Corner = v7.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    });
    l_createElement_2 = v7.createElement;
    v257 = "Frame";
    v258 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v262 = {};
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    local v263 = "Frame";
    local v264 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        SelectionBehaviorDown = if not l_FFlagEnableConsoleExpControls_0 or v46 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = if not l_FFlagEnableConsoleExpControls_0 or v46 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = if not l_FFlagEnableConsoleExpControls_0 or v46 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = if not l_FFlagEnableConsoleExpControls_0 or v46 then nil else Enum.SelectionBehavior.Stop, 
        SelectionGroup = l_FFlagEnableConsoleExpControls_0 and not v46 or nil, 
        Size = UDim2.new(1, -v97.sendButtonContainerWidth, 0, 0)
    };
    local v265 = {};
    local l_createElement_3 = v7.createElement;
    local l_v30_0 = v30;
    local v268 = {};
    local l_transparencyValue_0 = v97.transparencyValue;
    local v270 = 0;
    local l_v270_0 = v270 --[[ copy: 71 -> 73 ]];
    v268.transparency = l_transparencyValue_0:map(function(v272) --[[ Line: 79 ]]
        -- upvalues: l_v270_0 (copy)
        return l_v270_0 + v272 * (1 - l_v270_0);
    end);
    v268.onAbsoluteSizeChanged = v230;
    v268.onChannelChipActivated = v97.resetTargetChannel;
    v268.targetTextChannelDisplayName = v97.targetTextChannelDisplayName or "";
    v268.isChannelBarVisible = v97.isChannelBarVisible;
    v268.developerChannelTabsEnabled = v97.developerChannelTabsEnabled;
    v265.TargetChannelChip = l_createElement_3(l_v30_0, v268);
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then not v122 else not v97.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "TextLabel";
        v268 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v22.ChatInputBarFont, 
            Text = v97.disabledChatPlaceholderText, 
            Position = UDim2.fromScale(1, 0), 
            Size = v109:map(function(v273) --[[ Line: 1242 ]]
                return UDim2.new(1, -(v273 + 8), 0, 0);
            end), 
            TextColor3 = v235 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3, 
            TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
        };
        l_transparencyValue_0 = v235 and 0.5 or 0;
        local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 67 -> 75 ]];
        v268.TextTransparency = v97.transparencyValue:map(function(v275) --[[ Line: 79 ]]
            -- upvalues: l_l_transparencyValue_0_0 (copy)
            return l_l_transparencyValue_0_0 + v275 * (1 - l_l_transparencyValue_0_0);
        end);
        v268.Selectable = v49 and true or nil;
        v268.SelectionImageObject = if v49 then v231 else nil;
        v268.TextWrapped = true;
        v268.TextXAlignment = Enum.TextXAlignment.Left;
        v268.TextYAlignment = Enum.TextYAlignment.Top;
        v268.ref = if v49 then v114 else nil;
        l_createElement_3 = l_createElement_3(l_v30_0, v268);
    end;
    v265.DisabledPlaceholderLabel = l_createElement_3;
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then v122 else v97.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "Frame";
        v268 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = v109:map(function(v276) --[[ Line: 1270 ]]
                return UDim2.new(1, -(v276 + 8), 0, 0);
            end)
        };
        local v277 = {};
        l_transparencyValue_0 = if l_FFlagExpChatUseMessagesStore_0 then v122 else v97.canLocalUserChat;
        if l_transparencyValue_0 then
            l_transparencyValue_0 = v7.createElement;
            local v278 = "TextBox";
            local v279 = {
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                FontFace = l_chatInputBarSettings_0.FontFace, 
                PlaceholderText = v235 and v97.placeholderText or "", 
                Selectable = l_FFlagEnableConsoleExpControls_0 and true or nil, 
                SelectionImageObject = v231, 
                Size = UDim2.fromScale(1, 0), 
                Text = "", 
                PlaceholderColor3 = l_chatInputBarSettings_0.PlaceholderColor3, 
                TextColor3 = l_chatInputBarSettings_0.TextColor3, 
                TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
            };
            v270 = v235 and 0.5 or 0;
            local l_v270_1 = v270 --[[ copy: 71 -> 74 ]];
            v279.TextTransparency = v97.transparencyValue:map(function(v281) --[[ Line: 79 ]]
                -- upvalues: l_v270_1 (copy)
                return l_v270_1 + v281 * (1 - l_v270_1);
            end);
            v270 = l_chatInputBarSettings_0.TextStrokeTransparency;
            v279.TextStrokeTransparency = v97.transparencyValue:map(function(v282) --[[ Line: 79 ]]
                -- upvalues: v270 (copy)
                return v270 + v282 * (1 - v270);
            end);
            v279.TextStrokeColor3 = l_chatInputBarSettings_0.TextStrokeColor3;
            v279.TextWrapped = true;
            v279.TextXAlignment = Enum.TextXAlignment.Left;
            v279.TextYAlignment = Enum.TextYAlignment.Top;
            v279.ZIndex = 2;
            v279[v7.Event.Focused] = v170;
            v279[v7.Event.FocusLost] = v188;
            v279[v7.Change.Text] = v226;
            v279[v7.Event.ReturnPressedFromOnScreenKeyboard] = v228;
            v279.ref = if l_chatInputBarSettings_0.TextBox then v113 else v112;
            l_transparencyValue_0 = l_transparencyValue_0(v278, v279);
        end;
        v277.TextBox = l_transparencyValue_0;
        l_createElement_3 = l_createElement_3(l_v30_0, v268, v277);
    end;
    v265.TextBoxContainer = l_createElement_3;
    v265.UIPadding = v7.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10), 
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10)
    });
    v262.TextContainer = l_ChatInputBarBorderTransparency_0(v263, v264, v265);
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    v263 = "TextButton";
    v264 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Selectable = not v46 and nil, 
        Size = UDim2.new(0, v97.sendButtonContainerWidth, 1, 0), 
        Text = "", 
        [v7.Event.Activated] = v138
    };
    v265 = {
        Layout = v7.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    l_createElement_3 = v7.createElement;
    l_v30_0 = l_ImageSetLabel_0;
    v268 = {
        BackgroundTransparency = 1, 
        ImageColor3 = v234 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3
    };
    l_transparencyValue_0 = v234 and 0.5 or 0;
    v268.ImageTransparency = v97.transparencyValue:map(function(v283) --[[ Line: 79 ]]
        -- upvalues: l_transparencyValue_0 (copy)
        return l_transparencyValue_0 + v283 * (1 - l_transparencyValue_0);
    end);
    v268.Image = l_Images_0["icons/actions/send"];
    v268.Size = UDim2.new(0, 30, 0, 30);
    v268.ZIndex = 2;
    v265.SendIcon = l_createElement_3(l_v30_0, v268);
    v262.SendButton = l_ChatInputBarBorderTransparency_0(v263, v264, v265);
    v255.Container = l_createElement_2(v257, v258, v262);
    v250.Background = l_createElement_1(v252, v254, v255);
    return l_createElement_0(v243, v249, v250);
end;
local v291 = v28.connect(function(v285) --[[ Line: 1355 ]]
    -- upvalues: v29 (copy)
    local v286 = nil;
    if v285.targetTextChannel then
        local v287 = {
            RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText", 
            RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
        };
        for v288, v289 in pairs(v287) do
            if string.match(v285.targetTextChannel.Name, v288) then
                if v288 == "RBXWhisper" then
                    local v290 = v29(v285.targetTextChannel, v285.localPlayer);
                    if v290 then
                        v286 = {
                            v289, 
                            {
                                RBX_NAME = v290
                            }
                        };
                    end;
                else
                    v286 = v289;
                end;
            end;
        end;
    end;
    return {
        targetTextChannelDisplayName = v286
    };
end)(v284);
return v7.memo(v291);
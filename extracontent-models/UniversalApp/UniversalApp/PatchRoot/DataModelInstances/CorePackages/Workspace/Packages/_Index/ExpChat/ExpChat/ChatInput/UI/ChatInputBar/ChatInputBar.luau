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
local l_ActionBindableEvent_0 = v9.ActionBindableEvent;
local v54 = v23(false);
local function v58(v55, v56) --[[ Line: 72 ]] --[[ Name: setTransparency ]]
    return v56:map(function(v57) --[[ Line: 73 ]]
        -- upvalues: v55 (copy)
        return v55 + v57 * (1 - v55);
    end);
end;
local v59 = nil;
local v60 = nil;
local v61 = nil;
local v62 = nil;
local function v73(v63, v64, v65) --[[ Line: 83 ]] --[[ Name: onChatInputBarFocusLost ]]
    -- upvalues: l_UserInputService_0 (copy), v51 (copy), l_GuiService_0 (copy)
    local v66 = {
        Enum.KeyCode.ButtonB
    };
    local v67 = v64 or v66;
    local v68 = nil;
    v68 = l_UserInputService_0.InputBegan:Connect(function(v69) --[[ Line: 87 ]]
        -- upvalues: v51 (ref), v67 (copy), l_GuiService_0 (ref), v65 (copy), v63 (copy), v68 (ref)
        local v70 = if not v51 or v69 then v69.KeyCode else nil;
        for _, v72 in v67 do
            if v70 == v72 then
                l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                v65();
                if v63 then
                    v63();
                else
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                if v68 then
                    v68:Disconnect();
                    v68 = nil;
                    return;
                else
                    break;
                end;
            end;
        end;
    end);
    return v68;
end;
local function v92(v74, v75, v76, v77, v78) --[[ Line: 111 ]] --[[ Name: useEffectChatInputBarFocus ]]
    -- upvalues: l_FFlagConsoleChatUseChromeFocusUtils_0 (copy), v7 (copy), v45 (copy), v14 (copy), v54 (copy), v48 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v51 (copy), l_FocusUtils_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), v73 (copy), l_ActionBindableEvent_0 (copy)
    if l_FFlagConsoleChatUseChromeFocusUtils_0 then
        v7.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: v45 (ref), v14 (ref), v54 (ref), v75 (copy), v74 (copy), v48 (ref), v76 (copy), l_GuiService_0 (ref), v77 (copy), l_UserInputService_0 (ref), v51 (ref), l_FocusUtils_0 (ref), v78 (copy)
            local v79 = {
                [Enum.KeyCode.DPadUp] = not v45 or nil
            };
            local v80 = nil;
            local v85 = v14.createEffect(function(v81) --[[ Line: 119 ]]
                -- upvalues: v54 (ref), v75 (ref), v74 (ref), v48 (ref), v76 (ref), l_GuiService_0 (ref), v77 (ref), v80 (ref), l_UserInputService_0 (ref), v51 (ref), v79 (copy), l_FocusUtils_0 (ref), v78 (ref)
                local v82 = v54.getChatInputBarFocused(v81);
                local v83 = if v75.current then v75.current else v74.current;
                if v48 then
                    v83 = v83 or v76.current;
                end;
                if not v83 then
                    return;
                else
                    if v82 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v77();
                        l_GuiService_0.SelectedCoreObject = v83;
                        if not v80 then
                            v80 = l_UserInputService_0.InputBegan:Connect(function(v84) --[[ Line: 141 ]]
                                -- upvalues: v51 (ref), v79 (ref), l_FocusUtils_0 (ref), v54 (ref)
                                if (not v51 or v84) and v79[v84.KeyCode] then
                                    l_FocusUtils_0.FocusOnChrome(function() --[[ Line: 144 ]]
                                        -- upvalues: v54 (ref)
                                        v54.unfocusChatInputBar();
                                    end, "chat");
                                end;
                            end);
                            return;
                        end;
                    elseif l_GuiService_0.MenuIsOpen then
                        l_GuiService_0:SetMenuIsOpen(false, "ExperienceChat");
                        v78();
                        if v80 then
                            v80:Disconnect();
                            v80 = nil;
                        end;
                    end;
                    return;
                end;
            end);
            return function() --[[ Line: 160 ]]
                -- upvalues: v85 (copy), v80 (ref)
                v85();
                if v80 then
                    v80:Disconnect();
                    v80 = nil;
                end;
            end;
        end, {});
        return;
    else
        if l_FFlagChromeChatGamepadSupportFix_0 then
            v7.useEffect(function() --[[ Line: 170 ]]
                -- upvalues: v75 (copy), v74 (copy), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v77 (copy), v73 (ref), v78 (copy), l_ActionBindableEvent_0 (ref)
                local v86 = nil;
                local v87 = nil;
                local function v90(v88) --[[ Line: 174 ]]
                    -- upvalues: v75 (ref), v74 (ref), l_FFlagEnableConsoleExpControls_0 (ref), l_GuiService_0 (ref), v77 (ref), v87 (ref), v86 (ref), v73 (ref), v78 (ref)
                    local v89 = if v75.current then v75.current else v74.current;
                    if l_FFlagEnableConsoleExpControls_0 and v88.type == "ChatTopBarFocusSelect" and v89 then
                        l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                        v77();
                        l_GuiService_0.SelectedCoreObject = v89;
                        v87 = task.delay(0, function() --[[ Line: 186 ]]
                            -- upvalues: v87 (ref), v86 (ref), v73 (ref), v88 (copy), v78 (ref)
                            v87 = nil;
                            if v86 then
                                v86:Disconnect();
                            end;
                            v86 = v73(v88.onSelectionLost, v88.keybinds, v78);
                        end);
                    end;
                end;
                local v91 = l_ActionBindableEvent_0.Event:Connect(v90);
                return function() --[[ Line: 200 ]]
                    -- upvalues: v91 (copy), v87 (ref), v86 (ref)
                    v91:disconnect();
                    if v87 then
                        task.cancel(v87);
                        v87 = nil;
                    end;
                    if v86 then
                        v86:Disconnect();
                        v86 = nil;
                    end;
                end;
            end, {
                v74.current, 
                v75.current
            });
        end;
        return;
    end;
end;
local function v279(v93) --[[ Line: 216 ]] --[[ Name: ChatInputBar ]]
    -- upvalues: v7 (copy), v45 (copy), v8 (copy), v46 (copy), v6 (copy), v15 (copy), v54 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v11 (copy), l_TextChatService_0 (copy), v60 (ref), v31 (copy), v33 (copy), v50 (copy), v39 (copy), v59 (ref), v32 (copy), v49 (copy), v34 (copy), v24 (copy), v52 (copy), v51 (copy), l_dependencyArray_0 (copy), v22 (copy), l_Players_0 (copy), l_FFlagEnableConsoleExpControls_0 (copy), l_FFlagChromeChatGamepadSupportFix_0 (copy), l_GuiService_0 (copy), v73 (copy), l_ActionBindableEvent_0 (copy), v92 (copy), v36 (copy), v35 (copy), l_List_0 (copy), v61 (ref), l_RBXTeamCommand_0 (copy), v62 (ref), l_RBXWhisperCommand_0 (copy), v47 (copy), l_autoCastCommand_0 (copy), v13 (copy), l_useCursor_0 (copy), v21 (copy), v38 (copy), v58 (copy), v30 (copy), v48 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v94 = v7.useRef("");
    local v95 = nil;
    local v96 = nil;
    local v97 = nil;
    local v98 = nil;
    local v99, v100 = v7.useState("");
    local v101, v102 = v7.useState(0);
    v95 = v101;
    v96 = v102;
    v101, v102 = v7.useState(0);
    v97 = v101;
    v98 = v102;
    v101, v102 = v7.useState(false);
    local v103, _ = v7.useState(true);
    local v105, v106 = v7.useBinding(0);
    local v107 = v7.useRef(false);
    local v108 = v7.useRef(nil);
    local v109 = v7.useRef(nil);
    local v110 = v7.useRef(nil);
    local v111 = v7.useRef(nil);
    local v112 = v7.useRef(nil);
    local v113 = v7.useRef(nil);
    local v114 = v7.useRef(false);
    local v115 = if v45 then v8.useFocusGuiObject() else nil;
    local v116 = if not v45 or v46 then nil else v6.useLastInputMode();
    local v117 = if v46 then v15.useSignalState(v54.getChatInputBarFocused) else nil;
    local v118 = nil;
    local v119 = nil;
    if l_FFlagExpChatUseMessagesStore_0 then
        v119 = v11(false);
        v118 = v15.useSignalState(v119.getCanLocalUserChat);
    end;
    local v120 = v7.useRef(false);
    v7.useEffect(function() --[[ Line: 263 ]]
        -- upvalues: v109 (copy), v93 (copy)
        v109.current = v93.chatInputBarSettings.TextBox;
    end, {
        if v93.chatInputBarSettings.TextBox ~= nil then v93.chatInputBarSettings.TextBox else "nil"
    });
    v7.useEffect(function() --[[ Line: 268 ]]
        -- upvalues: v93 (copy), l_TextChatService_0 (ref), v60 (ref), v31 (ref), v33 (ref), v50 (ref), v39 (ref), v59 (ref), v32 (ref), v49 (ref), v34 (ref)
        if not v93.autocompleteEnabled then
            return;
        else
            local v121 = {};
            local v124 = l_TextChatService_0.DescendantAdded:Connect(function(v122) --[[ Line: 273 ]]
                -- upvalues: v60 (ref), v31 (ref), v33 (ref), v121 (copy)
                if v122:IsA("TextChatCommand") and string.sub(v122.PrimaryAlias, 1, 1) == "/" then
                    v60 = v31.new(v33);
                    local v123 = v122:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 279 ]]
                        -- upvalues: v60 (ref), v31 (ref), v33 (ref)
                        v60 = v31.new(v33);
                    end);
                    table.insert(v121, v123);
                end;
            end);
            local v126 = if v50 then l_TextChatService_0.DescendantRemoving:Connect(function(v125) --[[ Line: 287 ]]
                -- upvalues: v60 (ref), v31 (ref), v33 (ref)
                if v125:IsA("TextChatCommand") and string.sub(v125.PrimaryAlias, 1, 1) == "/" then
                    v60 = v31.new(v33);
                end;
            end) else nil;
            if v39() then
                v60 = v31.new(v33);
                v59 = v31.new(v32);
                if v49() then
                    local v127 = v34();
                    if v127 then
                        for _, v129 in v127 do
                            table.insert(v121, (v129:GetPropertyChangedSignal("AutocompleteVisible"):Connect(function() --[[ Line: 303 ]]
                                -- upvalues: v60 (ref), v31 (ref), v33 (ref)
                                v60 = v31.new(v33);
                            end)));
                        end;
                    end;
                end;
            end;
            return function() --[[ Line: 312 ]]
                -- upvalues: v50 (ref), v126 (copy), v124 (copy), v121 (copy)
                if v50 and v126 then
                    v126:Disconnect();
                end;
                v124:Disconnect();
                for _, v131 in ipairs(v121) do
                    v131:Disconnect();
                end;
                table.clear(v121);
            end;
        end;
    end, {});
    local v133 = v7.useCallback(function() --[[ Line: 324 ]]
        -- upvalues: v24 (ref), v99 (copy), l_FFlagExpChatUseMessagesStore_0 (ref), v107 (copy), v118 (ref), v93 (copy), v108 (copy), v109 (copy), v100 (copy), v114 (copy)
        v24:trace("onSendActivated with input text: '{}'", v99);
        if l_FFlagExpChatUseMessagesStore_0 then
            if not v107.current or not v118 then
                v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v107.current), v118);
                return;
            end;
        elseif not v107.current or not v93.canLocalUserChat then
            v24:debug("onSendActivated could not send message. isMounted: {} canLocalUserChat: {}", tostring(v107.current), v93.canLocalUserChat);
            return;
        end;
        if v108.current or v109.current then
            local v132 = if v109.current then v109.current.Text else v108.current.Text;
            if v93.onSendChat and string.find(v132, "%S") ~= nil then
                v93.onSendChat(v132);
            elseif l_FFlagExpChatUseMessagesStore_0 then
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v132, v118);
            else
                v24:debug("onSendActivated could not send message. text: '{}' canLocalUserChat: {}", v132, v93.canLocalUserChat);
            end;
            if v109.current then
                v109.current.Text = "";
                v109.current:ReleaseFocus();
            end;
            if v108.current then
                v108.current.Text = "";
                v108.current:ReleaseFocus();
            end;
            v100("");
            if v93.targetTextChannel and v93.targetTextChannelDisplayName ~= "" then
                v114.current = true;
                return;
            end;
        else
            v24:debug("onSendActivated could not send message because textBoxRef.current was nil");
        end;
    end, {
        v99, 
        v109.current
    });
    local v142 = v7.useCallback(function(v134) --[[ Line: 388 ]]
        -- upvalues: v93 (copy), v109 (copy), v108 (copy), v95 (ref), v100 (copy), v107 (copy), v46 (ref), v117 (copy), v115 (copy), v116 (copy), v52 (ref), v24 (ref)
        v93.autocompleteDropdownActivated(false);
        v93.autocompleteDropdownResultsChanged({});
        local v135 = if v109.current then v109.current else v108.current;
        if v135 then
            local l_Text_0 = v135.Text;
            local v137 = string.sub(l_Text_0, 1, v95 - 1);
            local v138 = string.sub(l_Text_0, v95, #l_Text_0);
            local v139 = "";
            if v93.autocompleteDropdownReducer.autocompleteType == "emojis" then
                local l_Text_1 = v134.EmojiLabel.Text;
                v139 = string.gsub(v137, ":[^:]*$", l_Text_1);
            elseif v93.autocompleteDropdownReducer.autocompleteType == "commands" then
                local l_Text_2 = v134.TextLabel.Text;
                v139 = string.gsub(v137, "(/.*)", l_Text_2);
            end;
            if v138 ~= "" then
                v139 = v139 .. v138;
            end;
            v135.Text = v139;
            v100(v139);
            if v107.current then
                v135:CaptureFocus();
                if v46 then
                    if v117 then
                        v115(v135);
                    end;
                elseif v116 == "Focus" then
                    v115(v135);
                end;
                if v138 ~= "" and not v52 then
                    v135.CursorPosition = #v139 - #v138 + 1;
                end;
            end;
            v93.autocompleteDropdownDeactivated();
            return;
        else
            v24:error("Could not find textBox");
            return;
        end;
    end, if v45 then {
        if v46 then v117 else nil, 
        v115, 
        v103, 
        v95, 
        if v46 then nil else v116, 
        v93.autocompleteDropdownActivated, 
        v93.autocompleteDropdownDeactivated, 
        v93.autocompleteDropdownReducer and v93.autocompleteDropdownReducer.autocompleteType, 
        v93.autocompleteDropdownResultsChanged
    } else nil);
    v7.useEffect(function() --[[ Line: 459 ]]
        -- upvalues: v107 (copy), v109 (copy), v108 (copy), v24 (ref)
        if v107.current then
            local v143 = if v109.current then v109.current else v108.current;
            if v143 then
                v143:CaptureFocus();
                return;
            else
                v24:error("Could not focus chat input bar because textBox not found");
            end;
        end;
    end, {
        v93.shouldFocusChatInputBar, 
        v109.current
    });
    v7.useEffect(function() --[[ Line: 470 ]]
        -- upvalues: v24 (ref), v107 (copy)
        v24:trace("Mounted");
        v107.current = true;
        return function() --[[ Line: 474 ]]
            -- upvalues: v24 (ref), v107 (ref)
            v24:trace("Unmounting");
            v107.current = false;
        end;
    end, {});
    v7.useEffect(function() --[[ Line: 480 ]]
        -- upvalues: v93 (copy), v109 (copy), v108 (copy), v96 (ref)
        local v144 = nil;
        if v93.autocompleteEnabled then
            local v145 = if v109.current then v109.current else v108.current;
            if v145 then
                v144 = v145:GetPropertyChangedSignal("CursorPosition"):Connect(function() --[[ Line: 485 ]]
                    -- upvalues: v145 (copy), v96 (ref)
                    local l_CursorPosition_0 = v145.CursorPosition;
                    if l_CursorPosition_0 and l_CursorPosition_0 ~= -1 then
                        v96(l_CursorPosition_0);
                    end;
                end);
            end;
        end;
        return function() --[[ Line: 494 ]]
            -- upvalues: v144 (ref)
            if v144 then
                v144:Disconnect();
            end;
        end;
    end, {
        v109.current
    });
    v7.useEffect(function() --[[ Line: 502 ]]
        -- upvalues: v93 (copy), v113 (copy), v51 (ref)
        if v93.autocompleteEnabled then
            v113.current = v93.userInputService.InputBegan:connect(function(v147, _) --[[ Line: 504 ]]
                -- upvalues: v93 (ref), v51 (ref)
                local v149 = v93.autocompleteDropdownReducer.activated and (Enum.KeyCode.Up or Enum.KeyCode.Down);
                local v150 = not v51 or v147;
                if v149 then
                    if v150 and v147.KeyCode == Enum.KeyCode.Up and v93.autocompleteDropdownReducer.selectedIndex > 1 then
                        v93.autocompleteDropdownSelectionChanged(v93.autocompleteDropdownReducer.selectedIndex - 1);
                    end;
                    if v150 and v147.KeyCode == Enum.KeyCode.Down and v93.autocompleteDropdownReducer.selectedIndex < #v93.autocompleteDropdownReducer.results then
                        v93.autocompleteDropdownSelectionChanged(v93.autocompleteDropdownReducer.selectedIndex + 1);
                    end;
                end;
            end);
            return function() --[[ Line: 527 ]]
                -- upvalues: v113 (ref)
                local l_current_0 = v113.current;
                if l_current_0 and l_current_0.Connected then
                    l_current_0:Disconnect();
                end;
                v113.current = nil;
            end;
        else
            return function() --[[ Line: 535 ]]

            end;
        end;
    end, {
        v93.userInputService, 
        v93.autocompleteDropdownReducer
    });
    v7.useEffect(function() --[[ Line: 540 ]]
        -- upvalues: v112 (copy), v93 (copy), v51 (ref), v109 (copy), v108 (copy), v114 (copy), v24 (ref), v99 (copy)
        v112.current = v93.userInputService.InputEnded:connect(function(v152, _) --[[ Line: 541 ]]
            -- upvalues: v51 (ref), v109 (ref), v108 (ref), v114 (ref), v93 (ref), v24 (ref), v99 (ref)
            local v154 = not v51 or v152;
            if if v109.current then v109.current and v109.current:IsFocused() and v154 and v152.KeyCode == Enum.KeyCode.Backspace else v108.current and v108.current:IsFocused() and v154 and v152.KeyCode == Enum.KeyCode.Backspace then
                if v114.current and not v93.isChannelBarVisible then
                    v93.resetTargetChannel();
                    v24:debug("ChatInputBar ChatInputBarResetTargetChannel()");
                    v114.current = false;
                    return;
                elseif v99 == "" and v93.targetTextChannelDisplayName ~= "" then
                    v114.current = true;
                end;
            end;
        end);
        return function() --[[ Line: 569 ]]
            -- upvalues: v112 (ref)
            local l_current_1 = v112.current;
            if l_current_1 and l_current_1.Connected then
                l_current_1:Disconnect();
            end;
            v112.current = nil;
        end;
    end, l_dependencyArray_0(v93.userInputService, v109.current, v93.isChannelBarVisible, v93.targetTextChannelDisplayName, v93.resetTargetChannel));
    v7.useEffect(function() --[[ Line: 587 ]]
        -- upvalues: v93 (copy), v51 (ref), v22 (ref), v109 (copy), v108 (copy), v120 (copy)
        local function v160(_, v157, v158) --[[ Line: 588 ]] --[[ Name: handleAction ]]
            -- upvalues: v93 (ref), v51 (ref), v22 (ref), v109 (ref), v108 (ref), v120 (ref)
            if v93.isChatHotkeyEnabled and (not v51 or v158) and (v158.KeyCode == v22.ChatInputBarDefaultFocusKeyCode or v158.KeyCode == v93.devDefinedFocusKeyCode) then
                local v159 = if v109.current then v109.current else v108.current;
                if v159 and v157 == Enum.UserInputState.Begin and v159 and not v159:IsFocused() then
                    task.delay(0, function() --[[ Line: 610 ]]
                        -- upvalues: v159 (copy)
                        v159:CaptureFocus();
                    end);
                    v93.focusChatHotKeyActivated();
                    v120.current = true;
                    return Enum.ContextActionResult.Sink;
                end;
            end;
            return Enum.ContextActionResult.Pass;
        end;
        v93.contextActionService:BindCoreAction("FocusChat", v160, false, Enum.UserInputType.Keyboard);
        return function() --[[ Line: 634 ]]
            -- upvalues: v93 (ref)
            v93.contextActionService:UnbindCoreAction("FocusChat");
        end;
    end, {
        v93.isChatHotkeyEnabled, 
        v93.devDefinedFocusKeyCode, 
        v120.current, 
        v109.current
    });
    local function _(v161) --[[ Line: 641 ]]
        -- upvalues: l_TextChatService_0 (ref)
        local l_ChatInputBarConfiguration_0 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_0 then
            l_ChatInputBarConfiguration_0.IsFocusedWrite = v161;
        end;
    end;
    local v165 = v7.useCallback(function() --[[ Line: 648 ]]
        -- upvalues: v102 (copy), v93 (copy), l_TextChatService_0 (ref)
        v102(true);
        v93.onFocus();
        local l_ChatInputBarConfiguration_1 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_1 then
            l_ChatInputBarConfiguration_1.IsFocusedWrite = true;
        end;
    end, {
        v93.onFocus
    });
    local v183 = v7.useCallback(function(_, v167, v168) --[[ Line: 654 ]]
        -- upvalues: v24 (ref), v111 (copy), v45 (ref), v93 (copy), v142 (copy), v133 (copy), v107 (copy), v51 (ref), v109 (copy), v108 (copy), v95 (ref), v52 (ref), v102 (copy), l_TextChatService_0 (ref), v120 (copy), l_Players_0 (ref)
        v24:debug("Focus lost with enter: {}", (tostring(v167)));
        local l_current_2 = v111.current;
        if v167 or v45 and v168 and (v168.KeyCode == Enum.KeyCode.Return or v168.KeyCode == Enum.KeyCode.KeypadEnter) then
            if v93.autocompleteEnabled and l_current_2 and v93.autocompleteDropdownReducer.activated and #v93.autocompleteDropdownReducer.results > 0 then
                local l_OffsetFrame_0 = l_current_2.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                for _, v172 in ipairs(l_OffsetFrame_0:GetChildren()) do
                    if v172.ClassName == "Frame" and v172.LayoutOrder == v93.autocompleteDropdownReducer.selectedIndex then
                        v142(v172.TextLabelButton);
                        return;
                    end;
                end;
            else
                v133();
            end;
        end;
        if v107.current then
            if v93.autocompleteEnabled and l_current_2 and v93.autocompleteDropdownReducer.activated then
                if not v51 or v168 then
                    if v168.KeyCode == Enum.KeyCode.Escape then
                        v93.autocompleteDropdownActivated(false);
                        local v173 = if v109.current then v109.current else v108.current;
                        if v173 then
                            local l_v95_0 = v95;
                            v173:CaptureFocus();
                            if not v52 then
                                v173.CursorPosition = l_v95_0;
                            end;
                            return;
                        else
                            v24:error("Could not focus chat input bar because textBox not found");
                        end;
                    else
                        local l_X_0 = v168.Position.X;
                        local l_Y_0 = v168.Position.Y;
                        local l_X_1 = l_current_2.AbsolutePosition.X;
                        local v178 = l_X_1 + l_current_2.AbsoluteSize.X;
                        local l_Y_1 = l_current_2.AbsolutePosition.Y;
                        local v180 = l_Y_1 + l_current_2.AbsoluteSize.Y;
                        if l_X_0 < l_X_1 or v178 < l_X_0 or l_Y_0 < l_Y_1 or v180 < l_Y_0 then
                            v93.autocompleteDropdownActivated(false);
                        end;
                    end;
                end;
            else
                v102(false);
            end;
        end;
        v93.onUnfocus();
        local l_ChatInputBarConfiguration_2 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
        if l_ChatInputBarConfiguration_2 then
            l_ChatInputBarConfiguration_2.IsFocusedWrite = false;
        end;
        if v120.current then
            l_ChatInputBarConfiguration_2 = l_Players_0.LocalPlayer;
            if l_ChatInputBarConfiguration_2 then
                local l_TextBox_0 = Instance.new("TextBox");
                l_TextBox_0.Visible = false;
                l_TextBox_0.Parent = l_ChatInputBarConfiguration_2:FindFirstChildOfClass("PlayerGui");
                l_TextBox_0:CaptureFocus();
                l_TextBox_0:ReleaseFocus();
                l_TextBox_0:Destroy();
            end;
            v120.current = false;
        end;
    end);
    v7.useEffect(function() --[[ Line: 759 ]]
        -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v109 (copy), v108 (copy), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v165 (copy), v73 (ref), v183 (copy), l_ActionBindableEvent_0 (ref)
        local v184 = nil;
        local v185 = nil;
        local function v188(v186) --[[ Line: 763 ]]
            -- upvalues: l_FFlagEnableConsoleExpControls_0 (ref), v109 (ref), v108 (ref), l_FFlagChromeChatGamepadSupportFix_0 (ref), l_GuiService_0 (ref), v165 (ref), v185 (ref), v184 (ref), v73 (ref), v183 (ref)
            local v187 = nil;
            if l_FFlagEnableConsoleExpControls_0 then
                v187 = if v109.current then v109.current else v108.current;
            end;
            if v186.type == "ChatTopBarFocusActivated" then
                if not l_FFlagEnableConsoleExpControls_0 then
                    v187 = if v109.current then v109.current else v108.current;
                end;
                if v187 then
                    task.delay(0, function() --[[ Line: 774 ]]
                        -- upvalues: v187 (ref)
                        v187:CaptureFocus();
                    end);
                end;
            elseif not l_FFlagChromeChatGamepadSupportFix_0 and l_FFlagEnableConsoleExpControls_0 and v186.type == "ChatTopBarFocusSelect" and v187 then
                l_GuiService_0:SetMenuIsOpen(true, "ExperienceChat");
                v165();
                l_GuiService_0.SelectedCoreObject = v187;
                v185 = task.delay(0, function() --[[ Line: 789 ]]
                    -- upvalues: v185 (ref), v184 (ref), v73 (ref), v186 (copy), v183 (ref)
                    v185 = nil;
                    if v184 then
                        v184:Disconnect();
                    end;
                    v184 = v73(v186.onSelectionLost, v186.keybinds, v183);
                end);
            end;
        end;
        local v189 = l_ActionBindableEvent_0.Event:Connect(v188);
        return function() --[[ Line: 803 ]]
            -- upvalues: v189 (copy), v185 (ref), v184 (ref)
            v189:disconnect();
            if v185 then
                task.cancel(v185);
                v185 = nil;
            end;
            if v184 then
                v184:Disconnect();
                v184 = nil;
            end;
        end;
    end, {
        v108.current, 
        v109.current
    });
    v92(v108, v109, v110, v165, v183);
    local function v209(v190, v191, v192) --[[ Line: 821 ]] --[[ Name: handleAutocomplete ]]
        -- upvalues: v93 (copy), v60 (ref), v36 (ref), v59 (ref), v35 (ref), v97 (ref), l_List_0 (ref), v100 (copy), v52 (ref), v111 (copy), v142 (copy), v98 (ref)
        if v192 == "/" and v190.CursorPosition == 2 or v93.autocompleteDropdownReducer.autocompleteType == "commands" and v192 ~= ":" then
            v93.autocompleteDropdownTypeChanged("commands");
            v93.autocompleteDropdownActivated(true);
            if v192 ~= "" and v192 ~= " " then
                local v193 = string.sub(v191, 1, v190.CursorPosition - 1):lower();
                local v194 = v60:getResults(v193, v36);
                v93.autocompleteDropdownResultsChanged(v194);
                if v193 == v194[1] then
                    v93.autocompleteDropdownActivated(false);
                    v93.autocompleteDropdownResultsChanged({});
                    return;
                end;
            else
                v93.autocompleteDropdownDeactivated();
            end;
            return;
        elseif (v93.autocompleteDropdownReducer.activated or #v93.autocompleteDropdownReducer.results > 0) and v93.autocompleteDropdownReducer.autocompleteType == "emojis" then
            v93.autocompleteDropdownActivated(true);
            local v195 = string.sub(v191, 1, v190.CursorPosition - 1);
            local v196 = string.find(v195, ":[^:]*$");
            if v192 ~= "" and v192 ~= ":" and v192 ~= " " and v196 then
                local v197 = string.sub(v191, v196 + 1, v190.CursorPosition - 1):lower();
                local v198 = {};
                if v197 and string.len(v197) > 1 then
                    v198 = v59:getResults(v197, v35);
                end;
                v93.autocompleteDropdownResultsChanged(v198);
                return;
            elseif v192 == ":" then
                if v196 ~= v97 then
                    local v199 = string.sub(v191, v97 + 1, v190.CursorPosition - 2):lower();
                    if l_List_0.includes(v93.autocompleteDropdownReducer.results, v199) then
                        local v200 = string.sub(v191, v190.CursorPosition, #v191);
                        local v201 = string.sub(v191, 1, v190.CursorPosition - 2) .. v200;
                        v190.Text = v201;
                        v100(v201);
                        if not v52 then
                            v190.CursorPosition = v190.CursorPosition - 1;
                        end;
                        local l_current_3 = v111.current;
                        if l_current_3 then
                            local l_OffsetFrame_1 = l_current_3.ScrollBarFrame.ScrollViewFrame.ScrollView.OffsetFrame;
                            for _, v205 in ipairs(l_OffsetFrame_1:GetChildren()) do
                                if v205.ClassName == "Frame" then
                                    local l_TextLabelButton_0 = v205:FindFirstChild("TextLabelButton");
                                    if l_TextLabelButton_0 then
                                        local l_TextLabel_0 = l_TextLabelButton_0:FindFirstChild("TextLabel");
                                        if l_TextLabel_0 and l_TextLabel_0.Text and l_TextLabel_0.Text == v199 then
                                            v142(l_TextLabelButton_0);
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    else
                        v93.autocompleteDropdownActivated(false);
                        v93.autocompleteDropdownResultsChanged({});
                    end;
                    return;
                else
                    v93.autocompleteDropdownResultsChanged({});
                    return;
                end;
            elseif v192 == " " then
                v93.autocompleteDropdownActivated(false);
                v93.autocompleteDropdownResultsChanged({});
                return;
            else
                v93.autocompleteDropdownDeactivated();
                v98(0);
                return;
            end;
        else
            local v208 = string.find(v191, ":[^:]*$");
            if v192 == ":" then
                v93.autocompleteDropdownTypeChanged("emojis");
                v93.autocompleteDropdownActivated(true);
                v93.autocompleteDropdownResultsChanged({});
                v98(v208);
            end;
            return;
        end;
    end;
    if v50 then
        v7.useEffect(function() --[[ Line: 937 ]]
            -- upvalues: l_TextChatService_0 (ref), v61 (ref), l_RBXTeamCommand_0 (ref), v62 (ref), l_RBXWhisperCommand_0 (ref)
            if l_TextChatService_0.CreateDefaultCommands then
                v61 = l_TextChatService_0:FindFirstChild(l_RBXTeamCommand_0.name, true);
                v62 = l_TextChatService_0:FindFirstChild(l_RBXWhisperCommand_0.name, true);
            end;
        end, {});
    end;
    local v221 = v7.useCallback(function(v210) --[[ Line: 945 ]]
        -- upvalues: v93 (copy), v100 (copy), v24 (ref), v99 (copy), v39 (ref), v209 (copy), v114 (copy), v47 (ref), v94 (copy), v50 (ref), l_autoCastCommand_0 (ref), l_RBXTeamCommand_0 (ref), l_RBXWhisperCommand_0 (ref), v61 (ref), v62 (ref), v13 (ref)
        local l_Text_3 = v210.Text;
        if v93.autocompleteEnabled then
            local v212 = string.find(l_Text_3, "\r");
            local v213 = v210.CursorPosition < #l_Text_3 + 1;
            if v212 then
                local v214 = string.gsub(l_Text_3, "\r", "");
                v210.Text = v214;
                v100(v214);
                if v213 then
                    v210.CursorPosition = v210.CursorPosition - 1;
                end;
                return;
            end;
        end;
        local v215 = string.sub(l_Text_3, v210.CursorPosition - 1, v210.CursorPosition - 1);
        v24:trace("Input: {}", l_Text_3);
        local v216 = if utf8.len(l_Text_3) then utf8.len(utf8.nfcnormalize(l_Text_3)) else string.len(l_Text_3);
        if v216 and v93.messageCharacterLimit < v216 then
            v24:debug("Message is over the character limit of {}", (tostring(v93.messageCharacterLimit)));
            v210.Text = v99;
            return;
        else
            v100(l_Text_3);
            if v39() and v93.autocompleteEnabled then
                v209(v210, l_Text_3, v215);
            end;
            local l_v114_0 = v114;
            local v218 = false;
            if #l_Text_3 == 0 then
                v218 = v114.current;
            end;
            l_v114_0.current = v218;
            if v47 then
                if string.sub(l_Text_3, 1, 1) == "/" and v93.localPlayer and l_Text_3 ~= v94.current then
                    v94.current = l_Text_3;
                    l_v114_0 = v93.localPlayer.UserId;
                    v218 = if v50 then {} else {
                        l_autoCastCommand_0(l_RBXTeamCommand_0, l_v114_0, l_Text_3), 
                        l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v114_0, l_Text_3)
                    };
                    if v50 then
                        if v61 and v61.Enabled then
                            table.insert(v218, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v114_0, l_Text_3));
                        end;
                        if v62 and v62.Enabled then
                            table.insert(v218, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v114_0, l_Text_3));
                        end;
                        if #v218 == 0 then
                            v218 = {
                                v13.reject()
                            };
                        end;
                    end;
                    v13.any(v218):andThen(function() --[[ Line: 1009 ]]
                        -- upvalues: v210 (copy), v100 (ref), v114 (ref)
                        v210.Text = "";
                        v100("");
                        v114.current = true;
                    end):catch(function(v219) --[[ Line: 1015 ]]
                        -- upvalues: v24 (ref)
                        v24:trace("Could not send autoCastCommand. Error: {}", v219);
                    end);
                    return;
                elseif string.sub(l_Text_3, 1, 1) ~= "/" then
                    v94.current = "";
                    return;
                end;
            elseif v93.localPlayer then
                l_v114_0 = v93.localPlayer.UserId;
                v218 = if v50 then {} else {
                    l_autoCastCommand_0(l_RBXTeamCommand_0, l_v114_0, l_Text_3), 
                    l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v114_0, l_Text_3)
                };
                if v50 then
                    if v61 and v61.Enabled then
                        table.insert(v218, l_autoCastCommand_0(l_RBXTeamCommand_0, l_v114_0, l_Text_3));
                    end;
                    if v62 and v62.Enabled then
                        table.insert(v218, l_autoCastCommand_0(l_RBXWhisperCommand_0, l_v114_0, l_Text_3));
                    end;
                    if #v218 == 0 then
                        v218 = {
                            v13.reject()
                        };
                    end;
                end;
                v13.any(v218):andThen(function() --[[ Line: 1046 ]]
                    -- upvalues: v210 (copy), v100 (ref), v114 (ref)
                    v210.Text = "";
                    v100("");
                    v114.current = true;
                end):catch(function(v220) --[[ Line: 1052 ]]
                    -- upvalues: v24 (ref)
                    v24:trace("Could not send autoCastCommand. Error: {}", v220);
                end);
            end;
            return;
        end;
    end);
    local v223 = v7.useCallback(function() --[[ Line: 1059 ]]
        -- upvalues: v109 (copy), v108 (copy)
        local v222 = if v109.current then v109.current else v108.current;
        if v222 then
            v222:ReleaseFocus(true);
        end;
    end, {
        v108.current, 
        v109.current
    });
    local v225 = v7.useCallback(function(v224) --[[ Line: 1066 ]]
        -- upvalues: v106 (copy)
        v106(v224.Visible and v224.AbsoluteSize.X or 0);
    end);
    local v226 = if v45 then l_useCursor_0() else nil;
    local v228 = v7.useCallback(function(v227) --[[ Line: 1073 ]]
        -- upvalues: v93 (copy)
        v93.autocompleteDropdownSelectionChanged(v227.LayoutOrder);
    end);
    local v229 = v99 == "";
    local v230 = v229 and not v101;
    local l_chatInputBarSettings_0 = v93.chatInputBarSettings;
    local l_chatWindowSettings_0 = v93.chatWindowSettings;
    local l_BackgroundTransparency_0 = v21(l_chatInputBarSettings_0).BackgroundTransparency;
    local l_BackgroundTransparency_1 = v21(l_chatWindowSettings_0).BackgroundTransparency;
    local l_BackgroundColor3_0 = v21(l_chatWindowSettings_0).BackgroundColor3;
    local l_isSpatialUIEnabled_0 = v93.isSpatialUIEnabled;
    local l_createElement_0 = v7.createElement;
    local v238 = "Frame";
    local v244 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_BackgroundColor3_0, 
        BackgroundTransparency = v93.transparencyValue:map(function(v239) --[[ Line: 73 ]]
            -- upvalues: l_BackgroundTransparency_1 (copy)
            return l_BackgroundTransparency_1 + v239 * (1 - l_BackgroundTransparency_1);
        end), 
        BorderSizePixel = 0, 
        LayoutOrder = v93.LayoutOrder, 
        Size = v93.size, 
        Visible = v93.visible, 
        ZIndex = 2, 
        [v7.Event.MouseEnter] = v93.onHovered, 
        [v7.Event.MouseLeave] = v93.onUnhovered, 
        [v7.Change.AbsoluteSize] = v7.useCallback(function(v240) --[[ Line: 1099 ]]
            -- upvalues: l_TextChatService_0 (ref), v93 (copy)
            local l_ChatInputBarConfiguration_3 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_3 and v93.onAbsoluteSizeChanged then
                v93.onAbsoluteSizeChanged(v240, l_ChatInputBarConfiguration_3);
            end;
        end), 
        [v7.Change.AbsolutePosition] = v7.useCallback(function(v242) --[[ Line: 1105 ]]
            -- upvalues: l_TextChatService_0 (ref), v93 (copy)
            local l_ChatInputBarConfiguration_4 = l_TextChatService_0:FindFirstChildOfClass("ChatInputBarConfiguration");
            if l_ChatInputBarConfiguration_4 and v93.onAbsolutePositionChanged then
                v93.onAbsolutePositionChanged(v242, l_ChatInputBarConfiguration_4);
            end;
        end)
    };
    local v245 = {
        AutocompleteDropdown = v39() and v93.autocompleteEnabled and v7.createElement(v38, {
            chatInputBarSettings = l_chatInputBarSettings_0, 
            chatWindowSettings = l_chatWindowSettings_0, 
            setTransparency = v58, 
            transparencyValue = v93.transparencyValue, 
            activated = v93.autocompleteDropdownReducer.activated and v101, 
            results = v93.autocompleteDropdownReducer.results, 
            selectedIndex = v93.autocompleteDropdownReducer.selectedIndex, 
            autocompleteType = v93.autocompleteDropdownReducer.autocompleteType, 
            onAutocompleteDropdownHover = v228, 
            onAutocompleteSelected = v142, 
            autocompleteDropdownRef = v111, 
            textBoxRef = if l_chatInputBarSettings_0.TextBox then v109 else v108
        }) or nil, 
        UISizeConstraint = v7.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v22.ChatWindowMaxWidth, 1e999)
        }), 
        UIPadding = v7.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8), 
            PaddingTop = v93.addTopPadding and UDim.new(0, 8) or UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 1)
        })
    };
    local l_createElement_1 = v7.createElement;
    local v247 = "Frame";
    local v249 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_chatInputBarSettings_0.BackgroundColor3, 
        BackgroundTransparency = v93.transparencyValue:map(function(v248) --[[ Line: 73 ]]
            -- upvalues: l_BackgroundTransparency_0 (copy)
            return l_BackgroundTransparency_0 + v248 * (1 - l_BackgroundTransparency_0);
        end), 
        Size = UDim2.new(1, 0, 0, 0)
    };
    local v250 = {};
    local l_createElement_2 = v7.createElement;
    local v252 = "UIStroke";
    local v253 = {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = v22.ChatInputBarBorderColor3
    };
    local l_ChatInputBarBorderTransparency_0 = v22.ChatInputBarBorderTransparency;
    local l_l_ChatInputBarBorderTransparency_0_0 = l_ChatInputBarBorderTransparency_0 --[[ copy: 59 -> 72 ]];
    v253.Transparency = v93.transparencyValue:map(function(v256) --[[ Line: 73 ]]
        -- upvalues: l_l_ChatInputBarBorderTransparency_0_0 (copy)
        return l_l_ChatInputBarBorderTransparency_0_0 + v256 * (1 - l_l_ChatInputBarBorderTransparency_0_0);
    end);
    v250.Border = l_createElement_2(v252, v253);
    v250.Corner = v7.createElement("UICorner", {
        CornerRadius = UDim.new(0, 3)
    });
    l_createElement_2 = v7.createElement;
    v252 = "Frame";
    v253 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1
    };
    local v257 = {};
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    local v258 = "Frame";
    local v259 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        SelectionBehaviorDown = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorLeft = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorRight = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionBehaviorUp = if not l_FFlagEnableConsoleExpControls_0 or v45 then nil else Enum.SelectionBehavior.Stop, 
        SelectionGroup = l_FFlagEnableConsoleExpControls_0 and not v45 or nil, 
        Size = UDim2.new(1, -v93.sendButtonContainerWidth, 0, 0)
    };
    local v260 = {};
    local l_createElement_3 = v7.createElement;
    local l_v30_0 = v30;
    local v263 = {};
    local l_transparencyValue_0 = v93.transparencyValue;
    local v265 = 0;
    local l_v265_0 = v265 --[[ copy: 71 -> 73 ]];
    v263.transparency = l_transparencyValue_0:map(function(v267) --[[ Line: 73 ]]
        -- upvalues: l_v265_0 (copy)
        return l_v265_0 + v267 * (1 - l_v265_0);
    end);
    v263.onAbsoluteSizeChanged = v225;
    v263.onChannelChipActivated = v93.resetTargetChannel;
    v263.targetTextChannelDisplayName = v93.targetTextChannelDisplayName or "";
    v263.isChannelBarVisible = v93.isChannelBarVisible;
    v260.TargetChannelChip = l_createElement_3(l_v30_0, v263);
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then not v118 else not v93.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "TextLabel";
        v263 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v22.ChatInputBarFont, 
            Text = v93.disabledChatPlaceholderText, 
            Position = UDim2.fromScale(1, 0), 
            Size = v105:map(function(v268) --[[ Line: 1197 ]]
                return UDim2.new(1, -(v268 + 8), 0, 0);
            end), 
            TextColor3 = v230 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3, 
            TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
        };
        l_transparencyValue_0 = v230 and 0.5 or 0;
        local l_l_transparencyValue_0_0 = l_transparencyValue_0 --[[ copy: 67 -> 75 ]];
        v263.TextTransparency = v93.transparencyValue:map(function(v270) --[[ Line: 73 ]]
            -- upvalues: l_l_transparencyValue_0_0 (copy)
            return l_l_transparencyValue_0_0 + v270 * (1 - l_l_transparencyValue_0_0);
        end);
        v263.Selectable = v48 and true or nil;
        v263.SelectionImageObject = if v48 then v226 else nil;
        v263.TextWrapped = true;
        v263.TextXAlignment = Enum.TextXAlignment.Left;
        v263.TextYAlignment = Enum.TextYAlignment.Top;
        v263.ref = if v48 then v110 else nil;
        l_createElement_3 = l_createElement_3(l_v30_0, v263);
    end;
    v260.DisabledPlaceholderLabel = l_createElement_3;
    l_createElement_3 = if l_FFlagExpChatUseMessagesStore_0 then v118 else v93.canLocalUserChat;
    if l_createElement_3 then
        l_createElement_3 = v7.createElement;
        l_v30_0 = "Frame";
        v263 = {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(1, 0), 
            Size = v105:map(function(v271) --[[ Line: 1225 ]]
                return UDim2.new(1, -(v271 + 8), 0, 0);
            end)
        };
        local v272 = {};
        l_transparencyValue_0 = if l_FFlagExpChatUseMessagesStore_0 then v118 else v93.canLocalUserChat;
        if l_transparencyValue_0 then
            l_transparencyValue_0 = v7.createElement;
            local v273 = "TextBox";
            local v274 = {
                AnchorPoint = Vector2.new(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                FontFace = l_chatInputBarSettings_0.FontFace, 
                PlaceholderText = v230 and v93.placeholderText or "", 
                Selectable = l_FFlagEnableConsoleExpControls_0 and true or nil, 
                SelectionImageObject = v226, 
                Size = UDim2.fromScale(1, 0), 
                Text = "", 
                PlaceholderColor3 = l_chatInputBarSettings_0.PlaceholderColor3, 
                TextColor3 = l_chatInputBarSettings_0.TextColor3, 
                TextSize = if l_isSpatialUIEnabled_0 then l_chatInputBarSettings_0.SpatialPanelTextSize else l_chatInputBarSettings_0.TextSize
            };
            v265 = v230 and 0.5 or 0;
            local l_v265_1 = v265 --[[ copy: 71 -> 74 ]];
            v274.TextTransparency = v93.transparencyValue:map(function(v276) --[[ Line: 73 ]]
                -- upvalues: l_v265_1 (copy)
                return l_v265_1 + v276 * (1 - l_v265_1);
            end);
            v265 = l_chatInputBarSettings_0.TextStrokeTransparency;
            v274.TextStrokeTransparency = v93.transparencyValue:map(function(v277) --[[ Line: 73 ]]
                -- upvalues: v265 (copy)
                return v265 + v277 * (1 - v265);
            end);
            v274.TextStrokeColor3 = l_chatInputBarSettings_0.TextStrokeColor3;
            v274.TextWrapped = true;
            v274.TextXAlignment = Enum.TextXAlignment.Left;
            v274.TextYAlignment = Enum.TextYAlignment.Top;
            v274.ZIndex = 2;
            v274[v7.Event.Focused] = v165;
            v274[v7.Event.FocusLost] = v183;
            v274[v7.Change.Text] = v221;
            v274[v7.Event.ReturnPressedFromOnScreenKeyboard] = v223;
            v274.ref = if l_chatInputBarSettings_0.TextBox then v109 else v108;
            l_transparencyValue_0 = l_transparencyValue_0(v273, v274);
        end;
        v272.TextBox = l_transparencyValue_0;
        l_createElement_3 = l_createElement_3(l_v30_0, v263, v272);
    end;
    v260.TextBoxContainer = l_createElement_3;
    v260.UIPadding = v7.createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10), 
        PaddingLeft = UDim.new(0, 10), 
        PaddingRight = UDim.new(0, 10), 
        PaddingTop = UDim.new(0, 10)
    });
    v257.TextContainer = l_ChatInputBarBorderTransparency_0(v258, v259, v260);
    l_ChatInputBarBorderTransparency_0 = v7.createElement;
    v258 = "TextButton";
    v259 = {
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Position = UDim2.fromScale(1, 0), 
        Selectable = not v45 and nil, 
        Size = UDim2.new(0, v93.sendButtonContainerWidth, 1, 0), 
        Text = "", 
        [v7.Event.Activated] = v133
    };
    v260 = {
        Layout = v7.createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    l_createElement_3 = v7.createElement;
    l_v30_0 = l_ImageSetLabel_0;
    v263 = {
        BackgroundTransparency = 1, 
        ImageColor3 = v229 and l_chatInputBarSettings_0.PlaceholderColor3 or l_chatInputBarSettings_0.TextColor3
    };
    l_transparencyValue_0 = v229 and 0.5 or 0;
    v263.ImageTransparency = v93.transparencyValue:map(function(v278) --[[ Line: 73 ]]
        -- upvalues: l_transparencyValue_0 (copy)
        return l_transparencyValue_0 + v278 * (1 - l_transparencyValue_0);
    end);
    v263.Image = l_Images_0["icons/actions/send"];
    v263.Size = UDim2.new(0, 30, 0, 30);
    v263.ZIndex = 2;
    v260.SendIcon = l_createElement_3(l_v30_0, v263);
    v257.SendButton = l_ChatInputBarBorderTransparency_0(v258, v259, v260);
    v250.Container = l_createElement_2(v252, v253, v257);
    v245.Background = l_createElement_1(v247, v249, v250);
    return l_createElement_0(v238, v244, v245);
end;
local v286 = v28.connect(function(v280) --[[ Line: 1310 ]]
    -- upvalues: v29 (copy)
    local v281 = nil;
    if v280.targetTextChannel then
        local v282 = {
            RBXTeam = "CoreScripts.TextChat.TeamChat.PrefixText", 
            RBXWhisper = "CoreScripts.TextChat.WhisperChat.PrefixText.Outgoing"
        };
        for v283, v284 in pairs(v282) do
            if string.match(v280.targetTextChannel.Name, v283) then
                if v283 == "RBXWhisper" then
                    local v285 = v29(v280.targetTextChannel, v280.localPlayer);
                    if v285 then
                        v281 = {
                            v284, 
                            {
                                RBX_NAME = v285
                            }
                        };
                    end;
                else
                    v281 = v284;
                end;
            end;
        end;
    end;
    return {
        targetTextChannelDisplayName = v281
    };
end)(v279);
return v7.memo(v286);
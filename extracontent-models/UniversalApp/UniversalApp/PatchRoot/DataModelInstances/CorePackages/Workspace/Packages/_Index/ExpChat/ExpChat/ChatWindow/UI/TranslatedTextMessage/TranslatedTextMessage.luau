local l_IXPService_0 = game:GetService("IXPService");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local v8 = require(l_Parent_0.SignalsReact);
local v9 = require(l_Parent_1.React);
local v10 = require(l_Parent_0.RoactRodux);
local v11 = require(l_Parent_0.SharedFlags);
local v12 = require(l_Parent_0.DataHydration);
local v13 = require(l_Parent_0.Signals);
local v14 = require(l_Parent_0.Foundation);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v16 = require(l_script_FirstAncestor_0.Localization);
local v17 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v18 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local v19 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v20 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v21 = require(l_Parent_0.UIBlox);
local l_FFlagExpChatUseMessagesStore_0 = v11.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatAddPaddingAroundARButton_0 = v11.FFlagExpChatAddPaddingAroundARButton;
local v24 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v25 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagDebugMessageProfiling);
local v27 = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatUseUpdatedMessageRendered);
local v29 = require(l_script_FirstAncestor_0.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v30 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v32 = game:DefineFastString("InExpChatRewriteLabelKey", "CoreScripts.TextChat.ChatWindow.RephrasedLabel");
local v33 = game:DefineFastString("InExpChatRewriteReasonKey", "CoreScripts.TextChat.ChatWindow.RephrasedReason.Description");
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInlineIxpEnabled);
local v36 = require(l_script_FirstAncestor_0.Flags.FStringExpChatRewriteInlineIxpLayer);
local v37 = game:DefineFastInt("ExpChatWindowTransparencyRewriteInteractableThresholdHundredth", 90) / 100;
local l_useCursor_0 = v21.App.SelectionCursor.useCursor;
local v39 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v41 = require(l_Helpers_0.getMessageSettings);
local v42 = require(l_Helpers_0.duplicateInvisibleText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v44 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v45 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v46 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v47 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v48 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v49 = require(l_Flags_0.FFlagExpChatTcOptimization);
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
appendVerifiedBadge = function(v51) --[[ Line: 69 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v39 (copy)
    return string.gsub(v51, ":(%S-)$", v39.VERIFIED_EMOJI .. ":%1");
end;
local function v57(v52) --[[ Line: 73 ]]
    -- upvalues: l_UserProfileStore_0 (copy), v8 (copy)
    local v53 = tostring(v52.userId);
    local v54 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v53
    })(false).data[1];
    local v55 = v8.useSignalBinding(v54.names.getDisplayName);
    local v56 = v8.useSignalBinding(v54.names.getInExperienceCombinedName);
    return {
        displayName = v55, 
        inExperienceCombinedName = v56
    };
end;
trim = function(v58) --[[ Line: 82 ]] --[[ Name: trim ]]
    if v58:match("^()%s*$") then
        return "";
    else
        return (v58:match("^%s*(.*%S)"));
    end;
end;
getMessageText = function(v59, v60, v61) --[[ Line: 86 ]] --[[ Name: getMessageText ]]
    if v60 == nil or v60 == "" then
        return v61 or "";
    elseif v59 then
        return v60 or "";
    else
        return v61 or "";
    end;
end;
local function _(v62, v63) --[[ Line: 96 ]] --[[ Name: calculateTransparency ]]
    return v62 + v63 * (1 - v62);
end;
local function _(v65, v66) --[[ Line: 100 ]] --[[ Name: setTransparency ]]
    return v66:map(function(v67) --[[ Line: 101 ]]
        -- upvalues: v65 (copy)
        if v65 == nil then
            return 1;
        else
            local l_v65_0 = v65;
            return l_v65_0 + v67 * (1 - l_v65_0);
        end;
    end);
end;
local function _() --[[ Line: 106 ]] --[[ Name: useARButtonRightPadding ]]
    -- upvalues: l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v47 (copy), v20 (copy), v8 (copy), v18 (copy), v17 (copy), v45 (copy), v46 (copy)
    local v70 = 0;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        local v71 = nil;
        local v72 = nil;
        local v73 = true;
        if v47 then
            v72 = v20(false);
            v71 = v8.useSignalState(v72.getChatStatus);
            v73 = v18(v71);
        end;
        if not v17() and v73 then
            return v45;
        else
            v70 = v46;
        end;
    end;
    return v70;
end;
local function v86(v75, v76, v77, v78, v79) --[[ Line: 128 ]] --[[ Name: appendTrustedIndicator ]]
    local v80 = v79.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v79.Color.Shift.Shift_300.Transparency;
    local v82 = l_Transparency_0 + v77 * (1 - l_Transparency_0);
    l_Transparency_0 = v79.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v79.Color.Content.Emphasis.Transparency;
    local v84 = l_Transparency_1 + v77 * (1 - l_Transparency_1);
    l_Transparency_1 = v78 - 4;
    local v85 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v80, v82), 600, l_Transparency_1), l_Transparency_0, v84, v76)))));
    if string.find(v75, ":([%S:]-)$") then
        return string.gsub(v75, ":([%S:]-)$", ((" %* :%%1"):format(v85)));
    else
        return (("%* %*"):format(v75, v85));
    end;
end;
local v87 = if v48 then v12.TrustedConnections.TrustedConnectionsStore.get() else nil;
local function v181(v88) --[[ Line: 167 ]]
    -- upvalues: v26 (copy), l_FFlagExpChatPerfTracking_0 (copy), v9 (copy), v25 (copy), v48 (copy), v34 (copy), v16 (copy), v32 (copy), v14 (copy), v41 (copy), v44 (copy), v57 (copy), v49 (copy), v30 (copy), v13 (copy), l_Players_0 (copy), v87 (copy), v8 (copy), v28 (copy), v24 (copy), v29 (copy), l_TextChatService_0 (copy), v86 (copy), v27 (copy), v42 (copy), v6 (copy), l_useCursor_0 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v31 (copy), v47 (copy), v20 (copy), v18 (copy), v17 (copy), v45 (copy), v46 (copy), v37 (copy)
    if v26 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    if l_FFlagExpChatPerfTracking_0 then
        local v89 = v88.message.messageId or "UNKNOWN_MESSAGE_ID";
        local l_v89_0 = v89 --[[ copy: 1 -> 50 ]];
        v9.useEffect(function() --[[ Line: 173 ]]
            -- upvalues: v25 (ref), l_v89_0 (copy)
            v25.finish(v25.Events.MessageReceiveToWindowRenderInterval, {
                messageId = l_v89_0
            });
            v25.finish(v25.Events.MessageSendToWindowRenderInterval, {
                messageId = l_v89_0
            });
        end, {
            v89
        });
    end;
    local l_isSpatialUIEnabled_0 = v88.isSpatialUIEnabled;
    local v92 = if l_isSpatialUIEnabled_0 then v88.chatWindowSettings.SpatialPanelTextSize else v88.chatWindowSettings.TextSize;
    local v93 = if not not v48 or v34 then v16.useLocalization({
        trustedLabelText = v48 and "CoreScripts.TextChat.ChatWindow.TrustedLabel" or nil, 
        rewrittenLabelText = if v34 then v32 else nil, 
        defaultRewrittenLabelText = v34 and "CoreScripts.TextChat.ChatWindow.RewrittenLabel" or nil
    }) else nil;
    local v94 = nil;
    if v34 then
        v94 = if v93.rewrittenLabelText and v93.rewrittenLabelText ~= "" then v93.rewrittenLabelText else v93.defaultRewrittenLabelText;
    end;
    local v95 = if not not v48 or v34 then v14.Hooks.useTokens() else nil;
    local v96 = v41(v88.message, v88.chatWindowSettings);
    local l_showTranslationButton_0 = v88.showTranslationButton;
    local l_useTranslation_0 = v96.useTranslation;
    local v99 = getMessageText(l_useTranslation_0, v96.translation, v96.text);
    local v100 = v96.prefixText or "";
    local v101 = nil;
    if v44() and v88.message.userId then
        if v26 then
            debug.profilebegin("useCombinedName");
        end;
        v101 = v57(v88.message);
        if v26 then
            debug.profileend();
        end;
    end;
    local v102 = nil;
    if v48 then
        local v103 = v88.message.userId and tostring(v88.message.userId);
        local v104 = if v49 and v30() then v88.message.isHiddenMessage else nil;
        local l_v103_0 = v103 --[[ copy: 13 -> 48 ]];
        local l_v104_0 = v104 --[[ copy: 14 -> 49 ]];
        local v111 = v9.useMemo(function() --[[ Line: 231 ]]
            -- upvalues: v13 (ref), l_v103_0 (copy), v49 (ref), l_Players_0 (ref), l_v104_0 (copy), v87 (ref)
            return v13.createComputed(function(v107) --[[ Line: 232 ]]
                -- upvalues: l_v103_0 (ref), v49 (ref), l_Players_0 (ref), l_v104_0 (ref), v87 (ref)
                local v108 = l_v103_0 and l_v103_0 ~= "";
                if v49 then
                    local v109 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                    local v110 = v109 and v109 == l_v103_0;
                    v108 = v108 and not v110 and not l_v104_0;
                end;
                if v108 then
                    return (v87.getIsTrustedConnection(l_v103_0).data(v107));
                else
                    return nil;
                end;
            end);
        end, {
            v103, 
            v104
        });
        v102 = v8.useSignalBinding(v111);
    end;
    if v28() then
        v9.useEffect(function() --[[ Line: 255 ]]
            -- upvalues: v88 (copy), v24 (ref), v29 (ref), v30 (ref), l_TextChatService_0 (ref)
            if v88.message.textChatMessageInstance and v24(v29) and (not v30() or not v88.message.isHiddenMessage) then
                l_TextChatService_0:SendExpChatMessageClientRendered(v88.message.textChatMessageInstance, "chat_window");
            end;
        end, {});
    end;
    local l_bodyTextProperties_0 = v96.bodyTextProperties;
    local l_prefixTextProperties_0 = v96.prefixTextProperties;
    local v118 = v9.joinBindings(if v101 ~= nil then {
        v101.displayName, 
        v101.inExperienceCombinedName
    } else {}):map(function(v114) --[[ Line: 270 ]]
        -- upvalues: v100 (copy), v88 (copy)
        local v115 = v114[1] or "";
        local v116 = v114[2] or "";
        local l_v100_0 = v100;
        if string.len(v115) > 0 and string.len(v116) > 0 and v115 ~= v116 then
            l_v100_0 = string.gsub(l_v100_0, v115, v116);
        end;
        if string.len(v100) > 0 and v88.isUserVerified then
            l_v100_0 = appendVerifiedBadge(l_v100_0);
        end;
        return l_v100_0;
    end);
    if v48 then
        v118 = v9.joinBindings({
            v118, 
            v102, 
            v88.textTransparency
        }):map(function(v119) --[[ Line: 293 ]]
            -- upvalues: v100 (copy), v48 (ref), v86 (ref), v93 (copy), l_prefixTextProperties_0 (copy), v95 (copy)
            local v120 = v119[1] or "";
            local v121 = v119[2] or false;
            local v122 = v119[3];
            if v122 == nil then
                v122 = 1;
            end;
            if string.len(v100) == 0 then
                return v120;
            else
                if v48 and v121 then
                    v120 = v86(v120, v93.trustedLabelText, v122, l_prefixTextProperties_0.TextSize, v95);
                end;
                return v120;
            end;
        end);
    end;
    local v124 = v118:map(function(v123) --[[ Line: 315 ]]
        -- upvalues: v100 (copy)
        if string.len(v100) == 0 then
            return v123;
        else
            return trim(v123);
        end;
    end);
    local v127 = v118:map(function(v125) --[[ Line: 322 ]]
        -- upvalues: v100 (copy), v99 (copy), l_showTranslationButton_0 (copy), v27 (ref), v42 (ref), l_prefixTextProperties_0 (copy)
        if string.len(v100) == 0 then
            return v99;
        else
            local l_v99_0 = v99;
            if l_showTranslationButton_0 then
                l_v99_0 = if v27 then "     " .. l_v99_0 else "   " .. l_v99_0;
            end;
            return v42(v125, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. l_v99_0;
        end;
    end);
    if v34 then
        v127 = v9.joinBindings({
            v127
        }):map(function(v128) --[[ Line: 337 ]]
            -- upvalues: v88 (copy), v14 (ref), l_prefixTextProperties_0 (copy), v95 (copy), v94 (ref)
            local v129 = v128[1] or "";
            if not v88.wasRewritten then
                return v129;
            else
                local v130 = if v88.isRewriteMenuOpen then v14.Enums.IconName.ChevronLargeUp else v14.Enums.IconName.ChevronLargeDown;
                return (("%* <font size='%*' color='#%*'>%*<font transparency='1'><stroke transparency='1'>_</stroke></font>%*</font>"):format(v129, l_prefixTextProperties_0.TextSize - 4, v95.Color.Content.Muted.Color3:ToHex(), ("(%*)"):format(v94), (("<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>"):format(v130))));
            end;
        end);
    end;
    local v131 = if l_isSpatialUIEnabled_0 then v92 else l_bodyTextProperties_0.TextSize;
    local v132 = v131 - 2;
    local v133 = if v6 then l_useCursor_0() else nil;
    local v134 = nil;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        if v31 then
            local v135 = 0;
            if l_FFlagExpChatAddPaddingAroundARButton_0 then
                local v136 = nil;
                local v137 = nil;
                local v138 = true;
                if v47 then
                    v137 = v20(false);
                    v136 = v8.useSignalState(v137.getChatStatus);
                    v138 = v18(v136);
                end;
                v135 = if not v17() and v138 then v45 else v46;
            end;
            v134 = v9.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v135)
            });
        else
            local v139 = nil;
            local v140 = nil;
            local v141 = true;
            if v47 then
                v140 = v20(false);
                v139 = v8.useSignalState(v140.getChatStatus);
                v141 = v18(v139);
            end;
            local v142 = not v17() and v141;
            v134 = v9.createElement("UIPadding", {
                PaddingRight = UDim.new(0, if v142 then v45 else v46)
            });
        end;
    end;
    local v143 = nil;
    if v34 and v88.wasRewritten then
        v143 = v88.chatWindowTransparencyBindingOrValue == nil or if typeof(v88.chatWindowTransparencyBindingOrValue) == "number" then v88.chatWindowTransparencyBindingOrValue < v37 else v88.chatWindowTransparencyBindingOrValue:map(function(v144) --[[ Line: 400 ]]
            -- upvalues: v37 (ref)
            return v144 < v37;
        end);
    end;
    local l_createElement_0 = v9.createElement;
    local v146 = "Frame";
    local v147 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v88.LayoutOrder
    };
    local v148 = {
        UIPadding = v134
    };
    local l_createElement_1 = v9.createElement;
    local v150 = "Frame";
    local v151 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v152 = {};
    local v153 = false;
    if string.len(v100) > 0 then
        v153 = v9.createElement;
        local v154 = "TextLabel";
        local v155 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = l_prefixTextProperties_0.FontFace, 
            RichText = true, 
            Text = v118, 
            TextColor3 = l_prefixTextProperties_0.TextColor3, 
            TextSize = l_prefixTextProperties_0.TextSize, 
            TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
        };
        local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 35 -> 46 ]];
        v155.TextStrokeTransparency = v88.textTransparency:map(function(v158) --[[ Line: 101 ]]
            -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
            if l_l_TextStrokeTransparency_0_0 == nil then
                return 1;
            else
                local l_l_l_TextStrokeTransparency_0_0_0 = l_l_TextStrokeTransparency_0_0;
                return l_l_l_TextStrokeTransparency_0_0_0 + v158 * (1 - l_l_l_TextStrokeTransparency_0_0_0);
            end;
        end);
        l_TextStrokeTransparency_0 = v88.textTransparency;
        local v160 = 0;
        local l_v160_0 = v160 --[[ copy: 39 -> 47 ]];
        v155.TextTransparency = l_TextStrokeTransparency_0:map(function(v162) --[[ Line: 101 ]]
            -- upvalues: l_v160_0 (copy)
            if l_v160_0 == nil then
                return 1;
            else
                local l_l_v160_0_0 = l_v160_0;
                return l_l_v160_0_0 + v162 * (1 - l_l_v160_0_0);
            end;
        end);
        v155.TextWrapped = true;
        v155.TextXAlignment = Enum.TextXAlignment.Left;
        v155.TextYAlignment = Enum.TextYAlignment.Top;
        local v164 = {};
        l_TextStrokeTransparency_0 = false;
        if l_prefixTextProperties_0.UIGradient ~= nil then
            l_TextStrokeTransparency_0 = v9.createElement("UIGradient", l_prefixTextProperties_0.UIGradient);
        end;
        v164.UIGradient = l_TextStrokeTransparency_0;
        v153 = v153(v154, v155, v164);
    end;
    v152.PrefixText = v153;
    v153 = v9.createElement;
    local v165 = v34 and v88.wasRewritten and "TextButton" or "TextLabel";
    local v166 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = l_bodyTextProperties_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v127, 
        TextColor3 = l_bodyTextProperties_0.TextColor3, 
        TextSize = v131, 
        TextStrokeColor3 = l_bodyTextProperties_0.TextStrokeColor3
    };
    local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
    local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 35 -> 44 ]];
    v166.TextStrokeTransparency = v88.textTransparency:map(function(v169) --[[ Line: 101 ]]
        -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
        if l_l_TextStrokeTransparency_1_0 == nil then
            return 1;
        else
            local l_l_l_TextStrokeTransparency_1_0_0 = l_l_TextStrokeTransparency_1_0;
            return l_l_l_TextStrokeTransparency_1_0_0 + v169 * (1 - l_l_l_TextStrokeTransparency_1_0_0);
        end;
    end);
    l_TextStrokeTransparency_1 = v88.textTransparency;
    local v171 = 0;
    local l_v171_0 = v171 --[[ copy: 39 -> 45 ]];
    v166.TextTransparency = l_TextStrokeTransparency_1:map(function(v173) --[[ Line: 101 ]]
        -- upvalues: l_v171_0 (copy)
        if l_v171_0 == nil then
            return 1;
        else
            local l_l_v171_0_0 = l_v171_0;
            return l_l_v171_0_0 + v173 * (1 - l_l_v171_0_0);
        end;
    end);
    v166.TextWrapped = true;
    v166.TextXAlignment = Enum.TextXAlignment.Left;
    v166.TextYAlignment = Enum.TextYAlignment.Top;
    v166[v9.Event.Activated] = if v34 and v88.wasRewritten then v88.onTextBodyActivated else nil;
    v166.Interactable = v143;
    v152.BodyText = v153(v165, v166);
    if string.len(v100) ~= 0 then
        v153 = v9.createElement;
        v165 = "Frame";
        v166 = {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v175 = {
            Layout = v9.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            TextButton = v9.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = l_prefixTextProperties_0.FontFace, 
                RichText = true, 
                SelectionImageObject = v133, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = v124, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeTransparency = 1, 
                TextTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 1, 
                [v9.Event.Activated] = function() --[[ Line: 493 ]]
                    -- upvalues: v88 (copy)
                    v88.onTextMessageLabelButtonActivated(v88.message);
                end
            })
        };
        if l_showTranslationButton_0 then
            l_TextStrokeTransparency_1 = v9.createElement;
            local v176 = "ImageButton";
            local v177 = {
                BackgroundTransparency = 1, 
                HoverImage = "rbxasset://textures/translateIconDark.png", 
                Image = "rbxasset://textures/translateIcon.png"
            };
            v171 = v88.textTransparency;
            local v178 = 0;
            v177.ImageTransparency = v171:map(function(v179) --[[ Line: 101 ]]
                -- upvalues: v178 (copy)
                if v178 == nil then
                    return 1;
                else
                    local l_v178_0 = v178;
                    return l_v178_0 + v179 * (1 - l_v178_0);
                end;
            end);
            v177.LayoutOrder = 2;
            v177.PressedImage = "rbxasset://textures/translateIconDark.png";
            v177.SelectionImageObject = v133;
            v177.Size = UDim2.new(0, v132, 0, v132);
            v177[v9.Event.Activated] = function() --[[ Line: 508 ]]
                -- upvalues: v88 (copy)
                v88.onToggle(not v88.message.useTranslation, v88.message.messageId);
            end;
            l_TextStrokeTransparency_1 = l_TextStrokeTransparency_1(v176, v177);
        else
            l_TextStrokeTransparency_1 = nil;
        end;
        v175.TranslationButton = l_TextStrokeTransparency_1;
        v153 = v153(v165, v166, v175);
    else
        v153 = nil;
    end;
    v152.TextMessageButton = v153;
    v148.TextMessage = l_createElement_1(v150, v151, v152);
    l_createElement_0 = l_createElement_0(v146, v147, v148);
    if v26 then
        debug.profileend();
    end;
    return l_createElement_0;
end;
local function v186(_) --[[ Line: 523 ]] --[[ Name: TranslatedTextMessageWithToggle ]]
    -- upvalues: v10 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v19 (copy), v181 (copy)
    return v10.connect(function() --[[ Line: 524 ]]

    end, function(v183) --[[ Line: 524 ]]
        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v19 (ref)
        return {
            onToggle = function(v184, v185) --[[ Line: 526 ]] --[[ Name: onToggle ]]
                -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v19 (ref), v183 (copy)
                if l_FFlagExpChatUseMessagesStore_0 then
                    v19(false).toggleMessageTranslation(v184, v185);
                    return;
                else
                    v183({
                        type = "ChatTranslationMessageToggled", 
                        useTranslation = v184, 
                        messageId = v185
                    });
                    return;
                end;
            end
        };
    end)(v181);
end;
local function v207(v187) --[[ Line: 542 ]] --[[ Name: RewriteLabelWithButton ]]
    -- upvalues: v14 (copy), v16 (copy), v32 (copy), v9 (copy)
    local v188 = v14.Hooks.useTokens();
    local v189 = v16.useLocalization({
        rewrittenLabelText = v32, 
        defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
    });
    local v190 = if v189.rewrittenLabelText and v189.rewrittenLabelText ~= "" then v189.rewrittenLabelText else v189.defaultRewrittenLabelText;
    local l_createElement_2 = v9.createElement;
    local l_View_0 = v14.View;
    local v193 = {
        tag = "size-full-0 auto-y row align-y-center gap-xsmall", 
        LayoutOrder = v187.LayoutOrder
    };
    local v194 = {};
    local l_createElement_3 = v9.createElement;
    local l_Text_0 = v14.Text;
    local v197 = {
        Text = "(" .. v190 .. ")", 
        tag = "size-0-0 auto-xy text-caption-small text-align-x-left", 
        LayoutOrder = 1, 
        RichText = true
    };
    local v198 = {
        Color3 = v188.Color.Content.Muted.Color3
    };
    local l_Transparency_2 = v188.Color.Content.Muted.Transparency;
    local l_l_Transparency_2_0 = l_Transparency_2 --[[ copy: 13 -> 18 ]];
    v198.Transparency = v187.textTransparency:map(function(v201) --[[ Line: 101 ]]
        -- upvalues: l_l_Transparency_2_0 (copy)
        if l_l_Transparency_2_0 == nil then
            return 1;
        else
            local l_l_l_Transparency_2_0_0 = l_l_Transparency_2_0;
            return l_l_l_Transparency_2_0_0 + v201 * (1 - l_l_l_Transparency_2_0_0);
        end;
    end);
    v197.textStyle = v198;
    v198 = {
        Color = Color3.fromRGB(0, 0, 0)
    };
    l_Transparency_2 = v187.textTransparency;
    local v203 = 0.5;
    v198.Transparency = l_Transparency_2:map(function(v204) --[[ Line: 101 ]]
        -- upvalues: v203 (copy)
        if v203 == nil then
            return 1;
        else
            local l_v203_0 = v203;
            return l_v203_0 + v204 * (1 - l_v203_0);
        end;
    end);
    v198.Thickness = v188.Stroke.Thin;
    v197.stroke = v198;
    v194.Label = l_createElement_3(l_Text_0, v197);
    v194.IconButton = v9.createElement(v14.IconButton, {
        size = v14.Enums.InputSize.XSmall, 
        icon = if v187.isRewriteMenuOpen then v14.Enums.IconName.ChevronLargeUp else v14.Enums.IconName.ChevronLargeDown, 
        variant = v14.Enums.ButtonVariant.Utility, 
        isCircular = true, 
        LayoutOrder = 2, 
        Visible = v187.textTransparency:map(function(v206) --[[ Line: 580 ]]
            return v206 < 1;
        end), 
        onActivated = v187.onActivated
    });
    return l_createElement_2(l_View_0, v193, v194);
end;
return v9.memo(function(v208) --[[ Line: 588 ]] --[[ Name: TranslatedTextMessageWrapper ]]
    -- upvalues: v41 (copy), v31 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v47 (copy), v20 (copy), v8 (copy), v18 (copy), v17 (copy), v45 (copy), v46 (copy), v16 (copy), v33 (copy), v14 (copy), v9 (copy), v35 (copy), l_IXPService_0 (copy), v36 (copy), v34 (copy), l_Dictionary_0 (copy), v186 (copy), v181 (copy), v207 (copy)
    local v209 = v41(v208.message, v208.chatWindowSettings);
    local l_showTranslationButton_1 = v208.showTranslationButton;
    local v211 = nil;
    local v212 = nil;
    local v213 = nil;
    local v214 = nil;
    local v215 = nil;
    local v216 = nil;
    local v217 = false;
    local v218 = false;
    local v219 = 0;
    local v220 = "";
    if v31 then
        local v221 = 0;
        if l_FFlagExpChatAddPaddingAroundARButton_0 then
            local v222 = nil;
            local v223 = nil;
            local v224 = true;
            if v47 then
                v223 = v20(false);
                v222 = v8.useSignalState(v223.getChatStatus);
                v224 = v18(v222);
            end;
            v221 = if not v17() and v224 then v45 else v46;
        end;
        v219 = math.max(v221 - v46, 0);
        v212 = v16.useLocalization({
            rewrittenReasonLabelText = v33, 
            defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel"
        });
        v220 = if v212.rewrittenReasonLabelText and v212.rewrittenReasonLabelText ~= "" then v212.rewrittenReasonLabelText else v212.defaultRewrittenReasonLabelText;
        v211 = v14.Hooks.useTokens();
        local v225;
        v221, v225 = v9.useState(false);
        v213 = v221;
        v214 = v225;
        v215 = v9.useCallback(function() --[[ Line: 614 ]]
            -- upvalues: v214 (ref)
            v214(function(v226) --[[ Line: 615 ]]
                return not v226;
            end);
        end, {});
        v218 = v209.wasRewritten;
        v216 = v209.originalText;
        v217 = v218 and v216 ~= nil and v216 ~= "";
        if v35 then
            v9.useEffect(function() --[[ Line: 625 ]]
                -- upvalues: v218 (ref), l_IXPService_0 (ref), v36 (ref)
                if v218 then
                    l_IXPService_0:LogFlagLinkedUserLayerExposure(v36);
                end;
            end, {
                v218
            });
        end;
    end;
    local v227 = nil;
    local l_v208_0 = v208;
    if v34 and v218 then
        l_v208_0 = l_Dictionary_0.join(l_v208_0, {
            isRewriteMenuOpen = v213, 
            wasRewritten = v218, 
            onTextBodyActivated = v215, 
            LayoutOrder = 1
        });
    elseif v31 and v218 then
        l_v208_0 = l_Dictionary_0.join(l_v208_0, {
            LayoutOrder = 1
        });
    end;
    v227 = if l_showTranslationButton_1 then v9.createElement(v186, l_v208_0) else v9.createElement(v181, l_v208_0);
    local v229;
    if v31 and v218 then
        v229 = v9.createElement;
        local l_View_1 = v14.View;
        local v231 = {
            tag = ("size-full-0 auto-y align-y-top col%*"):format(v34 and " gap-xsmall" or ""), 
            LayoutOrder = v208.LayoutOrder
        };
        local v232 = {
            UIPadding = if v213 then v9.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4)
            }) else nil, 
            TranslatedTextMessage = v227, 
            RewriteLabelWithButton = if not v218 or v34 then nil else v9.createElement(v207, {
                onActivated = v215, 
                isRewriteMenuOpen = v213, 
                transparencyValue = v208.transparencyValue, 
                textTransparency = v208.textTransparency, 
                LayoutOrder = 2
            })
        };
        local v233;
        if v213 then
            v233 = v9.createElement;
            local l_View_2 = v14.View;
            local v235 = {
                tag = "align-x-left col radius-medium gap-xxsmall padding-small", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v46, 0, 0), 
                LayoutOrder = 3
            };
            local v236 = {
                Color3 = v211.Color.Common.Scrim.Color3
            };
            local l_transparencyValue_0 = v208.transparencyValue;
            local v238 = 0.7;
            local l_v238_0 = v238 --[[ copy: 28 -> 33 ]];
            v236.Transparency = l_transparencyValue_0:map(function(v240) --[[ Line: 101 ]]
                -- upvalues: l_v238_0 (copy)
                if l_v238_0 == nil then
                    return 1;
                else
                    local l_l_v238_0_0 = l_v238_0;
                    return l_l_v238_0_0 + v240 * (1 - l_l_v238_0_0);
                end;
            end);
            v235.backgroundStyle = v236;
            v236 = {};
            local v242;
            if v217 then
                v242 = v9.createElement;
                l_transparencyValue_0 = v14.Text;
                local v243 = {
                    Text = v216, 
                    tag = "text-body-small text-align-x-left", 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, -v219, 0, 0), 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextWrapped = true
                };
                local v244 = {
                    Color3 = v211.Color.Content.Muted.Color3
                };
                v238 = v211.Color.Content.Muted.Transparency;
                local l_v238_1 = v238 --[[ copy: 28 -> 35 ]];
                v244.Transparency = v208.textTransparency:map(function(v246) --[[ Line: 101 ]]
                    -- upvalues: l_v238_1 (copy)
                    if l_v238_1 == nil then
                        return 1;
                    else
                        local l_l_v238_1_0 = l_v238_1;
                        return l_l_v238_1_0 + v246 * (1 - l_l_v238_1_0);
                    end;
                end);
                v243.textStyle = v244;
                v244 = {
                    Color = Color3.fromRGB(0, 0, 0)
                };
                v238 = v208.textTransparency;
                local v248 = 0.5;
                local l_v248_0 = v248 --[[ copy: 32 -> 36 ]];
                v244.Transparency = v238:map(function(v250) --[[ Line: 101 ]]
                    -- upvalues: l_v248_0 (copy)
                    if l_v248_0 == nil then
                        return 1;
                    else
                        local l_l_v248_0_0 = l_v248_0;
                        return l_l_v248_0_0 + v250 * (1 - l_l_v248_0_0);
                    end;
                end);
                v244.Thickness = v211.Stroke.Thin;
                v243.stroke = v244;
                v242 = v242(l_transparencyValue_0, v243);
            else
                v242 = nil;
            end;
            v236.OriginalText = v242;
            v236.Divider = if v217 then v9.createElement(v14.Divider, {
                orientation = v14.Enums.Orientation.Horizontal, 
                LayoutOrder = 2, 
                Visible = v208.textTransparency:map(function(v252) --[[ Line: 713 ]]
                    return v252 < 1;
                end), 
                DividerVariant = v14.Enums.DividerVariant.Default
            }) else nil;
            v242 = v9.createElement;
            l_transparencyValue_0 = v14.Text;
            local v253 = {
                Text = v220, 
                tag = "text-body-small text-align-x-left", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v219, 0, 0), 
                LayoutOrder = 3, 
                RichText = true, 
                TextWrapped = true
            };
            local v254 = {
                Color3 = v211.Color.Content.Default.Color3
            };
            v238 = v211.Color.Content.Default.Transparency;
            local l_v238_2 = v238 --[[ copy: 28 -> 34 ]];
            v254.Transparency = v208.textTransparency:map(function(v256) --[[ Line: 101 ]]
                -- upvalues: l_v238_2 (copy)
                if l_v238_2 == nil then
                    return 1;
                else
                    local l_l_v238_2_0 = l_v238_2;
                    return l_l_v238_2_0 + v256 * (1 - l_l_v238_2_0);
                end;
            end);
            v253.textStyle = v254;
            v254 = {
                Color = Color3.fromRGB(0, 0, 0)
            };
            v238 = v208.textTransparency;
            local v258 = 0.5;
            v254.Transparency = v238:map(function(v259) --[[ Line: 101 ]]
                -- upvalues: v258 (copy)
                if v258 == nil then
                    return 1;
                else
                    local l_v258_0 = v258;
                    return l_v258_0 + v259 * (1 - l_v258_0);
                end;
            end);
            v254.Thickness = v211.Stroke.Thin;
            v253.stroke = v254;
            v236.ReasoningText = v242(l_transparencyValue_0, v253);
            v233 = v233(l_View_2, v235, v236);
        else
            v233 = nil;
        end;
        v232.DropdownMenu = v233;
        v229 = v229(l_View_1, v231, v232);
    else
        v229 = v227;
    end;
    return v229;
end, function(v261, v262) --[[ Line: 753 ]] --[[ Name: areEqual ]]
    -- upvalues: v31 (copy), v34 (copy)
    local v263 = false;
    if v261.message.text == v262.message.text then
        v263 = false;
        if v261.message.prefixText == v262.message.prefixText then
            v263 = false;
            if v261.message.translation == v262.message.translation then
                v263 = false;
                if v261.message.useTranslation == v262.message.useTranslation then
                    v263 = false;
                    if v261.message.messageId == v262.message.messageId then
                        v263 = false;
                        if v261.chatWindowSettings == v262.chatWindowSettings then
                            v263 = not v31 or v261.message.wasRewritten == v262.message.wasRewritten and v261.message.originalText == v262.message.originalText;
                            if v263 then
                                if v34 then
                                    return v261.chatWindowTransparencyBindingOrValue == v262.chatWindowTransparencyBindingOrValue;
                                else
                                    v263 = true;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v263;
end);
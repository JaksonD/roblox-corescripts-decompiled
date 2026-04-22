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
local v23 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v24 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v25 = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagDebugMessageProfiling);
local v27 = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false);
local v28 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatUseUpdatedMessageRendered);
local v29 = require(l_script_FirstAncestor_0.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v30 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local v31 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v32 = require(l_script_FirstAncestor_0.Flags.FStringInExpChatRewriteLabelKey);
local v33 = require(l_script_FirstAncestor_0.Flags.FStringInExpChatRewriteReasonKey);
local v34 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local v35 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInlineIxpEnabled);
local v36 = require(l_script_FirstAncestor_0.Flags.FStringExpChatRewriteInlineIxpLayer);
local v37 = require(l_script_FirstAncestor_0.Flags.FIntExpChatWindowTransparencyRewriteInteractableThreshold);
local v38 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatSummaryOnLua);
local v39 = require(l_script_FirstAncestor_0.summaryMessageRichText);
local l_useCursor_0 = v21.App.SelectionCursor.useCursor;
local v41 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v43 = require(l_Helpers_0.getMessageSettings);
local v44 = require(l_Helpers_0.duplicateInvisibleText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v46 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v47 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v48 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v49 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
local l_GetFFlagTextChatEnableUniverseChatTabs_0 = require(l_Parent_1.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs;
appendVerifiedBadge = function(v52) --[[ Line: 68 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v41 (copy)
    return string.gsub(v52, ":(%S-)$", v41.VERIFIED_EMOJI .. ":%1");
end;
local function v58(v53) --[[ Line: 72 ]]
    -- upvalues: l_UserProfileStore_0 (copy), v8 (copy)
    local v54 = tostring(v53.userId);
    local v55 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v54
    })(false).data[1];
    local v56 = v8.useSignalBinding(v55.names.getDisplayName);
    local v57 = v8.useSignalBinding(v55.names.getInExperienceCombinedName);
    return {
        displayName = v56, 
        inExperienceCombinedName = v57
    };
end;
trim = function(v59) --[[ Line: 81 ]] --[[ Name: trim ]]
    if v59:match("^()%s*$") then
        return "";
    else
        return (v59:match("^%s*(.*%S)"));
    end;
end;
getMessageText = function(v60, v61, v62) --[[ Line: 85 ]] --[[ Name: getMessageText ]]
    if v61 == nil or v61 == "" then
        return v62 or "";
    elseif v60 then
        return v61 or "";
    else
        return v62 or "";
    end;
end;
local function _(v63, v64) --[[ Line: 95 ]] --[[ Name: calculateTransparency ]]
    return v63 + v64 * (1 - v63);
end;
local function _(v66, v67) --[[ Line: 99 ]] --[[ Name: setTransparency ]]
    return v67:map(function(v68) --[[ Line: 100 ]]
        -- upvalues: v66 (copy)
        if v66 == nil then
            return 1;
        else
            local l_v66_0 = v66;
            return l_v66_0 + v68 * (1 - l_v66_0);
        end;
    end);
end;
local _ = function() --[[ Line: 105 ]] --[[ Name: useARButtonRightPadding ]]
    -- upvalues: v49 (copy), v20 (copy), v8 (copy), v18 (copy), v17 (copy), v47 (copy), v48 (copy)
    local _ = 0;
    local v72 = nil;
    local v73 = nil;
    local v74 = true;
    if v49 then
        v73 = v20(false);
        v72 = v8.useSignalState(v73.getChatStatus);
        v74 = v18(v72);
    end;
    if not v17() and v74 then
        return v47;
    else
        return v48;
    end;
end;
local function v87(v76, v77, v78, v79, v80) --[[ Line: 125 ]] --[[ Name: appendTrustedIndicator ]]
    local v81 = v80.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v80.Color.Shift.Shift_300.Transparency;
    local v83 = l_Transparency_0 + v78 * (1 - l_Transparency_0);
    l_Transparency_0 = v80.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v80.Color.Content.Emphasis.Transparency;
    local v85 = l_Transparency_1 + v78 * (1 - l_Transparency_1);
    l_Transparency_1 = v79 - 4;
    local v86 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v81, v83), 600, l_Transparency_1), l_Transparency_0, v85, v77)))));
    if string.find(v76, ":([%S:]-)$") then
        return string.gsub(v76, ":([%S:]-)$", ((" %* :%%1"):format(v86)));
    else
        return (("%* %*"):format(v76, v86));
    end;
end;
local v88 = v12.TrustedConnections.TrustedConnectionsStore.get();
local function _(v89, v90, v91) --[[ Line: 162 ]] --[[ Name: applyStyleToText ]]
    -- upvalues: v25 (copy), v39 (copy)
    local v92 = v90 or "";
    if v91.chatActionType == v25.Summary then
        v92 = v39.wrapInSummaryMutedStyle(v39.getSummaryIconPrefix() .. " " .. v92, v89.Color.Content.Muted.Color3:ToHex());
    end;
    return v92;
end;
local function v189(v94) --[[ Line: 174 ]]
    -- upvalues: v26 (copy), l_FFlagExpChatPerfTracking_0 (copy), v9 (copy), v24 (copy), v16 (copy), v34 (copy), v32 (copy), v14 (copy), v43 (copy), l_GetFFlagTextChatEnableUniverseChatTabs_0 (copy), v46 (copy), v58 (copy), v30 (copy), v13 (copy), l_Players_0 (copy), v88 (copy), v8 (copy), v28 (copy), v23 (copy), v29 (copy), l_TextChatService_0 (copy), v87 (copy), v38 (copy), v25 (copy), v39 (copy), v27 (copy), v44 (copy), v6 (copy), l_useCursor_0 (copy), v31 (copy), v49 (copy), v20 (copy), v18 (copy), v17 (copy), v47 (copy), v48 (copy), v37 (copy)
    if v26 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    if l_FFlagExpChatPerfTracking_0 then
        local v95 = v94.message.messageId or "UNKNOWN_MESSAGE_ID";
        local l_v95_0 = v95 --[[ copy: 1 -> 51 ]];
        v9.useEffect(function() --[[ Line: 180 ]]
            -- upvalues: v24 (ref), l_v95_0 (copy)
            v24.finish(v24.Events.MessageReceiveToWindowRenderInterval, {
                messageId = l_v95_0
            });
            v24.finish(v24.Events.MessageSendToWindowRenderInterval, {
                messageId = l_v95_0
            });
        end, {
            v95
        });
    end;
    local l_isSpatialUIEnabled_0 = v94.isSpatialUIEnabled;
    local v98 = if l_isSpatialUIEnabled_0 then v94.chatWindowSettings.SpatialPanelTextSize else v94.chatWindowSettings.TextSize;
    local v99 = v16.useLocalization({
        trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel", 
        rewrittenLabelText = if v34 then v32 else nil, 
        defaultRewrittenLabelText = v34 and "CoreScripts.TextChat.ChatWindow.RewrittenLabel" or nil
    });
    local v100 = nil;
    if v34 then
        v100 = if v99.rewrittenLabelText and v99.rewrittenLabelText ~= "" then v99.rewrittenLabelText else v99.defaultRewrittenLabelText;
    end;
    local v101 = v14.Hooks.useTokens();
    local v102 = v43(v94.message, v94.chatWindowSettings);
    local l_showTranslationButton_0 = v94.showTranslationButton;
    local l_useTranslation_0 = v102.useTranslation;
    local v105 = getMessageText(l_useTranslation_0, v102.translation, v102.text);
    local v106 = v102.prefixText or "";
    local v107 = nil;
    if l_GetFFlagTextChatEnableUniverseChatTabs_0() and v94.message.textChannel == nil then
        v107 = nil;
    elseif v46() and v94.message.userId then
        if v26 then
            debug.profilebegin("useCombinedName");
        end;
        v107 = v58(v94.message);
        if v26 then
            debug.profileend();
        end;
    end;
    local v108 = nil;
    local v109 = v94.message.userId and tostring(v94.message.userId);
    local v110 = if v30() then v94.message.isHiddenMessage else nil;
    local v115 = v9.useMemo(function() --[[ Line: 233 ]]
        -- upvalues: v13 (ref), v109 (copy), l_Players_0 (ref), v110 (copy), v88 (ref)
        return v13.createComputed(function(v111) --[[ Line: 234 ]]
            -- upvalues: v109 (ref), l_Players_0 (ref), v110 (ref), v88 (ref)
            local v112 = v109 and v109 ~= "";
            local v113 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
            local v114 = v113 and v113 == v109;
            if v112 and not v114 and not v110 then
                return (v88.getIsTrustedConnection(v109).data(v111));
            else
                return nil;
            end;
        end);
    end, {
        v109, 
        v110
    });
    v108 = v8.useSignalBinding(v115);
    if v28() then
        v9.useEffect(function() --[[ Line: 251 ]]
            -- upvalues: v94 (copy), v23 (ref), v29 (ref), v30 (ref), l_TextChatService_0 (ref)
            if v94.message.textChatMessageInstance and v23(v29) and (not v30() or not v94.message.isHiddenMessage) then
                l_TextChatService_0:SendExpChatMessageClientRendered(v94.message.textChatMessageInstance, "chat_window");
            end;
        end, {});
    end;
    local l_bodyTextProperties_0 = v102.bodyTextProperties;
    local l_prefixTextProperties_0 = v102.prefixTextProperties;
    local v122 = v9.joinBindings(if v107 ~= nil then {
        v107.displayName, 
        v107.inExperienceCombinedName
    } else {}):map(function(v118) --[[ Line: 266 ]]
        -- upvalues: v106 (copy), v94 (copy)
        local v119 = v118[1] or "";
        local v120 = v118[2] or "";
        local l_v106_0 = v106;
        if string.len(v119) > 0 and string.len(v120) > 0 and v119 ~= v120 then
            l_v106_0 = string.gsub(l_v106_0, v119, v120);
        end;
        if string.len(v106) > 0 and v94.isUserVerified then
            l_v106_0 = appendVerifiedBadge(l_v106_0);
        end;
        return l_v106_0;
    end);
    v122 = v9.joinBindings({
        v122, 
        v108, 
        v94.textTransparency
    }):map(function(v123) --[[ Line: 287 ]]
        -- upvalues: v106 (copy), v87 (ref), v99 (copy), l_prefixTextProperties_0 (copy), v101 (copy)
        local v124 = v123[1] or "";
        local v125 = v123[2] or false;
        local v126 = v123[3];
        if v126 == nil then
            v126 = 1;
        end;
        if string.len(v106) == 0 then
            return v124;
        else
            if v125 then
                v124 = v87(v124, v99.trustedLabelText, v126, l_prefixTextProperties_0.TextSize, v101);
            end;
            return v124;
        end;
    end);
    local v128 = v122:map(function(v127) --[[ Line: 308 ]]
        -- upvalues: v106 (copy)
        if string.len(v106) == 0 then
            return v127;
        else
            return trim(v127);
        end;
    end);
    local v135 = v122:map(function(v129) --[[ Line: 315 ]]
        -- upvalues: v105 (copy), v38 (ref), v101 (copy), v94 (copy), v25 (ref), v39 (ref), v106 (copy), l_showTranslationButton_0 (copy), v27 (ref), v44 (ref), l_prefixTextProperties_0 (copy)
        local l_v105_0 = v105;
        if v38 then
            local l_v101_0 = v101;
            local l_v105_1 = v105;
            local l_message_0 = v94.message;
            local v134 = l_v105_1 or "";
            if l_message_0.chatActionType == v25.Summary then
                v134 = v39.wrapInSummaryMutedStyle(v39.getSummaryIconPrefix() .. " " .. v134, l_v101_0.Color.Content.Muted.Color3:ToHex());
            end;
            l_v105_0 = v134;
        end;
        if string.len(v106) == 0 then
            if v38 then
                return l_v105_0;
            else
                return v105;
            end;
        else
            if l_showTranslationButton_0 then
                l_v105_0 = if v27 then "     " .. l_v105_0 else "   " .. l_v105_0;
            end;
            return v44(v129, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. l_v105_0;
        end;
    end);
    if v34 then
        v135 = v9.joinBindings({
            v135
        }):map(function(v136) --[[ Line: 335 ]]
            -- upvalues: v94 (copy), v14 (ref), l_prefixTextProperties_0 (copy), v101 (copy), v100 (ref)
            local v137 = v136[1] or "";
            if not v94.wasRewritten then
                return v137;
            else
                local v138 = if v94.isRewriteMenuOpen then v14.Enums.IconName.ChevronLargeUp else v14.Enums.IconName.ChevronLargeDown;
                return (("%* <font size='%*' color='#%*'>%*<font transparency='1'><stroke transparency='1'>_</stroke></font>%*</font>"):format(v137, l_prefixTextProperties_0.TextSize - 4, v101.Color.Content.Muted.Color3:ToHex(), ("(%*)"):format(v100), (("<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>"):format(v138))));
            end;
        end);
    end;
    local v139 = if l_isSpatialUIEnabled_0 then v98 else l_bodyTextProperties_0.TextSize;
    local v140 = v139 - 2;
    local v141 = if v6 then l_useCursor_0() else nil;
    local v142 = nil;
    if v31 then
        local v143 = 0;
        local v144 = nil;
        local v145 = nil;
        local v146 = true;
        if v49 then
            v145 = v20(false);
            v144 = v8.useSignalState(v145.getChatStatus);
            v146 = v18(v144);
        end;
        v143 = if not v17() and v146 then v47 else v48;
        v142 = v9.createElement("UIPadding", {
            PaddingRight = UDim.new(0, v143)
        });
    else
        local v147 = nil;
        local v148 = nil;
        local v149 = true;
        if v49 then
            v148 = v20(false);
            v147 = v8.useSignalState(v148.getChatStatus);
            v149 = v18(v147);
        end;
        local v150 = not v17() and v149;
        v142 = v9.createElement("UIPadding", {
            PaddingRight = UDim.new(0, if v150 then v47 else v48)
        });
    end;
    local v151 = nil;
    if v34 and v94.wasRewritten then
        v151 = v94.chatWindowTransparencyBindable == nil or if typeof(v94.chatWindowTransparencyBindable) == "number" then v94.chatWindowTransparencyBindable < v37 else v94.chatWindowTransparencyBindable:map(function(v152) --[[ Line: 396 ]]
            -- upvalues: v37 (ref)
            return v152 < v37;
        end);
    end;
    local l_createElement_0 = v9.createElement;
    local v154 = "Frame";
    local v155 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v94.LayoutOrder
    };
    local v156 = {
        UIPadding = v142
    };
    local l_createElement_1 = v9.createElement;
    local v158 = "Frame";
    local v159 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v160 = {};
    local v161 = false;
    if string.len(v106) > 0 then
        v161 = v9.createElement;
        local v162 = "TextLabel";
        local v163 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = l_prefixTextProperties_0.FontFace, 
            RichText = true, 
            Text = v122, 
            TextColor3 = l_prefixTextProperties_0.TextColor3, 
            TextSize = l_prefixTextProperties_0.TextSize, 
            TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
        };
        local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 38 -> 49 ]];
        v163.TextStrokeTransparency = v94.textTransparency:map(function(v166) --[[ Line: 100 ]]
            -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
            if l_l_TextStrokeTransparency_0_0 == nil then
                return 1;
            else
                local l_l_l_TextStrokeTransparency_0_0_0 = l_l_TextStrokeTransparency_0_0;
                return l_l_l_TextStrokeTransparency_0_0_0 + v166 * (1 - l_l_l_TextStrokeTransparency_0_0_0);
            end;
        end);
        l_TextStrokeTransparency_0 = v94.textTransparency;
        local v168 = 0;
        local l_v168_0 = v168 --[[ copy: 42 -> 50 ]];
        v163.TextTransparency = l_TextStrokeTransparency_0:map(function(v170) --[[ Line: 100 ]]
            -- upvalues: l_v168_0 (copy)
            if l_v168_0 == nil then
                return 1;
            else
                local l_l_v168_0_0 = l_v168_0;
                return l_l_v168_0_0 + v170 * (1 - l_l_v168_0_0);
            end;
        end);
        v163.TextWrapped = true;
        v163.TextXAlignment = Enum.TextXAlignment.Left;
        v163.TextYAlignment = Enum.TextYAlignment.Top;
        local v172 = {};
        l_TextStrokeTransparency_0 = false;
        if l_prefixTextProperties_0.UIGradient ~= nil then
            l_TextStrokeTransparency_0 = v9.createElement("UIGradient", l_prefixTextProperties_0.UIGradient);
        end;
        v172.UIGradient = l_TextStrokeTransparency_0;
        v161 = v161(v162, v163, v172);
    end;
    v160.PrefixText = v161;
    v161 = v9.createElement;
    local v173 = v34 and v94.wasRewritten and "TextButton" or "TextLabel";
    local v174 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = l_bodyTextProperties_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v135, 
        TextColor3 = l_bodyTextProperties_0.TextColor3, 
        TextSize = v139, 
        TextStrokeColor3 = l_bodyTextProperties_0.TextStrokeColor3
    };
    local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
    local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 38 -> 47 ]];
    v174.TextStrokeTransparency = v94.textTransparency:map(function(v177) --[[ Line: 100 ]]
        -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
        if l_l_TextStrokeTransparency_1_0 == nil then
            return 1;
        else
            local l_l_l_TextStrokeTransparency_1_0_0 = l_l_TextStrokeTransparency_1_0;
            return l_l_l_TextStrokeTransparency_1_0_0 + v177 * (1 - l_l_l_TextStrokeTransparency_1_0_0);
        end;
    end);
    l_TextStrokeTransparency_1 = v94.textTransparency;
    local v179 = 0;
    local l_v179_0 = v179 --[[ copy: 42 -> 48 ]];
    v174.TextTransparency = l_TextStrokeTransparency_1:map(function(v181) --[[ Line: 100 ]]
        -- upvalues: l_v179_0 (copy)
        if l_v179_0 == nil then
            return 1;
        else
            local l_l_v179_0_0 = l_v179_0;
            return l_l_v179_0_0 + v181 * (1 - l_l_v179_0_0);
        end;
    end);
    v174.TextWrapped = true;
    v174.TextXAlignment = Enum.TextXAlignment.Left;
    v174.TextYAlignment = Enum.TextYAlignment.Top;
    v174[v9.Event.Activated] = if v34 and v94.wasRewritten then v94.onTextBodyActivated else nil;
    v174.Interactable = v151;
    v160.BodyText = v161(v173, v174);
    if string.len(v106) ~= 0 then
        v161 = v9.createElement;
        v173 = "Frame";
        v174 = {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v183 = {
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
                SelectionImageObject = v141, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = v128, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeTransparency = 1, 
                TextTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 1, 
                [v9.Event.Activated] = function() --[[ Line: 489 ]]
                    -- upvalues: v94 (copy)
                    v94.onTextMessageLabelButtonActivated(v94.message);
                end
            })
        };
        if l_showTranslationButton_0 then
            l_TextStrokeTransparency_1 = v9.createElement;
            local v184 = "ImageButton";
            local v185 = {
                BackgroundTransparency = 1, 
                HoverImage = "rbxasset://textures/translateIconDark.png", 
                Image = "rbxasset://textures/translateIcon.png"
            };
            v179 = v94.textTransparency;
            local v186 = 0;
            v185.ImageTransparency = v179:map(function(v187) --[[ Line: 100 ]]
                -- upvalues: v186 (copy)
                if v186 == nil then
                    return 1;
                else
                    local l_v186_0 = v186;
                    return l_v186_0 + v187 * (1 - l_v186_0);
                end;
            end);
            v185.LayoutOrder = 2;
            v185.PressedImage = "rbxasset://textures/translateIconDark.png";
            v185.SelectionImageObject = v141;
            v185.Size = UDim2.new(0, v140, 0, v140);
            v185[v9.Event.Activated] = function() --[[ Line: 504 ]]
                -- upvalues: v94 (copy)
                v94.onToggle(not v94.message.useTranslation, v94.message.messageId);
            end;
            l_TextStrokeTransparency_1 = l_TextStrokeTransparency_1(v184, v185);
        else
            l_TextStrokeTransparency_1 = nil;
        end;
        v183.TranslationButton = l_TextStrokeTransparency_1;
        v161 = v161(v173, v174, v183);
    else
        v161 = nil;
    end;
    v160.TextMessageButton = v161;
    v156.TextMessage = l_createElement_1(v158, v159, v160);
    l_createElement_0 = l_createElement_0(v154, v155, v156);
    if v26 then
        debug.profileend();
    end;
    return l_createElement_0;
end;
local function v194(_) --[[ Line: 519 ]] --[[ Name: TranslatedTextMessageWithToggle ]]
    -- upvalues: v10 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v19 (copy), v189 (copy)
    return v10.connect(function() --[[ Line: 520 ]]

    end, function(v191) --[[ Line: 520 ]]
        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v19 (ref)
        return {
            onToggle = function(v192, v193) --[[ Line: 522 ]] --[[ Name: onToggle ]]
                -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v19 (ref), v191 (copy)
                if l_FFlagExpChatUseMessagesStore_0 then
                    v19(false).toggleMessageTranslation(v192, v193);
                    return;
                else
                    v191({
                        type = "ChatTranslationMessageToggled", 
                        useTranslation = v192, 
                        messageId = v193
                    });
                    return;
                end;
            end
        };
    end)(v189);
end;
local function v215(v195) --[[ Line: 538 ]] --[[ Name: RewriteLabelWithButton ]]
    -- upvalues: v14 (copy), v16 (copy), v32 (copy), v9 (copy)
    local v196 = v14.Hooks.useTokens();
    local v197 = v16.useLocalization({
        rewrittenLabelText = v32, 
        defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
    });
    local v198 = if v197.rewrittenLabelText and v197.rewrittenLabelText ~= "" then v197.rewrittenLabelText else v197.defaultRewrittenLabelText;
    local l_createElement_2 = v9.createElement;
    local l_View_0 = v14.View;
    local v201 = {
        tag = "size-full-0 auto-y row align-y-center gap-xsmall", 
        LayoutOrder = v195.LayoutOrder
    };
    local v202 = {};
    local l_createElement_3 = v9.createElement;
    local l_Text_0 = v14.Text;
    local v205 = {
        Text = "(" .. v198 .. ")", 
        tag = "size-0-0 auto-xy text-caption-small text-align-x-left", 
        LayoutOrder = 1, 
        RichText = true
    };
    local v206 = {
        Color3 = v196.Color.Content.Muted.Color3
    };
    local l_Transparency_2 = v196.Color.Content.Muted.Transparency;
    local l_l_Transparency_2_0 = l_Transparency_2 --[[ copy: 13 -> 18 ]];
    v206.Transparency = v195.textTransparency:map(function(v209) --[[ Line: 100 ]]
        -- upvalues: l_l_Transparency_2_0 (copy)
        if l_l_Transparency_2_0 == nil then
            return 1;
        else
            local l_l_l_Transparency_2_0_0 = l_l_Transparency_2_0;
            return l_l_l_Transparency_2_0_0 + v209 * (1 - l_l_l_Transparency_2_0_0);
        end;
    end);
    v205.textStyle = v206;
    v206 = {
        Color = Color3.fromRGB(0, 0, 0)
    };
    l_Transparency_2 = v195.textTransparency;
    local v211 = 0.5;
    v206.Transparency = l_Transparency_2:map(function(v212) --[[ Line: 100 ]]
        -- upvalues: v211 (copy)
        if v211 == nil then
            return 1;
        else
            local l_v211_0 = v211;
            return l_v211_0 + v212 * (1 - l_v211_0);
        end;
    end);
    v206.Thickness = v196.Stroke.Thin;
    v205.stroke = v206;
    v202.Label = l_createElement_3(l_Text_0, v205);
    v202.IconButton = v9.createElement(v14.IconButton, {
        size = v14.Enums.InputSize.XSmall, 
        icon = if v195.isRewriteMenuOpen then v14.Enums.IconName.ChevronLargeUp else v14.Enums.IconName.ChevronLargeDown, 
        variant = v14.Enums.ButtonVariant.Utility, 
        isCircular = true, 
        LayoutOrder = 2, 
        Visible = v195.textTransparency:map(function(v214) --[[ Line: 576 ]]
            return v214 < 1;
        end), 
        onActivated = v195.onActivated
    });
    return l_createElement_2(l_View_0, v201, v202);
end;
return v9.memo(function(v216) --[[ Line: 584 ]] --[[ Name: TranslatedTextMessageWrapper ]]
    -- upvalues: v43 (copy), v31 (copy), v49 (copy), v20 (copy), v8 (copy), v18 (copy), v17 (copy), v47 (copy), v48 (copy), v16 (copy), v33 (copy), v14 (copy), v9 (copy), v35 (copy), l_IXPService_0 (copy), v36 (copy), v34 (copy), l_Dictionary_0 (copy), v194 (copy), v189 (copy), v215 (copy)
    local v217 = v43(v216.message, v216.chatWindowSettings);
    local l_showTranslationButton_1 = v216.showTranslationButton;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    local v222 = nil;
    local v223 = nil;
    local v224 = nil;
    local v225 = false;
    local v226 = false;
    local v227 = 0;
    local v228 = "";
    if v31 then
        local v229 = 0;
        local v230 = nil;
        local v231 = nil;
        local v232 = true;
        if v49 then
            v231 = v20(false);
            v230 = v8.useSignalState(v231.getChatStatus);
            v232 = v18(v230);
        end;
        v227 = math.max((if not v17() and v232 then v47 else v48) - v48, 0);
        v220 = v16.useLocalization({
            rewrittenReasonLabelText = v33, 
            defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel"
        });
        v228 = if v220.rewrittenReasonLabelText and v220.rewrittenReasonLabelText ~= "" then v220.rewrittenReasonLabelText else v220.defaultRewrittenReasonLabelText;
        v219 = v14.Hooks.useTokens();
        v229, v230 = v9.useState(false);
        v221 = v229;
        v222 = v230;
        v223 = v9.useCallback(function() --[[ Line: 610 ]]
            -- upvalues: v222 (ref)
            v222(function(v233) --[[ Line: 611 ]]
                return not v233;
            end);
        end, {});
        v226 = v217.wasRewritten;
        v224 = v217.originalText;
        v225 = v226 and v224 ~= nil and v224 ~= "";
        if v35 then
            v9.useEffect(function() --[[ Line: 621 ]]
                -- upvalues: v226 (ref), l_IXPService_0 (ref), v36 (ref)
                if v226 then
                    l_IXPService_0:LogFlagLinkedUserLayerExposure(v36);
                end;
            end, {
                v226
            });
        end;
    end;
    local v234 = nil;
    local l_v216_0 = v216;
    if v34 and v226 then
        l_v216_0 = l_Dictionary_0.join(l_v216_0, {
            isRewriteMenuOpen = v221, 
            wasRewritten = v226, 
            onTextBodyActivated = v223, 
            LayoutOrder = 1
        });
    elseif v31 and v226 then
        l_v216_0 = l_Dictionary_0.join(l_v216_0, {
            LayoutOrder = 1
        });
    end;
    v234 = if l_showTranslationButton_1 then v9.createElement(v194, l_v216_0) else v9.createElement(v189, l_v216_0);
    local v236;
    if v31 and v226 then
        v236 = v9.createElement;
        local l_View_1 = v14.View;
        local v238 = {
            tag = ("size-full-0 auto-y align-y-top col%*"):format(v34 and " gap-xsmall" or ""), 
            LayoutOrder = v216.LayoutOrder
        };
        local v239 = {
            UIPadding = if v221 then v9.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4)
            }) else nil, 
            TranslatedTextMessage = v234, 
            RewriteLabelWithButton = if not v226 or v34 then nil else v9.createElement(v215, {
                onActivated = v223, 
                isRewriteMenuOpen = v221, 
                transparencyValue = v216.transparencyValue, 
                textTransparency = v216.textTransparency, 
                LayoutOrder = 2
            })
        };
        local v240;
        if v221 then
            v240 = v9.createElement;
            local l_View_2 = v14.View;
            local v242 = {
                tag = "align-x-left col radius-medium gap-xxsmall padding-small", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v48, 0, 0), 
                LayoutOrder = 3
            };
            local v243 = {
                Color3 = v219.Color.Common.Scrim.Color3
            };
            local l_transparencyValue_0 = v216.transparencyValue;
            local v245 = 0.7;
            local l_v245_0 = v245 --[[ copy: 28 -> 33 ]];
            v243.Transparency = l_transparencyValue_0:map(function(v247) --[[ Line: 100 ]]
                -- upvalues: l_v245_0 (copy)
                if l_v245_0 == nil then
                    return 1;
                else
                    local l_l_v245_0_0 = l_v245_0;
                    return l_l_v245_0_0 + v247 * (1 - l_l_v245_0_0);
                end;
            end);
            v242.backgroundStyle = v243;
            v243 = {};
            local v249;
            if v225 then
                v249 = v9.createElement;
                l_transparencyValue_0 = v14.Text;
                local v250 = {
                    Text = v224, 
                    tag = "text-body-small text-align-x-left", 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, -v227, 0, 0), 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextWrapped = true
                };
                local v251 = {
                    Color3 = v219.Color.Content.Muted.Color3
                };
                v245 = v219.Color.Content.Muted.Transparency;
                local l_v245_1 = v245 --[[ copy: 28 -> 35 ]];
                v251.Transparency = v216.textTransparency:map(function(v253) --[[ Line: 100 ]]
                    -- upvalues: l_v245_1 (copy)
                    if l_v245_1 == nil then
                        return 1;
                    else
                        local l_l_v245_1_0 = l_v245_1;
                        return l_l_v245_1_0 + v253 * (1 - l_l_v245_1_0);
                    end;
                end);
                v250.textStyle = v251;
                v251 = {
                    Color = Color3.fromRGB(0, 0, 0)
                };
                v245 = v216.textTransparency;
                local v255 = 0.5;
                local l_v255_0 = v255 --[[ copy: 32 -> 36 ]];
                v251.Transparency = v245:map(function(v257) --[[ Line: 100 ]]
                    -- upvalues: l_v255_0 (copy)
                    if l_v255_0 == nil then
                        return 1;
                    else
                        local l_l_v255_0_0 = l_v255_0;
                        return l_l_v255_0_0 + v257 * (1 - l_l_v255_0_0);
                    end;
                end);
                v251.Thickness = v219.Stroke.Thin;
                v250.stroke = v251;
                v249 = v249(l_transparencyValue_0, v250);
            else
                v249 = nil;
            end;
            v243.OriginalText = v249;
            v243.Divider = if v225 then v9.createElement(v14.Divider, {
                orientation = v14.Enums.Orientation.Horizontal, 
                LayoutOrder = 2, 
                Visible = v216.textTransparency:map(function(v259) --[[ Line: 709 ]]
                    return v259 < 1;
                end), 
                DividerVariant = v14.Enums.DividerVariant.Default
            }) else nil;
            v249 = v9.createElement;
            l_transparencyValue_0 = v14.Text;
            local v260 = {
                Text = v228, 
                tag = "text-body-small text-align-x-left", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v227, 0, 0), 
                LayoutOrder = 3, 
                RichText = true, 
                TextWrapped = true
            };
            local v261 = {
                Color3 = v219.Color.Content.Default.Color3
            };
            v245 = v219.Color.Content.Default.Transparency;
            local l_v245_2 = v245 --[[ copy: 28 -> 34 ]];
            v261.Transparency = v216.textTransparency:map(function(v263) --[[ Line: 100 ]]
                -- upvalues: l_v245_2 (copy)
                if l_v245_2 == nil then
                    return 1;
                else
                    local l_l_v245_2_0 = l_v245_2;
                    return l_l_v245_2_0 + v263 * (1 - l_l_v245_2_0);
                end;
            end);
            v260.textStyle = v261;
            v261 = {
                Color = Color3.fromRGB(0, 0, 0)
            };
            v245 = v216.textTransparency;
            local v265 = 0.5;
            v261.Transparency = v245:map(function(v266) --[[ Line: 100 ]]
                -- upvalues: v265 (copy)
                if v265 == nil then
                    return 1;
                else
                    local l_v265_0 = v265;
                    return l_v265_0 + v266 * (1 - l_v265_0);
                end;
            end);
            v261.Thickness = v219.Stroke.Thin;
            v260.stroke = v261;
            v243.ReasoningText = v249(l_transparencyValue_0, v260);
            v240 = v240(l_View_2, v242, v243);
        else
            v240 = nil;
        end;
        v239.DropdownMenu = v240;
        v236 = v236(l_View_1, v238, v239);
    else
        v236 = v234;
    end;
    return v236;
end, function(v268, v269) --[[ Line: 749 ]] --[[ Name: areEqual ]]
    -- upvalues: v31 (copy), v34 (copy), v38 (copy)
    local v270 = false;
    if v268.message.text == v269.message.text then
        v270 = false;
        if v268.message.prefixText == v269.message.prefixText then
            v270 = false;
            if v268.message.translation == v269.message.translation then
                v270 = false;
                if v268.message.useTranslation == v269.message.useTranslation then
                    v270 = false;
                    if v268.message.messageId == v269.message.messageId then
                        v270 = false;
                        if v268.chatWindowSettings == v269.chatWindowSettings then
                            v270 = not v31 or v268.message.wasRewritten == v269.message.wasRewritten and v268.message.originalText == v269.message.originalText;
                            if v270 then
                                v270 = not v34 or v268.chatWindowTransparencyBindable == v269.chatWindowTransparencyBindable;
                                if v270 then
                                    if v38 then
                                        return v268.message.chatActionType == v269.message.chatActionType;
                                    else
                                        v270 = true;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v270;
end);
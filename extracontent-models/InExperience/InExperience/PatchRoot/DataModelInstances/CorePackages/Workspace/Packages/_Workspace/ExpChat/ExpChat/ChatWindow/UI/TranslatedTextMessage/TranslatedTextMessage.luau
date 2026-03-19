local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatEnableFocusNavigation);
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_Parent_1.React);
local v9 = require(l_Parent_0.RoactRodux);
local v10 = require(l_Parent_0.SharedFlags);
local v11 = require(l_Parent_0.DataHydration);
local v12 = require(l_Parent_0.Signals);
local v13 = require(l_Parent_0.Foundation);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v15 = require(l_script_FirstAncestor_0.Localization);
local v16 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v17 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local v18 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v19 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v20 = require(l_Parent_0.UIBlox);
local l_FFlagExpChatUseMessagesStore_0 = v10.FFlagExpChatUseMessagesStore;
local l_FFlagExpChatAddPaddingAroundARButton_0 = v10.FFlagExpChatAddPaddingAroundARButton;
local v23 = require(l_script_FirstAncestor_0.shouldSendHighFrequencyTelemetry);
local v24 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local v25 = game:DefineFastFlag("DebugMessageProfiling", false);
local v26 = game:DefineFastFlag("ExpChatTranslationToggleSpacingFix", false);
local v27 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatUseUpdatedMessageRendered);
local v28 = require(l_script_FirstAncestor_0.Flags.getFIntExpChatMessageRenderUserThrottlePermyriad)();
local v29 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatExcludeFOMORenders);
local v30 = require(l_script_FirstAncestor_0.Flags.FFlagEnableInExpChatRewrite);
local v31 = game:DefineFastString("InExpChatRewriteLabelKey", "CoreScripts.TextChat.ChatWindow.RephrasedLabel");
local v32 = game:DefineFastString("InExpChatRewriteReasonKey", "CoreScripts.TextChat.ChatWindow.RephrasedReason.Description");
local l_useCursor_0 = v20.App.SelectionCursor.useCursor;
local v34 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v36 = require(l_Helpers_0.getMessageSettings);
local v37 = require(l_Helpers_0.duplicateInvisibleText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v39 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v40 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v41 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v42 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v43 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v44 = require(l_Flags_0.FFlagExpChatTcOptimization);
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
appendVerifiedBadge = function(v46) --[[ Line: 61 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v34 (copy)
    return string.gsub(v46, ":(%S-)$", v34.VERIFIED_EMOJI .. ":%1");
end;
local function v52(v47) --[[ Line: 65 ]]
    -- upvalues: l_UserProfileStore_0 (copy), v7 (copy)
    local v48 = tostring(v47.userId);
    local v49 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v48
    })(false).data[1];
    local v50 = v7.useSignalBinding(v49.names.getDisplayName);
    local v51 = v7.useSignalBinding(v49.names.getInExperienceCombinedName);
    return {
        displayName = v50, 
        inExperienceCombinedName = v51
    };
end;
trim = function(v53) --[[ Line: 74 ]] --[[ Name: trim ]]
    if v53:match("^()%s*$") then
        return "";
    else
        return (v53:match("^%s*(.*%S)"));
    end;
end;
getMessageText = function(v54, v55, v56) --[[ Line: 78 ]] --[[ Name: getMessageText ]]
    if v55 == nil or v55 == "" then
        return v56 or "";
    elseif v54 then
        return v55 or "";
    else
        return v56 or "";
    end;
end;
local function _(v57, v58) --[[ Line: 88 ]] --[[ Name: calculateTransparency ]]
    return v57 + v58 * (1 - v57);
end;
local function _(v60, v61) --[[ Line: 92 ]] --[[ Name: setTransparency ]]
    return v61:map(function(v62) --[[ Line: 93 ]]
        -- upvalues: v60 (copy)
        if v60 == nil then
            return 1;
        else
            local l_v60_0 = v60;
            return l_v60_0 + v62 * (1 - l_v60_0);
        end;
    end);
end;
local function _() --[[ Line: 98 ]] --[[ Name: useARButtonRightPadding ]]
    -- upvalues: l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v42 (copy), v19 (copy), v7 (copy), v17 (copy), v16 (copy), v40 (copy), v41 (copy)
    local v65 = 0;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        local v66 = nil;
        local v67 = nil;
        local v68 = true;
        if v42 then
            v67 = v19(false);
            v66 = v7.useSignalState(v67.getChatStatus);
            v68 = v17(v66);
        end;
        if not v16() and v68 then
            return v40;
        else
            v65 = v41;
        end;
    end;
    return v65;
end;
local function v81(v70, v71, v72, v73, v74) --[[ Line: 120 ]] --[[ Name: appendTrustedIndicator ]]
    local v75 = v74.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v74.Color.Shift.Shift_300.Transparency;
    local v77 = l_Transparency_0 + v72 * (1 - l_Transparency_0);
    l_Transparency_0 = v74.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v74.Color.Content.Emphasis.Transparency;
    local v79 = l_Transparency_1 + v72 * (1 - l_Transparency_1);
    l_Transparency_1 = v73 - 4;
    local v80 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v75, v77), 600, l_Transparency_1), l_Transparency_0, v79, v71)))));
    if string.find(v70, ":([%S:]-)$") then
        return string.gsub(v70, ":([%S:]-)$", ((" %* :%%1"):format(v80)));
    else
        return (("%* %*"):format(v70, v80));
    end;
end;
local v82 = if v43 then v11.TrustedConnections.TrustedConnectionsStore.get() else nil;
local function v170(v83) --[[ Line: 159 ]]
    -- upvalues: v25 (copy), l_FFlagExpChatPerfTracking_0 (copy), v8 (copy), v24 (copy), v43 (copy), v15 (copy), v13 (copy), v36 (copy), v39 (copy), v52 (copy), v44 (copy), v29 (copy), v12 (copy), l_Players_0 (copy), v82 (copy), v7 (copy), v27 (copy), v23 (copy), v28 (copy), l_TextChatService_0 (copy), v81 (copy), v26 (copy), v37 (copy), v5 (copy), l_useCursor_0 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v30 (copy), v42 (copy), v19 (copy), v17 (copy), v16 (copy), v40 (copy), v41 (copy)
    if v25 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    if l_FFlagExpChatPerfTracking_0 then
        local v84 = v83.message.messageId or "UNKNOWN_MESSAGE_ID";
        local l_v84_0 = v84 --[[ copy: 1 -> 48 ]];
        v8.useEffect(function() --[[ Line: 165 ]]
            -- upvalues: v24 (ref), l_v84_0 (copy)
            v24.finish(v24.Events.MessageReceiveToWindowRenderInterval, {
                messageId = l_v84_0
            });
            v24.finish(v24.Events.MessageSendToWindowRenderInterval, {
                messageId = l_v84_0
            });
        end, {
            v84
        });
    end;
    local l_isSpatialUIEnabled_0 = v83.isSpatialUIEnabled;
    local v87 = if l_isSpatialUIEnabled_0 then v83.chatWindowSettings.SpatialPanelTextSize else v83.chatWindowSettings.TextSize;
    local v88 = if v43 then v15.useLocalization({
        trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel"
    }) else nil;
    local v89 = if v43 then v13.Hooks.useTokens() else nil;
    local v90 = v36(v83.message, v83.chatWindowSettings);
    local v91 = v83.showTranslationButton and v90.translation ~= nil and v90.translation ~= "";
    local l_useTranslation_0 = v90.useTranslation;
    local v93 = getMessageText(l_useTranslation_0, v90.translation, v90.text);
    local v94 = v90.prefixText or "";
    local v95 = nil;
    if v39() and v83.message.userId then
        if v25 then
            debug.profilebegin("useCombinedName");
        end;
        v95 = v52(v83.message);
        if v25 then
            debug.profileend();
        end;
    end;
    local v96 = nil;
    if v43 then
        local v97 = v83.message.userId and tostring(v83.message.userId);
        local v98 = if v44 and v29() then v83.message.isHiddenMessage else nil;
        local l_v97_0 = v97 --[[ copy: 12 -> 46 ]];
        local l_v98_0 = v98 --[[ copy: 13 -> 47 ]];
        local v105 = v8.useMemo(function() --[[ Line: 212 ]]
            -- upvalues: v12 (ref), l_v97_0 (copy), v44 (ref), l_Players_0 (ref), l_v98_0 (copy), v82 (ref)
            return v12.createComputed(function(v101) --[[ Line: 213 ]]
                -- upvalues: l_v97_0 (ref), v44 (ref), l_Players_0 (ref), l_v98_0 (ref), v82 (ref)
                local v102 = l_v97_0 and l_v97_0 ~= "";
                if v44 then
                    local v103 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                    local v104 = v103 and v103 == l_v97_0;
                    v102 = v102 and not v104 and not l_v98_0;
                end;
                if v102 then
                    return (v82.getIsTrustedConnection(l_v97_0).data(v101));
                else
                    return nil;
                end;
            end);
        end, {
            v97, 
            v98
        });
        v96 = v7.useSignalBinding(v105);
    end;
    if v27() then
        v8.useEffect(function() --[[ Line: 236 ]]
            -- upvalues: v83 (copy), v23 (ref), v28 (ref), v29 (ref), l_TextChatService_0 (ref)
            if v83.message.textChatMessageInstance and v23(v28) and (not v29() or not v83.message.isHiddenMessage) then
                l_TextChatService_0:SendExpChatMessageClientRendered(v83.message.textChatMessageInstance, "chat_window");
            end;
        end, {});
    end;
    local l_bodyTextProperties_0 = v90.bodyTextProperties;
    local l_prefixTextProperties_0 = v90.prefixTextProperties;
    local v112 = v8.joinBindings(if v95 ~= nil then {
        v95.displayName, 
        v95.inExperienceCombinedName
    } else {}):map(function(v108) --[[ Line: 251 ]]
        -- upvalues: v94 (copy), v83 (copy)
        local v109 = v108[1] or "";
        local v110 = v108[2] or "";
        local l_v94_0 = v94;
        if string.len(v109) > 0 and string.len(v110) > 0 and v109 ~= v110 then
            l_v94_0 = string.gsub(l_v94_0, v109, v110);
        end;
        if string.len(v94) > 0 and v83.isUserVerified then
            l_v94_0 = appendVerifiedBadge(l_v94_0);
        end;
        return l_v94_0;
    end);
    if v43 then
        v112 = v8.joinBindings({
            v112, 
            v96, 
            v83.textTransparency
        }):map(function(v113) --[[ Line: 274 ]]
            -- upvalues: v94 (copy), v43 (ref), v81 (ref), v88 (copy), l_prefixTextProperties_0 (copy), v89 (copy)
            local v114 = v113[1] or "";
            local v115 = v113[2] or false;
            local v116 = v113[3];
            if v116 == nil then
                v116 = 1;
            end;
            if string.len(v94) == 0 then
                return v114;
            else
                if v43 and v115 then
                    v114 = v81(v114, v88.trustedLabelText, v116, l_prefixTextProperties_0.TextSize, v89);
                end;
                return v114;
            end;
        end);
    end;
    local v118 = v112:map(function(v117) --[[ Line: 296 ]]
        -- upvalues: v94 (copy)
        if string.len(v94) == 0 then
            return v117;
        else
            return trim(v117);
        end;
    end);
    local v121 = v112:map(function(v119) --[[ Line: 303 ]]
        -- upvalues: v94 (copy), v93 (copy), v91 (copy), v26 (ref), v37 (ref), l_prefixTextProperties_0 (copy)
        if string.len(v94) == 0 then
            return v93;
        else
            local l_v93_0 = v93;
            if v91 then
                l_v93_0 = if v26 then "     " .. l_v93_0 else "   " .. l_v93_0;
            end;
            return v37(v119, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. l_v93_0;
        end;
    end);
    local v122 = if l_isSpatialUIEnabled_0 then v87 else l_bodyTextProperties_0.TextSize;
    local v123 = v122 - 2;
    local v124 = if v5 then l_useCursor_0() else nil;
    local v125 = nil;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        if v30 then
            local v126 = 0;
            if l_FFlagExpChatAddPaddingAroundARButton_0 then
                local v127 = nil;
                local v128 = nil;
                local v129 = true;
                if v42 then
                    v128 = v19(false);
                    v127 = v7.useSignalState(v128.getChatStatus);
                    v129 = v17(v127);
                end;
                v126 = if not v16() and v129 then v40 else v41;
            end;
            v125 = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v126)
            });
        else
            local v130 = nil;
            local v131 = nil;
            local v132 = true;
            if v42 then
                v131 = v19(false);
                v130 = v7.useSignalState(v131.getChatStatus);
                v132 = v17(v130);
            end;
            local v133 = not v16() and v132;
            v125 = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, if v133 then v40 else v41)
            });
        end;
    end;
    local l_createElement_0 = v8.createElement;
    local v135 = "Frame";
    local v136 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v83.LayoutOrder
    };
    local v137 = {
        UIPadding = v125
    };
    local l_createElement_1 = v8.createElement;
    local v139 = "Frame";
    local v140 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v141 = {};
    local v142 = false;
    if string.len(v94) > 0 then
        v142 = v8.createElement;
        local v143 = "TextLabel";
        local v144 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = l_prefixTextProperties_0.FontFace, 
            RichText = true, 
            Text = v112, 
            TextColor3 = l_prefixTextProperties_0.TextColor3, 
            TextSize = l_prefixTextProperties_0.TextSize, 
            TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
        };
        local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 33 -> 44 ]];
        v144.TextStrokeTransparency = v83.textTransparency:map(function(v147) --[[ Line: 93 ]]
            -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
            if l_l_TextStrokeTransparency_0_0 == nil then
                return 1;
            else
                local l_l_l_TextStrokeTransparency_0_0_0 = l_l_TextStrokeTransparency_0_0;
                return l_l_l_TextStrokeTransparency_0_0_0 + v147 * (1 - l_l_l_TextStrokeTransparency_0_0_0);
            end;
        end);
        l_TextStrokeTransparency_0 = v83.textTransparency;
        local v149 = 0;
        local l_v149_0 = v149 --[[ copy: 37 -> 45 ]];
        v144.TextTransparency = l_TextStrokeTransparency_0:map(function(v151) --[[ Line: 93 ]]
            -- upvalues: l_v149_0 (copy)
            if l_v149_0 == nil then
                return 1;
            else
                local l_l_v149_0_0 = l_v149_0;
                return l_l_v149_0_0 + v151 * (1 - l_l_v149_0_0);
            end;
        end);
        v144.TextWrapped = true;
        v144.TextXAlignment = Enum.TextXAlignment.Left;
        v144.TextYAlignment = Enum.TextYAlignment.Top;
        local v153 = {};
        l_TextStrokeTransparency_0 = false;
        if l_prefixTextProperties_0.UIGradient ~= nil then
            l_TextStrokeTransparency_0 = v8.createElement("UIGradient", l_prefixTextProperties_0.UIGradient);
        end;
        v153.UIGradient = l_TextStrokeTransparency_0;
        v142 = v142(v143, v144, v153);
    end;
    v141.PrefixText = v142;
    v142 = v8.createElement;
    local v154 = "TextLabel";
    local v155 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = l_bodyTextProperties_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v121, 
        TextColor3 = l_bodyTextProperties_0.TextColor3, 
        TextSize = v122, 
        TextStrokeColor3 = l_bodyTextProperties_0.TextStrokeColor3
    };
    local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
    local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 33 -> 42 ]];
    v155.TextStrokeTransparency = v83.textTransparency:map(function(v158) --[[ Line: 93 ]]
        -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
        if l_l_TextStrokeTransparency_1_0 == nil then
            return 1;
        else
            local l_l_l_TextStrokeTransparency_1_0_0 = l_l_TextStrokeTransparency_1_0;
            return l_l_l_TextStrokeTransparency_1_0_0 + v158 * (1 - l_l_l_TextStrokeTransparency_1_0_0);
        end;
    end);
    l_TextStrokeTransparency_1 = v83.textTransparency;
    local v160 = 0;
    local l_v160_0 = v160 --[[ copy: 37 -> 43 ]];
    v155.TextTransparency = l_TextStrokeTransparency_1:map(function(v162) --[[ Line: 93 ]]
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
    v141.BodyText = v142(v154, v155);
    if string.len(v94) ~= 0 then
        v142 = v8.createElement;
        v154 = "Frame";
        v155 = {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v164 = {
            Layout = v8.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            }), 
            TextButton = v8.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                FontFace = l_prefixTextProperties_0.FontFace, 
                RichText = true, 
                SelectionImageObject = v124, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = v118, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeTransparency = 1, 
                TextTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 1, 
                [v8.Event.Activated] = function() --[[ Line: 430 ]]
                    -- upvalues: v83 (copy)
                    v83.onTextMessageLabelButtonActivated(v83.message);
                end
            })
        };
        if v91 then
            l_TextStrokeTransparency_1 = v8.createElement;
            local v165 = "ImageButton";
            local v166 = {
                BackgroundTransparency = 1, 
                HoverImage = "rbxasset://textures/translateIconDark.png", 
                Image = "rbxasset://textures/translateIcon.png"
            };
            v160 = v83.textTransparency;
            local v167 = 0;
            v166.ImageTransparency = v160:map(function(v168) --[[ Line: 93 ]]
                -- upvalues: v167 (copy)
                if v167 == nil then
                    return 1;
                else
                    local l_v167_0 = v167;
                    return l_v167_0 + v168 * (1 - l_v167_0);
                end;
            end);
            v166.LayoutOrder = 2;
            v166.PressedImage = "rbxasset://textures/translateIconDark.png";
            v166.SelectionImageObject = v124;
            v166.Size = UDim2.new(0, v123, 0, v123);
            v166[v8.Event.Activated] = function() --[[ Line: 445 ]]
                -- upvalues: v83 (copy)
                v83.onToggle(not v83.message.useTranslation, v83.message.messageId);
            end;
            l_TextStrokeTransparency_1 = l_TextStrokeTransparency_1(v165, v166);
        else
            l_TextStrokeTransparency_1 = nil;
        end;
        v164.TranslationButton = l_TextStrokeTransparency_1;
        v142 = v142(v154, v155, v164);
    else
        v142 = nil;
    end;
    v141.TextMessageButton = v142;
    v137.TextMessage = l_createElement_1(v139, v140, v141);
    l_createElement_0 = l_createElement_0(v135, v136, v137);
    if v25 then
        debug.profileend();
    end;
    return l_createElement_0;
end;
local function v175(_) --[[ Line: 460 ]] --[[ Name: TranslatedTextMessageWithToggle ]]
    -- upvalues: v9 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v18 (copy), v170 (copy)
    return v9.connect(function() --[[ Line: 461 ]]

    end, function(v172) --[[ Line: 461 ]]
        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v18 (ref)
        return {
            onToggle = function(v173, v174) --[[ Line: 463 ]] --[[ Name: onToggle ]]
                -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v18 (ref), v172 (copy)
                if l_FFlagExpChatUseMessagesStore_0 then
                    v18(false).toggleMessageTranslation(v173, v174);
                    return;
                else
                    v172({
                        type = "ChatTranslationMessageToggled", 
                        useTranslation = v173, 
                        messageId = v174
                    });
                    return;
                end;
            end
        };
    end)(v170);
end;
local function v196(v176) --[[ Line: 479 ]] --[[ Name: RewriteLabelWithButton ]]
    -- upvalues: v13 (copy), v15 (copy), v31 (copy), v8 (copy)
    local v177 = v13.Hooks.useTokens();
    local v178 = v15.useLocalization({
        rewrittenLabelText = v31, 
        defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
    });
    local v179 = if v178.rewrittenLabelText and v178.rewrittenLabelText ~= "" then v178.rewrittenLabelText else v178.defaultRewrittenLabelText;
    local l_createElement_2 = v8.createElement;
    local l_View_0 = v13.View;
    local v182 = {
        tag = "size-full-0 auto-y row align-y-center gap-xsmall", 
        LayoutOrder = v176.LayoutOrder
    };
    local v183 = {};
    local l_createElement_3 = v8.createElement;
    local l_Text_0 = v13.Text;
    local v186 = {
        Text = "(" .. v179 .. ")", 
        tag = "size-0-0 auto-xy text-caption-small text-align-x-left", 
        LayoutOrder = 1, 
        RichText = true
    };
    local v187 = {
        Color3 = v177.Color.Content.Muted.Color3
    };
    local l_Transparency_2 = v177.Color.Content.Muted.Transparency;
    local l_l_Transparency_2_0 = l_Transparency_2 --[[ copy: 13 -> 18 ]];
    v187.Transparency = v176.textTransparency:map(function(v190) --[[ Line: 93 ]]
        -- upvalues: l_l_Transparency_2_0 (copy)
        if l_l_Transparency_2_0 == nil then
            return 1;
        else
            local l_l_l_Transparency_2_0_0 = l_l_Transparency_2_0;
            return l_l_l_Transparency_2_0_0 + v190 * (1 - l_l_l_Transparency_2_0_0);
        end;
    end);
    v186.textStyle = v187;
    v187 = {
        Color = Color3.fromRGB(0, 0, 0)
    };
    l_Transparency_2 = v176.textTransparency;
    local v192 = 0.5;
    v187.Transparency = l_Transparency_2:map(function(v193) --[[ Line: 93 ]]
        -- upvalues: v192 (copy)
        if v192 == nil then
            return 1;
        else
            local l_v192_0 = v192;
            return l_v192_0 + v193 * (1 - l_v192_0);
        end;
    end);
    v187.Thickness = v177.Stroke.Thin;
    v186.stroke = v187;
    v183.Label = l_createElement_3(l_Text_0, v186);
    v183.IconButton = v8.createElement(v13.IconButton, {
        size = v13.Enums.InputSize.XSmall, 
        icon = if v176.isRewriteMenuOpen then v13.Enums.IconName.ChevronLargeUp else v13.Enums.IconName.ChevronLargeDown, 
        variant = v13.Enums.ButtonVariant.Utility, 
        isCircular = true, 
        LayoutOrder = 2, 
        Visible = v176.textTransparency:map(function(v195) --[[ Line: 517 ]]
            return v195 < 1;
        end), 
        onActivated = v176.onActivated
    });
    return l_createElement_2(l_View_0, v182, v183);
end;
return v8.memo(function(v197) --[[ Line: 525 ]] --[[ Name: TranslatedTextMessageWrapper ]]
    -- upvalues: v36 (copy), v30 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v42 (copy), v19 (copy), v7 (copy), v17 (copy), v16 (copy), v40 (copy), v41 (copy), v15 (copy), v32 (copy), v13 (copy), v8 (copy), v175 (copy), l_Dictionary_0 (copy), v170 (copy), v196 (copy)
    local v198 = v36(v197.message, v197.chatWindowSettings);
    local v199 = v197.showTranslationButton and v198.translation ~= nil and v198.translation ~= "";
    local v200 = nil;
    local v201 = nil;
    local v202 = nil;
    local v203 = nil;
    local v204 = nil;
    local v205 = nil;
    local v206 = false;
    local v207 = false;
    local v208 = 0;
    local v209 = "";
    if v30 then
        local v210 = 0;
        if l_FFlagExpChatAddPaddingAroundARButton_0 then
            local v211 = nil;
            local v212 = nil;
            local v213 = true;
            if v42 then
                v212 = v19(false);
                v211 = v7.useSignalState(v212.getChatStatus);
                v213 = v17(v211);
            end;
            v210 = if not v16() and v213 then v40 else v41;
        end;
        v208 = math.max(v210 - v41, 0);
        v201 = v15.useLocalization({
            rewrittenReasonLabelText = v32, 
            defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel"
        });
        v209 = if v201.rewrittenReasonLabelText and v201.rewrittenReasonLabelText ~= "" then v201.rewrittenReasonLabelText else v201.defaultRewrittenReasonLabelText;
        v200 = v13.Hooks.useTokens();
        local v214;
        v210, v214 = v8.useState(false);
        v202 = v210;
        v203 = v214;
        v204 = v8.useCallback(function() --[[ Line: 553 ]]
            -- upvalues: v203 (ref)
            v203(function(v215) --[[ Line: 554 ]]
                return not v215;
            end);
        end, {});
        v207 = v198.wasRewritten;
        v205 = v198.originalText;
        v206 = v207 and v205 ~= nil and v205 ~= "";
    end;
    local v216 = nil;
    v216 = if v199 then v8.createElement(v175, if v30 and v207 then l_Dictionary_0.join(v197, {
        LayoutOrder = 1
    }) else v197) else v8.createElement(v170, if v30 and v207 then l_Dictionary_0.join(v197, {
        LayoutOrder = 1
    }) else v197);
    local v217;
    if v30 and v207 then
        v217 = v8.createElement;
        local l_View_1 = v13.View;
        local v219 = {
            tag = "size-full-0 auto-y align-y-top col", 
            LayoutOrder = v197.LayoutOrder
        };
        local v220 = {
            UIPadding = if v202 then v8.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4)
            }) else nil, 
            TranslatedTextMessage = v216, 
            RewriteLabelWithButton = if v207 then v8.createElement(v196, {
                onActivated = v204, 
                isRewriteMenuOpen = v202, 
                transparencyValue = v197.transparencyValue, 
                textTransparency = v197.textTransparency, 
                LayoutOrder = 2
            }) else nil
        };
        local v221;
        if v202 then
            v221 = v8.createElement;
            local l_View_2 = v13.View;
            local v223 = {
                tag = "align-x-left col radius-medium gap-xxsmall padding-small", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v41, 0, 0), 
                LayoutOrder = 3
            };
            local v224 = {
                Color3 = v200.Color.Common.Scrim.Color3
            };
            local l_transparencyValue_0 = v197.transparencyValue;
            local v226 = 0.7;
            local l_v226_0 = v226 --[[ copy: 27 -> 32 ]];
            v224.Transparency = l_transparencyValue_0:map(function(v228) --[[ Line: 93 ]]
                -- upvalues: l_v226_0 (copy)
                if l_v226_0 == nil then
                    return 1;
                else
                    local l_l_v226_0_0 = l_v226_0;
                    return l_l_v226_0_0 + v228 * (1 - l_l_v226_0_0);
                end;
            end);
            v223.backgroundStyle = v224;
            v224 = {};
            local v230;
            if v206 then
                v230 = v8.createElement;
                l_transparencyValue_0 = v13.Text;
                local v231 = {
                    Text = v205, 
                    tag = "text-body-small text-align-x-left", 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, -v208, 0, 0), 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextWrapped = true
                };
                local v232 = {
                    Color3 = v200.Color.Content.Muted.Color3
                };
                v226 = v200.Color.Content.Muted.Transparency;
                local l_v226_1 = v226 --[[ copy: 27 -> 34 ]];
                v232.Transparency = v197.textTransparency:map(function(v234) --[[ Line: 93 ]]
                    -- upvalues: l_v226_1 (copy)
                    if l_v226_1 == nil then
                        return 1;
                    else
                        local l_l_v226_1_0 = l_v226_1;
                        return l_l_v226_1_0 + v234 * (1 - l_l_v226_1_0);
                    end;
                end);
                v231.textStyle = v232;
                v232 = {
                    Color = Color3.fromRGB(0, 0, 0)
                };
                v226 = v197.textTransparency;
                local v236 = 0.5;
                local l_v236_0 = v236 --[[ copy: 31 -> 35 ]];
                v232.Transparency = v226:map(function(v238) --[[ Line: 93 ]]
                    -- upvalues: l_v236_0 (copy)
                    if l_v236_0 == nil then
                        return 1;
                    else
                        local l_l_v236_0_0 = l_v236_0;
                        return l_l_v236_0_0 + v238 * (1 - l_l_v236_0_0);
                    end;
                end);
                v232.Thickness = v200.Stroke.Thin;
                v231.stroke = v232;
                v230 = v230(l_transparencyValue_0, v231);
            else
                v230 = nil;
            end;
            v224.OriginalText = v230;
            v224.Divider = if v206 then v8.createElement(v13.Divider, {
                orientation = v13.Enums.Orientation.Horizontal, 
                LayoutOrder = 2, 
                Visible = v197.textTransparency:map(function(v240) --[[ Line: 639 ]]
                    return v240 < 1;
                end), 
                DividerVariant = v13.Enums.DividerVariant.Default
            }) else nil;
            v230 = v8.createElement;
            l_transparencyValue_0 = v13.Text;
            local v241 = {
                Text = v209, 
                tag = "text-body-small text-align-x-left", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v208, 0, 0), 
                LayoutOrder = 3, 
                RichText = true, 
                TextWrapped = true
            };
            local v242 = {
                Color3 = v200.Color.Content.Default.Color3
            };
            v226 = v200.Color.Content.Default.Transparency;
            local l_v226_2 = v226 --[[ copy: 27 -> 33 ]];
            v242.Transparency = v197.textTransparency:map(function(v244) --[[ Line: 93 ]]
                -- upvalues: l_v226_2 (copy)
                if l_v226_2 == nil then
                    return 1;
                else
                    local l_l_v226_2_0 = l_v226_2;
                    return l_l_v226_2_0 + v244 * (1 - l_l_v226_2_0);
                end;
            end);
            v241.textStyle = v242;
            v242 = {
                Color = Color3.fromRGB(0, 0, 0)
            };
            v226 = v197.textTransparency;
            local v246 = 0.5;
            v242.Transparency = v226:map(function(v247) --[[ Line: 93 ]]
                -- upvalues: v246 (copy)
                if v246 == nil then
                    return 1;
                else
                    local l_v246_0 = v246;
                    return l_v246_0 + v247 * (1 - l_v246_0);
                end;
            end);
            v242.Thickness = v200.Stroke.Thin;
            v241.stroke = v242;
            v224.ReasoningText = v230(l_transparencyValue_0, v241);
            v221 = v221(l_View_2, v223, v224);
        else
            v221 = nil;
        end;
        v220.DropdownMenu = v221;
        v217 = v217(l_View_1, v219, v220);
    else
        v217 = v216;
    end;
    return v217;
end, function(v249, v250) --[[ Line: 679 ]] --[[ Name: areEqual ]]
    -- upvalues: v30 (copy)
    local v251 = false;
    if v249.message.text == v250.message.text then
        v251 = false;
        if v249.message.prefixText == v250.message.prefixText then
            v251 = false;
            if v249.message.translation == v250.message.translation then
                v251 = false;
                if v249.message.useTranslation == v250.message.useTranslation then
                    v251 = false;
                    if v249.message.messageId == v250.message.messageId then
                        v251 = false;
                        if v249.chatWindowSettings == v250.chatWindowSettings then
                            if v30 then
                                v251 = false;
                                if v249.message.wasRewritten == v250.message.wasRewritten then
                                    return v249.message.originalText == v250.message.originalText;
                                end;
                            else
                                v251 = true;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v251;
end);
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
local v33 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatRewriteInline);
local v34 = game:DefineFastInt("ExpChatWindowTransparencyRewriteInteractableThreshold", 0.9);
local l_useCursor_0 = v20.App.SelectionCursor.useCursor;
local v36 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v38 = require(l_Helpers_0.getMessageSettings);
local v39 = require(l_Helpers_0.duplicateInvisibleText);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v41 = require(l_Flags_0.isExperienceChatUserProfileApiEnabled);
local v42 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v43 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v44 = require(l_Flags_0.FFlagAEGIS2EnableGatesForExpChat);
local v45 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v46 = require(l_Flags_0.FFlagExpChatTcOptimization);
local l_FFlagExpChatPerfTracking_0 = require(l_Parent_0.SharedFlags).FFlagExpChatPerfTracking;
appendVerifiedBadge = function(v48) --[[ Line: 64 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v36 (copy)
    return string.gsub(v48, ":(%S-)$", v36.VERIFIED_EMOJI .. ":%1");
end;
local function v54(v49) --[[ Line: 68 ]]
    -- upvalues: l_UserProfileStore_0 (copy), v7 (copy)
    local v50 = tostring(v49.userId);
    local v51 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v50
    })(false).data[1];
    local v52 = v7.useSignalBinding(v51.names.getDisplayName);
    local v53 = v7.useSignalBinding(v51.names.getInExperienceCombinedName);
    return {
        displayName = v52, 
        inExperienceCombinedName = v53
    };
end;
trim = function(v55) --[[ Line: 77 ]] --[[ Name: trim ]]
    if v55:match("^()%s*$") then
        return "";
    else
        return (v55:match("^%s*(.*%S)"));
    end;
end;
getMessageText = function(v56, v57, v58) --[[ Line: 81 ]] --[[ Name: getMessageText ]]
    if v57 == nil or v57 == "" then
        return v58 or "";
    elseif v56 then
        return v57 or "";
    else
        return v58 or "";
    end;
end;
local function _(v59, v60) --[[ Line: 91 ]] --[[ Name: calculateTransparency ]]
    return v59 + v60 * (1 - v59);
end;
local function _(v62, v63) --[[ Line: 95 ]] --[[ Name: setTransparency ]]
    return v63:map(function(v64) --[[ Line: 96 ]]
        -- upvalues: v62 (copy)
        if v62 == nil then
            return 1;
        else
            local l_v62_0 = v62;
            return l_v62_0 + v64 * (1 - l_v62_0);
        end;
    end);
end;
local function _() --[[ Line: 101 ]] --[[ Name: useARButtonRightPadding ]]
    -- upvalues: l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v44 (copy), v19 (copy), v7 (copy), v17 (copy), v16 (copy), v42 (copy), v43 (copy)
    local v67 = 0;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        local v68 = nil;
        local v69 = nil;
        local v70 = true;
        if v44 then
            v69 = v19(false);
            v68 = v7.useSignalState(v69.getChatStatus);
            v70 = v17(v68);
        end;
        if not v16() and v70 then
            return v42;
        else
            v67 = v43;
        end;
    end;
    return v67;
end;
local function v83(v72, v73, v74, v75, v76) --[[ Line: 123 ]] --[[ Name: appendTrustedIndicator ]]
    local v77 = v76.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v76.Color.Shift.Shift_300.Transparency;
    local v79 = l_Transparency_0 + v74 * (1 - l_Transparency_0);
    l_Transparency_0 = v76.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v76.Color.Content.Emphasis.Transparency;
    local v81 = l_Transparency_1 + v74 * (1 - l_Transparency_1);
    l_Transparency_1 = v75 - 4;
    local v82 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v77, v79), 600, l_Transparency_1), l_Transparency_0, v81, v73)))));
    if string.find(v72, ":([%S:]-)$") then
        return string.gsub(v72, ":([%S:]-)$", ((" %* :%%1"):format(v82)));
    else
        return (("%* %*"):format(v72, v82));
    end;
end;
local v84 = if v45 then v11.TrustedConnections.TrustedConnectionsStore.get() else nil;
local function v178(v85) --[[ Line: 162 ]]
    -- upvalues: v25 (copy), l_FFlagExpChatPerfTracking_0 (copy), v8 (copy), v24 (copy), v45 (copy), v33 (copy), v15 (copy), v31 (copy), v13 (copy), v38 (copy), v41 (copy), v54 (copy), v46 (copy), v29 (copy), v12 (copy), l_Players_0 (copy), v84 (copy), v7 (copy), v27 (copy), v23 (copy), v28 (copy), l_TextChatService_0 (copy), v83 (copy), v26 (copy), v39 (copy), v5 (copy), l_useCursor_0 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v30 (copy), v44 (copy), v19 (copy), v17 (copy), v16 (copy), v42 (copy), v43 (copy), v34 (copy)
    if v25 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    if l_FFlagExpChatPerfTracking_0 then
        local v86 = v85.message.messageId or "UNKNOWN_MESSAGE_ID";
        local l_v86_0 = v86 --[[ copy: 1 -> 50 ]];
        v8.useEffect(function() --[[ Line: 168 ]]
            -- upvalues: v24 (ref), l_v86_0 (copy)
            v24.finish(v24.Events.MessageReceiveToWindowRenderInterval, {
                messageId = l_v86_0
            });
            v24.finish(v24.Events.MessageSendToWindowRenderInterval, {
                messageId = l_v86_0
            });
        end, {
            v86
        });
    end;
    local l_isSpatialUIEnabled_0 = v85.isSpatialUIEnabled;
    local v89 = if l_isSpatialUIEnabled_0 then v85.chatWindowSettings.SpatialPanelTextSize else v85.chatWindowSettings.TextSize;
    local v90 = if not not v45 or v33 then v15.useLocalization({
        trustedLabelText = v45 and "CoreScripts.TextChat.ChatWindow.TrustedLabel" or nil, 
        rewrittenLabelText = if v33 then v31 else nil, 
        defaultRewrittenLabelText = v33 and "CoreScripts.TextChat.ChatWindow.RewrittenLabel" or nil
    }) else nil;
    local v91 = nil;
    if v33 then
        v91 = if v90.rewrittenLabelText and v90.rewrittenLabelText ~= "" then v90.rewrittenLabelText else v90.defaultRewrittenLabelText;
    end;
    local v92 = if not not v45 or v33 then v13.Hooks.useTokens() else nil;
    local v93 = v38(v85.message, v85.chatWindowSettings);
    local l_showTranslationButton_0 = v85.showTranslationButton;
    local l_useTranslation_0 = v93.useTranslation;
    local v96 = getMessageText(l_useTranslation_0, v93.translation, v93.text);
    local v97 = v93.prefixText or "";
    local v98 = nil;
    if v41() and v85.message.userId then
        if v25 then
            debug.profilebegin("useCombinedName");
        end;
        v98 = v54(v85.message);
        if v25 then
            debug.profileend();
        end;
    end;
    local v99 = nil;
    if v45 then
        local v100 = v85.message.userId and tostring(v85.message.userId);
        local v101 = if v46 and v29() then v85.message.isHiddenMessage else nil;
        local l_v100_0 = v100 --[[ copy: 13 -> 48 ]];
        local l_v101_0 = v101 --[[ copy: 14 -> 49 ]];
        local v108 = v8.useMemo(function() --[[ Line: 226 ]]
            -- upvalues: v12 (ref), l_v100_0 (copy), v46 (ref), l_Players_0 (ref), l_v101_0 (copy), v84 (ref)
            return v12.createComputed(function(v104) --[[ Line: 227 ]]
                -- upvalues: l_v100_0 (ref), v46 (ref), l_Players_0 (ref), l_v101_0 (ref), v84 (ref)
                local v105 = l_v100_0 and l_v100_0 ~= "";
                if v46 then
                    local v106 = l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId and tostring(l_Players_0.LocalPlayer.UserId);
                    local v107 = v106 and v106 == l_v100_0;
                    v105 = v105 and not v107 and not l_v101_0;
                end;
                if v105 then
                    return (v84.getIsTrustedConnection(l_v100_0).data(v104));
                else
                    return nil;
                end;
            end);
        end, {
            v100, 
            v101
        });
        v99 = v7.useSignalBinding(v108);
    end;
    if v27() then
        v8.useEffect(function() --[[ Line: 250 ]]
            -- upvalues: v85 (copy), v23 (ref), v28 (ref), v29 (ref), l_TextChatService_0 (ref)
            if v85.message.textChatMessageInstance and v23(v28) and (not v29() or not v85.message.isHiddenMessage) then
                l_TextChatService_0:SendExpChatMessageClientRendered(v85.message.textChatMessageInstance, "chat_window");
            end;
        end, {});
    end;
    local l_bodyTextProperties_0 = v93.bodyTextProperties;
    local l_prefixTextProperties_0 = v93.prefixTextProperties;
    local v115 = v8.joinBindings(if v98 ~= nil then {
        v98.displayName, 
        v98.inExperienceCombinedName
    } else {}):map(function(v111) --[[ Line: 265 ]]
        -- upvalues: v97 (copy), v85 (copy)
        local v112 = v111[1] or "";
        local v113 = v111[2] or "";
        local l_v97_0 = v97;
        if string.len(v112) > 0 and string.len(v113) > 0 and v112 ~= v113 then
            l_v97_0 = string.gsub(l_v97_0, v112, v113);
        end;
        if string.len(v97) > 0 and v85.isUserVerified then
            l_v97_0 = appendVerifiedBadge(l_v97_0);
        end;
        return l_v97_0;
    end);
    if v45 then
        v115 = v8.joinBindings({
            v115, 
            v99, 
            v85.textTransparency
        }):map(function(v116) --[[ Line: 288 ]]
            -- upvalues: v97 (copy), v45 (ref), v83 (ref), v90 (copy), l_prefixTextProperties_0 (copy), v92 (copy)
            local v117 = v116[1] or "";
            local v118 = v116[2] or false;
            local v119 = v116[3];
            if v119 == nil then
                v119 = 1;
            end;
            if string.len(v97) == 0 then
                return v117;
            else
                if v45 and v118 then
                    v117 = v83(v117, v90.trustedLabelText, v119, l_prefixTextProperties_0.TextSize, v92);
                end;
                return v117;
            end;
        end);
    end;
    local v121 = v115:map(function(v120) --[[ Line: 310 ]]
        -- upvalues: v97 (copy)
        if string.len(v97) == 0 then
            return v120;
        else
            return trim(v120);
        end;
    end);
    local v124 = v115:map(function(v122) --[[ Line: 317 ]]
        -- upvalues: v97 (copy), v96 (copy), l_showTranslationButton_0 (copy), v26 (ref), v39 (ref), l_prefixTextProperties_0 (copy)
        if string.len(v97) == 0 then
            return v96;
        else
            local l_v96_0 = v96;
            if l_showTranslationButton_0 then
                l_v96_0 = if v26 then "     " .. l_v96_0 else "   " .. l_v96_0;
            end;
            return v39(v122, l_prefixTextProperties_0.FontFace, l_prefixTextProperties_0.TextSize) .. " " .. l_v96_0;
        end;
    end);
    if v33 then
        v124 = v8.joinBindings({
            v124
        }):map(function(v125) --[[ Line: 332 ]]
            -- upvalues: v85 (copy), v13 (ref), l_prefixTextProperties_0 (copy), v92 (copy), v91 (ref)
            local v126 = v125[1] or "";
            if not v85.wasRewritten then
                return v126;
            else
                local v127 = if v85.isRewriteMenuOpen then v13.Enums.IconName.ChevronLargeUp else v13.Enums.IconName.ChevronLargeDown;
                return (("%* <font size='%*' color='#%*'>%*<font transparency='1'><stroke transparency='1'>_</stroke></font>%*</font>"):format(v126, l_prefixTextProperties_0.TextSize - 4, v92.Color.Content.Muted.Color3:ToHex(), ("(%*)"):format(v91), (("<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>"):format(v127))));
            end;
        end);
    end;
    local v128 = if l_isSpatialUIEnabled_0 then v89 else l_bodyTextProperties_0.TextSize;
    local v129 = v128 - 2;
    local v130 = if v5 then l_useCursor_0() else nil;
    local v131 = nil;
    if l_FFlagExpChatAddPaddingAroundARButton_0 then
        if v30 then
            local v132 = 0;
            if l_FFlagExpChatAddPaddingAroundARButton_0 then
                local v133 = nil;
                local v134 = nil;
                local v135 = true;
                if v44 then
                    v134 = v19(false);
                    v133 = v7.useSignalState(v134.getChatStatus);
                    v135 = v17(v133);
                end;
                v132 = if not v16() and v135 then v42 else v43;
            end;
            v131 = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, v132)
            });
        else
            local v136 = nil;
            local v137 = nil;
            local v138 = true;
            if v44 then
                v137 = v19(false);
                v136 = v7.useSignalState(v137.getChatStatus);
                v138 = v17(v136);
            end;
            local v139 = not v16() and v138;
            v131 = v8.createElement("UIPadding", {
                PaddingRight = UDim.new(0, if v139 then v42 else v43)
            });
        end;
    end;
    local v140 = nil;
    if v33 and v85.wasRewritten then
        v140 = v85.chatWindowTransparencyBindingOrValue == nil or if typeof(v85.chatWindowTransparencyBindingOrValue) == "number" then v85.chatWindowTransparencyBindingOrValue < v34 else v85.chatWindowTransparencyBindingOrValue:map(function(v141) --[[ Line: 395 ]]
            -- upvalues: v34 (ref)
            return v141 < v34;
        end);
    end;
    local l_createElement_0 = v8.createElement;
    local v143 = "Frame";
    local v144 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v85.LayoutOrder
    };
    local v145 = {
        UIPadding = v131
    };
    local l_createElement_1 = v8.createElement;
    local v147 = "Frame";
    local v148 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v149 = {};
    local v150 = false;
    if string.len(v97) > 0 then
        v150 = v8.createElement;
        local v151 = "TextLabel";
        local v152 = {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            FontFace = l_prefixTextProperties_0.FontFace, 
            RichText = true, 
            Text = v115, 
            TextColor3 = l_prefixTextProperties_0.TextColor3, 
            TextSize = l_prefixTextProperties_0.TextSize, 
            TextStrokeColor3 = l_prefixTextProperties_0.TextStrokeColor3
        };
        local l_TextStrokeTransparency_0 = l_prefixTextProperties_0.TextStrokeTransparency;
        local l_l_TextStrokeTransparency_0_0 = l_TextStrokeTransparency_0 --[[ copy: 35 -> 46 ]];
        v152.TextStrokeTransparency = v85.textTransparency:map(function(v155) --[[ Line: 96 ]]
            -- upvalues: l_l_TextStrokeTransparency_0_0 (copy)
            if l_l_TextStrokeTransparency_0_0 == nil then
                return 1;
            else
                local l_l_l_TextStrokeTransparency_0_0_0 = l_l_TextStrokeTransparency_0_0;
                return l_l_l_TextStrokeTransparency_0_0_0 + v155 * (1 - l_l_l_TextStrokeTransparency_0_0_0);
            end;
        end);
        l_TextStrokeTransparency_0 = v85.textTransparency;
        local v157 = 0;
        local l_v157_0 = v157 --[[ copy: 39 -> 47 ]];
        v152.TextTransparency = l_TextStrokeTransparency_0:map(function(v159) --[[ Line: 96 ]]
            -- upvalues: l_v157_0 (copy)
            if l_v157_0 == nil then
                return 1;
            else
                local l_l_v157_0_0 = l_v157_0;
                return l_l_v157_0_0 + v159 * (1 - l_l_v157_0_0);
            end;
        end);
        v152.TextWrapped = true;
        v152.TextXAlignment = Enum.TextXAlignment.Left;
        v152.TextYAlignment = Enum.TextYAlignment.Top;
        local v161 = {};
        l_TextStrokeTransparency_0 = false;
        if l_prefixTextProperties_0.UIGradient ~= nil then
            l_TextStrokeTransparency_0 = v8.createElement("UIGradient", l_prefixTextProperties_0.UIGradient);
        end;
        v161.UIGradient = l_TextStrokeTransparency_0;
        v150 = v150(v151, v152, v161);
    end;
    v149.PrefixText = v150;
    v150 = v8.createElement;
    local v162 = v33 and v85.wasRewritten and "TextButton" or "TextLabel";
    local v163 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        FontFace = l_bodyTextProperties_0.FontFace, 
        RichText = true, 
        Size = UDim2.new(1, 0, 0, 0), 
        Text = v124, 
        TextColor3 = l_bodyTextProperties_0.TextColor3, 
        TextSize = v128, 
        TextStrokeColor3 = l_bodyTextProperties_0.TextStrokeColor3
    };
    local l_TextStrokeTransparency_1 = l_bodyTextProperties_0.TextStrokeTransparency;
    local l_l_TextStrokeTransparency_1_0 = l_TextStrokeTransparency_1 --[[ copy: 35 -> 44 ]];
    v163.TextStrokeTransparency = v85.textTransparency:map(function(v166) --[[ Line: 96 ]]
        -- upvalues: l_l_TextStrokeTransparency_1_0 (copy)
        if l_l_TextStrokeTransparency_1_0 == nil then
            return 1;
        else
            local l_l_l_TextStrokeTransparency_1_0_0 = l_l_TextStrokeTransparency_1_0;
            return l_l_l_TextStrokeTransparency_1_0_0 + v166 * (1 - l_l_l_TextStrokeTransparency_1_0_0);
        end;
    end);
    l_TextStrokeTransparency_1 = v85.textTransparency;
    local v168 = 0;
    local l_v168_0 = v168 --[[ copy: 39 -> 45 ]];
    v163.TextTransparency = l_TextStrokeTransparency_1:map(function(v170) --[[ Line: 96 ]]
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
    v163[v8.Event.Activated] = if v33 and v85.wasRewritten then v85.onTextBodyActivated else nil;
    v163.Interactable = v140;
    v149.BodyText = v150(v162, v163);
    if string.len(v97) ~= 0 then
        v150 = v8.createElement;
        v162 = "Frame";
        v163 = {
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.new(1, 0, 0, 0)
        };
        local v172 = {
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
                SelectionImageObject = v130, 
                Size = UDim2.new(0, 0, 0, 0), 
                Text = v121, 
                TextSize = l_prefixTextProperties_0.TextSize, 
                TextStrokeTransparency = 1, 
                TextTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = 1, 
                [v8.Event.Activated] = function() --[[ Line: 488 ]]
                    -- upvalues: v85 (copy)
                    v85.onTextMessageLabelButtonActivated(v85.message);
                end
            })
        };
        if l_showTranslationButton_0 then
            l_TextStrokeTransparency_1 = v8.createElement;
            local v173 = "ImageButton";
            local v174 = {
                BackgroundTransparency = 1, 
                HoverImage = "rbxasset://textures/translateIconDark.png", 
                Image = "rbxasset://textures/translateIcon.png"
            };
            v168 = v85.textTransparency;
            local v175 = 0;
            v174.ImageTransparency = v168:map(function(v176) --[[ Line: 96 ]]
                -- upvalues: v175 (copy)
                if v175 == nil then
                    return 1;
                else
                    local l_v175_0 = v175;
                    return l_v175_0 + v176 * (1 - l_v175_0);
                end;
            end);
            v174.LayoutOrder = 2;
            v174.PressedImage = "rbxasset://textures/translateIconDark.png";
            v174.SelectionImageObject = v130;
            v174.Size = UDim2.new(0, v129, 0, v129);
            v174[v8.Event.Activated] = function() --[[ Line: 503 ]]
                -- upvalues: v85 (copy)
                v85.onToggle(not v85.message.useTranslation, v85.message.messageId);
            end;
            l_TextStrokeTransparency_1 = l_TextStrokeTransparency_1(v173, v174);
        else
            l_TextStrokeTransparency_1 = nil;
        end;
        v172.TranslationButton = l_TextStrokeTransparency_1;
        v150 = v150(v162, v163, v172);
    else
        v150 = nil;
    end;
    v149.TextMessageButton = v150;
    v145.TextMessage = l_createElement_1(v147, v148, v149);
    l_createElement_0 = l_createElement_0(v143, v144, v145);
    if v25 then
        debug.profileend();
    end;
    return l_createElement_0;
end;
local function v183(_) --[[ Line: 518 ]] --[[ Name: TranslatedTextMessageWithToggle ]]
    -- upvalues: v9 (copy), l_FFlagExpChatUseMessagesStore_0 (copy), v18 (copy), v178 (copy)
    return v9.connect(function() --[[ Line: 519 ]]

    end, function(v180) --[[ Line: 519 ]]
        -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v18 (ref)
        return {
            onToggle = function(v181, v182) --[[ Line: 521 ]] --[[ Name: onToggle ]]
                -- upvalues: l_FFlagExpChatUseMessagesStore_0 (ref), v18 (ref), v180 (copy)
                if l_FFlagExpChatUseMessagesStore_0 then
                    v18(false).toggleMessageTranslation(v181, v182);
                    return;
                else
                    v180({
                        type = "ChatTranslationMessageToggled", 
                        useTranslation = v181, 
                        messageId = v182
                    });
                    return;
                end;
            end
        };
    end)(v178);
end;
local function v204(v184) --[[ Line: 537 ]] --[[ Name: RewriteLabelWithButton ]]
    -- upvalues: v13 (copy), v15 (copy), v31 (copy), v8 (copy)
    local v185 = v13.Hooks.useTokens();
    local v186 = v15.useLocalization({
        rewrittenLabelText = v31, 
        defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel"
    });
    local v187 = if v186.rewrittenLabelText and v186.rewrittenLabelText ~= "" then v186.rewrittenLabelText else v186.defaultRewrittenLabelText;
    local l_createElement_2 = v8.createElement;
    local l_View_0 = v13.View;
    local v190 = {
        tag = "size-full-0 auto-y row align-y-center gap-xsmall", 
        LayoutOrder = v184.LayoutOrder
    };
    local v191 = {};
    local l_createElement_3 = v8.createElement;
    local l_Text_0 = v13.Text;
    local v194 = {
        Text = "(" .. v187 .. ")", 
        tag = "size-0-0 auto-xy text-caption-small text-align-x-left", 
        LayoutOrder = 1, 
        RichText = true
    };
    local v195 = {
        Color3 = v185.Color.Content.Muted.Color3
    };
    local l_Transparency_2 = v185.Color.Content.Muted.Transparency;
    local l_l_Transparency_2_0 = l_Transparency_2 --[[ copy: 13 -> 18 ]];
    v195.Transparency = v184.textTransparency:map(function(v198) --[[ Line: 96 ]]
        -- upvalues: l_l_Transparency_2_0 (copy)
        if l_l_Transparency_2_0 == nil then
            return 1;
        else
            local l_l_l_Transparency_2_0_0 = l_l_Transparency_2_0;
            return l_l_l_Transparency_2_0_0 + v198 * (1 - l_l_l_Transparency_2_0_0);
        end;
    end);
    v194.textStyle = v195;
    v195 = {
        Color = Color3.fromRGB(0, 0, 0)
    };
    l_Transparency_2 = v184.textTransparency;
    local v200 = 0.5;
    v195.Transparency = l_Transparency_2:map(function(v201) --[[ Line: 96 ]]
        -- upvalues: v200 (copy)
        if v200 == nil then
            return 1;
        else
            local l_v200_0 = v200;
            return l_v200_0 + v201 * (1 - l_v200_0);
        end;
    end);
    v195.Thickness = v185.Stroke.Thin;
    v194.stroke = v195;
    v191.Label = l_createElement_3(l_Text_0, v194);
    v191.IconButton = v8.createElement(v13.IconButton, {
        size = v13.Enums.InputSize.XSmall, 
        icon = if v184.isRewriteMenuOpen then v13.Enums.IconName.ChevronLargeUp else v13.Enums.IconName.ChevronLargeDown, 
        variant = v13.Enums.ButtonVariant.Utility, 
        isCircular = true, 
        LayoutOrder = 2, 
        Visible = v184.textTransparency:map(function(v203) --[[ Line: 575 ]]
            return v203 < 1;
        end), 
        onActivated = v184.onActivated
    });
    return l_createElement_2(l_View_0, v190, v191);
end;
return v8.memo(function(v205) --[[ Line: 583 ]] --[[ Name: TranslatedTextMessageWrapper ]]
    -- upvalues: v38 (copy), v30 (copy), l_FFlagExpChatAddPaddingAroundARButton_0 (copy), v44 (copy), v19 (copy), v7 (copy), v17 (copy), v16 (copy), v42 (copy), v43 (copy), v15 (copy), v32 (copy), v13 (copy), v8 (copy), v33 (copy), l_Dictionary_0 (copy), v183 (copy), v178 (copy), v204 (copy)
    local v206 = v38(v205.message, v205.chatWindowSettings);
    local l_showTranslationButton_1 = v205.showTranslationButton;
    local v208 = nil;
    local v209 = nil;
    local v210 = nil;
    local v211 = nil;
    local v212 = nil;
    local v213 = nil;
    local v214 = false;
    local v215 = false;
    local v216 = 0;
    local v217 = "";
    if v30 then
        local v218 = 0;
        if l_FFlagExpChatAddPaddingAroundARButton_0 then
            local v219 = nil;
            local v220 = nil;
            local v221 = true;
            if v44 then
                v220 = v19(false);
                v219 = v7.useSignalState(v220.getChatStatus);
                v221 = v17(v219);
            end;
            v218 = if not v16() and v221 then v42 else v43;
        end;
        v216 = math.max(v218 - v43, 0);
        v209 = v15.useLocalization({
            rewrittenReasonLabelText = v32, 
            defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel"
        });
        v217 = if v209.rewrittenReasonLabelText and v209.rewrittenReasonLabelText ~= "" then v209.rewrittenReasonLabelText else v209.defaultRewrittenReasonLabelText;
        v208 = v13.Hooks.useTokens();
        local v222;
        v218, v222 = v8.useState(false);
        v210 = v218;
        v211 = v222;
        v212 = v8.useCallback(function() --[[ Line: 609 ]]
            -- upvalues: v211 (ref)
            v211(function(v223) --[[ Line: 610 ]]
                return not v223;
            end);
        end, {});
        v215 = v206.wasRewritten;
        v213 = v206.originalText;
        v214 = v215 and v213 ~= nil and v213 ~= "";
    end;
    local v224 = nil;
    local l_v205_0 = v205;
    if v33 and v215 then
        l_v205_0 = l_Dictionary_0.join(l_v205_0, {
            isRewriteMenuOpen = v210, 
            wasRewritten = v215, 
            onTextBodyActivated = v212, 
            LayoutOrder = 1
        });
    elseif v30 and v215 then
        l_v205_0 = l_Dictionary_0.join(l_v205_0, {
            LayoutOrder = 1
        });
    end;
    v224 = if l_showTranslationButton_1 then v8.createElement(v183, l_v205_0) else v8.createElement(v178, l_v205_0);
    local v226;
    if v30 and v215 then
        v226 = v8.createElement;
        local l_View_1 = v13.View;
        local v228 = {
            tag = ("size-full-0 auto-y align-y-top col%*"):format(v33 and " gap-xsmall" or ""), 
            LayoutOrder = v205.LayoutOrder
        };
        local v229 = {
            UIPadding = if v210 then v8.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 4)
            }) else nil, 
            TranslatedTextMessage = v224, 
            RewriteLabelWithButton = if not v215 or v33 then nil else v8.createElement(v204, {
                onActivated = v212, 
                isRewriteMenuOpen = v210, 
                transparencyValue = v205.transparencyValue, 
                textTransparency = v205.textTransparency, 
                LayoutOrder = 2
            })
        };
        local v230;
        if v210 then
            v230 = v8.createElement;
            local l_View_2 = v13.View;
            local v232 = {
                tag = "align-x-left col radius-medium gap-xxsmall padding-small", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v43, 0, 0), 
                LayoutOrder = 3
            };
            local v233 = {
                Color3 = v208.Color.Common.Scrim.Color3
            };
            local l_transparencyValue_0 = v205.transparencyValue;
            local v235 = 0.7;
            local l_v235_0 = v235 --[[ copy: 28 -> 33 ]];
            v233.Transparency = l_transparencyValue_0:map(function(v237) --[[ Line: 96 ]]
                -- upvalues: l_v235_0 (copy)
                if l_v235_0 == nil then
                    return 1;
                else
                    local l_l_v235_0_0 = l_v235_0;
                    return l_l_v235_0_0 + v237 * (1 - l_l_v235_0_0);
                end;
            end);
            v232.backgroundStyle = v233;
            v233 = {};
            local v239;
            if v214 then
                v239 = v8.createElement;
                l_transparencyValue_0 = v13.Text;
                local v240 = {
                    Text = v213, 
                    tag = "text-body-small text-align-x-left", 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, -v216, 0, 0), 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextWrapped = true
                };
                local v241 = {
                    Color3 = v208.Color.Content.Muted.Color3
                };
                v235 = v208.Color.Content.Muted.Transparency;
                local l_v235_1 = v235 --[[ copy: 28 -> 35 ]];
                v241.Transparency = v205.textTransparency:map(function(v243) --[[ Line: 96 ]]
                    -- upvalues: l_v235_1 (copy)
                    if l_v235_1 == nil then
                        return 1;
                    else
                        local l_l_v235_1_0 = l_v235_1;
                        return l_l_v235_1_0 + v243 * (1 - l_l_v235_1_0);
                    end;
                end);
                v240.textStyle = v241;
                v241 = {
                    Color = Color3.fromRGB(0, 0, 0)
                };
                v235 = v205.textTransparency;
                local v245 = 0.5;
                local l_v245_0 = v245 --[[ copy: 32 -> 36 ]];
                v241.Transparency = v235:map(function(v247) --[[ Line: 96 ]]
                    -- upvalues: l_v245_0 (copy)
                    if l_v245_0 == nil then
                        return 1;
                    else
                        local l_l_v245_0_0 = l_v245_0;
                        return l_l_v245_0_0 + v247 * (1 - l_l_v245_0_0);
                    end;
                end);
                v241.Thickness = v208.Stroke.Thin;
                v240.stroke = v241;
                v239 = v239(l_transparencyValue_0, v240);
            else
                v239 = nil;
            end;
            v233.OriginalText = v239;
            v233.Divider = if v214 then v8.createElement(v13.Divider, {
                orientation = v13.Enums.Orientation.Horizontal, 
                LayoutOrder = 2, 
                Visible = v205.textTransparency:map(function(v249) --[[ Line: 700 ]]
                    return v249 < 1;
                end), 
                DividerVariant = v13.Enums.DividerVariant.Default
            }) else nil;
            v239 = v8.createElement;
            l_transparencyValue_0 = v13.Text;
            local v250 = {
                Text = v217, 
                tag = "text-body-small text-align-x-left", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, -v216, 0, 0), 
                LayoutOrder = 3, 
                RichText = true, 
                TextWrapped = true
            };
            local v251 = {
                Color3 = v208.Color.Content.Default.Color3
            };
            v235 = v208.Color.Content.Default.Transparency;
            local l_v235_2 = v235 --[[ copy: 28 -> 34 ]];
            v251.Transparency = v205.textTransparency:map(function(v253) --[[ Line: 96 ]]
                -- upvalues: l_v235_2 (copy)
                if l_v235_2 == nil then
                    return 1;
                else
                    local l_l_v235_2_0 = l_v235_2;
                    return l_l_v235_2_0 + v253 * (1 - l_l_v235_2_0);
                end;
            end);
            v250.textStyle = v251;
            v251 = {
                Color = Color3.fromRGB(0, 0, 0)
            };
            v235 = v205.textTransparency;
            local v255 = 0.5;
            v251.Transparency = v235:map(function(v256) --[[ Line: 96 ]]
                -- upvalues: v255 (copy)
                if v255 == nil then
                    return 1;
                else
                    local l_v255_0 = v255;
                    return l_v255_0 + v256 * (1 - l_v255_0);
                end;
            end);
            v251.Thickness = v208.Stroke.Thin;
            v250.stroke = v251;
            v233.ReasoningText = v239(l_transparencyValue_0, v250);
            v230 = v230(l_View_2, v232, v233);
        else
            v230 = nil;
        end;
        v229.DropdownMenu = v230;
        v226 = v226(l_View_1, v228, v229);
    else
        v226 = v224;
    end;
    return v226;
end, function(v258, v259) --[[ Line: 740 ]] --[[ Name: areEqual ]]
    -- upvalues: v30 (copy), v33 (copy)
    local v260 = false;
    if v258.message.text == v259.message.text then
        v260 = false;
        if v258.message.prefixText == v259.message.prefixText then
            v260 = false;
            if v258.message.translation == v259.message.translation then
                v260 = false;
                if v258.message.useTranslation == v259.message.useTranslation then
                    v260 = false;
                    if v258.message.messageId == v259.message.messageId then
                        v260 = false;
                        if v258.chatWindowSettings == v259.chatWindowSettings then
                            v260 = not v30 or v258.message.wasRewritten == v259.message.wasRewritten and v258.message.originalText == v259.message.originalText;
                            if v260 then
                                if v33 then
                                    return v258.chatWindowTransparencyBindingOrValue == v259.chatWindowTransparencyBindingOrValue;
                                else
                                    v260 = true;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v260;
end);
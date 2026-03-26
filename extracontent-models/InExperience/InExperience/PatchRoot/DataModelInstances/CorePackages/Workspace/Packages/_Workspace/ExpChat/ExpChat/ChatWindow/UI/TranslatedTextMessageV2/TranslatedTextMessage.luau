local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local v4 = require(l_Parent_0.SignalsReact);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local v7 = require(l_script_FirstAncestor_0.Localization);
local v8 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v9 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v11 = require(l_Flags_0.FFlagExpChatEnableFocusNavigation);
local v12 = require(l_Flags_0.FFlagDebugMessageProfiling);
local v13 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v14 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v15 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v16 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v17 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v18 = game:DefineFastFlag("ExpChatMessageV2PerfTracking2", false);
local v19 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_useCursor_0 = v6.App.SelectionCursor.useCursor;
local v21 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v23 = require(l_Helpers_0.duplicateInvisibleText);
local function _(v24) --[[ Line: 35 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v21 (copy)
    return string.gsub(v24, ":(%S-)$", v21.VERIFIED_EMOJI .. ":%1");
end;
local function v32(v26) --[[ Line: 39 ]] --[[ Name: useCombinedName ]]
    -- upvalues: l_UserProfileStore_0 (copy), v4 (copy)
    local v27 = false;
    if v26 ~= nil then
        v27 = v26 ~= 0;
    end;
    local v28 = if v27 then tostring(v26) else tostring(0);
    local v29 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v28
    })(false).data[1];
    local v30 = v4.useSignalBinding(v29.names.getDisplayName);
    local v31 = v4.useSignalBinding(v29.names.getInExperienceCombinedName);
    if not v27 then
        return nil;
    else
        return {
            displayName = v30, 
            inExperienceCombinedName = v31
        };
    end;
end;
local function _(v33) --[[ Line: 52 ]] --[[ Name: trim ]]
    if v33:match("^()%s*$") then
        return "";
    else
        return (v33:match("^%s*(.*%S)"));
    end;
end;
local function _(v35, v36) --[[ Line: 56 ]] --[[ Name: calculateTransparency ]]
    return v35 + v36 * (1 - v35);
end;
local function v43(v38, v39) --[[ Line: 60 ]] --[[ Name: mergeTransparency ]]
    -- upvalues: v5 (copy)
    return v5.joinBindings(if typeof(v38) == "number" then {
        v39
    } else {
        v39, 
        v38
    }):map(function(v40) --[[ Line: 67 ]]
        -- upvalues: v38 (copy)
        local v41 = v40[1];
        local v42 = v40[2] or v38;
        if v42 == nil then
            return 1;
        else
            return v42 + v41 * (1 - v42);
        end;
    end);
end;
local function _(v44, v45) --[[ Line: 75 ]] --[[ Name: getPropertyFromObjBinding ]]
    return v44:map(function(v46) --[[ Line: 79 ]]
        -- upvalues: v45 (copy)
        if v46 then
            return v46[v45];
        else
            return nil;
        end;
    end);
end;
local function v59(v48, v49, v50, v51, v52) --[[ Line: 84 ]] --[[ Name: appendTrustedIndicator ]]
    local v53 = v52.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v52.Color.Shift.Shift_300.Transparency;
    local v55 = l_Transparency_0 + v50 * (1 - l_Transparency_0);
    l_Transparency_0 = v52.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v52.Color.Content.Emphasis.Transparency;
    local v57 = l_Transparency_1 + v50 * (1 - l_Transparency_1);
    l_Transparency_1 = v51 - 4;
    local v58 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v53, v55), 600, l_Transparency_1), l_Transparency_0, v57, v49)))));
    if string.find(v48, ":([%S:]-)$") then
        return string.gsub(v48, ":([%S:]-)$", ((" %* :%%1"):format(v58)));
    else
        return (("%* %*"):format(v48, v58));
    end;
end;
return v5.memo(function(v60) --[[ Line: 137 ]] --[[ Name: TranslatedTextMessage ]]
    -- upvalues: v12 (copy), v16 (copy), v4 (copy), v13 (copy), v7 (copy), v2 (copy), v32 (copy), v18 (copy), v5 (copy), v19 (copy), v17 (copy), v21 (copy), v59 (copy), v23 (copy), v8 (copy), v9 (copy), v14 (copy), v15 (copy), v11 (copy), l_useCursor_0 (copy), v43 (copy)
    if v12 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    local v61 = v16(false);
    local v62 = v4.useSignalBinding(v61.getChatStatus);
    local l_current_0 = v60.message.current;
    local l_isSpatialUIEnabled_0 = v60.isSpatialUIEnabled;
    local v65 = if l_isSpatialUIEnabled_0 then v60.chatWindowSettings.SpatialPanelTextSize else v60.chatWindowSettings.TextSize;
    local v66 = if v13 then v7.useLocalization({
        trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel"
    }) else nil;
    local v67 = if v13 then v2.Hooks.useTokens() else nil;
    if v12 then
        debug.profilebegin("useCombinedName");
    end;
    local v68 = v32(l_current_0.userId);
    if v12 then
        debug.profileend();
    end;
    local v70 = if v18 then v5.useCallback(function() --[[ Line: 167 ]]
        -- upvalues: v60 (copy), v19 (ref)
        local v69 = v60.message.current.messageId or "UNKNOWN_MESSAGE_ID";
        v19.finish(v19.Events.MessageReceiveToWindowRenderInterval, {
            messageId = v69
        });
        v19.finish(v19.Events.MessageSendToWindowRenderInterval, {
            messageId = v69
        });
    end, {
        v60.message
    }) else nil;
    local v72 = if v18 then v5.useCallback(function(v71) --[[ Line: 178 ]]
        -- upvalues: v70 (copy)
        if v71 and v71.Text and v71.Text ~= "" then
            v70();
        end;
    end, {
        v70
    }) else nil;
    local v73 = v5.useCallback(function() --[[ Line: 185 ]]
        -- upvalues: v60 (copy)
        v60.onTextMessageLabelButtonActivated(v60.message.current);
    end, {
        v60.onTextMessageLabelButtonActivated
    });
    local v75 = v5.useCallback(function() --[[ Line: 189 ]]
        -- upvalues: v60 (copy), v17 (ref)
        local l_current_1 = v60.message.current;
        v17(false).toggleMessageTranslation(not l_current_1.useTranslation, l_current_1.messageId);
    end, {});
    local v82 = v5.joinBindings(if v68 ~= nil then {
        v60.originalPrefixText, 
        v60.isUserVerified, 
        v68.displayName, 
        v68.inExperienceCombinedName
    } else {
        v60.originalPrefixText, 
        v60.isUserVerified
    }):map(function(v76) --[[ Line: 202 ]]
        -- upvalues: v21 (ref)
        local v77 = v76[1];
        local v78 = v76[2];
        local v79 = v76[3] or "";
        local v80 = v76[4] or "";
        local l_v77_0 = v77;
        if string.len(v79) > 0 and string.len(v80) > 0 and v79 ~= v80 then
            l_v77_0 = string.gsub(l_v77_0, v79, v80);
        end;
        if string.len(v77) > 0 and v78 then
            l_v77_0 = string.gsub(l_v77_0, ":(%S-)$", v21.VERIFIED_EMOJI .. ":%1");
        end;
        return l_v77_0;
    end);
    if v13 then
        v82 = v5.joinBindings({
            v82, 
            v60.isTrustedConnection, 
            v60.textTransparency, 
            v60.originalPrefixText, 
            v60.prefixTextProperties
        }):map(function(v83) --[[ Line: 232 ]]
            -- upvalues: v13 (ref), v59 (ref), v66 (copy), v67 (copy)
            local v84 = v83[1] or "";
            local v85 = v83[2] or false;
            local v86 = v83[3];
            local v87 = v83[4] or "";
            local v88 = v83[5];
            if v86 == nil then
                v86 = 1;
            end;
            if string.len(v87) == 0 then
                return v84;
            else
                if v13 and v85 then
                    v84 = v59(v84, v66.trustedLabelText, v86, v88.TextSize, v67);
                end;
                return v84;
            end;
        end);
    end;
    local v91 = v5.joinBindings({
        v82, 
        v60.originalPrefixText
    }):map(function(v89) --[[ Line: 258 ]]
        local v90 = v89[1];
        if string.len(v89[2]) == 0 then
            return v90;
        elseif v90:match("^()%s*$") then
            return "";
        else
            return (v90:match("^%s*(.*%S)"));
        end;
    end);
    local v99 = v5.joinBindings({
        v82, 
        v60.originalPrefixText, 
        v60.shouldShowTranslationToggle, 
        v60.originalBodyText, 
        v60.prefixTextProperties
    }):map(function(v92) --[[ Line: 274 ]]
        -- upvalues: v23 (ref)
        local v93 = v92[1];
        local v94 = v92[2];
        local v95 = v92[3];
        local v96 = v92[4];
        local v97 = v92[5];
        if string.len(v94) == 0 then
            return v96;
        else
            local l_v96_0 = v96;
            if v95 then
                l_v96_0 = "     " .. l_v96_0;
            end;
            return v23(v93, v97.FontFace, v97.TextSize) .. " " .. l_v96_0;
        end;
    end);
    local v101 = v60.bodyTextProperties:map(function(v100) --[[ Line: 297 ]]
        -- upvalues: l_isSpatialUIEnabled_0 (copy), v65 (copy)
        if l_isSpatialUIEnabled_0 then
            return v65;
        else
            return v100.TextSize;
        end;
    end);
    local v103 = v101:map(function(v102) --[[ Line: 300 ]]
        return UDim2.new(0, v102 - 2, 0, v102 - 2);
    end);
    local v105 = v60.originalPrefixText:map(function(v104) --[[ Line: 303 ]]
        return string.len(v104) > 0;
    end);
    local l_prefixTextProperties_0 = v60.prefixTextProperties;
    local v107 = "UIGradient";
    local l_v107_0 = v107 --[[ copy: 24 -> 43 ]];
    local v110 = l_prefixTextProperties_0:map(function(v109) --[[ Line: 79 ]]
        -- upvalues: l_v107_0 (copy)
        if v109 then
            return v109[l_v107_0];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_0 = v62:map(function(v111) --[[ Line: 307 ]]
        -- upvalues: v8 (ref), v9 (ref), v14 (ref), v15 (ref)
        local v112 = not v8() and v9(v111);
        return UDim.new(0, if v112 then v14 else v15);
    end);
    local v113 = if v11 then l_useCursor_0() else nil;
    local l_createElement_0 = v5.createElement;
    local v115 = "Frame";
    v107 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v60.layoutOrder, 
        Visible = v60.visible
    };
    local v116 = {
        UIPadding = v5.createElement("UIPadding", {
            PaddingRight = l_prefixTextProperties_0
        })
    };
    local l_createElement_1 = v5.createElement;
    local v118 = "Frame";
    local v119 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v120 = {};
    local l_createElement_2 = v5.createElement;
    local v122 = "TextLabel";
    local v123 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    local l_prefixTextProperties_1 = v60.prefixTextProperties;
    local v125 = "FontFace";
    local l_v125_0 = v125 --[[ copy: 38 -> 44 ]];
    v123.FontFace = l_prefixTextProperties_1:map(function(v127) --[[ Line: 79 ]]
        -- upvalues: l_v125_0 (copy)
        if v127 then
            return v127[l_v125_0];
        else
            return nil;
        end;
    end);
    v123.RichText = true;
    v123.Text = v82;
    l_prefixTextProperties_1 = v60.prefixTextProperties;
    v125 = "TextColor3";
    local l_v125_1 = v125 --[[ copy: 38 -> 45 ]];
    v123.TextColor3 = l_prefixTextProperties_1:map(function(v129) --[[ Line: 79 ]]
        -- upvalues: l_v125_1 (copy)
        if v129 then
            return v129[l_v125_1];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v60.prefixTextProperties;
    v125 = "TextSize";
    local l_v125_2 = v125 --[[ copy: 38 -> 46 ]];
    v123.TextSize = l_prefixTextProperties_1:map(function(v131) --[[ Line: 79 ]]
        -- upvalues: l_v125_2 (copy)
        if v131 then
            return v131[l_v125_2];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v60.prefixTextProperties;
    v125 = "TextStrokeColor3";
    local l_v125_3 = v125 --[[ copy: 38 -> 47 ]];
    v123.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v133) --[[ Line: 79 ]]
        -- upvalues: l_v125_3 (copy)
        if v133 then
            return v133[l_v125_3];
        else
            return nil;
        end;
    end);
    local l_v43_0 = v43;
    local l_prefixTextProperties_2 = v60.prefixTextProperties;
    local v136 = "TextStrokeTransparency";
    local l_v136_0 = v136 --[[ copy: 39 -> 48 ]];
    v123.TextStrokeTransparency = l_v43_0(l_prefixTextProperties_2:map(function(v138) --[[ Line: 79 ]]
        -- upvalues: l_v136_0 (copy)
        if v138 then
            return v138[l_v136_0];
        else
            return nil;
        end;
    end), v60.textTransparency);
    v123.TextTransparency = v43(0, v60.textTransparency);
    v123.TextWrapped = true;
    v123.TextXAlignment = Enum.TextXAlignment.Left;
    v123.TextYAlignment = Enum.TextYAlignment.Top;
    v123.Visible = v105;
    l_v43_0 = {};
    l_prefixTextProperties_1 = v5.createElement;
    l_prefixTextProperties_2 = "UIGradient";
    local v139 = {};
    local v140 = "Enabled";
    local l_v140_0 = v140 --[[ copy: 40 -> 49 ]];
    v139.Enabled = v110:map(function(v142) --[[ Line: 79 ]]
        -- upvalues: l_v140_0 (copy)
        if v142 then
            return v142[l_v140_0];
        else
            return nil;
        end;
    end);
    v140 = "Color";
    local l_v140_1 = v140 --[[ copy: 40 -> 50 ]];
    v139.Color = v110:map(function(v144) --[[ Line: 79 ]]
        -- upvalues: l_v140_1 (copy)
        if v144 then
            return v144[l_v140_1];
        else
            return nil;
        end;
    end);
    v140 = "Offset";
    local l_v140_2 = v140 --[[ copy: 40 -> 51 ]];
    v139.Offset = v110:map(function(v146) --[[ Line: 79 ]]
        -- upvalues: l_v140_2 (copy)
        if v146 then
            return v146[l_v140_2];
        else
            return nil;
        end;
    end);
    v140 = "Rotation";
    local l_v140_3 = v140 --[[ copy: 40 -> 52 ]];
    v139.Rotation = v110:map(function(v148) --[[ Line: 79 ]]
        -- upvalues: l_v140_3 (copy)
        if v148 then
            return v148[l_v140_3];
        else
            return nil;
        end;
    end);
    v140 = "Transparency";
    v139.Transparency = v110:map(function(v149) --[[ Line: 79 ]]
        -- upvalues: v140 (copy)
        if v149 then
            return v149[v140];
        else
            return nil;
        end;
    end);
    l_v43_0.UIGradient = l_prefixTextProperties_1(l_prefixTextProperties_2, v139);
    v120.PrefixText = l_createElement_2(v122, v123, l_v43_0);
    l_createElement_2 = v5.createElement;
    v122 = "TextLabel";
    v123 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    l_prefixTextProperties_1 = v60.bodyTextProperties;
    v125 = "FontFace";
    local l_v125_4 = v125 --[[ copy: 38 -> 53 ]];
    v123.FontFace = l_prefixTextProperties_1:map(function(v151) --[[ Line: 79 ]]
        -- upvalues: l_v125_4 (copy)
        if v151 then
            return v151[l_v125_4];
        else
            return nil;
        end;
    end);
    v123.RichText = true;
    v123.Size = UDim2.new(1, 0, 0, 0);
    v123.Text = v99;
    l_prefixTextProperties_1 = v60.bodyTextProperties;
    v125 = "TextColor3";
    local l_v125_5 = v125 --[[ copy: 38 -> 54 ]];
    v123.TextColor3 = l_prefixTextProperties_1:map(function(v153) --[[ Line: 79 ]]
        -- upvalues: l_v125_5 (copy)
        if v153 then
            return v153[l_v125_5];
        else
            return nil;
        end;
    end);
    v123.TextSize = v101;
    l_prefixTextProperties_1 = v60.bodyTextProperties;
    v125 = "TextStrokeColor3";
    local l_v125_6 = v125 --[[ copy: 38 -> 55 ]];
    v123.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v155) --[[ Line: 79 ]]
        -- upvalues: l_v125_6 (copy)
        if v155 then
            return v155[l_v125_6];
        else
            return nil;
        end;
    end);
    l_v43_0 = v43;
    l_prefixTextProperties_2 = v60.bodyTextProperties;
    v136 = "TextStrokeTransparency";
    v123.TextStrokeTransparency = l_v43_0(l_prefixTextProperties_2:map(function(v156) --[[ Line: 79 ]]
        -- upvalues: v136 (copy)
        if v156 then
            return v156[v136];
        else
            return nil;
        end;
    end), v60.textTransparency);
    v123.TextTransparency = v43(0, v60.textTransparency);
    v123.TextWrapped = true;
    v123.TextXAlignment = Enum.TextXAlignment.Left;
    v123.TextYAlignment = Enum.TextYAlignment.Top;
    v123[v5.Change.Text] = if v18 then v72 else nil;
    v120.BodyText = l_createElement_2(v122, v123);
    l_createElement_2 = v5.createElement;
    v122 = "Frame";
    v123 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Visible = v105
    };
    l_v43_0 = {
        Layout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    l_prefixTextProperties_1 = v5.createElement;
    l_prefixTextProperties_2 = "TextButton";
    v139 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    v125 = v60.prefixTextProperties;
    local v157 = "FontFace";
    local l_v157_0 = v157 --[[ copy: 42 -> 56 ]];
    v139.FontFace = v125:map(function(v159) --[[ Line: 79 ]]
        -- upvalues: l_v157_0 (copy)
        if v159 then
            return v159[l_v157_0];
        else
            return nil;
        end;
    end);
    v139.RichText = true;
    v139.SelectionImageObject = v113;
    v139.Size = UDim2.new(0, 0, 0, 0);
    v139.Text = v91;
    v125 = v60.prefixTextProperties;
    v157 = "TextSize";
    v139.TextSize = v125:map(function(v160) --[[ Line: 79 ]]
        -- upvalues: v157 (copy)
        if v160 then
            return v160[v157];
        else
            return nil;
        end;
    end);
    v139.TextStrokeTransparency = 1;
    v139.TextTransparency = 1;
    v139.TextWrapped = true;
    v139.TextXAlignment = Enum.TextXAlignment.Left;
    v139.TextYAlignment = Enum.TextYAlignment.Top;
    v139.LayoutOrder = 1;
    v139[v5.Event.Activated] = v73;
    l_v43_0.TextButton = l_prefixTextProperties_1(l_prefixTextProperties_2, v139);
    l_v43_0.TranslationButton = v5.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        HoverImage = "rbxasset://textures/translateIconDark.png", 
        Image = "rbxasset://textures/translateIcon.png", 
        ImageTransparency = v43(0, v60.textTransparency), 
        LayoutOrder = 2, 
        PressedImage = "rbxasset://textures/translateIconDark.png", 
        SelectionImageObject = v113, 
        Size = v103, 
        Visible = v60.shouldShowTranslationToggle, 
        [v5.Event.Activated] = v75
    });
    v120.TextMessageButton = l_createElement_2(v122, v123, l_v43_0);
    v116.TextMessage = l_createElement_1(v118, v119, v120);
    l_createElement_0 = l_createElement_0(v115, v107, v116);
    if v12 then
        debug.profileend();
    end;
    return l_createElement_0;
end);
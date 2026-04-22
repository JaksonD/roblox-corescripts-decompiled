local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_script_FirstAncestor_0.Localization);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v7 = require(l_Flags_0.FFlagExpChatEnableFocusNavigation);
local v8 = require(l_Flags_0.FFlagDebugMessageProfiling);
local v9 = require(l_Flags_0.FFlagEnableInExpChatRewrite);
local v10 = require(l_Flags_0.FFlagExpChatRewriteInline);
local v11 = require(l_Flags_0.FStringInExpChatRewriteLabelKey);
local v12 = require(l_Flags_0.FIntExpChatWindowTransparencyRewriteInteractableThreshold);
local v13 = require(l_Flags_0.FFlagEnableInExpChatSummaryOnLuaForTranslatedMessageV2);
local v14 = require(l_Flags_0.FStringExpChatSummaryPrefixText);
local v15 = require(l_script_FirstAncestor_0.TextChatMessageChatActionType);
local v16 = require(script.Parent.RewriteToggle);
local v17 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v18 = require(l_script_FirstAncestor_0.Stores.GetRewriteDropdownStore);
local v19 = game:DefineFastFlag("ExpChatMessageV2PerfTracking2", false);
local v20 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_useCursor_0 = v4.App.SelectionCursor.useCursor;
local v22 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v24 = require(l_Helpers_0.duplicateInvisibleText);
local v25 = require(l_Helpers_0.mergeBindableScalar);
local function _(v26, v27) --[[ Line: 39 ]] --[[ Name: calculateTransparency ]]
    return v26 + v27 * (1 - v26);
end;
local function _(v29) --[[ Line: 43 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v22 (copy)
    return string.gsub(v29, ":(%S-)$", v22.VERIFIED_EMOJI .. ":%1");
end;
local function v32(v31) --[[ Line: 47 ]] --[[ Name: trim ]]
    if v31:match("^()%s*$") then
        return "";
    else
        return (v31:match("^%s*(.*%S)"));
    end;
end;
local function _(v33, v34) --[[ Line: 51 ]] --[[ Name: getPropertyFromObjBinding ]]
    return v33:map(function(v35) --[[ Line: 55 ]]
        -- upvalues: v34 (copy)
        if v35 then
            return v35[v34];
        else
            return nil;
        end;
    end);
end;
local function _(v37, v38, v39) --[[ Line: 60 ]] --[[ Name: tryToGenerateRawPrefixTextWithActionType ]]
    -- upvalues: v15 (copy), v2 (copy), v14 (copy)
    local v40 = "";
    if v39 == v15.Summary then
        return (("<font color='#%*'><font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>%*</font>"):format(v37.Color.Content.Muted.Color3:ToHex(), v2.Enums.IconName.Nebula, v14));
    else
        if v38 then
            v40 = v38;
        end;
        return v40;
    end;
end;
local function v53(v42, v43, v44, v45, v46) --[[ Line: 72 ]] --[[ Name: appendTrustedIndicator ]]
    local v47 = v46.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v46.Color.Shift.Shift_300.Transparency;
    local v49 = l_Transparency_0 + v44 * (1 - l_Transparency_0);
    l_Transparency_0 = v46.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v46.Color.Content.Emphasis.Transparency;
    local v51 = l_Transparency_1 + v44 * (1 - l_Transparency_1);
    l_Transparency_1 = v45 - 4;
    local v52 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v47, v49), 600, l_Transparency_1), l_Transparency_0, v51, v43)))));
    if string.find(v42, ":([%S:]-)$") then
        return string.gsub(v42, ":([%S:]-)$", ((" %* :%%1"):format(v52)));
    else
        return (("%* %*"):format(v42, v52));
    end;
end;
return v3.memo(function(v54) --[[ Line: 130 ]] --[[ Name: TranslatedTextMessage ]]
    -- upvalues: v8 (copy), v5 (copy), v10 (copy), v9 (copy), v11 (copy), v2 (copy), v19 (copy), v3 (copy), v20 (copy), v17 (copy), v18 (copy), v13 (copy), v15 (copy), v14 (copy), v22 (copy), v53 (copy), v32 (copy), v24 (copy), v12 (copy), v7 (copy), l_useCursor_0 (copy), v25 (copy), v16 (copy)
    if v8 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    local l_isSpatialUIEnabled_0 = v54.isSpatialUIEnabled;
    local v56 = if l_isSpatialUIEnabled_0 then v54.chatWindowSettings.SpatialPanelTextSize else v54.chatWindowSettings.TextSize;
    local v57 = v5.useLocalization({
        trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel", 
        rewrittenLabelText = if v10 and v9 then v11 else nil, 
        defaultRewrittenLabelText = v10 and v9 and "CoreScripts.TextChat.ChatWindow.RewrittenLabel" or nil
    });
    local v58 = nil;
    if v10 and v9 then
        v58 = if v57.rewrittenLabelText and v57.rewrittenLabelText ~= "" then v57.rewrittenLabelText else v57.defaultRewrittenLabelText;
    end;
    local v59 = v2.Hooks.useTokens();
    local v61 = if v19 then v3.useCallback(function() --[[ Line: 160 ]]
        -- upvalues: v54 (copy), v20 (ref)
        local v60 = v54.message.current.messageId or "UNKNOWN_MESSAGE_ID";
        v20.finish(v20.Events.MessageReceiveToWindowRenderInterval, {
            messageId = v60
        });
        v20.finish(v20.Events.MessageSendToWindowRenderInterval, {
            messageId = v60
        });
    end, {
        v54.message
    }) else nil;
    local v63 = if v19 then v3.useCallback(function(v62) --[[ Line: 171 ]]
        -- upvalues: v61 (copy)
        if v62 and v62.Text and v62.Text ~= "" then
            v61();
        end;
    end, {
        v61
    }) else nil;
    local v64 = v3.useCallback(function() --[[ Line: 178 ]]
        -- upvalues: v54 (copy)
        v54.onTextMessageLabelButtonActivated(v54.message.current);
    end, {
        v54.onTextMessageLabelButtonActivated
    });
    local v66 = v3.useCallback(function() --[[ Line: 182 ]]
        -- upvalues: v54 (copy), v17 (ref)
        local l_current_0 = v54.message.current;
        v17(false).toggleMessageTranslation(not l_current_0.useTranslation, l_current_0.messageId);
    end, {});
    local v67 = nil;
    if v9 then
        v67 = v3.useCallback(function() --[[ Line: 190 ]]
            -- upvalues: v54 (copy), v18 (ref)
            local l_current_1 = v54.message.current;
            if l_current_1 and l_current_1.messageId then
                v18(false).toggleDropdown(l_current_1.messageId);
            end;
        end, {
            v54.message
        });
    end;
    local v69 = {
        v54.originalPrefixText, 
        v54.isUserVerified
    };
    table.insert(v69, v54.isTrustedConnection);
    table.insert(v69, v54.textTransparency);
    table.insert(v69, v54.prefixTextProperties);
    local v70 = 0;
    if v13 then
        v70 = #v69 + 1;
        table.insert(v69, v54.chatActionType);
    end;
    local v82 = v3.joinBindings(v69):map(function(v71) --[[ Line: 209 ]]
        -- upvalues: v13 (ref), v59 (copy), v70 (ref), v15 (ref), v2 (ref), v14 (ref), v22 (ref), v53 (ref), v57 (copy)
        local v72;
        if v13 then
            local l_v59_0 = v59;
            local v74 = v71[1];
            local v75 = v71[v70];
            local v76 = "";
            if v75 == v15.Summary then
                v76 = ("<font color='#%*'><font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>%*</font>"):format(l_v59_0.Color.Content.Muted.Color3:ToHex(), v2.Enums.IconName.Nebula, v14);
            elseif v74 then
                v76 = v74;
            end;
            v72 = v76;
        else
            v72 = v71[1];
        end;
        local v77 = v71[2];
        local l_v72_0 = v72;
        if string.len(v72) > 0 then
            if v77 then
                l_v72_0 = string.gsub(l_v72_0, ":(%S-)$", v22.VERIFIED_EMOJI .. ":%1");
            end;
            local v79 = v71[3] or false;
            local v80 = v71[4] == nil and 1 or v71[4];
            local v81 = v71[5];
            if v79 then
                l_v72_0 = v53(l_v72_0, v57.trustedLabelText, v80, v81.TextSize, v59);
            end;
        end;
        return l_v72_0;
    end);
    local v83 = v82:map(v32);
    local v84 = {
        v82, 
        v54.shouldShowTranslationToggle, 
        v54.originalBodyText, 
        v54.prefixTextProperties
    };
    if v10 and v9 then
        table.insert(v84, v54.wasRewritten);
        table.insert(v84, v54.isRewriteWindowOpen);
    end;
    local v85 = nil;
    if v13 then
        v85 = #v84 + 1;
        table.insert(v84, v54.chatActionType);
    end;
    local v95 = v3.joinBindings(v84):map(function(v86) --[[ Line: 256 ]]
        -- upvalues: v13 (ref), v85 (ref), v15 (ref), v59 (copy), v24 (ref), v10 (ref), v9 (ref), v2 (ref), v58 (ref)
        local v87 = v86[1];
        local v88 = v86[2];
        local v89 = v86[3];
        local v90 = v86[4];
        local l_v89_0 = v89;
        if v13 and v86[v85] == v15.Summary then
            l_v89_0 = ("<font color='#%*'>%*</font>"):format(v59.Color.Content.Muted.Color3:ToHex(), l_v89_0);
        end;
        if string.len(v87) > 0 then
            if v88 then
                l_v89_0 = "     " .. l_v89_0;
            end;
            l_v89_0 = v24(v87, v90.FontFace, v90.TextSize) .. " " .. l_v89_0;
        end;
        if v10 and v9 then
            local v92 = v86[5];
            local v93 = v86[6];
            if v92 then
                local v94 = if v93 then v2.Enums.IconName.ChevronLargeUp else v2.Enums.IconName.ChevronLargeDown;
                l_v89_0 = ("%* <font size='%*' color='#%*'>%*<font transparency='1'><stroke transparency='1'>_</stroke></font>%*</font>"):format(l_v89_0, v90.TextSize - 4, v59.Color.Content.Muted.Color3:ToHex(), ("(%*)"):format(v58), (("<font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>"):format(v94)));
            end;
        end;
        return l_v89_0;
    end);
    local v97 = v54.bodyTextProperties:map(function(v96) --[[ Line: 301 ]]
        -- upvalues: l_isSpatialUIEnabled_0 (copy), v56 (copy)
        if l_isSpatialUIEnabled_0 then
            return v56;
        else
            return v96.TextSize;
        end;
    end);
    local v99 = v97:map(function(v98) --[[ Line: 304 ]]
        return UDim2.new(0, v98 - 2, 0, v98 - 2);
    end);
    local v100 = nil;
    v100 = if v13 then v3.joinBindings({
        v54.originalPrefixText, 
        v54.chatActionType
    }):map(function(v101) --[[ Line: 310 ]]
        -- upvalues: v59 (copy), v15 (ref), v2 (ref), v14 (ref)
        local l_v59_1 = v59;
        local v103 = v101[1];
        local v104 = v101[2];
        local v105 = "";
        if v104 == v15.Summary then
            v105 = ("<font color='#%*'><font weight='600' family='rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json'>%*</font>%*</font>"):format(l_v59_1.Color.Content.Muted.Color3:ToHex(), v2.Enums.IconName.Nebula, v14);
        elseif v103 then
            v105 = v103;
        end;
        return string.len(v105) > 0;
    end) else v54.originalPrefixText:map(function(v106) --[[ Line: 315 ]]
        return string.len(v106) > 0;
    end);
    local l_prefixTextProperties_0 = v54.prefixTextProperties;
    local v108 = "UIGradient";
    local l_v108_0 = v108 --[[ copy: 26 -> 46 ]];
    local v111 = l_prefixTextProperties_0:map(function(v110) --[[ Line: 55 ]]
        -- upvalues: l_v108_0 (copy)
        if v110 then
            return v110[l_v108_0];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_0 = nil;
    local v112 = nil;
    if v9 then
        local l_wasRewritten_0 = v54.wasRewritten;
        l_prefixTextProperties_0 = l_wasRewritten_0:map(function(v114) --[[ Line: 326 ]]
            -- upvalues: v10 (ref)
            return v114 and not v10;
        end);
        if v10 then
            local l_chatWindowTransparencyBindable_0 = v54.chatWindowTransparencyBindable;
            if l_chatWindowTransparencyBindable_0 == nil then
                v112 = l_wasRewritten_0;
            elseif typeof(l_chatWindowTransparencyBindable_0) == "number" then
                v108 = l_chatWindowTransparencyBindable_0 < v12;
                local l_v108_1 = v108 --[[ copy: 26 -> 60 ]];
                v112 = l_wasRewritten_0:map(function(v117) --[[ Line: 337 ]]
                    -- upvalues: l_v108_1 (copy)
                    return v117 and l_v108_1;
                end);
            else
                v112 = v3.joinBindings({
                    l_wasRewritten_0, 
                    l_chatWindowTransparencyBindable_0
                }):map(function(v118) --[[ Line: 344 ]]
                    -- upvalues: v12 (ref)
                    return v118[1] and v118[2] < v12;
                end);
            end;
        end;
    end;
    local v119 = if v7 then l_useCursor_0() else nil;
    local l_createElement_0 = v3.createElement;
    v108 = "Frame";
    local v121 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v54.layoutOrder, 
        Visible = v54.visible
    };
    local v122 = {
        UIPadding = v3.createElement("UIPadding", {
            PaddingRight = v54.arButtonPadding
        }), 
        ColumnLayout = if not v9 or v10 then nil else v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local l_createElement_1 = v3.createElement;
    local v124 = "Frame";
    local v125 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v9 and 1 or nil
    };
    local v126 = {};
    local l_createElement_2 = v3.createElement;
    local v128 = "TextLabel";
    local v129 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    local l_prefixTextProperties_1 = v54.prefixTextProperties;
    local v131 = "FontFace";
    local l_v131_0 = v131 --[[ copy: 41 -> 47 ]];
    v129.FontFace = l_prefixTextProperties_1:map(function(v133) --[[ Line: 55 ]]
        -- upvalues: l_v131_0 (copy)
        if v133 then
            return v133[l_v131_0];
        else
            return nil;
        end;
    end);
    v129.RichText = true;
    v129.Text = v82;
    l_prefixTextProperties_1 = v54.prefixTextProperties;
    v131 = "TextColor3";
    local l_v131_1 = v131 --[[ copy: 41 -> 48 ]];
    v129.TextColor3 = l_prefixTextProperties_1:map(function(v135) --[[ Line: 55 ]]
        -- upvalues: l_v131_1 (copy)
        if v135 then
            return v135[l_v131_1];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v54.prefixTextProperties;
    v131 = "TextSize";
    local l_v131_2 = v131 --[[ copy: 41 -> 49 ]];
    v129.TextSize = l_prefixTextProperties_1:map(function(v137) --[[ Line: 55 ]]
        -- upvalues: l_v131_2 (copy)
        if v137 then
            return v137[l_v131_2];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v54.prefixTextProperties;
    v131 = "TextStrokeColor3";
    local l_v131_3 = v131 --[[ copy: 41 -> 50 ]];
    v129.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v139) --[[ Line: 55 ]]
        -- upvalues: l_v131_3 (copy)
        if v139 then
            return v139[l_v131_3];
        else
            return nil;
        end;
    end);
    local l_v25_0 = v25;
    local l_prefixTextProperties_2 = v54.prefixTextProperties;
    local v142 = "TextStrokeTransparency";
    local l_v142_0 = v142 --[[ copy: 42 -> 51 ]];
    v129.TextStrokeTransparency = l_v25_0(l_prefixTextProperties_2:map(function(v144) --[[ Line: 55 ]]
        -- upvalues: l_v142_0 (copy)
        if v144 then
            return v144[l_v142_0];
        else
            return nil;
        end;
    end), v54.textTransparency);
    v129.TextTransparency = v25(0, v54.textTransparency);
    v129.TextWrapped = true;
    v129.TextXAlignment = Enum.TextXAlignment.Left;
    v129.TextYAlignment = Enum.TextYAlignment.Top;
    v129.Visible = v100;
    l_v25_0 = {};
    l_prefixTextProperties_1 = v3.createElement;
    l_prefixTextProperties_2 = "UIGradient";
    local v145 = {};
    local v146 = "Enabled";
    local l_v146_0 = v146 --[[ copy: 43 -> 52 ]];
    v145.Enabled = v111:map(function(v148) --[[ Line: 55 ]]
        -- upvalues: l_v146_0 (copy)
        if v148 then
            return v148[l_v146_0];
        else
            return nil;
        end;
    end);
    v146 = "Color";
    local l_v146_1 = v146 --[[ copy: 43 -> 53 ]];
    v145.Color = v111:map(function(v150) --[[ Line: 55 ]]
        -- upvalues: l_v146_1 (copy)
        if v150 then
            return v150[l_v146_1];
        else
            return nil;
        end;
    end);
    v146 = "Offset";
    local l_v146_2 = v146 --[[ copy: 43 -> 54 ]];
    v145.Offset = v111:map(function(v152) --[[ Line: 55 ]]
        -- upvalues: l_v146_2 (copy)
        if v152 then
            return v152[l_v146_2];
        else
            return nil;
        end;
    end);
    v146 = "Rotation";
    local l_v146_3 = v146 --[[ copy: 43 -> 55 ]];
    v145.Rotation = v111:map(function(v154) --[[ Line: 55 ]]
        -- upvalues: l_v146_3 (copy)
        if v154 then
            return v154[l_v146_3];
        else
            return nil;
        end;
    end);
    v146 = "Transparency";
    v145.Transparency = v111:map(function(v155) --[[ Line: 55 ]]
        -- upvalues: v146 (copy)
        if v155 then
            return v155[v146];
        else
            return nil;
        end;
    end);
    l_v25_0.UIGradient = l_prefixTextProperties_1(l_prefixTextProperties_2, v145);
    v126.PrefixText = l_createElement_2(v128, v129, l_v25_0);
    l_createElement_2 = v3.createElement;
    v128 = v10 and v9 and "TextButton" or "TextLabel";
    v129 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    l_prefixTextProperties_1 = v54.bodyTextProperties;
    v131 = "FontFace";
    local l_v131_4 = v131 --[[ copy: 41 -> 56 ]];
    v129.FontFace = l_prefixTextProperties_1:map(function(v157) --[[ Line: 55 ]]
        -- upvalues: l_v131_4 (copy)
        if v157 then
            return v157[l_v131_4];
        else
            return nil;
        end;
    end);
    v129.RichText = true;
    v129.Size = UDim2.new(1, 0, 0, 0);
    v129.Text = v95;
    l_prefixTextProperties_1 = v54.bodyTextProperties;
    v131 = "TextColor3";
    local l_v131_5 = v131 --[[ copy: 41 -> 57 ]];
    v129.TextColor3 = l_prefixTextProperties_1:map(function(v159) --[[ Line: 55 ]]
        -- upvalues: l_v131_5 (copy)
        if v159 then
            return v159[l_v131_5];
        else
            return nil;
        end;
    end);
    v129.TextSize = v97;
    l_prefixTextProperties_1 = v54.bodyTextProperties;
    v131 = "TextStrokeColor3";
    local l_v131_6 = v131 --[[ copy: 41 -> 58 ]];
    v129.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v161) --[[ Line: 55 ]]
        -- upvalues: l_v131_6 (copy)
        if v161 then
            return v161[l_v131_6];
        else
            return nil;
        end;
    end);
    l_v25_0 = v25;
    l_prefixTextProperties_2 = v54.bodyTextProperties;
    v142 = "TextStrokeTransparency";
    v129.TextStrokeTransparency = l_v25_0(l_prefixTextProperties_2:map(function(v162) --[[ Line: 55 ]]
        -- upvalues: v142 (copy)
        if v162 then
            return v162[v142];
        else
            return nil;
        end;
    end), v54.textTransparency);
    v129.TextTransparency = v25(0, v54.textTransparency);
    v129.TextWrapped = true;
    v129.TextXAlignment = Enum.TextXAlignment.Left;
    v129.TextYAlignment = Enum.TextYAlignment.Top;
    v129[v3.Change.Text] = if v19 then v63 else nil;
    v129[v3.Event.Activated] = if v10 and v9 then v67 else nil;
    v129.Interactable = if v10 and v9 then v112 else nil;
    v126.BodyText = l_createElement_2(v128, v129);
    l_createElement_2 = v3.createElement;
    v128 = "Frame";
    v129 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Visible = v100
    };
    l_v25_0 = {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    l_prefixTextProperties_1 = v3.createElement;
    l_prefixTextProperties_2 = "TextButton";
    v145 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    v131 = v54.prefixTextProperties;
    local v163 = "FontFace";
    local l_v163_0 = v163 --[[ copy: 45 -> 59 ]];
    v145.FontFace = v131:map(function(v165) --[[ Line: 55 ]]
        -- upvalues: l_v163_0 (copy)
        if v165 then
            return v165[l_v163_0];
        else
            return nil;
        end;
    end);
    v145.RichText = true;
    v145.SelectionImageObject = v119;
    v145.Size = UDim2.new(0, 0, 0, 0);
    v145.Text = v83;
    v131 = v54.prefixTextProperties;
    v163 = "TextSize";
    v145.TextSize = v131:map(function(v166) --[[ Line: 55 ]]
        -- upvalues: v163 (copy)
        if v166 then
            return v166[v163];
        else
            return nil;
        end;
    end);
    v145.TextStrokeTransparency = 1;
    v145.TextTransparency = 1;
    v145.TextWrapped = true;
    v145.TextXAlignment = Enum.TextXAlignment.Left;
    v145.TextYAlignment = Enum.TextYAlignment.Top;
    v145.LayoutOrder = 1;
    v145[v3.Event.Activated] = v64;
    l_v25_0.TextButton = l_prefixTextProperties_1(l_prefixTextProperties_2, v145);
    l_v25_0.TranslationButton = v3.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        HoverImage = "rbxasset://textures/translateIconDark.png", 
        Image = "rbxasset://textures/translateIcon.png", 
        ImageTransparency = v25(0, v54.textTransparency), 
        LayoutOrder = 2, 
        PressedImage = "rbxasset://textures/translateIconDark.png", 
        SelectionImageObject = v119, 
        Size = v99, 
        Visible = v54.shouldShowTranslationToggle, 
        [v3.Event.Activated] = v66
    });
    v126.TextMessageButton = l_createElement_2(v128, v129, l_v25_0);
    v122.TextMessage = l_createElement_1(v124, v125, v126);
    v122.RewriteToggle = if not v9 or v10 then nil else v3.createElement(v16, {
        isRewriteMenuOpen = v54.isRewriteWindowOpen, 
        textTransparency = v54.textTransparency, 
        onActivated = v67, 
        LayoutOrder = 2, 
        Visible = l_prefixTextProperties_0
    });
    l_createElement_0 = l_createElement_0(v108, v121, v122);
    if v8 then
        debug.profileend();
    end;
    return l_createElement_0;
end);
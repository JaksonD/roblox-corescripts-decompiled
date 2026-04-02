local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local v6 = require(l_script_FirstAncestor_0.Localization);
local v7 = require(l_script_FirstAncestor_0.isChatRegionLocked);
local v8 = require(l_script_FirstAncestor_0.showChatEnabledUI);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v10 = require(l_Flags_0.FFlagExpChatEnableFocusNavigation);
local v11 = require(l_Flags_0.FFlagDebugMessageProfiling);
local v12 = require(l_Flags_0.FFlagExpChatTcIndicator);
local v13 = require(l_Flags_0.FIntExpChatVisibleARButtonPadding);
local v14 = require(l_Flags_0.FIntExpChatDefaultARButtonPadding);
local v15 = require(l_script_FirstAncestor_0.Stores.GetChatStatusStore);
local v16 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
local v17 = game:DefineFastFlag("ExpChatMessageV2PerfTracking2", false);
local v18 = require(l_script_FirstAncestor_0.Telemetry.ExpChatPerfTracker);
local l_useCursor_0 = v5.App.SelectionCursor.useCursor;
local v20 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v22 = require(l_Helpers_0.duplicateInvisibleText);
local function _(v23) --[[ Line: 33 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v20 (copy)
    return string.gsub(v23, ":(%S-)$", v20.VERIFIED_EMOJI .. ":%1");
end;
local function v26(v25) --[[ Line: 37 ]] --[[ Name: trim ]]
    if v25:match("^()%s*$") then
        return "";
    else
        return (v25:match("^%s*(.*%S)"));
    end;
end;
local function _(v27, v28) --[[ Line: 41 ]] --[[ Name: calculateTransparency ]]
    return v27 + v28 * (1 - v27);
end;
local function v35(v30, v31) --[[ Line: 45 ]] --[[ Name: mergeTransparency ]]
    -- upvalues: v4 (copy)
    return v4.joinBindings(if typeof(v30) == "number" then {
        v31
    } else {
        v31, 
        v30
    }):map(function(v32) --[[ Line: 52 ]]
        -- upvalues: v30 (copy)
        local v33 = v32[1];
        local v34 = v32[2] or v30;
        if v34 == nil then
            return 1;
        else
            return v34 + v33 * (1 - v34);
        end;
    end);
end;
local function _(v36, v37) --[[ Line: 60 ]] --[[ Name: getPropertyFromObjBinding ]]
    return v36:map(function(v38) --[[ Line: 64 ]]
        -- upvalues: v37 (copy)
        if v38 then
            return v38[v37];
        else
            return nil;
        end;
    end);
end;
local function v51(v40, v41, v42, v43, v44) --[[ Line: 69 ]] --[[ Name: appendTrustedIndicator ]]
    local v45 = v44.Color.Shift.Shift_300.Color3:ToHex();
    local l_Transparency_0 = v44.Color.Shift.Shift_300.Transparency;
    local v47 = l_Transparency_0 + v42 * (1 - l_Transparency_0);
    l_Transparency_0 = v44.Color.Content.Emphasis.Color3:ToHex();
    local l_Transparency_1 = v44.Color.Content.Emphasis.Transparency;
    local v49 = l_Transparency_1 + v42 * (1 - l_Transparency_1);
    l_Transparency_1 = v43 - 4;
    local v50 = ("%*</mark>"):format((("%*_</stroke></font>"):format((("%*<font color='#%*' transparency='%*'>%*</font>"):format(("%*<font transparency='1' weight='%*' size='%*'><stroke transparency='1'>_"):format(("<mark color='#%*' transparency='%*'>"):format(v45, v47), 600, l_Transparency_1), l_Transparency_0, v49, v41)))));
    if string.find(v40, ":([%S:]-)$") then
        return string.gsub(v40, ":([%S:]-)$", ((" %* :%%1"):format(v50)));
    else
        return (("%* %*"):format(v40, v50));
    end;
end;
return v4.memo(function(v52) --[[ Line: 122 ]] --[[ Name: TranslatedTextMessage ]]
    -- upvalues: v11 (copy), v15 (copy), v3 (copy), v12 (copy), v6 (copy), v2 (copy), v17 (copy), v4 (copy), v18 (copy), v16 (copy), v20 (copy), v51 (copy), v26 (copy), v22 (copy), v7 (copy), v8 (copy), v13 (copy), v14 (copy), v10 (copy), l_useCursor_0 (copy), v35 (copy)
    if v11 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    local v53 = v15(false);
    local v54 = v3.useSignalBinding(v53.getChatStatus);
    local l_isSpatialUIEnabled_0 = v52.isSpatialUIEnabled;
    local v56 = if l_isSpatialUIEnabled_0 then v52.chatWindowSettings.SpatialPanelTextSize else v52.chatWindowSettings.TextSize;
    local v57 = if v12 then v6.useLocalization({
        trustedLabelText = "CoreScripts.TextChat.ChatWindow.TrustedLabel"
    }) else nil;
    local v58 = if v12 then v2.Hooks.useTokens() else nil;
    local v60 = if v17 then v4.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v52 (copy), v18 (ref)
        local v59 = v52.message.current.messageId or "UNKNOWN_MESSAGE_ID";
        v18.finish(v18.Events.MessageReceiveToWindowRenderInterval, {
            messageId = v59
        });
        v18.finish(v18.Events.MessageSendToWindowRenderInterval, {
            messageId = v59
        });
    end, {
        v52.message
    }) else nil;
    local v62 = if v17 then v4.useCallback(function(v61) --[[ Line: 153 ]]
        -- upvalues: v60 (copy)
        if v61 and v61.Text and v61.Text ~= "" then
            v60();
        end;
    end, {
        v60
    }) else nil;
    local v63 = v4.useCallback(function() --[[ Line: 160 ]]
        -- upvalues: v52 (copy)
        v52.onTextMessageLabelButtonActivated(v52.message.current);
    end, {
        v52.onTextMessageLabelButtonActivated
    });
    local v65 = v4.useCallback(function() --[[ Line: 164 ]]
        -- upvalues: v52 (copy), v16 (ref)
        local l_current_0 = v52.message.current;
        v16(false).toggleMessageTranslation(not l_current_0.useTranslation, l_current_0.messageId);
    end, {});
    local v66 = {
        v52.originalPrefixText, 
        v52.isUserVerified
    };
    if v12 then
        table.insert(v66, v52.isTrustedConnection);
        table.insert(v66, v52.textTransparency);
        table.insert(v66, v52.prefixTextProperties);
    end;
    local v74 = v4.joinBindings(v66):map(function(v67) --[[ Line: 177 ]]
        -- upvalues: v20 (ref), v12 (ref), v51 (ref), v57 (copy), v58 (copy)
        local v68 = v67[1];
        local v69 = v67[2];
        local l_v68_0 = v68;
        if string.len(v68) > 0 then
            if v69 then
                l_v68_0 = string.gsub(l_v68_0, ":(%S-)$", v20.VERIFIED_EMOJI .. ":%1");
            end;
            if v12 then
                local v71 = v67[3] or false;
                local v72 = v67[4] == nil and 1 or v67[4];
                local v73 = v67[5];
                if v71 then
                    l_v68_0 = v51(l_v68_0, v57.trustedLabelText, v72, v73.TextSize, v58);
                end;
            end;
        end;
        return l_v68_0;
    end);
    local v75 = v74:map(v26);
    local v82 = v4.joinBindings({
        v74, 
        v52.shouldShowTranslationToggle, 
        v52.originalBodyText, 
        v52.prefixTextProperties
    }):map(function(v76) --[[ Line: 214 ]]
        -- upvalues: v22 (ref)
        local v77 = v76[1];
        local v78 = v76[2];
        local v79 = v76[3];
        local v80 = v76[4];
        if string.len(v77) == 0 then
            return v79;
        else
            local l_v79_0 = v79;
            if v78 then
                l_v79_0 = "     " .. l_v79_0;
            end;
            return v22(v77, v80.FontFace, v80.TextSize) .. " " .. l_v79_0;
        end;
    end);
    local v84 = v52.bodyTextProperties:map(function(v83) --[[ Line: 236 ]]
        -- upvalues: l_isSpatialUIEnabled_0 (copy), v56 (copy)
        if l_isSpatialUIEnabled_0 then
            return v56;
        else
            return v83.TextSize;
        end;
    end);
    local v86 = v84:map(function(v85) --[[ Line: 239 ]]
        return UDim2.new(0, v85 - 2, 0, v85 - 2);
    end);
    local v88 = v52.originalPrefixText:map(function(v87) --[[ Line: 242 ]]
        return string.len(v87) > 0;
    end);
    local l_prefixTextProperties_0 = v52.prefixTextProperties;
    local v90 = "UIGradient";
    local l_v90_0 = v90 --[[ copy: 23 -> 42 ]];
    local v93 = l_prefixTextProperties_0:map(function(v92) --[[ Line: 64 ]]
        -- upvalues: l_v90_0 (copy)
        if v92 then
            return v92[l_v90_0];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_0 = v54:map(function(v94) --[[ Line: 246 ]]
        -- upvalues: v7 (ref), v8 (ref), v13 (ref), v14 (ref)
        local v95 = not v7() and v8(v94);
        return UDim.new(0, if v95 then v13 else v14);
    end);
    local v96 = if v10 then l_useCursor_0() else nil;
    local l_createElement_0 = v4.createElement;
    local v98 = "Frame";
    v90 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v52.layoutOrder, 
        Visible = v52.visible
    };
    local v99 = {
        UIPadding = v4.createElement("UIPadding", {
            PaddingRight = l_prefixTextProperties_0
        })
    };
    local l_createElement_1 = v4.createElement;
    local v101 = "Frame";
    local v102 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v103 = {};
    local l_createElement_2 = v4.createElement;
    local v105 = "TextLabel";
    local v106 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    local l_prefixTextProperties_1 = v52.prefixTextProperties;
    local v108 = "FontFace";
    local l_v108_0 = v108 --[[ copy: 37 -> 43 ]];
    v106.FontFace = l_prefixTextProperties_1:map(function(v110) --[[ Line: 64 ]]
        -- upvalues: l_v108_0 (copy)
        if v110 then
            return v110[l_v108_0];
        else
            return nil;
        end;
    end);
    v106.RichText = true;
    v106.Text = v74;
    l_prefixTextProperties_1 = v52.prefixTextProperties;
    v108 = "TextColor3";
    local l_v108_1 = v108 --[[ copy: 37 -> 44 ]];
    v106.TextColor3 = l_prefixTextProperties_1:map(function(v112) --[[ Line: 64 ]]
        -- upvalues: l_v108_1 (copy)
        if v112 then
            return v112[l_v108_1];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v52.prefixTextProperties;
    v108 = "TextSize";
    local l_v108_2 = v108 --[[ copy: 37 -> 45 ]];
    v106.TextSize = l_prefixTextProperties_1:map(function(v114) --[[ Line: 64 ]]
        -- upvalues: l_v108_2 (copy)
        if v114 then
            return v114[l_v108_2];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v52.prefixTextProperties;
    v108 = "TextStrokeColor3";
    local l_v108_3 = v108 --[[ copy: 37 -> 46 ]];
    v106.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v116) --[[ Line: 64 ]]
        -- upvalues: l_v108_3 (copy)
        if v116 then
            return v116[l_v108_3];
        else
            return nil;
        end;
    end);
    local l_v35_0 = v35;
    local l_prefixTextProperties_2 = v52.prefixTextProperties;
    local v119 = "TextStrokeTransparency";
    local l_v119_0 = v119 --[[ copy: 38 -> 47 ]];
    v106.TextStrokeTransparency = l_v35_0(l_prefixTextProperties_2:map(function(v121) --[[ Line: 64 ]]
        -- upvalues: l_v119_0 (copy)
        if v121 then
            return v121[l_v119_0];
        else
            return nil;
        end;
    end), v52.textTransparency);
    v106.TextTransparency = v35(0, v52.textTransparency);
    v106.TextWrapped = true;
    v106.TextXAlignment = Enum.TextXAlignment.Left;
    v106.TextYAlignment = Enum.TextYAlignment.Top;
    v106.Visible = v88;
    l_v35_0 = {};
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "UIGradient";
    local v122 = {};
    local v123 = "Enabled";
    local l_v123_0 = v123 --[[ copy: 39 -> 48 ]];
    v122.Enabled = v93:map(function(v125) --[[ Line: 64 ]]
        -- upvalues: l_v123_0 (copy)
        if v125 then
            return v125[l_v123_0];
        else
            return nil;
        end;
    end);
    v123 = "Color";
    local l_v123_1 = v123 --[[ copy: 39 -> 49 ]];
    v122.Color = v93:map(function(v127) --[[ Line: 64 ]]
        -- upvalues: l_v123_1 (copy)
        if v127 then
            return v127[l_v123_1];
        else
            return nil;
        end;
    end);
    v123 = "Offset";
    local l_v123_2 = v123 --[[ copy: 39 -> 50 ]];
    v122.Offset = v93:map(function(v129) --[[ Line: 64 ]]
        -- upvalues: l_v123_2 (copy)
        if v129 then
            return v129[l_v123_2];
        else
            return nil;
        end;
    end);
    v123 = "Rotation";
    local l_v123_3 = v123 --[[ copy: 39 -> 51 ]];
    v122.Rotation = v93:map(function(v131) --[[ Line: 64 ]]
        -- upvalues: l_v123_3 (copy)
        if v131 then
            return v131[l_v123_3];
        else
            return nil;
        end;
    end);
    v123 = "Transparency";
    v122.Transparency = v93:map(function(v132) --[[ Line: 64 ]]
        -- upvalues: v123 (copy)
        if v132 then
            return v132[v123];
        else
            return nil;
        end;
    end);
    l_v35_0.UIGradient = l_prefixTextProperties_1(l_prefixTextProperties_2, v122);
    v103.PrefixText = l_createElement_2(v105, v106, l_v35_0);
    l_createElement_2 = v4.createElement;
    v105 = "TextLabel";
    v106 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    l_prefixTextProperties_1 = v52.bodyTextProperties;
    v108 = "FontFace";
    local l_v108_4 = v108 --[[ copy: 37 -> 52 ]];
    v106.FontFace = l_prefixTextProperties_1:map(function(v134) --[[ Line: 64 ]]
        -- upvalues: l_v108_4 (copy)
        if v134 then
            return v134[l_v108_4];
        else
            return nil;
        end;
    end);
    v106.RichText = true;
    v106.Size = UDim2.new(1, 0, 0, 0);
    v106.Text = v82;
    l_prefixTextProperties_1 = v52.bodyTextProperties;
    v108 = "TextColor3";
    local l_v108_5 = v108 --[[ copy: 37 -> 53 ]];
    v106.TextColor3 = l_prefixTextProperties_1:map(function(v136) --[[ Line: 64 ]]
        -- upvalues: l_v108_5 (copy)
        if v136 then
            return v136[l_v108_5];
        else
            return nil;
        end;
    end);
    v106.TextSize = v84;
    l_prefixTextProperties_1 = v52.bodyTextProperties;
    v108 = "TextStrokeColor3";
    local l_v108_6 = v108 --[[ copy: 37 -> 54 ]];
    v106.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v138) --[[ Line: 64 ]]
        -- upvalues: l_v108_6 (copy)
        if v138 then
            return v138[l_v108_6];
        else
            return nil;
        end;
    end);
    l_v35_0 = v35;
    l_prefixTextProperties_2 = v52.bodyTextProperties;
    v119 = "TextStrokeTransparency";
    v106.TextStrokeTransparency = l_v35_0(l_prefixTextProperties_2:map(function(v139) --[[ Line: 64 ]]
        -- upvalues: v119 (copy)
        if v139 then
            return v139[v119];
        else
            return nil;
        end;
    end), v52.textTransparency);
    v106.TextTransparency = v35(0, v52.textTransparency);
    v106.TextWrapped = true;
    v106.TextXAlignment = Enum.TextXAlignment.Left;
    v106.TextYAlignment = Enum.TextYAlignment.Top;
    v106[v4.Change.Text] = if v17 then v62 else nil;
    v103.BodyText = l_createElement_2(v105, v106);
    l_createElement_2 = v4.createElement;
    v105 = "Frame";
    v106 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Visible = v88
    };
    l_v35_0 = {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "TextButton";
    v122 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    v108 = v52.prefixTextProperties;
    local v140 = "FontFace";
    local l_v140_0 = v140 --[[ copy: 41 -> 55 ]];
    v122.FontFace = v108:map(function(v142) --[[ Line: 64 ]]
        -- upvalues: l_v140_0 (copy)
        if v142 then
            return v142[l_v140_0];
        else
            return nil;
        end;
    end);
    v122.RichText = true;
    v122.SelectionImageObject = v96;
    v122.Size = UDim2.new(0, 0, 0, 0);
    v122.Text = v75;
    v108 = v52.prefixTextProperties;
    v140 = "TextSize";
    v122.TextSize = v108:map(function(v143) --[[ Line: 64 ]]
        -- upvalues: v140 (copy)
        if v143 then
            return v143[v140];
        else
            return nil;
        end;
    end);
    v122.TextStrokeTransparency = 1;
    v122.TextTransparency = 1;
    v122.TextWrapped = true;
    v122.TextXAlignment = Enum.TextXAlignment.Left;
    v122.TextYAlignment = Enum.TextYAlignment.Top;
    v122.LayoutOrder = 1;
    v122[v4.Event.Activated] = v63;
    l_v35_0.TextButton = l_prefixTextProperties_1(l_prefixTextProperties_2, v122);
    l_v35_0.TranslationButton = v4.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        HoverImage = "rbxasset://textures/translateIconDark.png", 
        Image = "rbxasset://textures/translateIcon.png", 
        ImageTransparency = v35(0, v52.textTransparency), 
        LayoutOrder = 2, 
        PressedImage = "rbxasset://textures/translateIconDark.png", 
        SelectionImageObject = v96, 
        Size = v86, 
        Visible = v52.shouldShowTranslationToggle, 
        [v4.Event.Activated] = v65
    });
    v103.TextMessageButton = l_createElement_2(v105, v106, l_v35_0);
    v99.TextMessage = l_createElement_1(v101, v102, v103);
    l_createElement_0 = l_createElement_0(v98, v90, v99);
    if v11 then
        debug.profileend();
    end;
    return l_createElement_0;
end);
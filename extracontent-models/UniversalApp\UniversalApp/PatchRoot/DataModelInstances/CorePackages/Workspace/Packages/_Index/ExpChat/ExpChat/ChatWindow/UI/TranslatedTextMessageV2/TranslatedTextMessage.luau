local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.UIBlox);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v7 = require(l_Flags_0.FFlagExpChatEnableFocusNavigation);
local v8 = game:DefineFastFlag("DebugMessageProfiling", false);
local l_useCursor_0 = v5.App.SelectionCursor.useCursor;
local v10 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.ChatWindow.Helpers;
local v12 = require(l_Helpers_0.duplicateInvisibleText);
local function _(v13) --[[ Line: 21 ]] --[[ Name: appendVerifiedBadge ]]
    -- upvalues: v10 (copy)
    return string.gsub(v13, ":(%S-)$", v10.VERIFIED_EMOJI .. ":%1");
end;
local function v21(v15) --[[ Line: 25 ]] --[[ Name: useCombinedName ]]
    -- upvalues: l_UserProfileStore_0 (copy), v3 (copy)
    local v16 = false;
    if v15 ~= nil then
        v16 = v15 ~= 0;
    end;
    local v17 = if v16 then tostring(v15) else tostring(0);
    local v18 = l_UserProfileStore_0.get().fetchNamesByUserIds({
        v17
    })(false).data[1];
    local v19 = v3.useSignalBinding(v18.names.getDisplayName);
    local v20 = v3.useSignalBinding(v18.names.getInExperienceCombinedName);
    if not v16 then
        return nil;
    else
        return {
            displayName = v19, 
            inExperienceCombinedName = v20
        };
    end;
end;
local function _(v22) --[[ Line: 39 ]] --[[ Name: trim ]]
    if v22:match("^()%s*$") then
        return "";
    else
        return (v22:match("^%s*(.*%S)"));
    end;
end;
local function v29(v24, v25) --[[ Line: 45 ]] --[[ Name: mergeTransparency ]]
    -- upvalues: v4 (copy)
    return v4.joinBindings({
        v24, 
        v25
    }):map(function(v26) --[[ Line: 49 ]]
        local v27 = v26[1];
        local v28 = v26[2];
        if v27 == nil then
            return 1;
        else
            return v27 + v28 * (1 - v27);
        end;
    end);
end;
local function _(v30, v31) --[[ Line: 56 ]] --[[ Name: getPropertyFromObjBinding ]]
    return v30:map(function(v32) --[[ Line: 60 ]]
        -- upvalues: v31 (copy)
        if v32 then
            return v32[v31];
        else
            return nil;
        end;
    end);
end;
return v4.memo(function(v34) --[[ Line: 86 ]] --[[ Name: TranslatedTextMessage ]]
    -- upvalues: v8 (copy), v21 (copy), v4 (copy), v10 (copy), v12 (copy), v7 (copy), l_useCursor_0 (copy), v29 (copy)
    if v8 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    local l_isSpatialUIEnabled_0 = v34.isSpatialUIEnabled;
    local v36 = if l_isSpatialUIEnabled_0 then v34.chatWindowSettings.SpatialPanelTextSize else v34.chatWindowSettings.TextSize;
    if v8 then
        debug.profilebegin("useCombinedName");
    end;
    local v37 = v21(v34.userId.current);
    if v8 then
        debug.profileend();
    end;
    local v38 = v4.useCallback(function() --[[ Line: 104 ]]
        -- upvalues: v34 (copy)
        v34.onTextMessageLabelButtonActivated(v34.userId.current);
    end, {
        v34.onTextMessageLabelButtonActivated
    });
    local v39 = v4.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v34 (copy)
        v34.onToggle(not v34.useTranslation.current, v34.messageId.current);
    end, {
        v34.onToggle
    });
    local v46 = v4.joinBindings(if v37 ~= nil then {
        v34.originalPrefixText, 
        v34.isUserVerified, 
        v37.displayName, 
        v37.inExperienceCombinedName
    } else {
        v34.originalPrefixText, 
        v34.isUserVerified
    }):map(function(v40) --[[ Line: 120 ]]
        -- upvalues: v10 (ref)
        local v41 = v40[1];
        local v42 = v40[2];
        local v43 = v40[3] or "";
        local v44 = v40[4] or "";
        local l_v41_0 = v41;
        if string.len(v43) > 0 and string.len(v44) > 0 and v43 ~= v44 then
            l_v41_0 = string.gsub(l_v41_0, v43, v44);
        end;
        if string.len(v41) > 0 and v42 then
            l_v41_0 = string.gsub(l_v41_0, ":(%S-)$", v10.VERIFIED_EMOJI .. ":%1");
        end;
        return l_v41_0;
    end);
    local v49 = v4.joinBindings({
        v46, 
        v34.originalPrefixText
    }):map(function(v47) --[[ Line: 144 ]]
        local v48 = v47[1];
        if string.len(v47[2]) == 0 then
            return v48;
        elseif v48:match("^()%s*$") then
            return "";
        else
            return (v48:match("^%s*(.*%S)"));
        end;
    end);
    local v57 = v4.joinBindings({
        v46, 
        v34.originalPrefixText, 
        v34.shouldShowTranslationToggle, 
        v34.originalBodyText, 
        v34.prefixTextProperties
    }):map(function(v50) --[[ Line: 160 ]]
        -- upvalues: v12 (ref)
        local v51 = v50[1];
        local v52 = v50[2];
        local v53 = v50[3];
        local v54 = v50[4];
        local v55 = v50[5];
        if string.len(v52) == 0 then
            return v54;
        else
            local l_v54_0 = v54;
            if v53 then
                l_v54_0 = "     " .. l_v54_0;
            end;
            return v12(v51, v55.FontFace, v55.TextSize) .. " " .. l_v54_0;
        end;
    end);
    local v58 = v4.useBinding(0);
    local v60 = v34.bodyTextProperties:map(function(v59) --[[ Line: 184 ]]
        -- upvalues: l_isSpatialUIEnabled_0 (copy), v36 (copy)
        if l_isSpatialUIEnabled_0 then
            return v36;
        else
            return v59.TextSize;
        end;
    end);
    local v62 = v60:map(function(v61) --[[ Line: 187 ]]
        return UDim2.new(0, v61 - 2, 0, v61 - 2);
    end);
    local v64 = v34.originalPrefixText:map(function(v63) --[[ Line: 190 ]]
        return string.len(v63) > 0;
    end);
    local l_prefixTextProperties_0 = v34.prefixTextProperties;
    local v66 = "UIGradient";
    local l_v66_0 = v66 --[[ copy: 18 -> 36 ]];
    local v69 = l_prefixTextProperties_0:map(function(v68) --[[ Line: 60 ]]
        -- upvalues: l_v66_0 (copy)
        if v68 then
            return v68[l_v66_0];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_0 = if v7 then l_useCursor_0() else nil;
    local l_createElement_0 = v4.createElement;
    local v71 = "Frame";
    local v72 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v34.layoutOrder, 
        Visible = v34.visible
    };
    v66 = {};
    local l_createElement_1 = v4.createElement;
    local v74 = "Frame";
    local v75 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v76 = {};
    local l_createElement_2 = v4.createElement;
    local v78 = "TextLabel";
    local v79 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    local l_prefixTextProperties_1 = v34.prefixTextProperties;
    local v81 = "FontFace";
    local l_v81_0 = v81 --[[ copy: 31 -> 37 ]];
    v79.FontFace = l_prefixTextProperties_1:map(function(v83) --[[ Line: 60 ]]
        -- upvalues: l_v81_0 (copy)
        if v83 then
            return v83[l_v81_0];
        else
            return nil;
        end;
    end);
    v79.RichText = true;
    v79.Text = v46;
    l_prefixTextProperties_1 = v34.prefixTextProperties;
    v81 = "TextColor3";
    local l_v81_1 = v81 --[[ copy: 31 -> 38 ]];
    v79.TextColor3 = l_prefixTextProperties_1:map(function(v85) --[[ Line: 60 ]]
        -- upvalues: l_v81_1 (copy)
        if v85 then
            return v85[l_v81_1];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v34.prefixTextProperties;
    v81 = "TextSize";
    local l_v81_2 = v81 --[[ copy: 31 -> 39 ]];
    v79.TextSize = l_prefixTextProperties_1:map(function(v87) --[[ Line: 60 ]]
        -- upvalues: l_v81_2 (copy)
        if v87 then
            return v87[l_v81_2];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v34.prefixTextProperties;
    v81 = "TextStrokeColor3";
    local l_v81_3 = v81 --[[ copy: 31 -> 40 ]];
    v79.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v89) --[[ Line: 60 ]]
        -- upvalues: l_v81_3 (copy)
        if v89 then
            return v89[l_v81_3];
        else
            return nil;
        end;
    end);
    local l_v29_0 = v29;
    local l_prefixTextProperties_2 = v34.prefixTextProperties;
    local v92 = "TextStrokeTransparency";
    local l_v92_0 = v92 --[[ copy: 32 -> 41 ]];
    v79.TextStrokeTransparency = l_v29_0(l_prefixTextProperties_2:map(function(v94) --[[ Line: 60 ]]
        -- upvalues: l_v92_0 (copy)
        if v94 then
            return v94[l_v92_0];
        else
            return nil;
        end;
    end), v34.textTransparency);
    v79.TextTransparency = v29(v58, v34.textTransparency);
    v79.TextWrapped = true;
    v79.TextXAlignment = Enum.TextXAlignment.Left;
    v79.TextYAlignment = Enum.TextYAlignment.Top;
    v79.Visible = v64;
    l_v29_0 = {};
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "UIGradient";
    local v95 = {};
    local v96 = "Enabled";
    local l_v96_0 = v96 --[[ copy: 33 -> 42 ]];
    v95.Enabled = v69:map(function(v98) --[[ Line: 60 ]]
        -- upvalues: l_v96_0 (copy)
        if v98 then
            return v98[l_v96_0];
        else
            return nil;
        end;
    end);
    v96 = "Color";
    local l_v96_1 = v96 --[[ copy: 33 -> 43 ]];
    v95.Color = v69:map(function(v100) --[[ Line: 60 ]]
        -- upvalues: l_v96_1 (copy)
        if v100 then
            return v100[l_v96_1];
        else
            return nil;
        end;
    end);
    v96 = "Offset";
    local l_v96_2 = v96 --[[ copy: 33 -> 44 ]];
    v95.Offset = v69:map(function(v102) --[[ Line: 60 ]]
        -- upvalues: l_v96_2 (copy)
        if v102 then
            return v102[l_v96_2];
        else
            return nil;
        end;
    end);
    v96 = "Rotation";
    local l_v96_3 = v96 --[[ copy: 33 -> 45 ]];
    v95.Rotation = v69:map(function(v104) --[[ Line: 60 ]]
        -- upvalues: l_v96_3 (copy)
        if v104 then
            return v104[l_v96_3];
        else
            return nil;
        end;
    end);
    v96 = "Transparency";
    v95.Transparency = v69:map(function(v105) --[[ Line: 60 ]]
        -- upvalues: v96 (copy)
        if v105 then
            return v105[v96];
        else
            return nil;
        end;
    end);
    l_v29_0.UIGradient = l_prefixTextProperties_1(l_prefixTextProperties_2, v95);
    v76.PrefixText = l_createElement_2(v78, v79, l_v29_0);
    l_createElement_2 = v4.createElement;
    v78 = "TextLabel";
    v79 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    l_prefixTextProperties_1 = v34.bodyTextProperties;
    v81 = "FontFace";
    local l_v81_4 = v81 --[[ copy: 31 -> 46 ]];
    v79.FontFace = l_prefixTextProperties_1:map(function(v107) --[[ Line: 60 ]]
        -- upvalues: l_v81_4 (copy)
        if v107 then
            return v107[l_v81_4];
        else
            return nil;
        end;
    end);
    v79.RichText = true;
    v79.Size = UDim2.new(1, 0, 0, 0);
    v79.Text = v57;
    l_prefixTextProperties_1 = v34.bodyTextProperties;
    v81 = "TextColor3";
    local l_v81_5 = v81 --[[ copy: 31 -> 47 ]];
    v79.TextColor3 = l_prefixTextProperties_1:map(function(v109) --[[ Line: 60 ]]
        -- upvalues: l_v81_5 (copy)
        if v109 then
            return v109[l_v81_5];
        else
            return nil;
        end;
    end);
    v79.TextSize = v60;
    l_prefixTextProperties_1 = v34.bodyTextProperties;
    v81 = "TextStrokeColor3";
    local l_v81_6 = v81 --[[ copy: 31 -> 48 ]];
    v79.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v111) --[[ Line: 60 ]]
        -- upvalues: l_v81_6 (copy)
        if v111 then
            return v111[l_v81_6];
        else
            return nil;
        end;
    end);
    l_v29_0 = v29;
    l_prefixTextProperties_2 = v34.bodyTextProperties;
    v92 = "TextStrokeTransparency";
    v79.TextStrokeTransparency = l_v29_0(l_prefixTextProperties_2:map(function(v112) --[[ Line: 60 ]]
        -- upvalues: v92 (copy)
        if v112 then
            return v112[v92];
        else
            return nil;
        end;
    end), v34.textTransparency);
    v79.TextTransparency = v29(v58, v34.textTransparency);
    v79.TextWrapped = true;
    v79.TextXAlignment = Enum.TextXAlignment.Left;
    v79.TextYAlignment = Enum.TextYAlignment.Top;
    v76.BodyText = l_createElement_2(v78, v79);
    l_createElement_2 = v4.createElement;
    v78 = "Frame";
    v79 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Visible = v64
    };
    l_v29_0 = {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "TextButton";
    v95 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    v81 = v34.prefixTextProperties;
    local v113 = "FontFace";
    local l_v113_0 = v113 --[[ copy: 35 -> 49 ]];
    v95.FontFace = v81:map(function(v115) --[[ Line: 60 ]]
        -- upvalues: l_v113_0 (copy)
        if v115 then
            return v115[l_v113_0];
        else
            return nil;
        end;
    end);
    v95.RichText = true;
    v95.SelectionImageObject = l_prefixTextProperties_0;
    v95.Size = UDim2.new(0, 0, 0, 0);
    v95.Text = v49;
    v81 = v34.prefixTextProperties;
    v113 = "TextSize";
    v95.TextSize = v81:map(function(v116) --[[ Line: 60 ]]
        -- upvalues: v113 (copy)
        if v116 then
            return v116[v113];
        else
            return nil;
        end;
    end);
    v95.TextStrokeTransparency = 1;
    v95.TextTransparency = 1;
    v95.TextWrapped = true;
    v95.TextXAlignment = Enum.TextXAlignment.Left;
    v95.TextYAlignment = Enum.TextYAlignment.Top;
    v95.LayoutOrder = 1;
    v95[v4.Event.Activated] = v38;
    l_v29_0.TextButton = l_prefixTextProperties_1(l_prefixTextProperties_2, v95);
    l_v29_0.TranslationButton = v4.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        HoverImage = "rbxasset://textures/translateIconDark.png", 
        Image = "rbxasset://textures/translateIcon.png", 
        ImageTransparency = v29(v58, v34.textTransparency), 
        LayoutOrder = 2, 
        PressedImage = "rbxasset://textures/translateIconDark.png", 
        SelectionImageObject = l_prefixTextProperties_0, 
        Size = v62, 
        Visible = v34.shouldShowTranslationToggle, 
        [v4.Event.Activated] = v39
    });
    v76.TextMessageButton = l_createElement_2(v78, v79, l_v29_0);
    v66.TextMessage = l_createElement_1(v74, v75, v76);
    l_createElement_0 = l_createElement_0(v71, v72, v66);
    if v8 then
        debug.profileend();
    end;
    return l_createElement_0;
end);
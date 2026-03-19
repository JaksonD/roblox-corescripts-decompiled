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
local function v20(v15) --[[ Line: 25 ]] --[[ Name: useCombinedName ]]
    -- upvalues: l_UserProfileStore_0 (copy), v3 (copy)
    if not v15 then
        return nil;
    else
        local v16 = tostring(v15);
        local v17 = l_UserProfileStore_0.get().fetchNamesByUserIds({
            v16
        })(false).data[1];
        local v18 = v3.useSignalBinding(v17.names.getDisplayName);
        local v19 = v3.useSignalBinding(v17.names.getInExperienceCombinedName);
        return {
            displayName = v18, 
            inExperienceCombinedName = v19
        };
    end;
end;
local function _(v21) --[[ Line: 38 ]] --[[ Name: trim ]]
    if v21:match("^()%s*$") then
        return "";
    else
        return (v21:match("^%s*(.*%S)"));
    end;
end;
local function v28(v23, v24) --[[ Line: 44 ]] --[[ Name: mergeTransparency ]]
    -- upvalues: v4 (copy)
    return v4.joinBindings({
        v23, 
        v24
    }):map(function(v25) --[[ Line: 48 ]]
        local v26 = v25[1];
        local v27 = v25[2];
        if v26 == nil then
            return 1;
        else
            return v26 + v27 * (1 - v26);
        end;
    end);
end;
local function _(v29, v30) --[[ Line: 55 ]] --[[ Name: getPropertyFromObjBinding ]]
    return v29:map(function(v31) --[[ Line: 59 ]]
        -- upvalues: v30 (copy)
        if v31 then
            return v31[v30];
        else
            return nil;
        end;
    end);
end;
return v4.memo(function(v33) --[[ Line: 84 ]] --[[ Name: TranslatedTextMessage ]]
    -- upvalues: v8 (copy), v20 (copy), v4 (copy), v10 (copy), v12 (copy), v7 (copy), l_useCursor_0 (copy), v28 (copy)
    if v8 then
        debug.profilebegin("TranslatedTextMessage");
    end;
    local l_isSpatialUIEnabled_0 = v33.isSpatialUIEnabled;
    local v35 = if l_isSpatialUIEnabled_0 then v33.chatWindowSettings.SpatialPanelTextSize else v33.chatWindowSettings.TextSize;
    if v8 then
        debug.profilebegin("useCombinedName");
    end;
    local v36 = v20(v33.userId.current);
    if v8 then
        debug.profileend();
    end;
    local v37 = v4.useCallback(function() --[[ Line: 102 ]]
        -- upvalues: v33 (copy)
        v33.onTextMessageLabelButtonActivated(v33.userId.current);
    end, {
        v33.onTextMessageLabelButtonActivated
    });
    local v38 = v4.useCallback(function() --[[ Line: 106 ]]
        -- upvalues: v33 (copy)
        v33.onToggle(not v33.useTranslation.current, v33.messageId.current);
    end, {
        v33.onToggle
    });
    local v45 = v4.joinBindings(if v36 ~= nil then {
        v33.originalPrefixText, 
        v33.isUserVerified, 
        v36.displayName, 
        v36.inExperienceCombinedName
    } else {
        v33.originalPrefixText, 
        v33.isUserVerified
    }):map(function(v39) --[[ Line: 118 ]]
        -- upvalues: v10 (ref)
        local v40 = v39[1];
        local v41 = v39[2];
        local v42 = v39[3] or "";
        local v43 = v39[4] or "";
        local l_v40_0 = v40;
        if string.len(v42) > 0 and string.len(v43) > 0 and v42 ~= v43 then
            l_v40_0 = string.gsub(l_v40_0, v42, v43);
        end;
        if string.len(v40) > 0 and v41 then
            l_v40_0 = string.gsub(l_v40_0, ":(%S-)$", v10.VERIFIED_EMOJI .. ":%1");
        end;
        return l_v40_0;
    end);
    local v48 = v4.joinBindings({
        v45, 
        v33.originalPrefixText
    }):map(function(v46) --[[ Line: 142 ]]
        local v47 = v46[1];
        if string.len(v46[2]) == 0 then
            return v47;
        elseif v47:match("^()%s*$") then
            return "";
        else
            return (v47:match("^%s*(.*%S)"));
        end;
    end);
    local v56 = v4.joinBindings({
        v45, 
        v33.originalPrefixText, 
        v33.shouldShowTranslationToggle, 
        v33.originalBodyText, 
        v33.prefixTextProperties
    }):map(function(v49) --[[ Line: 158 ]]
        -- upvalues: v12 (ref)
        local v50 = v49[1];
        local v51 = v49[2];
        local v52 = v49[3];
        local v53 = v49[4];
        local v54 = v49[5];
        if string.len(v51) == 0 then
            return v53;
        else
            local l_v53_0 = v53;
            if v52 then
                l_v53_0 = "     " .. l_v53_0;
            end;
            return v12(v50, v54.FontFace, v54.TextSize) .. " " .. l_v53_0;
        end;
    end);
    local v57 = v4.useBinding(0);
    local v59 = v33.bodyTextProperties:map(function(v58) --[[ Line: 182 ]]
        -- upvalues: l_isSpatialUIEnabled_0 (copy), v35 (copy)
        if l_isSpatialUIEnabled_0 then
            return v35;
        else
            return v58.TextSize;
        end;
    end);
    local v61 = v59:map(function(v60) --[[ Line: 185 ]]
        return UDim2.new(0, v60 - 2, 0, v60 - 2);
    end);
    local v63 = v33.originalPrefixText:map(function(v62) --[[ Line: 188 ]]
        return string.len(v62) > 0;
    end);
    local l_prefixTextProperties_0 = v33.prefixTextProperties;
    local v65 = "UIGradient";
    local l_v65_0 = v65 --[[ copy: 18 -> 36 ]];
    local v68 = l_prefixTextProperties_0:map(function(v67) --[[ Line: 59 ]]
        -- upvalues: l_v65_0 (copy)
        if v67 then
            return v67[l_v65_0];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_0 = if v7 then l_useCursor_0() else nil;
    local l_createElement_0 = v4.createElement;
    local v70 = "Frame";
    local v71 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        LayoutOrder = v33.layoutOrder
    };
    v65 = {};
    local l_createElement_1 = v4.createElement;
    local v73 = "Frame";
    local v74 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1
    };
    local v75 = {};
    local l_createElement_2 = v4.createElement;
    local v77 = "TextLabel";
    local v78 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    local l_prefixTextProperties_1 = v33.prefixTextProperties;
    local v80 = "FontFace";
    local l_v80_0 = v80 --[[ copy: 31 -> 37 ]];
    v78.FontFace = l_prefixTextProperties_1:map(function(v82) --[[ Line: 59 ]]
        -- upvalues: l_v80_0 (copy)
        if v82 then
            return v82[l_v80_0];
        else
            return nil;
        end;
    end);
    v78.RichText = true;
    v78.Text = v45;
    l_prefixTextProperties_1 = v33.prefixTextProperties;
    v80 = "TextColor3";
    local l_v80_1 = v80 --[[ copy: 31 -> 38 ]];
    v78.TextColor3 = l_prefixTextProperties_1:map(function(v84) --[[ Line: 59 ]]
        -- upvalues: l_v80_1 (copy)
        if v84 then
            return v84[l_v80_1];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v33.prefixTextProperties;
    v80 = "TextSize";
    local l_v80_2 = v80 --[[ copy: 31 -> 39 ]];
    v78.TextSize = l_prefixTextProperties_1:map(function(v86) --[[ Line: 59 ]]
        -- upvalues: l_v80_2 (copy)
        if v86 then
            return v86[l_v80_2];
        else
            return nil;
        end;
    end);
    l_prefixTextProperties_1 = v33.prefixTextProperties;
    v80 = "TextStrokeColor3";
    local l_v80_3 = v80 --[[ copy: 31 -> 40 ]];
    v78.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v88) --[[ Line: 59 ]]
        -- upvalues: l_v80_3 (copy)
        if v88 then
            return v88[l_v80_3];
        else
            return nil;
        end;
    end);
    local l_v28_0 = v28;
    local l_prefixTextProperties_2 = v33.prefixTextProperties;
    local v91 = "TextStrokeTransparency";
    local l_v91_0 = v91 --[[ copy: 32 -> 41 ]];
    v78.TextStrokeTransparency = l_v28_0(l_prefixTextProperties_2:map(function(v93) --[[ Line: 59 ]]
        -- upvalues: l_v91_0 (copy)
        if v93 then
            return v93[l_v91_0];
        else
            return nil;
        end;
    end), v33.textTransparency);
    v78.TextTransparency = v28(v57, v33.textTransparency);
    v78.TextWrapped = true;
    v78.TextXAlignment = Enum.TextXAlignment.Left;
    v78.TextYAlignment = Enum.TextYAlignment.Top;
    v78.Visible = v63;
    l_v28_0 = {};
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "UIGradient";
    local v94 = {};
    local v95 = "Enabled";
    local l_v95_0 = v95 --[[ copy: 33 -> 42 ]];
    v94.Enabled = v68:map(function(v97) --[[ Line: 59 ]]
        -- upvalues: l_v95_0 (copy)
        if v97 then
            return v97[l_v95_0];
        else
            return nil;
        end;
    end);
    v95 = "Color";
    local l_v95_1 = v95 --[[ copy: 33 -> 43 ]];
    v94.Color = v68:map(function(v99) --[[ Line: 59 ]]
        -- upvalues: l_v95_1 (copy)
        if v99 then
            return v99[l_v95_1];
        else
            return nil;
        end;
    end);
    v95 = "Offset";
    local l_v95_2 = v95 --[[ copy: 33 -> 44 ]];
    v94.Offset = v68:map(function(v101) --[[ Line: 59 ]]
        -- upvalues: l_v95_2 (copy)
        if v101 then
            return v101[l_v95_2];
        else
            return nil;
        end;
    end);
    v95 = "Rotation";
    local l_v95_3 = v95 --[[ copy: 33 -> 45 ]];
    v94.Rotation = v68:map(function(v103) --[[ Line: 59 ]]
        -- upvalues: l_v95_3 (copy)
        if v103 then
            return v103[l_v95_3];
        else
            return nil;
        end;
    end);
    v95 = "Transparency";
    v94.Transparency = v68:map(function(v104) --[[ Line: 59 ]]
        -- upvalues: v95 (copy)
        if v104 then
            return v104[v95];
        else
            return nil;
        end;
    end);
    l_v28_0.UIGradient = l_prefixTextProperties_1(l_prefixTextProperties_2, v94);
    v75.PrefixText = l_createElement_2(v77, v78, l_v28_0);
    l_createElement_2 = v4.createElement;
    v77 = "TextLabel";
    v78 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    l_prefixTextProperties_1 = v33.bodyTextProperties;
    v80 = "FontFace";
    local l_v80_4 = v80 --[[ copy: 31 -> 46 ]];
    v78.FontFace = l_prefixTextProperties_1:map(function(v106) --[[ Line: 59 ]]
        -- upvalues: l_v80_4 (copy)
        if v106 then
            return v106[l_v80_4];
        else
            return nil;
        end;
    end);
    v78.RichText = true;
    v78.Size = UDim2.new(1, 0, 0, 0);
    v78.Text = v56;
    l_prefixTextProperties_1 = v33.bodyTextProperties;
    v80 = "TextColor3";
    local l_v80_5 = v80 --[[ copy: 31 -> 47 ]];
    v78.TextColor3 = l_prefixTextProperties_1:map(function(v108) --[[ Line: 59 ]]
        -- upvalues: l_v80_5 (copy)
        if v108 then
            return v108[l_v80_5];
        else
            return nil;
        end;
    end);
    v78.TextSize = v59;
    l_prefixTextProperties_1 = v33.bodyTextProperties;
    v80 = "TextStrokeColor3";
    local l_v80_6 = v80 --[[ copy: 31 -> 48 ]];
    v78.TextStrokeColor3 = l_prefixTextProperties_1:map(function(v110) --[[ Line: 59 ]]
        -- upvalues: l_v80_6 (copy)
        if v110 then
            return v110[l_v80_6];
        else
            return nil;
        end;
    end);
    l_v28_0 = v28;
    l_prefixTextProperties_2 = v33.bodyTextProperties;
    v91 = "TextStrokeTransparency";
    v78.TextStrokeTransparency = l_v28_0(l_prefixTextProperties_2:map(function(v111) --[[ Line: 59 ]]
        -- upvalues: v91 (copy)
        if v111 then
            return v111[v91];
        else
            return nil;
        end;
    end), v33.textTransparency);
    v78.TextTransparency = v28(v57, v33.textTransparency);
    v78.TextWrapped = true;
    v78.TextXAlignment = Enum.TextXAlignment.Left;
    v78.TextYAlignment = Enum.TextYAlignment.Top;
    v75.BodyText = l_createElement_2(v77, v78);
    l_createElement_2 = v4.createElement;
    v77 = "Frame";
    v78 = {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Size = UDim2.new(1, 0, 0, 0), 
        Visible = v63
    };
    l_v28_0 = {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 4)
        })
    };
    l_prefixTextProperties_1 = v4.createElement;
    l_prefixTextProperties_2 = "TextButton";
    v94 = {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    };
    v80 = v33.prefixTextProperties;
    local v112 = "FontFace";
    local l_v112_0 = v112 --[[ copy: 35 -> 49 ]];
    v94.FontFace = v80:map(function(v114) --[[ Line: 59 ]]
        -- upvalues: l_v112_0 (copy)
        if v114 then
            return v114[l_v112_0];
        else
            return nil;
        end;
    end);
    v94.RichText = true;
    v94.SelectionImageObject = l_prefixTextProperties_0;
    v94.Size = UDim2.new(0, 0, 0, 0);
    v94.Text = v48;
    v80 = v33.prefixTextProperties;
    v112 = "TextSize";
    v94.TextSize = v80:map(function(v115) --[[ Line: 59 ]]
        -- upvalues: v112 (copy)
        if v115 then
            return v115[v112];
        else
            return nil;
        end;
    end);
    v94.TextStrokeTransparency = 1;
    v94.TextTransparency = 1;
    v94.TextWrapped = true;
    v94.TextXAlignment = Enum.TextXAlignment.Left;
    v94.TextYAlignment = Enum.TextYAlignment.Top;
    v94.LayoutOrder = 1;
    v94[v4.Event.Activated] = v37;
    l_v28_0.TextButton = l_prefixTextProperties_1(l_prefixTextProperties_2, v94);
    l_v28_0.TranslationButton = v4.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        HoverImage = "rbxasset://textures/translateIconDark.png", 
        Image = "rbxasset://textures/translateIcon.png", 
        ImageTransparency = v28(v57, v33.textTransparency), 
        LayoutOrder = 2, 
        PressedImage = "rbxasset://textures/translateIconDark.png", 
        SelectionImageObject = l_prefixTextProperties_0, 
        Size = v61, 
        Visible = v33.shouldShowTranslationToggle, 
        [v4.Event.Activated] = v38
    });
    v75.TextMessageButton = l_createElement_2(v77, v78, l_v28_0);
    v65.TextMessage = l_createElement_1(v73, v74, v75);
    l_createElement_0 = l_createElement_0(v70, v71, v65);
    if v8 then
        debug.profileend();
    end;
    return l_createElement_0;
end);
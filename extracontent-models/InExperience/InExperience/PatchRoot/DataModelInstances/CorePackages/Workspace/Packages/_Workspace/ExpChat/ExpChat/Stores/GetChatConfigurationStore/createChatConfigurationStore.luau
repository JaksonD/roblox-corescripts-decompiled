local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.tutils);
local l_createSignal_0 = v2.createSignal;
local l_createComputed_0 = v2.createComputed;
local v6 = require(l_script_FirstAncestor_0.installReducer.BubbleChat.DefaultSettings);
return function() --[[ Line: 111 ]] --[[ Name: createChatConfigurationStore ]]
    -- upvalues: v6 (copy), l_script_FirstAncestor_0 (copy), l_createSignal_0 (copy), v3 (copy), l_createComputed_0 (copy)
    local v7 = table.clone(v6);
    local v8 = require(l_script_FirstAncestor_0.Config);
    local v9 = {
        FontFace = v8.ChatWindowFont, 
        TextColor3 = v8.ChatWindowTextColor3, 
        TextSize = v8.ChatWindowTextSize, 
        TextStrokeColor3 = v8.ChatWindowTextStrokeColor, 
        TextStrokeTransparency = v8.ChatWindowTextStrokeTransparency, 
        BackgroundColor3 = v8.ChatWindowBackgroundColor3, 
        BackgroundTransparency = v8.ChatWindowBackgroundTransparency, 
        HeightScale = 1, 
        WidthScale = 1, 
        SpatialPanelTextSize = v8.ChatWindowSpatialPanelTextSize
    };
    local v10 = {
        BackgroundTransparency = v8.ChatInputBarBackgroundTransparency, 
        BackgroundColor3 = v8.ChatInputBarBackgroundColor, 
        TextSize = v8.ChatInputBarTextSize, 
        TextColor3 = v8.ChatInputBarTextColor3, 
        SpatialPanelTextSize = v8.ChatInputBarSpatialPanelTextSize, 
        TextStrokeColor3 = v8.ChatInputBarTextStrokeColor, 
        TextStrokeTransparency = v8.ChatInputBarTextStrokeTransparency, 
        FontFace = v8.ChatInputBarFontFace, 
        PlaceholderColor3 = v8.ChatInputBarPlaceholderColor, 
        KeyboardKeyCode = v8.ChatInputBarDefaultFocusKeyCode, 
        AutocompleteEnabled = v8.ChatInputBarDefaultAutocompleteEnabled
    };
    local v11 = {
        BackgroundTransparency = v8.ChannelTabsSettings.BackgroundTransparency, 
        BackgroundColor3 = v8.ChannelTabsSettings.BackgroundColor3, 
        HoverBackgroundColor3 = v8.ChannelTabsSettings.HoverBackgroundColor3, 
        FontFace = v8.ChannelTabsSettings.FontFace, 
        TextSize = v8.ChannelTabsSettings.TextSize, 
        TextColor3 = v8.ChannelTabsSettings.TextColor3, 
        SelectedTabTextColor3 = v8.ChannelTabsSettings.SelectedTabTextColor3, 
        TextStrokeColor3 = v8.ChannelTabsSettings.TextStrokeColor3, 
        TextStrokeTransparency = v8.ChannelTabsSettings.TextStrokeTransparency
    };
    local v12, v13 = l_createSignal_0(v7, v3.deepEqual);
    local v14, v15 = l_createSignal_0(v9, v3.deepEqual);
    local v16, v17 = l_createSignal_0(v10, v3.deepEqual);
    local v18, v19 = l_createSignal_0(v11, v3.deepEqual);
    local v21 = l_createComputed_0(function(v20) --[[ Line: 157 ]]
        -- upvalues: v12 (copy)
        return v12(v20).Enabled or false;
    end);
    return {
        getBubbleChatSettings = v12, 
        getChatWindowSettings = v14, 
        getChatInputBarSettings = v16, 
        getChannelTabsSettings = v18, 
        setBubbleChatSettings = v13, 
        setChatWindowSettings = v15, 
        setChatInputBarSettings = v17, 
        setChannelTabsSettings = v19, 
        mergeBubbleChatSettings = function(v22) --[[ Line: 163 ]] --[[ Name: mergeBubbleChatSettings ]]
            -- upvalues: v13 (copy)
            v13(function(v23) --[[ Line: 164 ]]
                -- upvalues: v22 (copy)
                local v24 = table.clone(v23);
                for v25, v26 in pairs(v22) do
                    v24[v25] = v26;
                end;
                return v24;
            end);
        end, 
        mergeChatWindowSettings = function(v27) --[[ Line: 173 ]] --[[ Name: mergeChatWindowSettings ]]
            -- upvalues: v15 (copy)
            v15(function(v28) --[[ Line: 174 ]]
                -- upvalues: v27 (copy)
                local v29 = table.clone(v28);
                for v30, v31 in pairs(v27) do
                    v29[v30] = v31;
                end;
                return v29;
            end);
        end, 
        mergeChatInputBarSettings = function(v32) --[[ Line: 183 ]] --[[ Name: mergeChatInputBarSettings ]]
            -- upvalues: v17 (copy)
            v17(function(v33) --[[ Line: 184 ]]
                -- upvalues: v32 (copy)
                local v34 = table.clone(v33);
                for v35, v36 in pairs(v32) do
                    v34[v35] = v36;
                end;
                return v34;
            end);
        end, 
        mergeChannelTabsSettings = function(v37) --[[ Line: 193 ]] --[[ Name: mergeChannelTabsSettings ]]
            -- upvalues: v19 (copy)
            v19(function(v38) --[[ Line: 194 ]]
                -- upvalues: v37 (copy)
                local v39 = table.clone(v38);
                for v40, v41 in pairs(v37) do
                    v39[v40] = v41;
                end;
                return v39;
            end);
        end, 
        setBubbleChatProperty = function(v42, v43) --[[ Line: 203 ]] --[[ Name: setBubbleChatProperty ]]
            -- upvalues: v13 (copy)
            v13(function(v44) --[[ Line: 204 ]]
                -- upvalues: v42 (copy), v43 (copy)
                local v45 = table.clone(v44);
                v45[v42] = v43;
                return v45;
            end);
        end, 
        setChatWindowProperty = function(v46, v47) --[[ Line: 211 ]] --[[ Name: setChatWindowProperty ]]
            -- upvalues: v15 (copy)
            v15(function(v48) --[[ Line: 212 ]]
                -- upvalues: v46 (copy), v47 (copy)
                local v49 = table.clone(v48);
                v49[v46] = v47;
                return v49;
            end);
        end, 
        setChatInputBarProperty = function(v50, v51) --[[ Line: 219 ]] --[[ Name: setChatInputBarProperty ]]
            -- upvalues: v17 (copy)
            v17(function(v52) --[[ Line: 220 ]]
                -- upvalues: v50 (copy), v51 (copy)
                local v53 = table.clone(v52);
                v53[v50] = v51;
                return v53;
            end);
        end, 
        setChannelTabsProperty = function(v54, v55) --[[ Line: 227 ]] --[[ Name: setChannelTabsProperty ]]
            -- upvalues: v19 (copy)
            v19(function(v56) --[[ Line: 228 ]]
                -- upvalues: v54 (copy), v55 (copy)
                local v57 = table.clone(v56);
                v57[v54] = v55;
                return v57;
            end);
        end, 
        getIsBubbleChatEnabled = v21
    };
end;
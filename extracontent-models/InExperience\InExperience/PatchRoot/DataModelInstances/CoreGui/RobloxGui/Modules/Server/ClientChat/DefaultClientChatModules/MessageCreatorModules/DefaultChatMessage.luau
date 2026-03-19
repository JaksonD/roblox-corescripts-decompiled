local v0 = false;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2");
end);
v0 = l_status_0 and l_result_0;
l_status_0 = game:GetService("Players");
l_result_0 = script.Parent.Parent;
local l_ChatSettings_0 = require(l_result_0:WaitForChild("ChatSettings"));
local l_ChatConstants_0 = require(l_result_0:WaitForChild("ChatConstants"));
local l_Util_0 = require(script.Parent:WaitForChild("Util"));
local v6 = utf8.char(57344);
IsPlayerVerified = function(v7) --[[ Line: 23 ]] --[[ Name: IsPlayerVerified ]]
    -- upvalues: l_status_0 (copy)
    local l_l_status_0_PlayerByUserId_0 = l_status_0:GetPlayerByUserId(v7);
    if not l_l_status_0_PlayerByUserId_0 then
        return false;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: l_l_status_0_PlayerByUserId_0 (copy)
            return l_l_status_0_PlayerByUserId_0.HasVerifiedBadge;
        end);
        if l_status_1 then
            return l_result_1;
        else
            return false;
        end;
    end;
end;
AppendVerifiedBadge = function(v11) --[[ Line: 37 ]] --[[ Name: AppendVerifiedBadge ]]
    -- upvalues: v6 (copy)
    return v11 .. v6;
end;
CreateMessageLabel = function(v12, v13, v14) --[[ Line: 41 ]] --[[ Name: CreateMessageLabel ]]
    -- upvalues: l_ChatSettings_0 (copy), l_Util_0 (copy), v0 (ref)
    local l_FromSpeaker_0 = v12.FromSpeaker;
    local v16 = nil;
    v16 = if l_ChatSettings_0.PlayerDisplayNamesEnabled and v12.SpeakerDisplayName then v12.SpeakerDisplayName else l_FromSpeaker_0;
    local l_SpeakerUserId_0 = v12.SpeakerUserId;
    if IsPlayerVerified(l_SpeakerUserId_0) then
        v16 = AppendVerifiedBadge(v16);
    end;
    local _ = v12.Message;
    local v19 = v12.ExtraData or {};
    local v20 = v19.Font or l_ChatSettings_0.DefaultFont;
    local v21 = v19.TextSize or l_ChatSettings_0.ChatWindowTextSize;
    local v22 = v19.NameColor or l_ChatSettings_0.DefaultNameColor;
    local v23 = v19.ChatColor or l_ChatSettings_0.DefaultMessageColor;
    local v24 = v19.ChannelColor or v23;
    local v25 = v19.Tags or {};
    local v26 = string.format("[%s]:", v16);
    local _ = l_Util_0:GetStringTextBounds(v26, v20, v21);
    local v28 = l_Util_0:GetNumberOfSpaces(v26, v20, v21) + 1;
    local l_l_Util_0_BaseMessage_0, v30 = l_Util_0:CreateBaseMessage("", v20, v21, v23);
    local v31 = l_Util_0:AddNameButtonToBaseMessage(v30, v22, v26, l_FromSpeaker_0);
    local v32 = nil;
    local v33 = UDim2.new(0, 0, 0, 0);
    if v13 ~= v12.OriginalChannel then
        local v34 = string.format("{%s}", v12.OriginalChannel);
        v32 = l_Util_0:AddChannelButtonToBaseMessage(v30, v24, v34, v12.OriginalChannel);
        v33 = UDim2.new(0, v32.Size.X.Offset + l_Util_0:GetStringTextBounds(" ", v20, v21).X, 0, 0);
        v28 = v28 + l_Util_0:GetNumberOfSpaces(v34, v20, v21) + 1;
    end;
    local v35 = {};
    for _, v37 in pairs(v25) do
        local v38 = v37.TagColor or Color3.fromRGB(255, 0, 255);
        local v39 = v37.TagText or "???";
        local v40 = string.format("[%s] ", v39);
        local v41 = l_Util_0:AddTagLabelToBaseMessage(v30, v38, v40);
        v41.Position = v33;
        v28 = v28 + l_Util_0:GetNumberOfSpaces(v40, v20, v21);
        v33 = v33 + UDim2.new(0, v41.Size.X.Offset, 0, 0);
        table.insert(v35, v41);
    end;
    v31.Position = v33;
    local v42 = false;
    local v43 = nil;
    if v0 then
        pcall(function() --[[ Line: 105 ]]
            -- upvalues: v43 (ref), l_Util_0 (ref), v30 (copy), v33 (ref), v31 (copy)
            v43 = l_Util_0:AddTranslationButtonToBaseMessage(v30);
            v33 = v33 + UDim2.new(0, v31.Size.X.Offset + 2, 0, 0);
            v43.Position = v33;
        end);
    end;
    local function v46(v44) --[[ Line: 112 ]] --[[ Name: useOriginalText ]]
        -- upvalues: v42 (ref), v12 (copy), v30 (copy), l_Util_0 (ref), v28 (ref)
        v42 = false;
        if v12.IsFiltered then
            v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(v44.Message);
            return;
        else
            local v45 = v44.MessageLengthUtf8 or v44.MessageLength;
            v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. string.rep("_", v45);
            return;
        end;
    end;
    local function _(v47) --[[ Line: 122 ]] --[[ Name: useTranslatedText ]]
        -- upvalues: v43 (ref), v28 (ref), v42 (ref), v46 (copy), v30 (copy), l_Util_0 (ref)
        if v43 == nil then
            return;
        else
            if v43.Visible == false then
                v28 = v28 + 6;
            end;
            v43.Visible = true;
            v42 = true;
            if v47.TranslatedMessage == "" then
                v46(v47);
                return;
            else
                v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(v47.TranslatedMessage);
                return;
            end;
        end;
    end;
    local function _(v49) --[[ Line: 142 ]] --[[ Name: UpdateTextFunction_Chat ]]
        -- upvalues: v12 (copy), v43 (ref), v28 (ref), v42 (ref), v46 (copy), v30 (copy), l_Util_0 (ref)
        v12.TranslatedMessage = v49.TranslatedMessage;
        if v49.TranslatedMessage then
            if v43 == nil then
                return;
            else
                if v43.Visible == false then
                    v28 = v28 + 6;
                end;
                v43.Visible = true;
                v42 = true;
                if v49.TranslatedMessage == "" then
                    v46(v49);
                    return;
                else
                    v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(v49.TranslatedMessage);
                    return;
                end;
            end;
        else
            v46(v49);
            return;
        end;
    end;
    local function v53(v51) --[[ Line: 151 ]] --[[ Name: UpdateTextFunction ]]
        -- upvalues: v0 (ref), v12 (copy), v43 (ref), v28 (ref), v42 (ref), v46 (copy), v30 (copy), l_Util_0 (ref)
        if v0 then
            v12.TranslatedMessage = v51.TranslatedMessage;
            if v51.TranslatedMessage then
                if v43 == nil then
                    return;
                else
                    if v43.Visible == false then
                        v28 = v28 + 6;
                    end;
                    v43.Visible = true;
                    v42 = true;
                    if v51.TranslatedMessage == "" then
                        v46(v51);
                        return;
                    else
                        v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(v51.TranslatedMessage);
                        return;
                    end;
                end;
            else
                v46(v51);
                return;
            end;
        elseif v12.IsFiltered then
            v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(v51.Message);
            return;
        else
            local v52 = v51.MessageLengthUtf8 or v51.MessageLength;
            v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. string.rep("_", v52);
            return;
        end;
    end;
    local function _() --[[ Line: 164 ]] --[[ Name: toggleTranslation ]]
        -- upvalues: v42 (ref), v12 (copy), v43 (ref), v28 (ref), v46 (copy), v30 (copy), l_Util_0 (ref), v14 (copy)
        if not v42 and v12.TranslatedMessage then
            local l_v12_0 = v12;
            if v43 ~= nil then
                if v43.Visible == false then
                    v28 = v28 + 6;
                end;
                v43.Visible = true;
                v42 = true;
                if l_v12_0.TranslatedMessage == "" then
                    v46(l_v12_0);
                else
                    v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(l_v12_0.TranslatedMessage);
                end;
            end;
        else
            v46(v12);
        end;
        if v14 then
            v14();
        end;
    end;
    if v0 and v43 ~= nil then
        local v57 = v43.MouseButton1Click:connect(function() --[[ Line: 176 ]]
            -- upvalues: v42 (ref), v12 (copy), v43 (ref), v28 (ref), v46 (copy), v30 (copy), l_Util_0 (ref), v14 (copy)
            if not v42 and v12.TranslatedMessage then
                local l_v12_1 = v12;
                if v43 ~= nil then
                    if v43.Visible == false then
                        v28 = v28 + 6;
                    end;
                    v43.Visible = true;
                    v42 = true;
                    if l_v12_1.TranslatedMessage == "" then
                        v46(l_v12_1);
                    else
                        v30.Text = l_Util_0:CreateLeadingSpaces(v28) .. l_Util_0:SanitizeForRichText(l_v12_1.TranslatedMessage);
                    end;
                end;
            else
                v46(v12);
            end;
            if v14 then
                v14();
            end;
        end);
        local v58 = nil;
        local l_v57_0 = v57 --[[ copy: 30 -> 38 ]];
        do
            local l_v58_0 = v58;
            l_v58_0 = v43.Changed:connect(function(v61) --[[ Line: 181 ]]
                -- upvalues: l_v57_0 (copy), l_v58_0 (ref)
                if v61 == "Parent" then
                    l_v57_0:Disconnect();
                    l_v58_0:Disconnect();
                end;
            end);
        end;
    end;
    v53(v12);
    local function v63(v62) --[[ Line: 191 ]] --[[ Name: GetHeightFunction ]]
        -- upvalues: l_Util_0 (ref), v30 (copy), l_l_Util_0_BaseMessage_0 (copy)
        return l_Util_0:GetMessageHeight(v30, l_l_Util_0_BaseMessage_0, v62);
    end;
    local v64 = {
        [v31] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        }
    };
    if v0 and v43 ~= nil then
        v64[v43] = {
            ImageTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }
        };
    end;
    v64[v30] = {
        TextTransparency = {
            FadedIn = 0, 
            FadedOut = 1
        }, 
        TextStrokeTransparency = {
            FadedIn = 0.75, 
            FadedOut = 1
        }
    };
    for v65, v66 in pairs(v35) do
        local _ = string.format("Tag%d", v65);
        v64[v66] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        };
    end;
    if v32 then
        v64[v32] = {
            TextTransparency = {
                FadedIn = 0, 
                FadedOut = 1
            }, 
            TextStrokeTransparency = {
                FadedIn = 0.75, 
                FadedOut = 1
            }
        };
    end;
    local l_l_Util_0_FadeFunctions_0, v69, v70 = l_Util_0:CreateFadeFunctions(v64);
    return {
        [l_Util_0.KEY_BASE_FRAME] = l_l_Util_0_BaseMessage_0, 
        [l_Util_0.KEY_BASE_MESSAGE] = v30, 
        [l_Util_0.KEY_UPDATE_TEXT_FUNC] = v53, 
        [l_Util_0.KEY_GET_HEIGHT] = v63, 
        [l_Util_0.KEY_FADE_IN] = l_l_Util_0_FadeFunctions_0, 
        [l_Util_0.KEY_FADE_OUT] = v69, 
        [l_Util_0.KEY_UPDATE_ANIMATION] = v70
    };
end;
return {
    [l_Util_0.KEY_MESSAGE_TYPE] = l_ChatConstants_0.MessageTypeDefault, 
    [l_Util_0.KEY_CREATOR_FUNCTION] = CreateMessageLabel
};
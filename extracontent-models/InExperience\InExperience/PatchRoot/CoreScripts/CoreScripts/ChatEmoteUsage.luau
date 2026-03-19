local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local _ = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Stats_0 = game:GetService("Stats");
local l_CoreGui_0 = game:GetService("CoreGui");
local v5 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Constants);
local v6 = require(l_CoreGui_0.RobloxGui.Modules.EmotesMenu.Utility.MaybeSendEmoteFailureAnalyticsFromPlayer);
while l_Players_0.LocalPlayer == nil do
    wait();
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local function v9(v8) --[[ Line: 30 ]] --[[ Name: reportEmoteUsed ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (copy), l_Stats_0 (copy)
    l_RbxAnalyticsService_0:SetRBXEventStream("client", "chat", "emoteTriggered", {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_LocalPlayer_0.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        assetID = if v8.AssetId then tostring(v8.AssetId) else nil, 
        slotNumber = if v8.Slot then tostring(v8.Slot) else nil
    });
end;
local function v12(v10, v11) --[[ Line: 40 ]] --[[ Name: reportEmoteFailed ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy), l_LocalPlayer_0 (copy), l_Stats_0 (copy)
    l_RbxAnalyticsService_0:SendEventDeferred("client", "chat", "emoteTriggerFailed", {
        pid = tostring(game.PlaceId), 
        uid = tostring(l_LocalPlayer_0.UserId), 
        btid = l_Stats_0:GetBrowserTrackerId(), 
        assetID = if v11 and v11.AssetId then tostring(v11.AssetId) else nil, 
        slotNumber = if v11 and v11.Slot then tostring(v11.Slot) else nil, 
        errorType = v10, 
        invokedByCoreGui = false
    });
end;
local function _(v13) --[[ Line: 52 ]] --[[ Name: getHumanoidFromPlayer ]]
    local l_Character_0 = v13.Character;
    if l_Character_0 then
        return l_Character_0:FindFirstChildOfClass("Humanoid");
    else
        return nil;
    end;
end;
local function _(v16) --[[ Line: 61 ]] --[[ Name: getHumanoidDescriptionFromPlayer ]]
    local l_Character_1 = v16.Character;
    local v18 = if l_Character_1 then l_Character_1:FindFirstChildOfClass("Humanoid") else nil;
    if v18 then
        return v18:FindFirstChildOfClass("HumanoidDescription");
    else
        return nil;
    end;
end;
local function _(v20) --[[ Line: 70 ]] --[[ Name: getEmoteFromMessage ]]
    if string.sub(v20, 1, 3) == "/e " then
        return string.sub(v20, 4):lower();
    elseif string.sub(v20, 1, 7) == "/emote " then
        return string.sub(v20, 8):lower();
    else
        return nil;
    end;
end;
local _ = function(v22, v23) --[[ Line: 80 ]] --[[ Name: getEquippedEmoteFromSlot ]]
    local l_v22_EquippedEmotes_0 = v22:GetEquippedEmotes();
    for _, v26 in ipairs(l_v22_EquippedEmotes_0) do
        if v26.Slot == v23 then
            return v26;
        end;
    end;
    return nil;
end;
local function v33(v28, v29) --[[ Line: 91 ]] --[[ Name: getEmoteFromEquippedEmote ]]
    local l_v28_Emotes_0 = v28:GetEmotes();
    for v31, v32 in pairs(l_v28_Emotes_0) do
        if string.lower(v29.Name) == string.lower(v31) then
            return {
                Name = v31, 
                Slot = v29.Slot, 
                AssetId = v32[1]
            };
        end;
    end;
    return nil;
end;
local function v39(v34, v35) --[[ Line: 106 ]] --[[ Name: getEmoteFromName ]]
    local l_v34_Emotes_0 = v34:GetEmotes();
    for v37, v38 in pairs(l_v34_Emotes_0) do
        if string.lower(v35) == string.lower(v37) then
            return {
                Name = v37, 
                Slot = nil, 
                AssetId = v38[1]
            };
        end;
    end;
    return nil;
end;
local _ = function(v40, v41) --[[ Line: 121 ]] --[[ Name: getEmoteUsed ]]
    -- upvalues: v33 (copy), v39 (copy)
    local v42 = false;
    local v43 = tonumber(v41);
    if v43 then
        local l_v40_EquippedEmotes_0 = v40:GetEquippedEmotes();
        local v45;
        for _, v47 in ipairs(l_v40_EquippedEmotes_0) do
            if v47.Slot == v43 then
                v45 = v47;
                v42 = true;
            end;
            if v42 then
                break;
            end;
        end;
        if not v42 then
            v45 = nil;
        end;
        v42 = false;
        if v45 then
            return (v33(v40, v45));
        else
            return nil;
        end;
    else
        return (v39(v40, v41));
    end;
end;
local v49 = {
    wave = {
        R6 = 128777973, 
        R15 = 507770239
    }, 
    point = {
        R6 = 128853357, 
        R15 = 507770453
    }, 
    dance = {
        R6 = 182435998, 
        R15 = 507771019
    }, 
    dance2 = {
        R6 = 182436842, 
        R15 = 507776043
    }, 
    dance3 = {
        R6 = 182436935, 
        R15 = 507777268
    }, 
    laugh = {
        R6 = 129423131, 
        R15 = 507770818
    }, 
    cheer = {
        R6 = 129423030, 
        R15 = 507770677
    }
};
local function _(v50, v51, v52) --[[ Line: 166 ]] --[[ Name: getLegacyEmoteUsed ]]
    local v53 = v50.RigType == Enum.HumanoidRigType.R15;
    return {
        Name = v51, 
        Slot = nil, 
        AssetId = if v53 then v52.R15 else v52.R6
    };
end;
l_LocalPlayer_0.Chatted:Connect(function(v55, _) --[[ Line: 175 ]]
    -- upvalues: v49 (copy), l_LocalPlayer_0 (copy), v33 (copy), v39 (copy), v9 (copy), v6 (copy), v12 (copy), v5 (copy)
    local v57 = false;
    local v58 = if string.sub(v55, 1, 3) == "/e " then string.sub(v55, 4):lower() else if string.sub(v55, 1, 7) == "/emote " then string.sub(v55, 8):lower() else nil;
    if v58 then
        local v59 = nil;
        local v60 = v49[v58];
        if v60 then
            local l_Character_2 = l_LocalPlayer_0.Character;
            local v62 = if l_Character_2 then l_Character_2:FindFirstChildOfClass("Humanoid") else nil;
            if v62 then
                local v63 = v62.RigType == Enum.HumanoidRigType.R15;
                v59 = {
                    Name = v58, 
                    Slot = nil, 
                    AssetId = if v63 then v60.R15 else v60.R6
                };
            end;
        else
            local l_Character_3 = l_LocalPlayer_0.Character;
            local v65 = if l_Character_3 then l_Character_3:FindFirstChildOfClass("Humanoid") else nil;
            local v66 = if v65 then v65:FindFirstChildOfClass("HumanoidDescription") else nil;
            if v66 then
                local v67 = tonumber(v58);
                if v67 then
                    l_Character_3 = v66:GetEquippedEmotes();
                    for _, v69 in ipairs(l_Character_3) do
                        if v69.Slot == v67 then
                            v65 = v69;
                            v57 = true;
                        end;
                        if v57 then
                            break;
                        end;
                    end;
                    if not v57 then
                        v65 = nil;
                    end;
                    v57 = false;
                    v59 = if v65 then v33(v66, v65) else nil;
                else
                    v59 = v39(v66, v58);
                end;
            end;
        end;
        if true then
            local l_v59_0 = v59;
            if l_v59_0 then
                v9(l_v59_0);
                v6(l_LocalPlayer_0, function(v71) --[[ Line: 195 ]]
                    -- upvalues: v12 (ref), l_v59_0 (ref)
                    v12(v71, l_v59_0);
                end);
            else
                v12(v5.ErrorTypes.NoMatchingEmote);
            end;
        end;
    end;
end);
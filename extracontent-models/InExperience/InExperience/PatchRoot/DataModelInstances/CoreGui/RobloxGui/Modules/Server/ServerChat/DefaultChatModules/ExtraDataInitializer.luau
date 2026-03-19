local v0 = {
    Groups = {
        {
            GroupId = 1200769, 
            ChatColor = Color3.new(1, 0.8431372549019608, 0)
        }
    }, 
    Players = {
        {}
    }
};
local _ = function(v1, v2) --[[ Line: 23 ]] --[[ Name: MakeIsInGroup ]]
    local v3 = true;
    if type(v2) ~= "nil" then
        v3 = type(v2) == "number";
    end;
    assert(v3, "requiredRank must be a number or nil");
    return function(v4) --[[ Line: 26 ]]
        -- upvalues: v2 (copy), v1 (copy)
        if v4 and v4.UserId then
            local _ = v4.UserId;
            local v6 = false;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
                -- upvalues: v2 (ref), v6 (ref), v4 (copy), v1 (ref)
                if v2 then
                    v6 = v4:GetRankInGroup(v1) > v2;
                    return;
                else
                    v6 = v4:IsInGroup(v1);
                    return;
                end;
            end);
            if not l_status_0 and l_result_0 then
                print("Error checking in group: " .. l_result_0);
            end;
            return v6;
        else
            return false;
        end;
    end;
end;
(function() --[[ Line: 49 ]] --[[ Name: ConstructIsInGroups ]]
    -- upvalues: v0 (copy)
    if v0.Groups then
        for _, v11 in pairs(v0.Groups) do
            local l_GroupId_0 = v11.GroupId;
            local l_Rank_0 = v11.Rank;
            local v14 = true;
            if type(l_Rank_0) ~= "nil" then
                v14 = type(l_Rank_0) == "number";
            end;
            assert(v14, "requiredRank must be a number or nil");
            v11.IsInGroup = function(v15) --[[ Line: 26 ]]
                -- upvalues: l_Rank_0 (copy), l_GroupId_0 (copy)
                if v15 and v15.UserId then
                    local _ = v15.UserId;
                    local v17 = false;
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
                        -- upvalues: l_Rank_0 (ref), v17 (ref), v15 (copy), l_GroupId_0 (ref)
                        if l_Rank_0 then
                            v17 = v15:GetRankInGroup(l_GroupId_0) > l_Rank_0;
                            return;
                        else
                            v17 = v15:IsInGroup(l_GroupId_0);
                            return;
                        end;
                    end);
                    if not l_status_1 and l_result_1 then
                        print("Error checking in group: " .. l_result_1);
                    end;
                    return v17;
                else
                    return false;
                end;
            end;
        end;
    end;
end)();
local l_Players_0 = game:GetService("Players");
local function v27(v21) --[[ Line: 60 ]] --[[ Name: GetSpecialChatColor ]]
    -- upvalues: v0 (copy), l_Players_0 (copy)
    if v0.Players then
        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v21);
        if l_l_Players_0_FirstChild_0 then
            for _, v24 in pairs(v0.Players) do
                if l_l_Players_0_FirstChild_0.UserId == v24.UserId then
                    return v24.ChatColor;
                end;
            end;
        end;
    end;
    if v0.Groups then
        for _, v26 in pairs(v0.Groups) do
            if v26.IsInGroup(l_Players_0:FindFirstChild(v21)) then
                return v26.ChatColor;
            end;
        end;
    end;
end;
return function(v28) --[[ Line: 80 ]] --[[ Name: Run ]]
    -- upvalues: v27 (copy), l_Players_0 (copy)
    local v29 = {
        Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), 
        Color3.new(0.00392156862745098, 0.6352941176470588, 1), 
        Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), 
        BrickColor.new("Bright violet").Color, 
        BrickColor.new("Bright orange").Color, 
        BrickColor.new("Bright yellow").Color, 
        BrickColor.new("Light reddish violet").Color, 
        BrickColor.new("Brick yellow").Color
    };
    local function v35(v30) --[[ Line: 93 ]] --[[ Name: GetNameValue ]]
        local v31 = 0;
        for v32 = 1, #v30 do
            local v33 = string.byte((string.sub(v30, v32, v32)));
            local v34 = #v30 - v32 + 1;
            if #v30 % 2 == 1 then
                v34 = v34 - 1;
            end;
            if v34 % 4 >= 2 then
                v33 = -v33;
            end;
            v31 = v31 + v33;
        end;
        return v31;
    end;
    local function _(v36) --[[ Line: 110 ]] --[[ Name: ComputeNameColor ]]
        -- upvalues: v29 (copy), v35 (copy)
        return v29[(v35(v36) + 0) % #v29 + 1];
    end;
    local function _(v38) --[[ Line: 114 ]] --[[ Name: GetNameColor ]]
        -- upvalues: v29 (copy), v35 (copy)
        local l_v38_Player_0 = v38:GetPlayer();
        if l_v38_Player_0 and l_v38_Player_0.Team ~= nil then
            return l_v38_Player_0.TeamColor.Color;
        else
            local l_Name_0 = v38.Name;
            return v29[(v35(l_Name_0) + 0) % #v29 + 1];
        end;
    end;
    local function v49(v42) --[[ Line: 124 ]] --[[ Name: onNewSpeaker ]]
        -- upvalues: v28 (copy), v29 (copy), v35 (copy), v27 (ref)
        local l_v28_Speaker_0 = v28:GetSpeaker(v42);
        if not l_v28_Speaker_0:GetExtraData("NameColor") then
            local v44 = "NameColor";
            local l_l_v28_Speaker_0_Player_0 = l_v28_Speaker_0:GetPlayer();
            local v46;
            if l_l_v28_Speaker_0_Player_0 and l_l_v28_Speaker_0_Player_0.Team ~= nil then
                v46 = l_l_v28_Speaker_0_Player_0.TeamColor.Color;
            else
                local l_Name_1 = l_v28_Speaker_0.Name;
                v46 = v29[(v35(l_Name_1) + 0) % #v29 + 1];
            end;
            l_v28_Speaker_0:SetExtraData(v44, v46);
        end;
        if not l_v28_Speaker_0:GetExtraData("ChatColor") then
            local v48 = v27(v42);
            if v48 then
                l_v28_Speaker_0:SetExtraData("ChatColor", v48);
            end;
        end;
        if not l_v28_Speaker_0:GetExtraData("Tags") then
            l_v28_Speaker_0:SetExtraData("Tags", {});
        end;
    end;
    v28.SpeakerAdded:connect(v49);
    for _, v51 in pairs(v28:GetSpeakerList()) do
        v49(v51);
    end;
    local v52 = {};
    l_Players_0.PlayerAdded:connect(function(v53) --[[ Line: 161 ]]
        -- upvalues: v28 (copy), v29 (copy), v35 (copy), v52 (copy)
        v52[v53] = v53.Changed:connect(function(v54) --[[ Line: 162 ]]
            -- upvalues: v28 (ref), v53 (copy), v29 (ref), v35 (ref)
            local l_v28_Speaker_1 = v28:GetSpeaker(v53.Name);
            if l_v28_Speaker_1 and (v54 == "TeamColor" or v54 == "Neutral" or v54 == "Team") then
                local v56 = "NameColor";
                local l_l_v28_Speaker_1_Player_0 = l_v28_Speaker_1:GetPlayer();
                local v58;
                if l_l_v28_Speaker_1_Player_0 and l_l_v28_Speaker_1_Player_0.Team ~= nil then
                    v58 = l_l_v28_Speaker_1_Player_0.TeamColor.Color;
                else
                    local l_Name_2 = l_v28_Speaker_1.Name;
                    v58 = v29[(v35(l_Name_2) + 0) % #v29 + 1];
                end;
                l_v28_Speaker_1:SetExtraData(v56, v58);
            end;
        end);
    end);
    l_Players_0.PlayerRemoving:connect(function(v60) --[[ Line: 173 ]]
        -- upvalues: v52 (copy)
        local v61 = v52[v60];
        if v61 then
            v61:Disconnect();
        end;
        v52[v60] = nil;
    end);
end;
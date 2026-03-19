local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
if not l_LocalPlayer_0 then
    l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Wait();
    l_LocalPlayer_0 = l_Players_0.LocalPlayer;
end;
local v2 = {
    Value = false, 
    ChangedEvent = Instance.new("BindableEvent")
};
local function _(v3) --[[ Line: 15 ]] --[[ Name: getAnimateScript ]]
    if not v3 then
        return nil;
    else
        local l_Animate_0 = v3:FindFirstChild("Animate");
        if l_Animate_0 and l_Animate_0:IsA("LocalScript") then
            return l_Animate_0;
        elseif l_Animate_0 and l_Animate_0:IsA("Script") and l_Animate_0.RunContext == Enum.RunContext.Client then
            return l_Animate_0;
        else
            return nil;
        end;
    end;
end;
local function _(v6) --[[ Line: 31 ]] --[[ Name: getPlayEmoteBindable ]]
    local v7;
    if not v6 then
        v7 = nil;
    else
        local l_Animate_1 = v6:FindFirstChild("Animate");
        v7 = if l_Animate_1 and l_Animate_1:IsA("LocalScript") then l_Animate_1 else if l_Animate_1 and l_Animate_1:IsA("Script") and l_Animate_1.RunContext == Enum.RunContext.Client then l_Animate_1 else nil;
    end;
    if not v7 then
        return nil;
    else
        local l_PlayEmote_0 = v7:FindFirstChild("PlayEmote");
        if l_PlayEmote_0 and l_PlayEmote_0:IsA("BindableFunction") then
            return l_PlayEmote_0;
        else
            return nil;
        end;
    end;
end;
local function _(v11) --[[ Line: 45 ]] --[[ Name: getCanPlayEmotes ]]
    local v12;
    if not v11 then
        v12 = nil;
    else
        local l_Animate_2 = v11:FindFirstChild("Animate");
        v12 = if l_Animate_2 and l_Animate_2:IsA("LocalScript") then l_Animate_2 else if l_Animate_2 and l_Animate_2:IsA("Script") and l_Animate_2.RunContext == Enum.RunContext.Client then l_Animate_2 else nil;
    end;
    local v14;
    if not v12 then
        v14 = nil;
    else
        local l_PlayEmote_1 = v12:FindFirstChild("PlayEmote");
        v14 = if l_PlayEmote_1 and l_PlayEmote_1:IsA("BindableFunction") then l_PlayEmote_1 else nil;
    end;
    return v14 ~= nil;
end;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local function _() --[[ Line: 52 ]] --[[ Name: disconnectListeners ]]
    -- upvalues: v17 (ref), v18 (ref), v19 (ref)
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    if v19 then
        v19:Disconnect();
        v19 = nil;
    end;
end;
local v21 = nil;
local function _(v22) --[[ Line: 71 ]] --[[ Name: checkUpdate ]]
    -- upvalues: v2 (copy), v21 (ref)
    local v23;
    if not v22 then
        v23 = nil;
    else
        local l_Animate_3 = v22:FindFirstChild("Animate");
        v23 = if l_Animate_3 and l_Animate_3:IsA("LocalScript") then l_Animate_3 else if l_Animate_3 and l_Animate_3:IsA("Script") and l_Animate_3.RunContext == Enum.RunContext.Client then l_Animate_3 else nil;
    end;
    local v25;
    if not v23 then
        v25 = nil;
    else
        local l_PlayEmote_2 = v23:FindFirstChild("PlayEmote");
        v25 = if l_PlayEmote_2 and l_PlayEmote_2:IsA("BindableFunction") then l_PlayEmote_2 else nil;
    end;
    local v27 = v25 ~= nil;
    if v2.Value ~= v27 then
        v2.Value = v27;
        v2.ChangedEvent:Fire(v27);
    end;
    v21(v27, v22);
end;
local function _(v29) --[[ Line: 82 ]] --[[ Name: connectAnimateAddedListener ]]
    -- upvalues: v2 (copy), v21 (ref), v17 (ref)
    local v30;
    if not v29 then
        v30 = nil;
    else
        local l_Animate_4 = v29:FindFirstChild("Animate");
        v30 = if l_Animate_4 and l_Animate_4:IsA("LocalScript") then l_Animate_4 else if l_Animate_4 and l_Animate_4:IsA("Script") and l_Animate_4.RunContext == Enum.RunContext.Client then l_Animate_4 else nil;
    end;
    if v30 then
        local v32;
        if not v29 then
            v32 = nil;
        else
            local l_Animate_5 = v29:FindFirstChild("Animate");
            v32 = if l_Animate_5 and l_Animate_5:IsA("LocalScript") then l_Animate_5 else if l_Animate_5 and l_Animate_5:IsA("Script") and l_Animate_5.RunContext == Enum.RunContext.Client then l_Animate_5 else nil;
        end;
        local v34;
        if not v32 then
            v34 = nil;
        else
            local l_PlayEmote_3 = v32:FindFirstChild("PlayEmote");
            v34 = if l_PlayEmote_3 and l_PlayEmote_3:IsA("BindableFunction") then l_PlayEmote_3 else nil;
        end;
        local v36 = v34 ~= nil;
        if v2.Value ~= v36 then
            v2.Value = v36;
            v2.ChangedEvent:Fire(v36);
        end;
        v21(v36, v29);
        return;
    else
        v17 = v29.ChildAdded:Connect(function(v37) --[[ Line: 89 ]]
            -- upvalues: v29 (copy), v2 (ref), v21 (ref)
            if (v37:IsA("LocalScript") or v37:IsA("Script") and v37.RunContext == Enum.RunContext.Client) and v37.Name == "Animate" then
                local l_v29_0 = v29;
                local v39;
                if not l_v29_0 then
                    v39 = nil;
                else
                    local l_Animate_6 = l_v29_0:FindFirstChild("Animate");
                    v39 = if l_Animate_6 and l_Animate_6:IsA("LocalScript") then l_Animate_6 else if l_Animate_6 and l_Animate_6:IsA("Script") and l_Animate_6.RunContext == Enum.RunContext.Client then l_Animate_6 else nil;
                end;
                local v41;
                if not v39 then
                    v41 = nil;
                else
                    local l_PlayEmote_4 = v39:FindFirstChild("PlayEmote");
                    v41 = if l_PlayEmote_4 and l_PlayEmote_4:IsA("BindableFunction") then l_PlayEmote_4 else nil;
                end;
                local v43 = v41 ~= nil;
                if v2.Value ~= v43 then
                    v2.Value = v43;
                    v2.ChangedEvent:Fire(v43);
                end;
                v21(v43, l_v29_0);
            end;
        end);
        return;
    end;
end;
local function _(v45, v46) --[[ Line: 98 ]] --[[ Name: connectPlayEmoteAddedListener ]]
    -- upvalues: v2 (copy), v21 (ref), v18 (ref)
    local v47;
    if not v45 then
        v47 = nil;
    else
        local l_Animate_7 = v45:FindFirstChild("Animate");
        v47 = if l_Animate_7 and l_Animate_7:IsA("LocalScript") then l_Animate_7 else if l_Animate_7 and l_Animate_7:IsA("Script") and l_Animate_7.RunContext == Enum.RunContext.Client then l_Animate_7 else nil;
    end;
    local v49;
    if not v47 then
        v49 = nil;
    else
        local l_PlayEmote_5 = v47:FindFirstChild("PlayEmote");
        v49 = if l_PlayEmote_5 and l_PlayEmote_5:IsA("BindableFunction") then l_PlayEmote_5 else nil;
    end;
    if v49 then
        local v51;
        if not v45 then
            v51 = nil;
        else
            local l_Animate_8 = v45:FindFirstChild("Animate");
            v51 = if l_Animate_8 and l_Animate_8:IsA("LocalScript") then l_Animate_8 else if l_Animate_8 and l_Animate_8:IsA("Script") and l_Animate_8.RunContext == Enum.RunContext.Client then l_Animate_8 else nil;
        end;
        local v53;
        if not v51 then
            v53 = nil;
        else
            local l_PlayEmote_6 = v51:FindFirstChild("PlayEmote");
            v53 = if l_PlayEmote_6 and l_PlayEmote_6:IsA("BindableFunction") then l_PlayEmote_6 else nil;
        end;
        v47 = v53 ~= nil;
        if v2.Value ~= v47 then
            v2.Value = v47;
            v2.ChangedEvent:Fire(v47);
        end;
        v21(v47, v45);
        return;
    else
        v18 = v46.ChildAdded:Connect(function(v55) --[[ Line: 105 ]]
            -- upvalues: v45 (copy), v2 (ref), v21 (ref)
            if v55:IsA("BindableFunction") and v55.Name == "PlayEmote" then
                local l_v45_0 = v45;
                local v57;
                if not l_v45_0 then
                    v57 = nil;
                else
                    local l_Animate_9 = l_v45_0:FindFirstChild("Animate");
                    v57 = if l_Animate_9 and l_Animate_9:IsA("LocalScript") then l_Animate_9 else if l_Animate_9 and l_Animate_9:IsA("Script") and l_Animate_9.RunContext == Enum.RunContext.Client then l_Animate_9 else nil;
                end;
                local v59;
                if not v57 then
                    v59 = nil;
                else
                    local l_PlayEmote_7 = v57:FindFirstChild("PlayEmote");
                    v59 = if l_PlayEmote_7 and l_PlayEmote_7:IsA("BindableFunction") then l_PlayEmote_7 else nil;
                end;
                local v61 = v59 ~= nil;
                if v2.Value ~= v61 then
                    v2.Value = v61;
                    v2.ChangedEvent:Fire(v61);
                end;
                v21(v61, l_v45_0);
            end;
        end);
        return;
    end;
end;
local _ = function(v63) --[[ Line: 112 ]] --[[ Name: connectPlayEmoteRemovedListener ]]
    -- upvalues: v2 (copy), v21 (ref), v19 (ref)
    local v64;
    if not v63 then
        v64 = nil;
    else
        local l_Animate_10 = v63:FindFirstChild("Animate");
        v64 = if l_Animate_10 and l_Animate_10:IsA("LocalScript") then l_Animate_10 else if l_Animate_10 and l_Animate_10:IsA("Script") and l_Animate_10.RunContext == Enum.RunContext.Client then l_Animate_10 else nil;
    end;
    local v66;
    if not v64 then
        v66 = nil;
    else
        local l_PlayEmote_8 = v64:FindFirstChild("PlayEmote");
        v66 = if l_PlayEmote_8 and l_PlayEmote_8:IsA("BindableFunction") then l_PlayEmote_8 else nil;
    end;
    if not v66 then
        local v68;
        if not v63 then
            v68 = nil;
        else
            local l_Animate_11 = v63:FindFirstChild("Animate");
            v68 = if l_Animate_11 and l_Animate_11:IsA("LocalScript") then l_Animate_11 else if l_Animate_11 and l_Animate_11:IsA("Script") and l_Animate_11.RunContext == Enum.RunContext.Client then l_Animate_11 else nil;
        end;
        local v70;
        if not v68 then
            v70 = nil;
        else
            local l_PlayEmote_9 = v68:FindFirstChild("PlayEmote");
            v70 = if l_PlayEmote_9 and l_PlayEmote_9:IsA("BindableFunction") then l_PlayEmote_9 else nil;
        end;
        v64 = v70 ~= nil;
        if v2.Value ~= v64 then
            v2.Value = v64;
            v2.ChangedEvent:Fire(v64);
        end;
        v21(v64, v63);
        return;
    else
        v19 = v66.AncestryChanged:Connect(function(_, v73) --[[ Line: 119 ]]
            -- upvalues: v66 (copy), v63 (copy), v2 (ref), v21 (ref)
            if not v73 or not v66:IsDescendantOf(v63) then
                local l_v63_0 = v63;
                local v75;
                if not l_v63_0 then
                    v75 = nil;
                else
                    local l_Animate_12 = l_v63_0:FindFirstChild("Animate");
                    v75 = if l_Animate_12 and l_Animate_12:IsA("LocalScript") then l_Animate_12 else if l_Animate_12 and l_Animate_12:IsA("Script") and l_Animate_12.RunContext == Enum.RunContext.Client then l_Animate_12 else nil;
                end;
                local v77;
                if not v75 then
                    v77 = nil;
                else
                    local l_PlayEmote_10 = v75:FindFirstChild("PlayEmote");
                    v77 = if l_PlayEmote_10 and l_PlayEmote_10:IsA("BindableFunction") then l_PlayEmote_10 else nil;
                end;
                local v79 = v77 ~= nil;
                if v2.Value ~= v79 then
                    v2.Value = v79;
                    v2.ChangedEvent:Fire(v79);
                end;
                v21(v79, l_v63_0);
            end;
        end);
        return;
    end;
end;
v21 = function(v81, v82) --[[ Line: 126 ]]
    -- upvalues: v17 (ref), v18 (ref), v19 (ref), v2 (copy), v21 (ref)
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    if v19 then
        v19:Disconnect();
        v19 = nil;
    end;
    if not v82 then
        return;
    elseif v81 then
        local v83;
        if not v82 then
            v83 = nil;
        else
            local l_Animate_13 = v82:FindFirstChild("Animate");
            v83 = if l_Animate_13 and l_Animate_13:IsA("LocalScript") then l_Animate_13 else if l_Animate_13 and l_Animate_13:IsA("Script") and l_Animate_13.RunContext == Enum.RunContext.Client then l_Animate_13 else nil;
        end;
        local v85;
        if not v83 then
            v85 = nil;
        else
            local l_PlayEmote_11 = v83:FindFirstChild("PlayEmote");
            v85 = if l_PlayEmote_11 and l_PlayEmote_11:IsA("BindableFunction") then l_PlayEmote_11 else nil;
        end;
        if not v85 then
            local v87;
            if not v82 then
                v87 = nil;
            else
                local l_Animate_14 = v82:FindFirstChild("Animate");
                v87 = if l_Animate_14 and l_Animate_14:IsA("LocalScript") then l_Animate_14 else if l_Animate_14 and l_Animate_14:IsA("Script") and l_Animate_14.RunContext == Enum.RunContext.Client then l_Animate_14 else nil;
            end;
            local v89;
            if not v87 then
                v89 = nil;
            else
                local l_PlayEmote_12 = v87:FindFirstChild("PlayEmote");
                v89 = if l_PlayEmote_12 and l_PlayEmote_12:IsA("BindableFunction") then l_PlayEmote_12 else nil;
            end;
            v83 = v89 ~= nil;
            if v2.Value ~= v83 then
                v2.Value = v83;
                v2.ChangedEvent:Fire(v83);
            end;
            v21(v83, v82);
            return;
        else
            v19 = v85.AncestryChanged:Connect(function(_, v92) --[[ Line: 119 ]]
                -- upvalues: v85 (copy), v82 (copy), v2 (ref), v21 (ref)
                if not v92 or not v85:IsDescendantOf(v82) then
                    local l_v82_0 = v82;
                    local v94;
                    if not l_v82_0 then
                        v94 = nil;
                    else
                        local l_Animate_15 = l_v82_0:FindFirstChild("Animate");
                        v94 = if l_Animate_15 and l_Animate_15:IsA("LocalScript") then l_Animate_15 else if l_Animate_15 and l_Animate_15:IsA("Script") and l_Animate_15.RunContext == Enum.RunContext.Client then l_Animate_15 else nil;
                    end;
                    local v96;
                    if not v94 then
                        v96 = nil;
                    else
                        local l_PlayEmote_13 = v94:FindFirstChild("PlayEmote");
                        v96 = if l_PlayEmote_13 and l_PlayEmote_13:IsA("BindableFunction") then l_PlayEmote_13 else nil;
                    end;
                    local v98 = v96 ~= nil;
                    if v2.Value ~= v98 then
                        v2.Value = v98;
                        v2.ChangedEvent:Fire(v98);
                    end;
                    v21(v98, l_v82_0);
                end;
            end);
            return;
        end;
    else
        local v99;
        if not v82 then
            v99 = nil;
        else
            local l_Animate_16 = v82:FindFirstChild("Animate");
            v99 = if l_Animate_16 and l_Animate_16:IsA("LocalScript") then l_Animate_16 else if l_Animate_16 and l_Animate_16:IsA("Script") and l_Animate_16.RunContext == Enum.RunContext.Client then l_Animate_16 else nil;
        end;
        if v99 then
            local v101;
            if not v82 then
                v101 = nil;
            else
                local l_Animate_17 = v82:FindFirstChild("Animate");
                v101 = if l_Animate_17 and l_Animate_17:IsA("LocalScript") then l_Animate_17 else if l_Animate_17 and l_Animate_17:IsA("Script") and l_Animate_17.RunContext == Enum.RunContext.Client then l_Animate_17 else nil;
            end;
            local v103;
            if not v101 then
                v103 = nil;
            else
                local l_PlayEmote_14 = v101:FindFirstChild("PlayEmote");
                v103 = if l_PlayEmote_14 and l_PlayEmote_14:IsA("BindableFunction") then l_PlayEmote_14 else nil;
            end;
            if v103 then
                local v105;
                if not v82 then
                    v105 = nil;
                else
                    local l_Animate_18 = v82:FindFirstChild("Animate");
                    v105 = if l_Animate_18 and l_Animate_18:IsA("LocalScript") then l_Animate_18 else if l_Animate_18 and l_Animate_18:IsA("Script") and l_Animate_18.RunContext == Enum.RunContext.Client then l_Animate_18 else nil;
                end;
                local v107;
                if not v105 then
                    v107 = nil;
                else
                    local l_PlayEmote_15 = v105:FindFirstChild("PlayEmote");
                    v107 = if l_PlayEmote_15 and l_PlayEmote_15:IsA("BindableFunction") then l_PlayEmote_15 else nil;
                end;
                v101 = v107 ~= nil;
                if v2.Value ~= v101 then
                    v2.Value = v101;
                    v2.ChangedEvent:Fire(v101);
                end;
                v21(v101, v82);
                return;
            else
                v18 = v99.ChildAdded:Connect(function(v109) --[[ Line: 105 ]]
                    -- upvalues: v82 (copy), v2 (ref), v21 (ref)
                    if v109:IsA("BindableFunction") and v109.Name == "PlayEmote" then
                        local l_v82_1 = v82;
                        local v111;
                        if not l_v82_1 then
                            v111 = nil;
                        else
                            local l_Animate_19 = l_v82_1:FindFirstChild("Animate");
                            v111 = if l_Animate_19 and l_Animate_19:IsA("LocalScript") then l_Animate_19 else if l_Animate_19 and l_Animate_19:IsA("Script") and l_Animate_19.RunContext == Enum.RunContext.Client then l_Animate_19 else nil;
                        end;
                        local v113;
                        if not v111 then
                            v113 = nil;
                        else
                            local l_PlayEmote_16 = v111:FindFirstChild("PlayEmote");
                            v113 = if l_PlayEmote_16 and l_PlayEmote_16:IsA("BindableFunction") then l_PlayEmote_16 else nil;
                        end;
                        local v115 = v113 ~= nil;
                        if v2.Value ~= v115 then
                            v2.Value = v115;
                            v2.ChangedEvent:Fire(v115);
                        end;
                        v21(v115, l_v82_1);
                    end;
                end);
                return;
            end;
        else
            local v116;
            if not v82 then
                v116 = nil;
            else
                local l_Animate_20 = v82:FindFirstChild("Animate");
                v116 = if l_Animate_20 and l_Animate_20:IsA("LocalScript") then l_Animate_20 else if l_Animate_20 and l_Animate_20:IsA("Script") and l_Animate_20.RunContext == Enum.RunContext.Client then l_Animate_20 else nil;
            end;
            if v116 then
                local v118;
                if not v82 then
                    v118 = nil;
                else
                    local l_Animate_21 = v82:FindFirstChild("Animate");
                    v118 = if l_Animate_21 and l_Animate_21:IsA("LocalScript") then l_Animate_21 else if l_Animate_21 and l_Animate_21:IsA("Script") and l_Animate_21.RunContext == Enum.RunContext.Client then l_Animate_21 else nil;
                end;
                local v120;
                if not v118 then
                    v120 = nil;
                else
                    local l_PlayEmote_17 = v118:FindFirstChild("PlayEmote");
                    v120 = if l_PlayEmote_17 and l_PlayEmote_17:IsA("BindableFunction") then l_PlayEmote_17 else nil;
                end;
                local v122 = v120 ~= nil;
                if v2.Value ~= v122 then
                    v2.Value = v122;
                    v2.ChangedEvent:Fire(v122);
                end;
                v21(v122, v82);
                return;
            else
                v17 = v82.ChildAdded:Connect(function(v123) --[[ Line: 89 ]]
                    -- upvalues: v82 (copy), v2 (ref), v21 (ref)
                    if (v123:IsA("LocalScript") or v123:IsA("Script") and v123.RunContext == Enum.RunContext.Client) and v123.Name == "Animate" then
                        local l_v82_2 = v82;
                        local v125;
                        if not l_v82_2 then
                            v125 = nil;
                        else
                            local l_Animate_22 = l_v82_2:FindFirstChild("Animate");
                            v125 = if l_Animate_22 and l_Animate_22:IsA("LocalScript") then l_Animate_22 else if l_Animate_22 and l_Animate_22:IsA("Script") and l_Animate_22.RunContext == Enum.RunContext.Client then l_Animate_22 else nil;
                        end;
                        local v127;
                        if not v125 then
                            v127 = nil;
                        else
                            local l_PlayEmote_18 = v125:FindFirstChild("PlayEmote");
                            v127 = if l_PlayEmote_18 and l_PlayEmote_18:IsA("BindableFunction") then l_PlayEmote_18 else nil;
                        end;
                        local v129 = v127 ~= nil;
                        if v2.Value ~= v129 then
                            v2.Value = v129;
                            v2.ChangedEvent:Fire(v129);
                        end;
                        v21(v129, l_v82_2);
                    end;
                end);
                return;
            end;
        end;
    end;
end;
local function _(v130) --[[ Line: 146 ]] --[[ Name: onCharacterChanged ]]
    -- upvalues: v17 (ref), v18 (ref), v19 (ref), v2 (copy), v21 (ref)
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    if v19 then
        v19:Disconnect();
        v19 = nil;
    end;
    local v131;
    if not v130 then
        v131 = nil;
    else
        local l_Animate_23 = v130:FindFirstChild("Animate");
        v131 = if l_Animate_23 and l_Animate_23:IsA("LocalScript") then l_Animate_23 else if l_Animate_23 and l_Animate_23:IsA("Script") and l_Animate_23.RunContext == Enum.RunContext.Client then l_Animate_23 else nil;
    end;
    local v133;
    if not v131 then
        v133 = nil;
    else
        local l_PlayEmote_19 = v131:FindFirstChild("PlayEmote");
        v133 = if l_PlayEmote_19 and l_PlayEmote_19:IsA("BindableFunction") then l_PlayEmote_19 else nil;
    end;
    local v135 = v133 ~= nil;
    if v2.Value ~= v135 then
        v2.Value = v135;
        v2.ChangedEvent:Fire(v135);
    end;
    v21(v135, v130);
end;
l_LocalPlayer_0:GetPropertyChangedSignal("Character"):Connect(function() --[[ Line: 151 ]]
    -- upvalues: l_LocalPlayer_0 (ref), v17 (ref), v18 (ref), v19 (ref), v2 (copy), v21 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if v17 then
        v17:Disconnect();
        v17 = nil;
    end;
    if v18 then
        v18:Disconnect();
        v18 = nil;
    end;
    if v19 then
        v19:Disconnect();
        v19 = nil;
    end;
    local v138;
    if not l_Character_0 then
        v138 = nil;
    else
        local l_Animate_24 = l_Character_0:FindFirstChild("Animate");
        v138 = if l_Animate_24 and l_Animate_24:IsA("LocalScript") then l_Animate_24 else if l_Animate_24 and l_Animate_24:IsA("Script") and l_Animate_24.RunContext == Enum.RunContext.Client then l_Animate_24 else nil;
    end;
    local v140;
    if not v138 then
        v140 = nil;
    else
        local l_PlayEmote_20 = v138:FindFirstChild("PlayEmote");
        v140 = if l_PlayEmote_20 and l_PlayEmote_20:IsA("BindableFunction") then l_PlayEmote_20 else nil;
    end;
    local v142 = v140 ~= nil;
    if v2.Value ~= v142 then
        v2.Value = v142;
        v2.ChangedEvent:Fire(v142);
    end;
    v21(v142, l_Character_0);
end);
local l_Character_1 = l_LocalPlayer_0.Character;
if v17 then
    v17:Disconnect();
    v17 = nil;
end;
if v18 then
    v18:Disconnect();
    v18 = nil;
end;
if v19 then
    v19:Disconnect();
    v19 = nil;
end;
local v144;
if not l_Character_1 then
    v144 = nil;
else
    local l_Animate_25 = l_Character_1:FindFirstChild("Animate");
    v144 = if l_Animate_25 and l_Animate_25:IsA("LocalScript") then l_Animate_25 else if l_Animate_25 and l_Animate_25:IsA("Script") and l_Animate_25.RunContext == Enum.RunContext.Client then l_Animate_25 else nil;
end;
local v146;
if not v144 then
    v146 = nil;
else
    local l_PlayEmote_21 = v144:FindFirstChild("PlayEmote");
    v146 = if l_PlayEmote_21 and l_PlayEmote_21:IsA("BindableFunction") then l_PlayEmote_21 else nil;
end;
local v148 = v146 ~= nil;
if v2.Value ~= v148 then
    v2.Value = v148;
    v2.ChangedEvent:Fire(v148);
end;
v21(v148, l_Character_1);
return v2;
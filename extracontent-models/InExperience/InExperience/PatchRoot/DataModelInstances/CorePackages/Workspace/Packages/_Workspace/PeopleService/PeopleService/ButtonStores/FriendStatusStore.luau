local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Signals);
local v4 = require(l_Parent_0.PeopleUtility);
local l_ButtonVariant_0 = require(l_Parent_1.Foundation).Enums.ButtonVariant;
local v6 = require(script.Parent.PeopleBlockStatusStore);
return ((function() --[[ Line: 31 ]] --[[ Name: createFriendStatusStore ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), v4 (copy), v6 (copy), l_ButtonVariant_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local v8 = {};
    local v9 = nil;
    local function _(v10) --[[ Line: 42 ]] --[[ Name: getCurrentFriendStatus ]]
        -- upvalues: l_LocalPlayer_0 (copy), l_Players_0 (ref)
        if not v10 or not l_LocalPlayer_0 then
            return Enum.FriendStatus.Unknown;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: l_Players_0 (ref), v10 (copy), l_LocalPlayer_0 (ref)
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v10);
                if l_l_Players_0_PlayerByUserId_0 then
                    return l_LocalPlayer_0:GetFriendStatus(l_l_Players_0_PlayerByUserId_0);
                else
                    return Enum.FriendStatus.Unknown;
                end;
            end);
            return l_status_0 and l_result_0 or Enum.FriendStatus.Unknown;
        end;
    end;
    local function v22(v15) --[[ Line: 60 ]] --[[ Name: getFriendStatusSignal ]]
        -- upvalues: v3 (ref), v8 (ref), l_LocalPlayer_0 (copy), l_Players_0 (ref)
        if not v15 then
            return v3.createSignal(Enum.FriendStatus.Unknown);
        elseif v8[v15] then
            return v8[v15].getter;
        else
            local v16;
            if not v15 or not l_LocalPlayer_0 then
                v16 = Enum.FriendStatus.Unknown;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 47 ]]
                    -- upvalues: l_Players_0 (ref), v15 (copy), l_LocalPlayer_0 (ref)
                    local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v15);
                    if l_l_Players_0_PlayerByUserId_1 then
                        return l_LocalPlayer_0:GetFriendStatus(l_l_Players_0_PlayerByUserId_1);
                    else
                        return Enum.FriendStatus.Unknown;
                    end;
                end);
                v16 = l_status_1 and l_result_1 or Enum.FriendStatus.Unknown;
            end;
            local v20, v21 = v3.createSignal(v16);
            v8[v15] = {
                getter = v20, 
                setter = v21
            };
            return v20;
        end;
    end;
    local function v25(v23, v24) --[[ Line: 86 ]] --[[ Name: onFriendStatusChanged ]]
        -- upvalues: v8 (ref)
        if v8[v23.UserId] then
            v8[v23.UserId].setter(v24);
        end;
    end;
    local function v29(v26, v27) --[[ Line: 94 ]] --[[ Name: getShouldShowFriendButton ]]
        -- upvalues: v3 (ref), v4 (ref), v6 (ref)
        return v3.createComputed(function(v28) --[[ Line: 95 ]]
            -- upvalues: v4 (ref), v27 (copy), v26 (copy), v6 (ref)
            if not v4.showPersonButtons(v27, v26) or not v26 then
                return false;
            else
                return not v6.getPlayerBlockStatus(v26)(v28);
            end;
        end);
    end;
    local function v34(v30, v31) --[[ Line: 110 ]] --[[ Name: getFriendButtonText ]]
        -- upvalues: v3 (ref), v22 (copy)
        if not v30 then
            return v3.createSignal(v31.addPerson);
        else
            return v3.createComputed(function(v32) --[[ Line: 115 ]]
                -- upvalues: v22 (ref), v30 (copy), v31 (copy)
                local v33 = v22(v30)(v32);
                if v33 == Enum.FriendStatus.Friend then
                    return v31.isFriend;
                elseif v33 == Enum.FriendStatus.FriendRequestSent then
                    return v31.requestSent;
                else
                    return v31.addPerson;
                end;
            end);
        end;
    end;
    local function v38(v35) --[[ Line: 130 ]] --[[ Name: getFriendButtonVariant ]]
        -- upvalues: v3 (ref), l_ButtonVariant_0 (ref), v22 (copy)
        if not v35 then
            return v3.createSignal(l_ButtonVariant_0.Subtle);
        else
            return v3.createComputed(function(v36) --[[ Line: 135 ]]
                -- upvalues: v22 (ref), v35 (copy), l_ButtonVariant_0 (ref)
                local v37 = v22(v35)(v36);
                if v37 == Enum.FriendStatus.Friend or v37 == Enum.FriendStatus.FriendRequestSent then
                    return l_ButtonVariant_0.Text;
                else
                    return l_ButtonVariant_0.Subtle;
                end;
            end);
        end;
    end;
    local function v41(v39) --[[ Line: 147 ]] --[[ Name: getFriendStatus ]]
        -- upvalues: v3 (ref), v22 (copy)
        if not v39 then
            return v3.createSignal(false);
        else
            return v3.createComputed(function(v40) --[[ Line: 152 ]]
                -- upvalues: v22 (ref), v39 (copy)
                return v22(v39)(v40) == Enum.FriendStatus.Friend;
            end);
        end;
    end;
    local function v46(v42) --[[ Line: 159 ]] --[[ Name: getIsFriendButtonDisabled ]]
        -- upvalues: v3 (ref), v22 (copy)
        if not v42 then
            return v3.createSignal(false);
        else
            return v3.createComputed(function(v43) --[[ Line: 164 ]]
                -- upvalues: v22 (ref), v42 (copy)
                local v44 = v22(v42)(v43);
                local v45 = true;
                if v44 ~= Enum.FriendStatus.Friend then
                    v45 = v44 == Enum.FriendStatus.FriendRequestSent;
                end;
                return v45;
            end);
        end;
    end;
    local function v49(v47) --[[ Line: 171 ]] --[[ Name: getIsFriendButtonGrayedOut ]]
        -- upvalues: v3 (ref), v22 (copy)
        if not v47 then
            return v3.createSignal(false);
        else
            return v3.createComputed(function(v48) --[[ Line: 176 ]]
                -- upvalues: v22 (ref), v47 (copy)
                return v22(v47)(v48) == Enum.FriendStatus.FriendRequestSent;
            end);
        end;
    end;
    local function v51(v50) --[[ Line: 183 ]] --[[ Name: sendFriendRequest ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        if not v50 or not l_LocalPlayer_0 then
            return;
        else
            l_LocalPlayer_0:RequestFriendship(v50);
            return;
        end;
    end;
    local function _() --[[ Line: 192 ]] --[[ Name: initializeFriendStatusListener ]]
        -- upvalues: l_LocalPlayer_0 (copy), v9 (ref), v25 (copy)
        if l_LocalPlayer_0 then
            v9 = l_LocalPlayer_0.FriendStatusChanged:Connect(v25);
        end;
    end;
    local function v53() --[[ Line: 199 ]] --[[ Name: cleanup ]]
        -- upvalues: v9 (ref), v8 (ref)
        if v9 then
            v9:Disconnect();
            v9 = nil;
        end;
        v8 = {};
    end;
    if l_LocalPlayer_0 then
        v9 = l_LocalPlayer_0.FriendStatusChanged:Connect(v25);
    end;
    return {
        getShouldShowFriendButton = v29, 
        getFriendButtonText = v34, 
        getFriendButtonVariant = v38, 
        getFriendStatus = v41, 
        getIsFriendButtonDisabled = v46, 
        getIsFriendButtonGrayedOut = v49, 
        sendFriendRequest = v51, 
        cleanup = v53
    };
end)());
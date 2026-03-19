local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Players_0 = game:GetService("Players");
local v3 = require(l_Parent_0.Signals);
local v4 = require(l_Parent_0.BlockingUtility);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Integration.PeopleBlockingModalManager);
local v7 = require(l_script_FirstAncestor_0.Analytics.PeopleAnalyticsManager);
local l_GetFFlagAddPeoplePageCardLayout_0 = require(l_script_FirstAncestor_0.Flags).GetFFlagAddPeoplePageCardLayout;
return ((function() --[[ Line: 31 ]] --[[ Name: createPeopleBlockStatusStore ]]
    -- upvalues: v3 (copy), v4 (copy), v6 (copy), l_GetFFlagAddPeoplePageCardLayout_0 (copy), v5 (copy), l_Players_0 (copy), v7 (copy)
    local v9 = {};
    local v10 = nil;
    local function v15(v11) --[[ Line: 39 ]] --[[ Name: getPlayerBlockStatus ]]
        -- upvalues: v3 (ref), v9 (ref), v4 (ref)
        if not v11 then
            return v3.createSignal(false);
        elseif v9[v11] then
            return v9[v11].getter;
        else
            local v12 = v4:IsPlayerBlockedByUserId(v11);
            local v13, v14 = v3.createSignal(v12);
            v9[v11] = {
                getter = v13, 
                setter = v14
            };
            return v13;
        end;
    end;
    local function v18(v16, v17) --[[ Line: 66 ]] --[[ Name: onBlockStatusChanged ]]
        -- upvalues: v9 (ref)
        if v9[v16] then
            v9[v16].setter(v17);
        end;
    end;
    local function v24(v19, v20) --[[ Line: 73 ]] --[[ Name: blockPlayer ]]
        -- upvalues: v9 (ref), v6 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v5 (ref)
        local v21 = {
            onBlockingSuccess = function() --[[ Line: 75 ]] --[[ Name: onBlockingSuccess ]]
                -- upvalues: v9 (ref), v19 (copy)
                if v9[v19.UserId] then
                    v9[v19.UserId].setter(true);
                end;
            end
        };
        local v22 = v6.openModal(v19, if l_GetFFlagAddPeoplePageCardLayout_0() then v20 else v5.ANALYTICS.IN_GAME_MENU_NAME, v21);
        if v22 then
            v22:catch(function(v23) --[[ Line: 88 ]]
                warn("Block modal promise error:", v23);
            end);
        end;
    end;
    local function v28(v25, v26) --[[ Line: 95 ]] --[[ Name: unblockPlayer ]]
        -- upvalues: v4 (ref), l_Players_0 (ref), v7 (ref), l_GetFFlagAddPeoplePageCardLayout_0 (ref), v9 (ref)
        if not v25 then
            return;
        else
            if v4:UnblockPlayerAsync(v25) then
                local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
                if l_LocalPlayer_0 then
                    v7:trackUnblockUser(v25.UserId, l_LocalPlayer_0.UserId, if l_GetFFlagAddPeoplePageCardLayout_0() then v26 else nil);
                end;
                if v9[v25.UserId] then
                    v9[v25.UserId].setter(false);
                end;
            end;
            return;
        end;
    end;
    local function _() --[[ Line: 120 ]] --[[ Name: initializeBlockStatusListener ]]
        -- upvalues: v4 (ref), v10 (ref), v18 (copy)
        v10 = v4:GetBlockedStatusChangedEvent():Connect(v18);
    end;
    local function v30() --[[ Line: 126 ]] --[[ Name: cleanup ]]
        -- upvalues: v10 (ref), v9 (ref)
        if v10 then
            v10:Disconnect();
            v10 = nil;
        end;
        v9 = {};
    end;
    v10 = v4:GetBlockedStatusChangedEvent():Connect(v18);
    return {
        getPlayerBlockStatus = v15, 
        unblockPlayer = v28, 
        blockPlayer = v24, 
        cleanup = v30
    };
end)());
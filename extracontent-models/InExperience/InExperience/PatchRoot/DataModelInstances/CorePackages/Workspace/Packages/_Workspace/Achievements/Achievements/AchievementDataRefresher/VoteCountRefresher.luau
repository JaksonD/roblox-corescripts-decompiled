local l_script_FirstAncestor_0 = script:FindFirstAncestor("Achievements");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signal);
local v3 = require(l_script_FirstAncestor_0.Logger);
local v4 = require(l_script_FirstAncestor_0.Requests.GetUserVoteCount);
local v5 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
local v7 = require(l_Parent_0.Dash);
return {
    init = function(v8, v9, v10, v11, v12) --[[ Line: 36 ]] --[[ Name: init ]]
        v8.fireVoteCountChanged = v9;
        v8.store = v10;
        v8.requestImpl = v11;
        v8.platformCloudStorageService = v12;
    end, 
    start = function(v13) --[[ Line: 48 ]] --[[ Name: start ]]
        -- upvalues: v3 (copy)
        v13.storeChangedConnection = v13.store.changed:connect(function(v14, v15) --[[ Line: 49 ]]
            -- upvalues: v13 (copy), v3 (ref)
            local l_LocalUserGameVoteCounter_0 = v15.LocalUserGameVoteCounter;
            local l_LocalUserGameVoteCounter_1 = v14.LocalUserGameVoteCounter;
            if l_LocalUserGameVoteCounter_0 ~= l_LocalUserGameVoteCounter_1 and l_LocalUserGameVoteCounter_1.voteCountSinceAppStart > 0 then
                local l_lastUniverseId_0 = l_LocalUserGameVoteCounter_1.lastUniverseId;
                v13:_checkPollster(l_lastUniverseId_0):catch(function(v19) --[[ Line: 57 ]]
                    -- upvalues: v3 (ref)
                    v3:warning(v19);
                end);
            end;
        end);
    end, 
    _checkPollster = function(v20, v21) --[[ Line: 64 ]] --[[ Name: _checkPollster ]]
        -- upvalues: v5 (copy), v7 (copy), v4 (copy), v3 (copy)
        if v20.platformCloudStorageService and v20.platformCloudStorageService:IsUserDataAvailable() then
            return v5.new(function() --[[ Line: 66 ]]
                -- upvalues: v20 (copy), v7 (ref), v21 (copy)
                local v22 = v20.platformCloudStorageService:GetUserDataAsync("UniversesVoted").data or {};
                if #v22 < 5 and not v7.includes(v22, v21) then
                    table.insert(v22, v21);
                    v20.platformCloudStorageService:SetUserDataAsync("UniversesVoted", {
                        data = v22
                    });
                end;
                v20.fireVoteCountChanged(#v22);
            end);
        else
            return v4(v20.requestImpl):andThen(function(v23) --[[ Line: 75 ]]
                -- upvalues: v3 (ref), v20 (copy)
                if v23.responseBody == nil then
                    v3:warning("Response has no body.");
                    return;
                else
                    local l_voteCount_0 = v23.responseBody.voteCount;
                    if l_voteCount_0 == nil then
                        v3:warning("Response has no voteCount field.");
                        return;
                    else
                        v20.fireVoteCountChanged(l_voteCount_0);
                        return;
                    end;
                end;
            end);
        end;
    end, 
    stop = function(v25) --[[ Line: 93 ]] --[[ Name: stop ]]
        if v25.storeChangedConnection then
            v25.storeChangedConnection:disconnect();
            v25.storeChangedConnection = nil;
        end;
    end
};
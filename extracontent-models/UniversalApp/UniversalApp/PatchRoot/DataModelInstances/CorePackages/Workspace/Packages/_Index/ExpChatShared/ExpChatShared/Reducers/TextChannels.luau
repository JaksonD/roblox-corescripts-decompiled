local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_None_0 = require(l_Parent_0.llama).None;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v7 = require(l_Actions_0.ChatInputBarActivatedTeamMode);
local v8 = require(l_Actions_0.ChatInputBarActivatedWhisperMode);
local v9 = require(l_Actions_0.ChatInputBarResetTargetChannel);
local v10 = require(l_Actions_0.ClientAppLoaded);
local v11 = require(l_Actions_0.LocalTeamChanged);
local v12 = require(l_Actions_0.LocalTextChannelParticipantRemoved);
local v13 = require(l_Actions_0.TargetTextChannelPropertyChanged);
local v14 = require(l_Actions_0.TextChannelCreated);
local v15 = require(l_Actions_0.TextChannelRemoved);
local v16 = require(l_Actions_0.PlayerRemoved);
local v17 = {
    allTextChannels = {}, 
    targetTextChannel = nil, 
    currentTeam = nil
};
local function _(v18, v19) --[[ Line: 33 ]] --[[ Name: getTeamTextChannelFromTeam ]]
    local v20 = "RBXTeam" .. v19.TeamColor.Name;
    for v21, v22 in pairs(v18) do
        if v21 == v20 then
            return v22;
        end;
    end;
    return nil;
end;
return v2.createReducer(v17, {
    [v10.name] = function(v24, v25) --[[ Line: 45 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.join(v24, {
            currentTeam = if v25.team == nil then l_None_0 else v25.team
        });
    end, 
    [v14.name] = function(v26, v27) --[[ Line: 51 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("TextChannelCreated: {}", v27.textChannel.Name);
        return l_Dictionary_0.join(v26, {
            allTextChannels = l_Dictionary_0.join(v26.allTextChannels, {
                [v27.textChannel.Name] = v27.textChannel
            })
        });
    end, 
    [v15.name] = function(v28, v29) --[[ Line: 60 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        local v30 = l_Dictionary_0.removeKey(v28.allTextChannels, v29.textChannel.Name);
        local v31 = if v29.textChannel == v28.targetTextChannel then v30.RBXGeneral or l_None_0 else v28.targetTextChannel;
        return l_Dictionary_0.join(v28, {
            allTextChannels = v30, 
            targetTextChannel = v31
        });
    end, 
    [v12.name] = function(v32, v33) --[[ Line: 72 ]]
        -- upvalues: l_Dictionary_0 (copy), l_None_0 (copy)
        return l_Dictionary_0.join(v32, {
            targetTextChannel = if v33.textChannel == v32.targetTextChannel then if v33.textChannel == v32.allTextChannels.RBXGeneral then l_None_0 else v32.allTextChannels.RBXGeneral or l_None_0 else v32.targetTextChannel
        });
    end, 
    [v13.name] = function(v34, v35) --[[ Line: 85 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        v5:trace("TargetTextChannelPropertyChanged dispatched");
        if v35.textChannel == nil then
            return v34;
        else
            return l_Dictionary_0.join(v34, {
                targetTextChannel = if v35.textChannel == nil then l_None_0 else v35.textChannel
            });
        end;
    end, 
    [v11.name] = function(v36, v37) --[[ Line: 97 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        local v38 = false;
        if v37.team then
            v5:trace("LocalTeamChanged dispatched with team: {}", v37.team.Name);
            if v36.targetTextChannel and string.find(v36.targetTextChannel.Name, "^RBXTeam") then
                local l_allTextChannels_0 = v36.allTextChannels;
                local v40 = "RBXTeam" .. v37.team.TeamColor.Name;
                local v41;
                for v42, v43 in pairs(l_allTextChannels_0) do
                    if v42 == v40 then
                        v41 = v43;
                        v38 = true;
                    end;
                    if v38 then
                        break;
                    end;
                end;
                if not v38 then
                    v41 = nil;
                end;
                v38 = false;
                return l_Dictionary_0.join(v36, {
                    currentTeam = v37.team, 
                    targetTextChannel = if v41 == nil then v36.allTextChannels.RBXGeneral else v41
                });
            else
                return l_Dictionary_0.join(v36, {
                    currentTeam = v37.team
                });
            end;
        else
            v5:trace("LocalTeamChanged dispatched with no team");
            return l_Dictionary_0.join(v36, {
                currentTeam = l_None_0, 
                targetTextChannel = v36.allTextChannels.RBXGeneral or v36.targetTextChannel
            });
        end;
    end, 
    [v7.name] = function(v44, _) --[[ Line: 123 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy), l_None_0 (copy)
        local v46 = false;
        if v44.currentTeam == nil then
            v5:trace("ChatInputBarActivatedTeamMode but not on a team");
            return v44;
        else
            assert(v44.currentTeam, "This should be unreachable");
            local l_allTextChannels_1 = v44.allTextChannels;
            local v48 = "RBXTeam" .. v44.currentTeam.TeamColor.Name;
            local v49;
            for v50, v51 in pairs(l_allTextChannels_1) do
                if v50 == v48 then
                    v49 = v51;
                    v46 = true;
                end;
                if v46 then
                    break;
                end;
            end;
            if not v46 then
                v49 = nil;
            end;
            v46 = false;
            v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v49 and v49.Name or "nil");
            if v49 == nil then
                return v44;
            else
                return l_Dictionary_0.join(v44, {
                    targetTextChannel = if v49 == nil then l_None_0 else v49
                });
            end;
        end;
    end, 
    [v9.name] = function(v52, _) --[[ Line: 146 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.join(v52, {
            targetTextChannel = v52.allTextChannels.RBXGeneral or v52.targetTextChannel
        });
    end, 
    [v8.name] = function(v54, v55) --[[ Line: 152 ]]
        -- upvalues: v5 (copy), l_Dictionary_0 (copy)
        v5:trace("ChatInputBarActivatedTeamMode - set targetTextChannel to {}", v55.textChannel and v55.textChannel.Name or "nil");
        if v55.textChannel == nil then
            return v54;
        else
            return l_Dictionary_0.join(v54, {
                allTextChannels = l_Dictionary_0.join(v54.allTextChannels, {
                    [v55.textChannel.Name] = v55.textChannel
                }), 
                targetTextChannel = v55.textChannel
            });
        end;
    end, 
    [v16.name] = function(v56, v57) --[[ Line: 170 ]]
        -- upvalues: l_Dictionary_0 (copy)
        local function _(v58) --[[ Line: 171 ]] --[[ Name: isRemovedPlayerInWhisperChannel ]]
            -- upvalues: v57 (copy)
            return string.find(v58, "RBXWhisper:") and string.find(v58, v57.userId);
        end;
        local l_targetTextChannel_0 = v56.targetTextChannel;
        if l_targetTextChannel_0 then
            local l_Name_0 = l_targetTextChannel_0.Name;
            if string.find(l_Name_0, "RBXWhisper:") and string.find(l_Name_0, v57.userId) then
                l_targetTextChannel_0 = v56.allTextChannels.RBXGeneral;
            end;
        end;
        local v64 = l_Dictionary_0.filter(v56.allTextChannels, function(_, v63) --[[ Line: 180 ]]
            -- upvalues: v57 (copy)
            return not (string.find(v63, "RBXWhisper:") and string.find(v63, v57.userId));
        end);
        return l_Dictionary_0.join(v56, {
            targetTextChannel = l_targetTextChannel_0, 
            allTextChannels = v64
        });
    end
});
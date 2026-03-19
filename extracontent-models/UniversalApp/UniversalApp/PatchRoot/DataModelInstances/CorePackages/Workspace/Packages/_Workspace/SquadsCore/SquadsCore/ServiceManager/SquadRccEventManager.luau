local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SocialService_0 = game:GetService("SocialService");
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_script_FirstAncestor_0.Common.validateSquadId);
local v5 = {};
v5.__index = v5;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v3.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
v5.new = function() --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        isLeaveSquadPending = false, 
        lastFiredSquadId = ""
    }, v5));
end;
v5.setLeaveSquadPendingAndFireEvent = function(v7, v8, v9) --[[ Line: 40 ]] --[[ Name: setLeaveSquadPendingAndFireEvent ]]
    if v7:_setLeaveSquadPending(v8) then
        v7:fireSquadChangeEvent(nil, v9);
    end;
end;
v5.fireSquadChangeEvent = function(v10, v11, v12) --[[ Line: 46 ]] --[[ Name: fireSquadChangeEvent ]]
    -- upvalues: v4 (copy), l_SocialService_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy)
    local v13 = v11 or "";
    local v14 = true;
    if v13 ~= "" then
        v14 = v4(v13);
    end;
    assert(v14, "Try to fire with wrong squadId");
    if v13 ~= "" then
        v10:_setLeaveSquadPending(false);
    end;
    if (not v10.isLeaveSquadPending or v13 ~= "") and v10.lastFiredSquadId ~= v13 then
        v10.lastFiredSquadId = v13;
        l_SocialService_0:UpdatePlayerPartyData(v13, if l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 then not v12 else nil);
    end;
end;
v5._setLeaveSquadPending = function(v15, v16) --[[ Line: 63 ]] --[[ Name: _setLeaveSquadPending ]]
    if v15.isLeaveSquadPending ~= v16 then
        v15.isLeaveSquadPending = v16;
        return true;
    else
        return false;
    end;
end;
v5.default = v5.new();
return v5.default;
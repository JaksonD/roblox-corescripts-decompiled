local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxPresence_0 = v1.RoduxPresence;
local l_UserModel_0 = v1.UserModel;
local l_t_0 = v1.t;
local l_PresenceType_0 = l_RoduxPresence_0.Enums.PresenceType;
local v6 = {
    InGame = 3, 
    Online = 2, 
    InStudio = 1, 
    Offline = 0
};
local v7 = {
    [l_PresenceType_0.InGame.rawValue()] = v6.InGame, 
    [l_PresenceType_0.Online.rawValue()] = v6.Online, 
    [l_PresenceType_0.InStudio.rawValue()] = v6.InStudio, 
    [l_PresenceType_0.Offline.rawValue()] = v6.Offline
};
local v8 = {
    [l_UserModel_0.PresenceType.IN_GAME] = v6.InGame, 
    [l_UserModel_0.PresenceType.ONLINE] = v6.Online, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = v6.InStudio, 
    [l_UserModel_0.PresenceType.OFFLINE] = v6.Offline
};
local function _(v9) --[[ Line: 43 ]]
    -- upvalues: l_t_0 (copy), v7 (copy), l_PresenceType_0 (copy)
    return l_t_0.number(v9) and v7[v9] or v7[l_PresenceType_0.Offline];
end;
local function _(v11) --[[ Line: 48 ]]
    -- upvalues: l_t_0 (copy), v8 (copy), l_UserModel_0 (copy)
    return l_t_0.string(v11) and v8[v11] or v8[l_UserModel_0.PresenceType.OFFLINE];
end;
local function v20(v13, v14) --[[ Line: 53 ]]
    -- upvalues: l_t_0 (copy), v7 (copy), l_PresenceType_0 (copy), v8 (copy), l_UserModel_0 (copy)
    local v15 = false;
    local v16 = 0;
    local v17 = 0;
    if v13.userPresenceType and v14.userPresenceType then
        local v18 = v13.userPresenceType.rawValue();
        v16 = l_t_0.number(v18) and v7[v18] or v7[l_PresenceType_0.Offline];
        v18 = v14.userPresenceType.rawValue();
        if l_t_0.number(v18) then
            v17 = v7[v18];
            v15 = v17;
        end;
        if not v15 then
            return v16, v7[l_PresenceType_0.Offline];
        end;
    elseif v13.presence and v14.presence then
        local l_presence_0 = v13.presence;
        v16 = l_t_0.string(l_presence_0) and v8[l_presence_0] or v8[l_UserModel_0.PresenceType.OFFLINE];
        l_presence_0 = v14.presence;
        v17 = l_t_0.string(l_presence_0) and v8[l_presence_0] or v8[l_UserModel_0.PresenceType.OFFLINE];
    end;
    v15 = false;
    return v16, v17;
end;
local function _(v21, v22) --[[ Line: 68 ]]
    return v21.username or v21.name or "", v22.username or v22.name or "";
end;
return function(v24, v25) --[[ Line: 72 ]]
    -- upvalues: v20 (copy), l_t_0 (copy)
    local v26, v27 = v20(v24, v25);
    if v26 ~= v27 then
        return v27 < v26;
    else
        local v28 = l_t_0.number(v24.friendRank) and v24.friendRank or 0;
        local v29 = l_t_0.number(v25.friendRank) and v25.friendRank or 0;
        if v28 ~= v29 then
            return v28 < v29;
        else
            local v30 = l_t_0.string(v24.displayName) and v24.displayName or "";
            local v31 = l_t_0.string(v25.displayName) and v25.displayName or "";
            if string.lower(v30) ~= string.lower(v31) then
                return string.lower(v30) < string.lower(v31);
            else
                local v32 = v24.username or v24.name or "";
                local v33 = v25.username or v25.name or "";
                return string.lower(v32) < string.lower(v33);
            end;
        end;
    end;
end;
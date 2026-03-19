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
local function _(v9) --[[ Line: 42 ]]
    -- upvalues: l_PresenceType_0 (copy)
    local l_userPresenceType_0 = v9.userPresenceType;
    local v11 = v9.lastLocation or "";
    if (l_userPresenceType_0 == l_PresenceType_0.InGame or l_userPresenceType_0 == l_PresenceType_0.InStudio) and #v11 == 0 then
        return l_PresenceType_0.Online.rawValue();
    else
        return l_userPresenceType_0.rawValue();
    end;
end;
local function _(v13) --[[ Line: 51 ]]
    -- upvalues: l_UserModel_0 (copy)
    local l_presence_0 = v13.presence;
    local v15 = v13.lastLocation or "";
    if (l_presence_0 == l_UserModel_0.PresenceType.IN_GAME or l_presence_0 == l_UserModel_0.PresenceType.IN_STUDIO) and #v15 == 0 then
        return l_UserModel_0.PresenceType.ONLINE;
    else
        return l_presence_0;
    end;
end;
local function _(v17) --[[ Line: 63 ]]
    -- upvalues: l_PresenceType_0 (copy), l_t_0 (copy), v7 (copy)
    local l_userPresenceType_1 = v17.userPresenceType;
    local v19 = v17.lastLocation or "";
    local v20 = if (not (l_userPresenceType_1 ~= l_PresenceType_0.InGame) or l_userPresenceType_1 == l_PresenceType_0.InStudio) and #v19 == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_1.rawValue();
    return l_t_0.number(v20) and v7[v20] or v7[l_PresenceType_0.Offline];
end;
local function _(v22) --[[ Line: 69 ]]
    -- upvalues: l_UserModel_0 (copy), l_t_0 (copy), v8 (copy)
    local l_presence_1 = v22.presence;
    local v24 = v22.lastLocation or "";
    local v25 = if (not (l_presence_1 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_1 == l_UserModel_0.PresenceType.IN_STUDIO) and #v24 == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_1;
    return l_t_0.string(v25) and v8[v25] or v8[l_UserModel_0.PresenceType.OFFLINE];
end;
local function _(v27, v28) --[[ Line: 75 ]]
    -- upvalues: l_PresenceType_0 (copy), l_t_0 (copy), v7 (copy), l_UserModel_0 (copy), v8 (copy)
    local v29 = false;
    local v30 = 0;
    local v31 = 0;
    if v27.userPresenceType and v28.userPresenceType then
        local l_userPresenceType_2 = v27.userPresenceType;
        local v33 = v27.lastLocation or "";
        local v34 = if (not (l_userPresenceType_2 ~= l_PresenceType_0.InGame) or l_userPresenceType_2 == l_PresenceType_0.InStudio) and #v33 == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_2.rawValue();
        v30 = l_t_0.number(v34) and v7[v34] or v7[l_PresenceType_0.Offline];
        l_userPresenceType_2 = v28.userPresenceType;
        v33 = v28.lastLocation or "";
        v34 = if (not (l_userPresenceType_2 ~= l_PresenceType_0.InGame) or l_userPresenceType_2 == l_PresenceType_0.InStudio) and #v33 == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_2.rawValue();
        if l_t_0.number(v34) then
            v31 = v7[v34];
            v29 = v31;
        end;
        if not v29 then
            return v30, v7[l_PresenceType_0.Offline];
        end;
    elseif v27.presence and v28.presence then
        local l_presence_2 = v27.presence;
        local v36 = v27.lastLocation or "";
        local v37 = if (not (l_presence_2 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_2 == l_UserModel_0.PresenceType.IN_STUDIO) and #v36 == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_2;
        v30 = l_t_0.string(v37) and v8[v37] or v8[l_UserModel_0.PresenceType.OFFLINE];
        l_presence_2 = v28.presence;
        v36 = v28.lastLocation or "";
        v37 = if (not (l_presence_2 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_2 == l_UserModel_0.PresenceType.IN_STUDIO) and #v36 == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_2;
        v31 = l_t_0.string(v37) and v8[v37] or v8[l_UserModel_0.PresenceType.OFFLINE];
    end;
    v29 = false;
    return v30, v31;
end;
local function _(v39, v40) --[[ Line: 90 ]]
    return v39.username or v39.name or "", v40.username or v40.name or "";
end;
return function(v42, v43) --[[ Line: 94 ]]
    -- upvalues: l_PresenceType_0 (copy), l_t_0 (copy), v7 (copy), l_UserModel_0 (copy), v8 (copy)
    local v44 = 0;
    local v45 = 0;
    if v42.userPresenceType and v43.userPresenceType then
        local l_userPresenceType_3 = v42.userPresenceType;
        local v47 = v42.lastLocation or "";
        local v48 = if (not (l_userPresenceType_3 ~= l_PresenceType_0.InGame) or l_userPresenceType_3 == l_PresenceType_0.InStudio) and #v47 == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_3.rawValue();
        v44 = l_t_0.number(v48) and v7[v48] or v7[l_PresenceType_0.Offline];
        l_userPresenceType_3 = v43.userPresenceType;
        v47 = v43.lastLocation or "";
        v48 = if (not (l_userPresenceType_3 ~= l_PresenceType_0.InGame) or l_userPresenceType_3 == l_PresenceType_0.InStudio) and #v47 == 0 then l_PresenceType_0.Online.rawValue() else l_userPresenceType_3.rawValue();
        v45 = l_t_0.number(v48) and v7[v48] or v7[l_PresenceType_0.Offline];
    elseif v42.presence and v43.presence then
        local l_presence_3 = v42.presence;
        local v50 = v42.lastLocation or "";
        local v51 = if (not (l_presence_3 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_3 == l_UserModel_0.PresenceType.IN_STUDIO) and #v50 == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_3;
        v44 = l_t_0.string(v51) and v8[v51] or v8[l_UserModel_0.PresenceType.OFFLINE];
        l_presence_3 = v43.presence;
        v50 = v43.lastLocation or "";
        v51 = if (not (l_presence_3 ~= l_UserModel_0.PresenceType.IN_GAME) or l_presence_3 == l_UserModel_0.PresenceType.IN_STUDIO) and #v50 == 0 then l_UserModel_0.PresenceType.ONLINE else l_presence_3;
        v45 = l_t_0.string(v51) and v8[v51] or v8[l_UserModel_0.PresenceType.OFFLINE];
    end;
    local l_v44_0 = v44;
    local l_v45_0 = v45;
    if l_v44_0 ~= l_v45_0 then
        return l_v45_0 < l_v44_0;
    else
        v44 = l_t_0.number(v42.friendRank) and v42.friendRank or 0;
        v45 = l_t_0.number(v43.friendRank) and v43.friendRank or 0;
        if v44 ~= v45 then
            return v44 < v45;
        else
            local v54 = l_t_0.string(v42.displayName) and v42.displayName or "";
            local v55 = l_t_0.string(v43.displayName) and v43.displayName or "";
            if string.lower(v54) ~= string.lower(v55) then
                return string.lower(v54) < string.lower(v55);
            else
                local v56 = v42.username or v42.name or "";
                local v57 = v43.username or v43.name or "";
                return string.lower(v56) < string.lower(v57);
            end;
        end;
    end;
end;
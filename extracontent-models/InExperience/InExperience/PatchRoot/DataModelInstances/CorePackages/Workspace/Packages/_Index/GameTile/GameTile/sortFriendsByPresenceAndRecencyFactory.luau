local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v2 = {
    [l_UserModel_0.PresenceType.IN_GAME] = 3, 
    [l_UserModel_0.PresenceType.ONLINE] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
local function _(v3, v4) --[[ Line: 12 ]] --[[ Name: useLastOnlineForSort ]]
    local v5 = false;
    if typeof(v3) == "number" then
        v5 = false;
        if typeof(v4) == "number" then
            v5 = v3 ~= v4;
        end;
    end;
    return v5;
end;
local function _(v7) --[[ Line: 16 ]] --[[ Name: getFriendWeight ]]
    -- upvalues: v2 (copy), l_UserModel_0 (copy)
    local v8 = nil;
    if v7 and v7.presence then
        v8 = v2[v7.presence];
    end;
    if v8 == nil then
        v8 = v2[l_UserModel_0.PresenceType.OFFLINE];
    end;
    return v8;
end;
return function(v10) --[[ Line: 27 ]]
    -- upvalues: v2 (copy), l_UserModel_0 (copy)
    return function(v11, v12) --[[ Line: 28 ]]
        -- upvalues: v2 (ref), l_UserModel_0 (ref), v10 (copy)
        local v13 = nil;
        if v11 and v11.presence then
            v13 = v2[v11.presence];
        end;
        if v13 == nil then
            v13 = v2[l_UserModel_0.PresenceType.OFFLINE];
        end;
        local l_v13_0 = v13;
        local v15 = nil;
        if v12 and v12.presence then
            v15 = v2[v12.presence];
        end;
        if v15 == nil then
            v15 = v2[l_UserModel_0.PresenceType.OFFLINE];
        end;
        v13 = v15;
        if l_v13_0 == v13 then
            if v11.presence ~= l_UserModel_0.PresenceType.OFFLINE then
                local l_lastOnline_0 = v11.lastOnline;
                local l_lastOnline_1 = v12.lastOnline;
                v15 = false;
                if typeof(l_lastOnline_0) == "number" then
                    v15 = false;
                    if typeof(l_lastOnline_1) == "number" then
                        v15 = l_lastOnline_0 ~= l_lastOnline_1;
                    end;
                end;
                if v15 then
                    return v11.lastOnline > v12.lastOnline;
                end;
            end;
            v15 = v11[v10] or "";
            local v18 = v12[v10] or "";
            return v15:lower() < v18:lower();
        else
            return v13 < l_v13_0;
        end;
    end;
end;
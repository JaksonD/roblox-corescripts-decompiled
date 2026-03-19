local v0 = {};
local l_findAvatarHeadshotById_0 = require(script.Parent.Parent.connectors.PlayerConnector).findAvatarHeadshotById;
local _ = require(script.Parent.Parent.generatedTypes);
v0.default = {
    Player = {
        avatarHeadshot = function(v3, _, v5, _) --[[ Line: 9 ]] --[[ Name: avatarHeadshot ]]
            -- upvalues: l_findAvatarHeadshotById_0 (copy)
            local l_fetchImpl_0 = v5.fetchImpl;
            return l_findAvatarHeadshotById_0(v3.id, l_fetchImpl_0);
        end
    }
};
return v0;
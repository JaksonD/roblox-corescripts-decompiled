local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v2.UIBlox;
local v4 = require(l_script_FirstAncestor_0.Friends.isUserInGame);
local v5 = require(l_script_FirstAncestor_0.Friends.getCorrectUserPresence);
local v6 = require(l_script_FirstAncestor_0.Enums.NotLocalizedStrings);
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_PresenceType_0 = v2.RoduxPresence.Enums.PresenceType;
local l_FFlagFriendsPageAlwaysOpenPPV_0 = require(l_Parent_0.SharedFlags).FFlagFriendsPageAlwaysOpenPPV;
local v10 = UDim2.fromOffset(12, 12);
return function(v11, v12, v13, v14, v15, v16, v17, v18, v19, v20) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), l_Images_0 (copy), l_PresenceType_0 (copy), v10 (copy), v4 (copy), l_FFlagFriendsPageAlwaysOpenPPV_0 (copy), v6 (copy)
    local v21 = {};
    local v22 = v5(v11);
    v21.icon = v13 and l_Images_0[v13] or nil;
    if v22 == l_PresenceType_0.Online then
        if not v20 then
            v21.iconSize = v10;
        end;
        v21.iconColor = v15.OnlineStatus.Color;
        v21.iconTransparency = v15.OnlineStatus.Transparency;
    end;
    if v11.isDeleted then
        v21.text = v19;
    elseif v4(v11) then
        v21.text = v11.lastLocation;
        v21.onActivated = if l_FFlagFriendsPageAlwaysOpenPPV_0 then nil else v14(v11.universeId, v11.id, v16);
    elseif v11.userPresenceType == l_PresenceType_0.InStudio then
        if v11.lastLocation and v11.lastLocation ~= "" then
            v21.text = v11.lastLocation;
        else
            v21.text = v17 and v6.StudioPresenceTextLuobu.rawValue() or v6.StudioPresenceTextGlobal.rawValue();
        end;
    else
        v21.text = v12;
    end;
    if not v20 and v18 then
        v21.fontStyle = v4(v11) and v18.CaptionHeader or v18.CaptionBody;
    end;
    return v21;
end;
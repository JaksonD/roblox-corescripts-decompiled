local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(script.ContactsListContainer);
local v4 = require(l_Parent_0.Flags.OffPlatformFriendRequestsIXP);
local l_Dash_0 = v1.Dash;
local l_Roact_0 = v1.Roact;
local l_useNavigation_0 = v1.useNavigation;
local l_FFlagContactImporterIXPCleanup_0 = require(l_Parent_1.SharedFlags).FFlagContactImporterIXPCleanup;
ContactsList = function(v9) --[[ Line: 15 ]] --[[ Name: ContactsList ]]
    -- upvalues: l_useNavigation_0 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), v4 (copy), l_Roact_0 (copy), v3 (copy), l_Dash_0 (copy)
    local v10 = l_useNavigation_0();
    local v11 = if l_FFlagContactImporterIXPCleanup_0 then nil else v4.useOffPlatformFriendRequestsVariant();
    if l_FFlagContactImporterIXPCleanup_0 then
        return l_Roact_0.createElement(v3, l_Dash_0.join({
            navigation = v10
        }, v9 or {}));
    elseif v11 == v4.IXPVariants.BLENDED or v11 == v4.IXPVariants.INVITES_ONLY then
        return l_Roact_0.createElement(v3, l_Dash_0.join({
            variant = v11, 
            navigation = v10, 
            isPVRequired = false
        }, v9 or {}));
    else
        return nil;
    end;
end;
return ContactsList;
local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Flags.getFFlagPassNavigationToContactsRevoked);
local _ = require(script.ContactsRevokedAccessDialog);
if v1() then
    return (require(script.ContactsRevokedAccessDialogEntryPoint));
else
    return (require(script.ContactsRevokedAccessDialog));
end;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_1.React);
local l_ContactsProtocol_0 = require(l_Parent_1.ContactsProtocol).ContactsProtocol;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_useSelector_0 = v2.useSelector;
local l_useDispatch_0 = v2.useDispatch;
local v8 = require(l_Parent_0.Networking.AutoSyncContacts);
return function(v9) --[[ Line: 20 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v8 (copy), l_ContactsProtocol_0 (copy), l_AppStorageService_0 (copy), v3 (copy)
    local v10 = l_useDispatch_0();
    local v12 = l_useSelector_0(function(v11) --[[ Line: 22 ]]
        return v11.LocalUserId;
    end);
    local v13 = v9 or function() --[[ Line: 27 ]]
        -- upvalues: v10 (copy), v8 (ref), v12 (copy), l_ContactsProtocol_0 (ref), l_AppStorageService_0 (ref)
        v10(v8(v12, l_ContactsProtocol_0.default, l_AppStorageService_0));
    end;
    v3.useEffect(v13, {});
end;
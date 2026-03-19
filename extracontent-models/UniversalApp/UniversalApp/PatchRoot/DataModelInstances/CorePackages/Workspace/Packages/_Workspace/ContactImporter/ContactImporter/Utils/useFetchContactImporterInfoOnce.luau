local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_AppStorageService_0 = v1.AppStorageService;
local l_useDispatch_0 = v1.useDispatch;
local l_useSelector_0 = v1.useSelector;
local l_useEffectOnce_0 = v1.useEffectOnce;
local v6 = require(l_Parent_0.Networking.FetchContactImporterParams);
local l_PermissionsProtocol_0 = v1.PermissionsProtocol;
local v8 = require(script.Parent.useContactImporterConfiguration);
return function(v9) --[[ Line: 12 ]]
    -- upvalues: l_useSelector_0 (copy), l_useDispatch_0 (copy), v6 (copy), l_PermissionsProtocol_0 (copy), l_AppStorageService_0 (copy), v8 (copy), l_useEffectOnce_0 (copy)
    local v11 = l_useSelector_0(function(v10) --[[ Line: 13 ]]
        return v10.LocalUserId;
    end);
    local v12 = l_useDispatch_0();
    local function v13() --[[ Line: 19 ]]
        -- upvalues: v12 (copy), v6 (ref), v11 (copy), l_PermissionsProtocol_0 (ref), l_AppStorageService_0 (ref)
        v12(v6(v11, l_PermissionsProtocol_0.default, l_AppStorageService_0));
    end;
    local v14 = v8(v9).shouldFetchContactImporterData and v11 and v11 ~= "" and v11 ~= "0";
    l_useEffectOnce_0(v13, v14);
end;
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local l_default_0 = require(l_Parent_1.PermissionsProtocol).PermissionsProtocol.default;
local v4 = require(l_Parent_0.Thunks.SaveCaptureToExternalStorage);
local v5 = require(l_Parent_0.Thunks.SaveCapturesToExternalStorage);
local _ = require(l_Parent_0.Types);
return function(v7, v8, v9) --[[ Line: 13 ]]
    -- upvalues: l_default_0 (copy), l_UserInputService_0 (copy), v5 (copy), v4 (copy)
    l_default_0:hasPermissions({
        l_default_0.Permissions.WRITE_MEDIA_STORAGE
    }):andThen(function(v10) --[[ Line: 15 ]]
        -- upvalues: l_default_0 (ref), l_UserInputService_0 (ref), v8 (copy), v7 (copy), v9 (copy), v5 (ref), v4 (ref)
        local v11 = true;
        if v10.status ~= l_default_0.Status.AUTHORIZED then
            v11 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
        end;
        if l_UserInputService_0:GetPlatform() == Enum.Platform.Android and not v11 then
            if not v8 then
                return;
            else
                assert(v8 ~= nil, "openPermissionModal is not nil");
                v8();
                return;
            end;
        elseif not v11 then
            l_default_0:requestPermissions({
                l_default_0.Permissions.WRITE_MEDIA_STORAGE
            }):andThen(function(v12) --[[ Line: 26 ]]
                -- upvalues: l_default_0 (ref), v7 (ref), v9 (ref), v5 (ref), v4 (ref)
                local v13 = true;
                if v12.status ~= l_default_0.Status.AUTHORIZED then
                    v13 = v12.status == l_default_0.Status.UNSUPPORTED;
                end;
                if v13 then
                    if #v7 > 0 then
                        v9(v5(v7));
                        return;
                    else
                        v9(v4(v7));
                    end;
                end;
            end):catch(function() --[[ Line: 38 ]]

            end);
            return;
        elseif #v7 > 0 then
            v9(v5(v7));
            return;
        else
            v9(v4(v7));
            return;
        end;
    end):catch(function() --[[ Line: 49 ]]
        -- upvalues: l_UserInputService_0 (ref), v8 (copy)
        if l_UserInputService_0:GetPlatform() ~= Enum.Platform.Android then
            return;
        elseif not v8 then
            return;
        else
            assert(v8 ~= nil, "openPermissionModal is not nil");
            v8();
            return;
        end;
    end);
    return nil;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local v1 = require(l_script_FirstAncestor_0.Utils.AppStorageUtilities);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Http.Requests.GetUserAppLaunchInfo);
local v4 = require(l_Parent_0.Promise);
local l_AppStorageService_0 = game:GetService("AppStorageService");
return function(v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v3 (copy), v1 (copy), l_AppStorageService_0 (copy)
    local _, v13 = v4.new(function(v7) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v6 (copy), v1 (ref), l_AppStorageService_0 (ref)
        v3(v6):andThen(function(v8) --[[ Line: 10 ]]
            -- upvalues: v1 (ref), l_AppStorageService_0 (ref), v7 (copy)
            if v8 and v8.responseBody then
                local l_name_0 = v8.responseBody.name;
                local v10 = tostring(v8.responseBody.id);
                v1.setIncompleteSignupUserId(v10);
                v1.setIncompleteSignupUsername(l_name_0);
                l_AppStorageService_0:Flush();
            end;
            v7(true);
        end):catch(function(_) --[[ Line: 19 ]]
            -- upvalues: v7 (copy)
            v7(false);
        end);
    end):await();
    return v13;
end;
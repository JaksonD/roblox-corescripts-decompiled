local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.EditBio);
local v4 = require(l_Parent_0.Promise);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v6 = require(l_script_FirstAncestor_0.Stores.EditProfileStore);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v8 = require(l_script_FirstAncestor_0.Analytics.AnalyticsServiceV2);
return function(v9) --[[ Line: 18 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v6 (copy), l_useSignalState_0 (copy), v2 (copy), v8 (copy), v4 (copy), v3 (copy)
    local v10 = l_useLocalUserId_0();
    local v11 = v6.getDescription(v10);
    local v12 = l_useSignalState_0(v11.data) or "";
    local v13, v14 = v2.useState(v12);
    local v15, v16 = v2.useState(nil);
    local v18 = v2.useCallback(function(v17) --[[ Line: 26 ]]
        -- upvalues: v14 (copy), v16 (copy)
        v14(v17);
        v16(nil);
    end, {});
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v14 (copy), v12 (copy)
        v14(v12);
    end, {
        v12
    });
    v2.useEffect(function() --[[ Line: 35 ]]
        -- upvalues: v9 (copy), v6 (ref), v10 (copy), v13 (copy), v16 (copy), v8 (ref), v4 (ref)
        v9.registerSaveHandler(function() --[[ Line: 36 ]]
            -- upvalues: v6 (ref), v10 (ref), v13 (ref), v16 (ref), v8 (ref), v4 (ref)
            return v6.updateDescription(v10, v13):catch(function(v19) --[[ Line: 37 ]]
                -- upvalues: v16 (ref), v8 (ref), v4 (ref)
                if v19 then
                    local v20 = nil;
                    if v19.errors and v19.errors[1] then
                        v20 = v19.errors[1].code;
                    elseif v19.statusCode then
                        v20 = v19.statusCode;
                    end;
                    if v20 then
                        v16(v20);
                        v8.sendError(v20);
                    end;
                    return v4.reject(v19);
                else
                    return;
                end;
            end);
        end);
    end, {
        v9.registerSaveHandler, 
        v10, 
        v13
    });
    return v2.createElement(v3, {
        bioText = v13, 
        onDataChange = v18, 
        errorCode = v15, 
        textBoxRef = v9.textBoxRef
    });
end;
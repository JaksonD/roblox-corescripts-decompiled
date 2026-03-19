local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Types.ReducerTypes);
local v4 = {
    canUploadContacts = nil
};
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_networkingUserSettings_0 = v5.networkingUserSettings;
    return v2.createReducer(v4, {
        [l_networkingUserSettings_0.GetUserSettings.Succeeded.name] = function(_, v8) --[[ Line: 14 ]]
            return {
                canUploadContacts = v8.responseBody and v8.responseBody.canUploadContacts
            };
        end, 
        [l_networkingUserSettings_0.UpdateUserSettings.Succeeded.name] = function(v9, v10) --[[ Line: 22 ]]
            if v10.postBody and v10.postBody.canUploadContacts ~= nil then
                return {
                    canUploadContacts = v10.postBody.canUploadContacts
                };
            else
                return v9;
            end;
        end
    });
end;
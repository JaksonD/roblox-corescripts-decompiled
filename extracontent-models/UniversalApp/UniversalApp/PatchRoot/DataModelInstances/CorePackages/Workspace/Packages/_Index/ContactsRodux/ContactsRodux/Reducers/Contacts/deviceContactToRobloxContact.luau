local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Types_0 = l_Parent_0.Types;
local v3 = require(l_Parent_1.Rodux);
local v4 = require(l_Parent_1.Dash);
local _ = require(l_Types_0.ActionTypes);
local _ = require(l_Types_0.ReducerTypes);
local l_getDeepValue_0 = require(l_Parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local v8 = {};
return function(v9) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v8 (copy), l_getDeepValue_0 (copy), v4 (copy)
    local l_networkingContacts_0 = v9.networkingContacts;
    return v3.createReducer(v8, {
        [l_networkingContacts_0.UploadContactsByUser.Succeeded.name] = function(_, v12) --[[ Line: 16 ]]
            -- upvalues: l_getDeepValue_0 (ref), v4 (ref)
            if not l_getDeepValue_0(v12, "responseBody.matchedContactFields") then
                return {};
            else
                local v13 = {};
                v4.forEach(v12.responseBody.matchedContactFields, function(v14) --[[ Line: 27 ]]
                    -- upvalues: v13 (copy)
                    if not v13[v14.idAssignedByFE] then
                        v13[v14.idAssignedByFE] = {};
                    end;
                    v13[v14.idAssignedByFE][v14.userContactId] = true;
                end);
                return v13;
            end;
        end
    });
end;
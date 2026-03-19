local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_1.llama);
local l_Actions_0 = l_Parent_0.Actions;
local v5 = require(l_Actions_0.AliasUpdated);
local v6 = require(l_Actions_0.AliasRemoved);
local v7 = require(l_Actions_0.ReceivedCanShowUserAlias);
local _ = require(l_Parent_0.RoduxAliasesTypes);
local function v11(v9, v10) --[[ Line: 17 ]] --[[ Name: addUserIdsToState ]]
    -- upvalues: v3 (copy)
    return v3.Dictionary.join(v9, v10);
end;
local function v16(v12, v13) --[[ Line: 21 ]] --[[ Name: addUsersIdsToInternalState ]]
    -- upvalues: v3 (copy)
    local l__INTERNAL_HIDDEN_DATA_0 = v12._INTERNAL_HIDDEN_DATA;
    local v15 = v3.Dictionary.join(l__INTERNAL_HIDDEN_DATA_0, v13);
    return v3.Dictionary.join(v12, {
        _INTERNAL_HIDDEN_DATA = v15
    });
end;
local v17 = {
    ShowUserAlias = true
};
return function(v18) --[[ Line: 33 ]]
    -- upvalues: v2 (copy), v17 (copy), v5 (copy), v11 (copy), v16 (copy), v6 (copy), v3 (copy), v7 (copy)
    local l_aliasNetworking_0 = v18.aliasNetworking;
    return v2.createReducer(v17, {
        [v5.name] = function(v20, v21) --[[ Line: 37 ]]
            -- upvalues: v11 (ref), v16 (ref)
            assert(type(v21.payload.userId) == "string", "Expected userId to be a string");
            assert(type(v21.payload.newAlias) == "string", "Expected newAlias to be a string");
            local v22 = {
                [v21.payload.userId] = v21.payload.newAlias
            };
            if v20.ShowUserAlias or v20.ShowUserAlias == nil then
                return v11(v20, v22);
            else
                return v16(v20, v22);
            end;
        end, 
        [v6.name] = function(v23, v24) --[[ Line: 51 ]]
            -- upvalues: v3 (ref), v11 (ref), v16 (ref)
            assert(type(v24.payload.userId) == "string", "Expected userId to be a string");
            local v25 = {
                [v24.payload.userId] = v3.None
            };
            if v23.ShowUserAlias or v23.ShowUserAlias == nil then
                return v11(v23, v25);
            else
                return v16(v23, v25);
            end;
        end, 
        [v7.name] = function(v26, v27) --[[ Line: 64 ]]
            -- upvalues: v3 (ref)
            assert(type(v27.payload.showUserAlias) == "boolean", "Expected showUserAlias to be a boolean");
            if v27.payload.showUserAlias == v26.ShowUserAlias then
                return v26;
            elseif v27.payload.showUserAlias then
                return v3.Dictionary.join(v26._INTERNAL_HIDDEN_DATA or {}, {
                    ShowUserAlias = v27.payload.showUserAlias, 
                    _INTERNAL_HIDDEN_DATA = v3.None
                });
            else
                return {
                    ShowUserAlias = v27.payload.showUserAlias, 
                    _INTERNAL_HIDDEN_DATA = v3.Dictionary.join(v26, {
                        ShowUserAlias = v3.None, 
                        _INTERNAL_HIDDEN_DATA = v3.None
                    })
                };
            end;
        end, 
        [l_aliasNetworking_0.GetTagsFromUserIds.Succeeded.name] = function(v28, v29) --[[ Line: 88 ]]
            -- upvalues: v11 (ref), v16 (ref)
            local v30 = {};
            for _, v32 in ipairs(v29.responseBody) do
                v30[tostring(v32.targetUserId)] = v32.targetUserTag;
            end;
            if v28.ShowUserAlias or v28.ShowUserAlias == nil then
                return v11(v28, v30);
            else
                return v16(v28, v30);
            end;
        end, 
        [l_aliasNetworking_0.SetUserTag.Succeeded.name] = function(v33, v34) --[[ Line: 102 ]]
            -- upvalues: v3 (ref)
            local l_userTag_0 = v34.postBody.userTag;
            local l_targetUserId_0 = v34.postBody.targetUserId;
            return v3.Dictionary.join(v33, {
                [tostring(l_targetUserId_0)] = l_userTag_0
            });
        end
    });
end;
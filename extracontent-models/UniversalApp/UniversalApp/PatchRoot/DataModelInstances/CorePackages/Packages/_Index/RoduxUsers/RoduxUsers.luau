local v0 = require(script.Reducers);
local v1 = require(script.Actions);
local v2 = require(script.Models);
local l_Parent_0 = script.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.RoduxNetworking);
local v6 = require(l_Parent_0.FriendsNetworking);
local v7 = require(l_Parent_0.UsersNetworking);
local v8 = require(script.roduxUsersTypes);
return {
    config = function(v9) --[[ Line: 13 ]] --[[ Name: config ]]
        -- upvalues: v4 (copy), v7 (copy), v5 (copy), v6 (copy), v0 (copy), v1 (copy), v2 (copy), v8 (copy)
        v9 = v4.Dictionary.join(v9, {
            usersNetworking = v7.config({
                roduxNetworking = v5.mock()
            }), 
            friendsNetworking = v6.config({
                roduxNetworking = v5.mock()
            })
        });
        return {
            installReducer = function() --[[ Line: 24 ]] --[[ Name: installReducer ]]
                -- upvalues: v0 (ref), v9 (ref)
                return v0(v9);
            end, 
            Actions = v1, 
            Models = v2, 
            roduxUsersTypes = v8
        };
    end
};
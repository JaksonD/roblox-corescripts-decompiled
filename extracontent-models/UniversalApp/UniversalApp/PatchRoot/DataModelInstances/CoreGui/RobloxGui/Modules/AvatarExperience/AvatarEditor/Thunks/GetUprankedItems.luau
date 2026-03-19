local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRemoteUprankedItems);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local _ = require(l_Modules_0.LuaApp.Types.RoduxTypes);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local function _(v12) --[[ Line: 30 ]]
    -- upvalues: v5 (copy)
    local l_uprankedItems_0 = v12.uprankedItems;
    local l_resolve_0 = v12.resolve;
    local l_store_0 = v12.store;
    if not l_uprankedItems_0 or #l_uprankedItems_0 == 0 then
        return l_resolve_0();
    else
        l_store_0:dispatch(v5(l_uprankedItems_0));
        l_resolve_0();
        return;
    end;
end;
local function v26(v17) --[[ Line: 49 ]] --[[ Name: fetchItems ]]
    -- upvalues: v7 (copy), v5 (copy)
    return v7.GetRemoteUpranked(v17.networkImpl, v17.userId):andThen(function(v18) --[[ Line: 57 ]]
        -- upvalues: v17 (copy), v5 (ref)
        local l_responseBody_0 = v18.responseBody;
        local v20 = {
            networkImpl = v17.networkImpl, 
            uprankedItems = l_responseBody_0.outfitDetails, 
            store = v17.store, 
            resolve = v17.resolve
        };
        local l_uprankedItems_1 = v20.uprankedItems;
        local l_resolve_1 = v20.resolve;
        local l_store_1 = v20.store;
        if not l_uprankedItems_1 or #l_uprankedItems_1 == 0 then
            local _ = l_resolve_1();
            return;
        else
            l_store_1:dispatch(v5(l_uprankedItems_1));
            l_resolve_1();
            return;
        end;
    end):catch(function(v25) --[[ Line: 66 ]]
        -- upvalues: v17 (copy)
        warn("GetRemoteUpranked failure: ", v25);
        return v17.reject(v25);
    end);
end;
return function(v27) --[[ Line: 72 ]]
    -- upvalues: v10 (copy), v3 (copy), v26 (copy)
    return function(v28) --[[ Line: 73 ]]
        -- upvalues: v10 (ref), v3 (ref), v26 (ref), v27 (copy)
        local v29 = v28:getState();
        local v30 = v10.getUserId(v29);
        return v3.new(function(v31, v32) --[[ Line: 77 ]]
            -- upvalues: v26 (ref), v27 (ref), v30 (copy), v28 (copy)
            v26({
                networkImpl = v27, 
                userId = v30, 
                store = v28, 
                resolve = v31, 
                reject = v32
            });
        end);
    end;
end;
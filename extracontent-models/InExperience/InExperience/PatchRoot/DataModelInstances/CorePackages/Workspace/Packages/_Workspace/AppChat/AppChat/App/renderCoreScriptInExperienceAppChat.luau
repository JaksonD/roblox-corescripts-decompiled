local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v4 = require(l_Parent_0.FocusNavigationUtils);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.ReactFocusNavigation);
local v7 = require(l_Parent_0.ReactRoblox);
local v8 = require(l_Parent_0.Rodux);
local l_Provider_0 = v4.FocusNavigableSurfaceRegistry.Provider;
local v10 = require(l_script_FirstAncestor_0.App.AppChatReducer);
local v11 = require(l_script_FirstAncestor_0.App.InExperienceAppChat);
local v12 = require(l_script_FirstAncestor_0.App.InExperienceAppChatProviders);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatSignalsMessageStore);
local v14 = require(l_script_FirstAncestor_0.Middleware.SignalsMessageIngestionMiddleware);
return function(v15, v16, v17) --[[ Line: 23 ]]
    -- upvalues: l_CoreGui_0 (copy), v7 (copy), v8 (copy), v13 (copy), v14 (copy), v10 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v6 (copy), v5 (copy), l_Provider_0 (copy), v12 (copy), v11 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "AppChat";
    l_Folder_0.Parent = l_CoreGui_0;
    local v19 = v7.createRoot(l_Folder_0);
    local v20 = {
        v8.thunkMiddleware
    };
    if v13 then
        table.insert(v20, v14);
    end;
    local v21 = v8.Store.new(v10, nil, v20);
    local v22 = if l_FFlagEnableAppChatFocusableFixes_0 then v6.FocusNavigationService.new(v6.EngineInterface.CoreGui) else nil;
    local function v23() --[[ Line: 45 ]] --[[ Name: AppChatMainWithFocusRoot ]]
        -- upvalues: v5 (ref), v6 (ref), v22 (copy), l_Provider_0 (ref), v12 (ref), v21 (copy), v17 (copy), v16 (copy), v15 (copy), v11 (ref)
        return v5.createElement(v6.FocusNavigationContext.Provider, {
            value = v22
        }, {
            FocusNavigationRegistryProvider = v5.createElement(l_Provider_0, nil, {
                InExperienceAppChatProviders = v5.createElement(v12, {
                    store = v21, 
                    updateAppChatUnreadMessagesCount = v17, 
                    parentContainerContext = v16, 
                    apolloClient = v15
                }, {
                    appChat = v5.createElement(v11)
                })
            })
        });
    end;
    local function v24() --[[ Line: 63 ]] --[[ Name: AppChatMainWithoutFocusRoot ]]
        -- upvalues: v5 (ref), v12 (ref), v21 (copy), v17 (copy), v16 (copy), v15 (copy), v11 (ref)
        return v5.createElement(v12, {
            store = v21, 
            updateAppChatUnreadMessagesCount = v17, 
            parentContainerContext = v16, 
            apolloClient = v15
        }, {
            appChat = v5.createElement(v11)
        });
    end;
    v19:render(if l_FFlagEnableAppChatFocusableFixes_0 then v23() else v24());
    return v19;
end;
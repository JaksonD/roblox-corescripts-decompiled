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
return function(v13, v14, v15) --[[ Line: 20 ]]
    -- upvalues: l_CoreGui_0 (copy), v7 (copy), v8 (copy), v10 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v6 (copy), v5 (copy), l_Provider_0 (copy), v12 (copy), v11 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "AppChat";
    l_Folder_0.Parent = l_CoreGui_0;
    local v17 = v7.createRoot(l_Folder_0);
    local v18 = v8.Store.new(v10, nil, {
        v8.thunkMiddleware
    });
    local v19 = if l_FFlagEnableAppChatFocusableFixes_0 then v6.FocusNavigationService.new(v6.EngineInterface.CoreGui) else nil;
    local function v20() --[[ Line: 38 ]] --[[ Name: AppChatMainWithFocusRoot ]]
        -- upvalues: v5 (ref), v6 (ref), v19 (copy), l_Provider_0 (ref), v12 (ref), v18 (copy), v15 (copy), v14 (copy), v13 (copy), v11 (ref)
        return v5.createElement(v6.FocusNavigationContext.Provider, {
            value = v19
        }, {
            FocusNavigationRegistryProvider = v5.createElement(l_Provider_0, nil, {
                InExperienceAppChatProviders = v5.createElement(v12, {
                    store = v18, 
                    updateAppChatUnreadMessagesCount = v15, 
                    parentContainerContext = v14, 
                    apolloClient = v13
                }, {
                    appChat = v5.createElement(v11)
                })
            })
        });
    end;
    local function v21() --[[ Line: 56 ]] --[[ Name: AppChatMainWithoutFocusRoot ]]
        -- upvalues: v5 (ref), v12 (ref), v18 (copy), v15 (copy), v14 (copy), v13 (copy), v11 (ref)
        return v5.createElement(v12, {
            store = v18, 
            updateAppChatUnreadMessagesCount = v15, 
            parentContainerContext = v14, 
            apolloClient = v13
        }, {
            appChat = v5.createElement(v11)
        });
    end;
    v17:render(if l_FFlagEnableAppChatFocusableFixes_0 then v20() else v21());
    return v17;
end;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_CoreScriptsRootProvider_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider;
local v8 = require(l_CorePackages_0.Workspace.Packages.PlayerList);
local v9 = require(script.Parent.Analytics.BlockingAnalytics);
local v10 = require(script.Parent.Components.Blocking.BlockingModalScreen);
local l_FFlagAddNewPlayerListMobileFocusNav_0 = v8.Flags.FFlagAddNewPlayerListMobileFocusNav;
local v12 = nil;
local function _() --[[ Line: 23 ]]
    -- upvalues: v12 (ref), v5 (copy), l_ContextActionService_0 (copy)
    if v12 ~= nil then
        v5.unmount(v12);
        v12 = nil;
        l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
    end;
end;
return function(v14, v15, v16, v17) --[[ Line: 32 ]]
    -- upvalues: v6 (copy), v9 (copy), v12 (ref), v5 (copy), l_ContextActionService_0 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (copy), l_GuiService_0 (copy), v10 (copy), l_CoreScriptsRootProvider_0 (copy), l_RobloxGui_0 (copy)
    return v6.new(function(v18) --[[ Line: 33 ]]
        -- upvalues: v15 (copy), v9 (ref), v14 (copy), v16 (copy), v12 (ref), v5 (ref), l_ContextActionService_0 (ref), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v17 (copy), l_GuiService_0 (ref), v10 (ref), l_CoreScriptsRootProvider_0 (ref), l_RobloxGui_0 (ref)
        local v19 = v15 or v9.new();
        v19:action("SettingsHub", "blockUserButtonClick", {
            blockeeUserId = v14.UserId, 
            source = v16
        });
        if v12 ~= nil then
            v5.unmount(v12);
            v12 = nil;
            l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
        end;
        local function v20() --[[ Line: 42 ]]
            -- upvalues: v12 (ref), v5 (ref), l_ContextActionService_0 (ref), v18 (copy), l_FFlagAddNewPlayerListMobileFocusNav_0 (ref), v17 (ref), l_GuiService_0 (ref)
            if v12 ~= nil then
                v5.unmount(v12);
                v12 = nil;
                l_ContextActionService_0:UnbindCoreAction("BlockingModalScreen");
            end;
            v18();
            if l_FFlagAddNewPlayerListMobileFocusNav_0 then
                if v17 and v17.onBlockingModalClose then
                    v17.onBlockingModalClose();
                    return;
                end;
            elseif l_FFlagAddNewPlayerListMobileFocusNav_0 then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        local v21 = v5.createElement(v10, {
            player = v14, 
            closeModal = v20, 
            analytics = v19, 
            source = v16, 
            onBlockingSuccess = v17 and v17.onBlockingSuccess or nil
        });
        local v22 = v5.createElement(l_CoreScriptsRootProvider_0, {}, {
            BlockingModalScreen = v21
        });
        v12 = v5.mount(v22, l_RobloxGui_0, "BlockingContainer");
        l_ContextActionService_0:BindCoreAction("BlockingModalScreen", v20, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape);
    end);
end;
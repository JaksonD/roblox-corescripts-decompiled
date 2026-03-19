local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Workspace.Packages.Chrome);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.Songbird);
local v7 = require(l_script_FirstAncestor_0.Service);
local v8 = require(l_script_FirstAncestor_0.Integrations.MusicUtility.Constants);
local v9 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Service.WindowSizeSignal);
local v11 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local v12 = require(l_CorePackages_0.Packages.Signals);
local v13 = require(l_CorePackages_0.Packages.SignalsReact);
local l_MappedSignal_0 = require(l_script_FirstAncestor_0.ChromeShared.Service.ChromeUtils).MappedSignal;
local l_MUSIC_WINDOW_MAX_SIZE_0 = v8.MUSIC_WINDOW_MAX_SIZE;
local l_useSignalState_0 = v13.useSignalState;
local v17 = v10.new(l_MUSIC_WINDOW_MAX_SIZE_0.X, l_MUSIC_WINDOW_MAX_SIZE_0.Y);
local v18 = l_MappedSignal_0.new(v7:onIntegrationStatusChanged(), function() --[[ Line: 27 ]]
    -- upvalues: v7 (copy)
    return v7:isWindowOpen("music_entrypoint");
end);
local v19, v20 = v12.createSignal(false);
local function v21() --[[ Line: 33 ]] --[[ Name: focusMusicWindow ]]
    -- upvalues: l_GuiService_0 (copy), v20 (copy)
    l_GuiService_0:SetMenuIsOpen(true, "music_entrypoint");
    v20(true);
end;
local function v22() --[[ Line: 38 ]] --[[ Name: unfocusMusicWindow ]]
    -- upvalues: v20 (copy), l_GuiService_0 (copy)
    v20(false);
    l_GuiService_0:SetMenuIsOpen(false, "music_entrypoint");
end;
return v7:register({
    initialAvailability = v7.AvailabilitySignal.Available, 
    id = "music_entrypoint", 
    draggable = true, 
    cachePosition = true, 
    windowSize = v17, 
    label = "CoreScripts.TopBar.Music", 
    activated = function() --[[ Line: 50 ]] --[[ Name: activated ]]
        -- upvalues: v11 (copy), v3 (copy), v21 (copy), v18 (copy), v7 (copy)
        if v11.GetInputModeStore(false).getLastInputType(false) == v11.Input.Directional then
            v3.FocusUtils.FocusOffChrome(v21);
            if not v18:get() then
                v7:toggleWindow("music_entrypoint");
                return;
            end;
        else
            v7:toggleWindow("music_entrypoint");
        end;
    end, 
    isActivated = function() --[[ Line: 66 ]] --[[ Name: isActivated ]]
        -- upvalues: v18 (copy)
        return v18:get();
    end, 
    components = {
        Icon = function(_) --[[ Line: 70 ]] --[[ Name: Icon ]]
            -- upvalues: v9 (copy), v18 (copy)
            return v9("icons/common/music", "icons/common/musicFilled_medium", v18);
        end, 
        Window = function() --[[ Line: 73 ]] --[[ Name: Window ]]
            -- upvalues: l_useSignalState_0 (copy), v19 (copy), v5 (copy), v4 (copy), v17 (copy), v6 (copy), v20 (copy), l_GuiService_0 (copy), v7 (copy), v22 (copy)
            local v24 = l_useSignalState_0(v19);
            return v5.createElement(v4.View, {
                tag = "auto-xy", 
                onAbsoluteSizeChanged = function(v25) --[[ Line: 78 ]] --[[ Name: onAbsoluteSizeChanged ]]
                    -- upvalues: v17 (ref)
                    v17:requestSize(v25.AbsoluteSize.X, v25.AbsoluteSize.Y);
                end
            }, {
                ChromeWindowWrapper = v5.createElement(v6.ChromeWindowWrapper, {
                    isFocused = v24, 
                    onClose = function() --[[ Line: 84 ]] --[[ Name: onClose ]]
                        -- upvalues: v20 (ref), l_GuiService_0 (ref), v7 (ref)
                        v20(false);
                        l_GuiService_0:SetMenuIsOpen(false, "music_entrypoint");
                        v7:toggleWindow("music_entrypoint");
                    end, 
                    onUnfocus = v22
                })
            });
        end
    }
});
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.ChatLineReporting);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_ChatLineReportSelectionModal_0 = v2.ChatLineReportSelectionModal;
local l_ChatLineSelectionMode_0 = v2.Enums.ChatLineSelectionMode;
local v7 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v7.FocusNavigableSurfaceIdentifierEnum;
local l_FocusRoot_0 = v7.FocusRoot;
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v12 = require(l_script_FirstAncestor_0.Hooks.useOrderedMessages);
local function v18(v13) --[[ Line: 28 ]] --[[ Name: ChatModalSelectorDialog ]]
    -- upvalues: l_useStyle_0 (copy), v12 (copy), v3 (copy), l_ChatLineReportSelectionModal_0 (copy), l_ChatLineSelectionMode_0 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v15 = v12();
    local v17 = v3.useCallback(function(v16) --[[ Line: 33 ]]
        -- upvalues: v13 (copy), v15 (copy)
        v13.onSelect(v16, v15);
        v13.onClose();
    end, {
        v15
    });
    if not v13.isShown then
        return nil;
    else
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            Overlay = v3.createElement("TextButton", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                AutoButtonColor = false, 
                BackgroundColor3 = l_Theme_0.Overlay.Color, 
                BackgroundTransparency = l_Theme_0.Overlay.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Selectable = false, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "", 
                ZIndex = 10, 
                [v3.Event.Activated] = function() --[[ Line: 56 ]]
                    -- upvalues: v13 (copy)
                    v13.onClose();
                end
            }), 
            ChatLineReportSelectionModalFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                ZIndex = 11
            }, v3.createElement(l_ChatLineReportSelectionModal_0, {
                isCentered = true, 
                onContinue = v17, 
                onBack = v13.onClose, 
                mode = l_ChatLineSelectionMode_0.Direct, 
                messages = v15, 
                analyticsDispatch = function() --[[ Line: 74 ]] --[[ Name: analyticsDispatch ]]

                end
            }))
        });
    end;
end;
DialogWrapper = function(v19) --[[ Line: 80 ]] --[[ Name: DialogWrapper ]]
    -- upvalues: v3 (copy), l_FocusRoot_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v18 (copy)
    return v3.createElement(l_FocusRoot_0, {
        surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, 
        isIsolated = true, 
        isAutoFocusRoot = true
    }, {
        DialogContainer = v3.createElement(v18, v19)
    });
end;
return DialogWrapper;
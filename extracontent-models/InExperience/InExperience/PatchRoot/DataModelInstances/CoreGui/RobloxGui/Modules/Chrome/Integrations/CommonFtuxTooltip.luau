local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v5 = require(l_CorePackages_0.Packages.React);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_CorePackages_0.Packages.Cryo);
local v8 = require(l_script_FirstAncestor_0.Service);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Service.LocalStore);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Tooltips.TooltipContext);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Tooltips.TooltipProvider);
local v12 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Tooltips.useIsTooltipTurn);
local v13 = require(l_script_FirstAncestor_0.Parent.TopBar.Components.Presentation.menuIconHoveredSignal);
local v14 = require(l_script_FirstAncestor_0.Integrations.FtuxTooltipAnchor);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = {
    id = nil, 
    priority = 1, 
    showDelay = 3000, 
    dismissDelay = 5000, 
    onDismissed = function(_, _) --[[ Line: 41 ]] --[[ Name: onDismissed ]]

    end
};
local function v43(v19) --[[ Line: 44 ]]
    -- upvalues: v5 (copy), v10 (copy), v12 (copy), v9 (copy), l_useLocalization_0 (copy), l_UserInputService_0 (copy), v18 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v8 (copy), l_GuiService_0 (copy), v13 (copy), v14 (copy)
    local v20 = v5.useRef(nil);
    local v21, _ = v5.useState(false);
    local v23, v24 = v5.useState(false);
    local v25 = v5.useContext(v10);
    local v26 = v12(v19.id) or false;
    local v28 = v5.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy), v9 (ref)
        local v27 = false;
        if v19.localStorageKey then
            v27 = v9.getValue(v19.localStorageKey) or false;
        end;
        return v27;
    end, {
        v19.localStorageKey
    });
    local v29 = v19.isIconVisible and not v28 and not v23;
    local v30 = v29 and v26;
    local v31 = l_useLocalization_0({
        headerText = v19.headerKey, 
        bodyText = v19.bodyKey
    });
    local v33 = v5.useCallback(function(v32) --[[ Line: 69 ]]
        -- upvalues: v19 (copy), v30 (copy), v24 (copy), v25 (copy)
        if v19.onDismissed then
            v19.onDismissed(v30, v32);
        end;
        v24(true);
        if v25 and v19.id then
            v25.dismissTooltip(v19.id, v32);
        end;
    end, {
        v24, 
        v30
    });
    v5.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v19 (copy), v21 (copy), v23 (copy), l_UserInputService_0 (ref), v20 (copy), v29 (copy), v33 (copy)
        local v34 = nil;
        if v19.dismissOnOutsideInput and v21 and not v23 then
            v34 = l_UserInputService_0.InputBegan:Connect(function(v35) --[[ Line: 84 ]]
                -- upvalues: v20 (ref), v29 (ref), v33 (ref)
                if (v35.UserInputType == Enum.UserInputType.Touch or v35.UserInputType == Enum.UserInputType.MouseButton1) and v20.current ~= nil then
                    local l_Position_0 = v35.Position;
                    local l_AbsolutePosition_0 = v20.current.AbsolutePosition;
                    local l_AbsoluteSize_0 = v20.current.AbsoluteSize;
                    if v29 and (l_Position_0.X < l_AbsolutePosition_0.X or l_Position_0.X > l_AbsolutePosition_0.X + l_AbsoluteSize_0.X or l_Position_0.Y < l_AbsolutePosition_0.Y or l_Position_0.Y > l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y) then
                        v33("outsideInput");
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 111 ]]
            -- upvalues: v34 (ref)
            if v34 then
                v34:Disconnect();
                v34 = nil;
            end;
        end;
    end, {
        v23, 
        v21, 
        v29
    });
    v5.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v25 (copy), v19 (copy), v29 (copy), v18 (ref)
        if v25 and v19.id and v29 then
            v25.registerTooltip(v19.id, v19.priority, v19.showDelay or v18.showDelay, v19.dismissDelay or v18.dismissDelay);
        end;
        return function() --[[ Line: 129 ]]
            -- upvalues: v25 (ref), v19 (ref), v29 (ref)
            if v25 and v19.id and v29 then
                v25.unregisterTooltip(v19.id);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v29, 
        v19.id
    } else l_dependencyArray_0(v29, v19.id));
    v5.useEffect(function() --[[ Line: 140 ]]
        -- upvalues: v8 (ref), v29 (copy), v33 (copy), l_GuiService_0 (ref), v13 (ref)
        local v40 = {
            v8:onIntegrationActivated():connect(function() --[[ Line: 144 ]]
                -- upvalues: v29 (ref), v33 (ref)
                if v29 then
                    v33("unibarActivated");
                end;
            end), 
            v8:onIntegrationHovered():connect(function() --[[ Line: 149 ]]
                -- upvalues: v29 (ref), v33 (ref)
                if v29 then
                    v33("unibarHovered");
                end;
            end), 
            l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 154 ]]
                -- upvalues: v29 (ref), v33 (ref)
                if v29 then
                    v33("menuOpened");
                end;
            end), 
            v13:connect(function(v39) --[[ Line: 159 ]]
                -- upvalues: v29 (ref), v33 (ref)
                if v29 and v39 then
                    v33("menuIconHovered");
                end;
            end)
        };
        return function() --[[ Line: 166 ]]
            -- upvalues: v40 (copy)
            for _, v42 in v40 do
                if v42.disconnect then
                    v42:disconnect();
                elseif v42.Disconnect then
                    v42:Disconnect();
                end;
            end;
        end;
    end, {
        v8, 
        l_GuiService_0, 
        v13, 
        v29, 
        v33
    });
    v5.useEffect(function() --[[ Line: 177 ]]
        -- upvalues: v30 (copy), v19 (copy), v9 (ref)
        if v30 and v19.localStorageKey then
            v9.storeForLocalPlayer(v19.localStorageKey, true);
        end;
    end, {
        v30, 
        v19.localStorageKey
    });
    return v5.createElement(v14, {
        ref = v20, 
        bodyText = v31.bodyText, 
        headerText = v31.headerText, 
        shouldShowTooltip = v30
    });
end;
return function(v44) --[[ Line: 205 ]]
    -- upvalues: v7 (copy), v18 (copy), v5 (copy), v43 (copy)
    local v45 = v7.Dictionary.union(v18, v44);
    return v5.createElement(v43, v45);
end;
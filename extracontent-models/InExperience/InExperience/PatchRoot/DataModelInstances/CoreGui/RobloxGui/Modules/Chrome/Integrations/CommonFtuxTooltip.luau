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
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagEnableUnibarTooltipQueue)();
local v14 = require(l_CorePackages_0.Packages.LuauPolyfill);
local l_clearTimeout_0 = v14.clearTimeout;
local l_setTimeout_0 = v14.setTimeout;
local v17 = require(l_script_FirstAncestor_0.Parent.TopBar.Components.Presentation.menuIconHoveredSignal);
local v18 = require(l_script_FirstAncestor_0.Integrations.FtuxTooltipAnchor);
local v21 = {
    id = nil, 
    priority = 1, 
    showDelay = 3000, 
    dismissDelay = 5000, 
    onDismissed = function(_, _) --[[ Line: 43 ]] --[[ Name: onDismissed ]]

    end
};
local function v48(v22) --[[ Line: 46 ]]
    -- upvalues: v5 (copy), l_setTimeout_0 (copy), v13 (copy), v10 (copy), v12 (copy), v9 (copy), l_useLocalization_0 (copy), l_UserInputService_0 (copy), v21 (copy), l_dependencyArray_0 (copy), v8 (copy), l_GuiService_0 (copy), v17 (copy), l_clearTimeout_0 (copy), v18 (copy)
    local v23 = v5.useRef(nil);
    local v24, v25 = v5.useState(false);
    local v26, v27 = v5.useState(false);
    local v28 = v5.useRef(l_setTimeout_0(function() --[[ Line: 50 ]]

    end, v22.showDelay));
    local v29 = v5.useRef(l_setTimeout_0(function() --[[ Line: 51 ]]

    end, v22.dismissDelay));
    local v30 = nil;
    local v31 = false;
    if v13 then
        v30 = v5.useContext(v10);
        v31 = v12(v22.id) or false;
    end;
    local v33 = v5.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: v22 (copy), v9 (ref)
        local v32 = false;
        if v22.localStorageKey then
            v32 = v9.getValue(v22.localStorageKey) or false;
        end;
        return v32;
    end, {
        v22.localStorageKey
    });
    local v34 = v22.isIconVisible and not v33 and not v26;
    local v35 = if v13 then v34 and v31 else v34 and v24;
    local v36 = l_useLocalization_0({
        headerText = v22.headerKey, 
        bodyText = v22.bodyKey
    });
    local v38 = v5.useCallback(function(v37) --[[ Line: 79 ]]
        -- upvalues: v22 (copy), v35 (copy), v27 (copy), v30 (ref)
        if v22.onDismissed then
            v22.onDismissed(v35, v37);
        end;
        v27(true);
        if v30 and v22.id then
            v30.dismissTooltip(v22.id, v37);
        end;
    end, {
        v27, 
        v35
    });
    v5.useEffect(function() --[[ Line: 91 ]]
        -- upvalues: v22 (copy), v24 (copy), v26 (copy), l_UserInputService_0 (ref), v23 (copy), v34 (copy), v38 (copy)
        local v39 = nil;
        if v22.dismissOnOutsideInput and v24 and not v26 then
            v39 = l_UserInputService_0.InputBegan:Connect(function(v40) --[[ Line: 94 ]]
                -- upvalues: v23 (ref), v34 (ref), v38 (ref)
                if (v40.UserInputType == Enum.UserInputType.Touch or v40.UserInputType == Enum.UserInputType.MouseButton1) and v23.current ~= nil then
                    local l_Position_0 = v40.Position;
                    local l_AbsolutePosition_0 = v23.current.AbsolutePosition;
                    local l_AbsoluteSize_0 = v23.current.AbsoluteSize;
                    if v34 and (l_Position_0.X < l_AbsolutePosition_0.X or l_Position_0.X > l_AbsolutePosition_0.X + l_AbsoluteSize_0.X or l_Position_0.Y < l_AbsolutePosition_0.Y or l_Position_0.Y > l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y) then
                        v38("outsideInput");
                    end;
                end;
            end);
        end;
        return function() --[[ Line: 121 ]]
            -- upvalues: v39 (ref)
            if v39 then
                v39:Disconnect();
                v39 = nil;
            end;
        end;
    end, {
        v26, 
        v24, 
        v34
    });
    v5.useEffect(function() --[[ Line: 129 ]]
        -- upvalues: v30 (ref), v22 (copy), v34 (copy), v21 (ref)
        if v30 and v22.id and v34 then
            v30.registerTooltip(v22.id, v22.priority, v22.showDelay or v21.showDelay, v22.dismissDelay or v21.dismissDelay);
        end;
        return function() --[[ Line: 138 ]]
            -- upvalues: v30 (ref), v22 (ref), v34 (ref)
            if v30 and v22.id and v34 then
                v30.unregisterTooltip(v22.id);
            end;
        end;
    end, l_dependencyArray_0(v34, v22.id));
    v5.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v8 (ref), v34 (copy), v38 (copy), l_GuiService_0 (ref), v17 (ref)
        local v45 = {
            v8:onIntegrationActivated():connect(function() --[[ Line: 149 ]]
                -- upvalues: v34 (ref), v38 (ref)
                if v34 then
                    v38("unibarActivated");
                end;
            end), 
            v8:onIntegrationHovered():connect(function() --[[ Line: 154 ]]
                -- upvalues: v34 (ref), v38 (ref)
                if v34 then
                    v38("unibarHovered");
                end;
            end), 
            l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 159 ]]
                -- upvalues: v34 (ref), v38 (ref)
                if v34 then
                    v38("menuOpened");
                end;
            end), 
            v17:connect(function(v44) --[[ Line: 164 ]]
                -- upvalues: v34 (ref), v38 (ref)
                if v34 and v44 then
                    v38("menuIconHovered");
                end;
            end)
        };
        return function() --[[ Line: 171 ]]
            -- upvalues: v45 (copy)
            for _, v47 in v45 do
                if v47.disconnect then
                    v47:disconnect();
                elseif v47.Disconnect then
                    v47:Disconnect();
                end;
            end;
        end;
    end, {
        v8, 
        l_GuiService_0, 
        v17, 
        v34, 
        v38
    });
    if not v13 then
        v5.useEffect(function() --[[ Line: 185 ]]
            -- upvalues: l_clearTimeout_0 (ref), v28 (copy), v34 (copy), l_setTimeout_0 (ref), v25 (copy), v22 (copy)
            l_clearTimeout_0(v28.current);
            if v34 then
                v28.current = l_setTimeout_0(function() --[[ Line: 188 ]]
                    -- upvalues: v34 (ref), v25 (ref)
                    if v34 then
                        v25(true);
                    end;
                end, v22.showDelay);
            end;
        end, {
            v34, 
            v28
        });
        v5.useEffect(function() --[[ Line: 197 ]]
            -- upvalues: l_clearTimeout_0 (ref), v29 (copy), v24 (copy), l_setTimeout_0 (ref), v38 (copy), v22 (copy)
            l_clearTimeout_0(v29.current);
            if v24 then
                v29.current = l_setTimeout_0(function() --[[ Line: 200 ]]
                    -- upvalues: v38 (ref)
                    v38("timeout");
                end, v22.dismissDelay);
            end;
        end, {
            v24, 
            v29
        });
    end;
    v5.useEffect(function() --[[ Line: 207 ]]
        -- upvalues: v35 (copy), v22 (copy), v9 (ref)
        if v35 and v22.localStorageKey then
            v9.storeForLocalPlayer(v22.localStorageKey, true);
        end;
    end, {
        v35, 
        v22.localStorageKey
    });
    return v5.createElement(v18, {
        ref = v23, 
        bodyText = v36.bodyText, 
        headerText = v36.headerText, 
        shouldShowTooltip = v35
    });
end;
return function(v49) --[[ Line: 235 ]]
    -- upvalues: v7 (copy), v21 (copy), v5 (copy), v48 (copy)
    local v50 = v7.Dictionary.union(v21, v49);
    return v5.createElement(v48, v50);
end;
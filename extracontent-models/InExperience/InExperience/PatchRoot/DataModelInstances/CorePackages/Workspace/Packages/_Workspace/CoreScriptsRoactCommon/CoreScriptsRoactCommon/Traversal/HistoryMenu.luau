local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v1 = require(l_Parent_0.DataHydration);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.Localization);
local v5 = require(l_Parent_0.React);
local l_getGameInfoStore_0 = v1.Game.getGameInfoStore;
local l_getVotesStore_0 = v1.Game.getVotesStore;
local v8 = require(script.Parent.Constants);
local l_default_0 = require(script.Parent.LocalTraversalHistory).default;
local v10 = require(script.Parent.Flags);
local v11 = require(script.Parent.TraversalTelemetry);
local l_Icon_0 = v3.Icon;
local l_IconName_0 = v3.Enums.IconName;
local l_Menu_0 = v3.Menu;
local l_PopoverAlign_0 = v3.Enums.PopoverAlign;
local l_PopoverSide_0 = v3.Enums.PopoverSide;
local l_View_0 = v3.View;
local l_useLocalization_0 = v4.Hooks.useLocalization;
local l_FIntMaximumTraversalHistoryItemsFetch_0 = v10.FIntMaximumTraversalHistoryItemsFetch;
local l_FFlagTraversalHistoryMenuFocusNavFix_0 = v10.FFlagTraversalHistoryMenuFocusNavFix;
local l_FFlagTraversalPerfFixes_0 = v10.FFlagTraversalPerfFixes;
local l_FFlagFixTraversalHistoryMenuFixesV3_0 = v10.FFlagFixTraversalHistoryMenuFixesV3;
local function _(v23) --[[ Line: 50 ]] --[[ Name: formatTags ]]
    if typeof(v23) == "table" then
        return v23;
    else
        return {
            [v23] = true
        };
    end;
end;
local function _(v25, v26, v27) --[[ Line: 57 ]] --[[ Name: setMenuSelection ]]
    -- upvalues: l_PopoverSide_0 (copy)
    if not v25 or not v25.current then
        return;
    elseif v27 == l_PopoverSide_0.Top then
        v25.current.NextSelectionUp = v26;
        return;
    else
        if v27 == l_PopoverSide_0.Bottom then
            v25.current.NextSelectionDown = v26;
        end;
        return;
    end;
end;
return v5.memo(v5.forwardRef(function(v29, v30) --[[ Line: 72 ]] --[[ Name: HistoryMenu ]]
    -- upvalues: l_FFlagFixTraversalHistoryMenuFixesV3_0 (copy), v5 (copy), v8 (copy), l_useLocalization_0 (copy), l_PopoverSide_0 (copy), v2 (copy), l_FFlagTraversalPerfFixes_0 (copy), l_default_0 (copy), l_FIntMaximumTraversalHistoryItemsFetch_0 (copy), l_getGameInfoStore_0 (copy), l_getVotesStore_0 (copy), l_FFlagTraversalHistoryMenuFocusNavFix_0 (copy), v11 (copy), l_IconName_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy)
    local v31 = nil;
    if not l_FFlagFixTraversalHistoryMenuFixesV3_0 then
        v31 = v5.useRef(nil);
    end;
    local v32 = nil;
    v32 = if v29.idleButtonStateIsDown ~= nil then v29.idleButtonStateIsDown else v8.DEFAULT_CHEVRON_BUTTON_STATE;
    local v33, v34 = v5.useState(false);
    local v35 = v33 and not v32 or not v33 and v32;
    local v36 = l_useLocalization_0({
        history = "CoreScripts.TopBar.Traversal.History"
    });
    local v37 = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v5.useRef(nil) else nil;
    local v38 = nil;
    if l_FFlagFixTraversalHistoryMenuFixesV3_0 then
        v38 = v5.useCallback(function(v39) --[[ Line: 95 ]]
            -- upvalues: v37 (copy), v29 (copy), l_PopoverSide_0 (ref)
            local l_v37_0 = v37;
            local l_menuSide_0 = v29.menuSide;
            if l_v37_0 then
                if not l_v37_0.current then
                    return;
                elseif l_menuSide_0 == l_PopoverSide_0.Top then
                    l_v37_0.current.NextSelectionUp = v39;
                    return;
                elseif l_menuSide_0 == l_PopoverSide_0.Bottom then
                    l_v37_0.current.NextSelectionDown = v39;
                end;
            end;
        end, {
            v29.menuSide
        });
    end;
    local v44 = v5.useMemo(function() --[[ Line: 100 ]]
        -- upvalues: v29 (copy), v2 (ref)
        local v42;
        if v29.historyButtonTags then
            local l_historyButtonTags_0 = v29.historyButtonTags;
            v42 = if typeof(l_historyButtonTags_0) == "table" then l_historyButtonTags_0 else {
                [l_historyButtonTags_0] = true
            };
        else
            v42 = {};
        end;
        return v2.Dictionary.join({
            ["row auto-xy align-y-center align-x-center radius-medium"] = true
        }, v42);
    end, {
        v29.historyButtonTags
    });
    local v46 = v5.useCallback(function() --[[ Line: 107 ]]
        -- upvalues: l_FFlagTraversalPerfFixes_0 (ref), l_default_0 (ref), l_FIntMaximumTraversalHistoryItemsFetch_0 (ref), l_getGameInfoStore_0 (ref), l_getVotesStore_0 (ref), v29 (copy), v33 (copy), v34 (copy)
        if not l_FFlagTraversalPerfFixes_0 then
            local v45 = l_default_0:getUniverseHistory(l_FIntMaximumTraversalHistoryItemsFetch_0);
            l_getGameInfoStore_0(false).fetchGameInfos(v45);
            l_getVotesStore_0(false).fetchVotes(v45);
        end;
        if v29.onMenuToggled then
            v29.onMenuToggled(not v33);
        end;
        v34(not v33);
    end, {
        v33, 
        if l_FFlagTraversalPerfFixes_0 then nil else v34, 
        v29.onMenuToggled
    });
    local v47 = v5.useCallback(function() --[[ Line: 122 ]]
        -- upvalues: v34 (copy), l_FFlagTraversalHistoryMenuFocusNavFix_0 (ref), v29 (copy)
        v34(false);
        if l_FFlagTraversalHistoryMenuFocusNavFix_0 and v29.onMenuToggled then
            v29.onMenuToggled(false);
        end;
    end, {
        if l_FFlagTraversalPerfFixes_0 then nil else v34
    });
    if l_FFlagTraversalHistoryMenuFocusNavFix_0 then
        v5.useEffect(function() --[[ Line: 130 ]]
            -- upvalues: v29 (copy), v47 (copy)
            if not v29.closeMenuConn then
                return;
            else
                local v48 = v29.closeMenuConn(v47);
                return function() --[[ Line: 136 ]]
                    -- upvalues: v48 (copy)
                    for _, v50 in v48 do
                        v50:Disconnect();
                    end;
                end;
            end;
        end, {
            v29.closeMenuConn, 
            v47
        });
    else
        v5.useEffect(function() --[[ Line: 143 ]]
            -- upvalues: v29 (copy), v47 (copy)
            if v29.forceMenuClose then
                v47();
            end;
        end, {
            v29.forceMenuClose, 
            v47
        });
    end;
    local v52 = v5.useCallback(function(v51) --[[ Line: 150 ]]
        -- upvalues: v11 (ref), v47 (copy), v29 (copy)
        v11.sendHistoryMenuItemClick({
            integration_id = "history_dropdown", 
            event_type = "click", 
            destination_universe_id = tostring(v51)
        });
        v47();
        if not v29.onMenuItemSelected then
            return;
        else
            v29.onMenuItemSelected(v51);
            return;
        end;
    end, {
        v47, 
        v29.onMenuItemSelected
    });
    local v53 = v5.useCallback(function() --[[ Line: 164 ]]
        -- upvalues: v11 (ref), v47 (copy), v29 (copy)
        v11.sendHistoryMenuHistoryClick({
            integration_id = "history_landing", 
            event_type = "click"
        });
        v47();
        v29.onHistorySelected();
    end, {
        v47, 
        v29.onHistorySelected
    });
    local v57 = v5.useMemo(function() --[[ Line: 174 ]]
        -- upvalues: v2 (ref), v29 (copy), v36 (copy), l_IconName_0 (ref), v53 (copy)
        local v55 = v2.List.map(v29.historyItems, function(v54) --[[ Line: 175 ]]
            return {
                id = v54.universeId, 
                text = v54.text, 
                icon = v54.icon
            };
        end);
        local v56 = {
            id = "history", 
            text = v36.history, 
            icon = l_IconName_0.ClockSpinReverse, 
            onActivated = v53
        };
        return (v2.List.join(v55, {
            v56
        }));
    end, {
        v29.historyItems
    });
    return v5.createElement(l_View_0, {
        tag = "auto-xy"
    }, {
        ChevronButton = v5.createElement(l_View_0, {
            tag = v44, 
            onActivated = function() --[[ Line: 198 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (ref), v33 (copy), v46 (copy)
                v11.sendHistoryMenuButtonActionEvent({
                    integration_id = "history_chevron", 
                    event_type = not v33 and "open" or "close"
                });
                v46();
            end, 
            ref = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v37 else if v30 then nil else v31, 
            testId = "--chevron-button"
        }, {
            Chevron = v5.createElement(l_Icon_0, {
                name = if v35 then l_IconName_0.ChevronLargeDown else l_IconName_0.ChevronLargeUp
            })
        }), 
        Menu = v5.createElement(l_Menu_0, {
            align = l_PopoverAlign_0.Start, 
            anchorRef = v30 or if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v37 else v31, 
            isOpen = v33, 
            items = v57, 
            onActivated = v52, 
            onPressedOutside = v47, 
            side = if l_FFlagTraversalPerfFixes_0 then v29.menuSide else if v35 then l_PopoverSide_0.Bottom else l_PopoverSide_0.Top, 
            size = v29.menuSize, 
            width = if l_FFlagFixTraversalHistoryMenuFixesV3_0 and v30 and v30.current then UDim.new(0, v30.current.AbsoluteSize.X) else nil, 
            ref = if l_FFlagFixTraversalHistoryMenuFixesV3_0 then v38 else nil
        })
    });
end));
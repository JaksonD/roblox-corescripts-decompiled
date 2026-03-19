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
local function _(v22) --[[ Line: 49 ]] --[[ Name: formatTags ]]
    if typeof(v22) == "table" then
        return v22;
    else
        return {
            [v22] = true
        };
    end;
end;
return v5.memo(v5.forwardRef(function(v24, v25) --[[ Line: 56 ]] --[[ Name: HistoryMenu ]]
    -- upvalues: v5 (copy), v8 (copy), l_useLocalization_0 (copy), v2 (copy), l_FFlagTraversalPerfFixes_0 (copy), l_default_0 (copy), l_FIntMaximumTraversalHistoryItemsFetch_0 (copy), l_getGameInfoStore_0 (copy), l_getVotesStore_0 (copy), l_FFlagTraversalHistoryMenuFocusNavFix_0 (copy), v11 (copy), l_IconName_0 (copy), l_View_0 (copy), l_Icon_0 (copy), l_Menu_0 (copy), l_PopoverAlign_0 (copy), l_PopoverSide_0 (copy)
    local v26 = v5.useRef(nil);
    local v27 = nil;
    v27 = if v24.idleButtonStateIsDown ~= nil then v24.idleButtonStateIsDown else v8.DEFAULT_CHEVRON_BUTTON_STATE;
    local v28, v29 = v5.useState(false);
    local v30 = v28 and not v27 or not v28 and v27;
    local v31 = l_useLocalization_0({
        history = "CoreScripts.TopBar.Traversal.History"
    });
    local v34 = v5.useMemo(function() --[[ Line: 70 ]]
        -- upvalues: v24 (copy), v2 (ref)
        local v32;
        if v24.historyButtonTags then
            local l_historyButtonTags_0 = v24.historyButtonTags;
            v32 = if typeof(l_historyButtonTags_0) == "table" then l_historyButtonTags_0 else {
                [l_historyButtonTags_0] = true
            };
        else
            v32 = {};
        end;
        return v2.Dictionary.join({
            ["row auto-xy align-y-center align-x-center radius-medium"] = true
        }, v32);
    end, {
        v24.historyButtonTags
    });
    local v36 = v5.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: l_FFlagTraversalPerfFixes_0 (ref), l_default_0 (ref), l_FIntMaximumTraversalHistoryItemsFetch_0 (ref), l_getGameInfoStore_0 (ref), l_getVotesStore_0 (ref), v24 (copy), v28 (copy), v29 (copy)
        if not l_FFlagTraversalPerfFixes_0 then
            local v35 = l_default_0:getUniverseHistory(l_FIntMaximumTraversalHistoryItemsFetch_0);
            l_getGameInfoStore_0(false).fetchGameInfos(v35);
            l_getVotesStore_0(false).fetchVotes(v35);
        end;
        if v24.onMenuToggled then
            v24.onMenuToggled(not v28);
        end;
        v29(not v28);
    end, {
        v28, 
        if l_FFlagTraversalPerfFixes_0 then nil else v29, 
        v24.onMenuToggled
    });
    local v37 = v5.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy), l_FFlagTraversalHistoryMenuFocusNavFix_0 (ref), v24 (copy)
        v29(false);
        if l_FFlagTraversalHistoryMenuFocusNavFix_0 and v24.onMenuToggled then
            v24.onMenuToggled(false);
        end;
    end, {
        if l_FFlagTraversalPerfFixes_0 then nil else v29
    });
    if l_FFlagTraversalHistoryMenuFocusNavFix_0 then
        v5.useEffect(function() --[[ Line: 100 ]]
            -- upvalues: v24 (copy), v37 (copy)
            if not v24.closeMenuConn then
                return;
            else
                local v38 = v24.closeMenuConn(v37);
                return function() --[[ Line: 106 ]]
                    -- upvalues: v38 (copy)
                    for _, v40 in v38 do
                        v40:Disconnect();
                    end;
                end;
            end;
        end, {
            v24.closeMenuConn, 
            v37
        });
    else
        v5.useEffect(function() --[[ Line: 113 ]]
            -- upvalues: v24 (copy), v37 (copy)
            if v24.forceMenuClose then
                v37();
            end;
        end, {
            v24.forceMenuClose, 
            v37
        });
    end;
    local v42 = v5.useCallback(function(v41) --[[ Line: 120 ]]
        -- upvalues: v11 (ref), v37 (copy), v24 (copy)
        v11.sendHistoryMenuItemClick({
            integration_id = "history_dropdown", 
            event_type = "click", 
            destination_universe_id = tostring(v41)
        });
        v37();
        if not v24.onMenuItemSelected then
            return;
        else
            v24.onMenuItemSelected(v41);
            return;
        end;
    end, {
        v37, 
        v24.onMenuItemSelected
    });
    local v43 = v5.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v11 (ref), v37 (copy), v24 (copy)
        v11.sendHistoryMenuHistoryClick({
            integration_id = "history_landing", 
            event_type = "click"
        });
        v37();
        v24.onHistorySelected();
    end, {
        v37, 
        v24.onHistorySelected
    });
    local v47 = v5.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v2 (ref), v24 (copy), v31 (copy), l_IconName_0 (ref), v43 (copy)
        local v45 = v2.List.map(v24.historyItems, function(v44) --[[ Line: 145 ]]
            return {
                id = v44.universeId, 
                text = v44.text, 
                icon = v44.icon
            };
        end);
        local v46 = {
            id = "history", 
            text = v31.history, 
            icon = l_IconName_0.ClockSpinReverse, 
            onActivated = v43
        };
        return (v2.List.join(v45, {
            v46
        }));
    end, {
        v24.historyItems
    });
    return v5.createElement(l_View_0, {
        tag = "auto-xy"
    }, {
        ChevronButton = v5.createElement(l_View_0, {
            tag = v34, 
            onActivated = function() --[[ Line: 168 ]] --[[ Name: onActivated ]]
                -- upvalues: v11 (ref), v28 (copy), v36 (copy)
                v11.sendHistoryMenuButtonActionEvent({
                    integration_id = "history_chevron", 
                    event_type = not v28 and "open" or "close"
                });
                v36();
            end, 
            ref = if v25 then nil else v26, 
            testId = "--chevron-button"
        }, {
            Chevron = v5.createElement(l_Icon_0, {
                name = if v30 then l_IconName_0.ChevronLargeDown else l_IconName_0.ChevronLargeUp
            })
        }), 
        Menu = v5.createElement(l_Menu_0, {
            align = l_PopoverAlign_0.Start, 
            anchorRef = v25 or v26, 
            isOpen = v28, 
            items = v47, 
            onActivated = v42, 
            onPressedOutside = v37, 
            side = if l_FFlagTraversalPerfFixes_0 then v24.menuSide else if v30 then l_PopoverSide_0.Bottom else l_PopoverSide_0.Top, 
            size = v24.menuSize
        })
    });
end));
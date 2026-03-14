local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.Foundation);
local l_IconName_0 = v4.Enums.IconName;
local l_InputSize_0 = v4.Enums.InputSize;
local l_Menu_0 = v4.Menu;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Configs.PersonButtonConfigs);
local v10 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
local v11 = require(l_script_FirstAncestor_0.Components.Buttons.PersonButton);
local v12 = require(l_script_FirstAncestor_0.Constants);
return v2.memo(function(v13) --[[ Line: 29 ]] --[[ Name: CardMenu ]]
    -- upvalues: l_useLocalization_0 (copy), v12 (copy), v10 (copy), v9 (copy), v3 (copy), v2 (copy), l_IconName_0 (copy), l_Menu_0 (copy), l_InputSize_0 (copy), v11 (copy)
    local v14 = l_useLocalization_0({
        unblock = v12.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNBLOCK, 
        block = v12.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.BLOCK, 
        unmute = v12.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.UNMUTE, 
        mute = v12.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.MUTE, 
        report = v12.PEOPLEPAGE.PERSON_BUTTONS.LOCALIZED_STRINGS.REPORT
    });
    local v15 = v10("PeopleBlockStatusStore");
    local v16 = v10("PeopleVoiceChatStore");
    local v17 = v10("PeopleAnalyticsManager");
    local v18 = v10("Constants");
    local v19 = v9(v13.person.UserId);
    local v20 = v3.useSignalState(v15.getPlayerBlockStatus(v13.person.UserId));
    local v21 = v3.useSignalState(v16.getPlayerIsLocalMuted(v13.person.UserId));
    local v22 = v3.useSignalState(v16.getPlayerIsTalking(v13.person.UserId));
    local v23, v24 = v2.useState(false);
    local v26 = v2.useCallback(function(v25) --[[ Line: 51 ]]
        -- upvalues: v13 (copy), v24 (copy)
        v13.onIsOpenChanged(v25);
        v24(v25);
    end, {
        v13.onIsOpenChanged
    });
    local v27 = v2.useCallback(function() --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v26 (copy)
        v17:trackPersonCardMenuToggled(false);
        v26(false);
    end, {
        v26
    });
    local v29 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v23 (copy), v17 (copy), v26 (copy)
        local v28 = not v23;
        v17:trackPersonCardMenuToggled(v28);
        v26(v28);
    end, {
        v23, 
        v26
    });
    local v30 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v19 (copy), v18 (copy)
        return v19[v18.PERSON_BUTTONS.MUTE_PLAYER].animatedIcon;
    end, {
        v19
    });
    local v35 = v2.useMemo(function() --[[ Line: 71 ]]
        -- upvalues: v19 (copy), v18 (copy), v21 (copy), v14 (copy), l_IconName_0 (ref), v20 (copy), v26 (copy)
        local v31 = v19[v18.PERSON_BUTTONS.MUTE_PLAYER];
        local v32 = v19[v18.PERSON_BUTTONS.BLOCK_PLAYER];
        local v33 = v19[v18.PERSON_BUTTONS.REPORT_PLAYER];
        local v34 = {};
        if v31.shouldShow() then
            table.insert(v34, {
                id = "mute", 
                text = if v21 then v14.unmute else v14.mute, 
                icon = if v21 then l_IconName_0.SpeakerSlash else l_IconName_0.Speaker, 
                onActivated = function() --[[ Line: 83 ]] --[[ Name: onActivated ]]
                    -- upvalues: v31 (copy), v18 (ref)
                    v31.onActivated(v18.ANALYTICS.ENTRY_POINT.PEOPLE_CARD);
                end
            });
        end;
        if v32.shouldShow() then
            table.insert(v34, {
                id = "block", 
                text = if v20 then v14.unblock else v14.block, 
                icon = l_IconName_0.CircleSlash, 
                onActivated = function() --[[ Line: 93 ]] --[[ Name: onActivated ]]
                    -- upvalues: v32 (copy), v18 (ref), v26 (ref)
                    v32.onActivated(v18.ANALYTICS.ENTRY_POINT.PEOPLE_CARD);
                    v26(false);
                end
            });
        end;
        if v33.shouldShow() then
            table.insert(v34, {
                id = "report", 
                text = v14.report, 
                icon = l_IconName_0.Flag, 
                onActivated = function() --[[ Line: 104 ]] --[[ Name: onActivated ]]
                    -- upvalues: v33 (copy), v18 (ref)
                    v33.onActivated(v18.ANALYTICS.ENTRY_POINT.PEOPLE_CARD);
                end
            });
        end;
        return v34;
    end, {
        v20, 
        v21, 
        v26, 
        v19, 
        v14
    });
    if next(v35) == nil then
        return nil;
    else
        return v2.createElement(l_Menu_0, {
            isOpen = v23, 
            items = v35, 
            size = l_InputSize_0.Medium, 
            onPressedOutside = v27
        }, {
            MenuAnchor = v2.createElement(v11, {
                icon = {
                    on = if v22 then nil else l_IconName_0.ThreeDotsHorizontal
                }, 
                animatedIcon = if v22 then v30 else nil, 
                onActivated = v29, 
                isBuilderIcon = not v22, 
                isBackgroundTransparent = true, 
                LayoutOrder = 1
            })
        });
    end;
end);
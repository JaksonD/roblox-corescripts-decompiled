local l_script_FirstAncestor_0 = script:FindFirstAncestor("PeopleReactView");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_Input_0 = v4.Input;
local l_useLastInputMode_0 = require(l_Parent_0.FocusNavigationUtils).useLastInputMode;
local v8 = require(l_Parent_0.Foundation);
local l_getRbxThumb_0 = v8.Utility.getRbxThumb;
local l_ControlState_0 = v8.Enums.ControlState;
local l_StateLayerAffordance_0 = v8.Enums.StateLayerAffordance;
local l_ThumbnailType_0 = v8.Enums.ThumbnailType;
local l_ThumbnailSize_0 = v8.Enums.ThumbnailSize;
local l_Image_0 = v8.Image;
local l_View_0 = v8.View;
local v16 = require(l_Parent_0.PeopleService);
local v17 = require(l_script_FirstAncestor_0.Configs.PersonButtonConfigs);
local v18 = require(l_script_FirstAncestor_0.Hooks.useGetPeopleService);
local v19 = require(l_script_FirstAncestor_0.Hooks.useIsComponentInputEnded);
local v20 = require(l_script_FirstAncestor_0.Components.Card.CardMenu);
local l_GetFFlagPeoplePageLazyRenderCards_0 = v16.getService("Flags").GetFFlagPeoplePageLazyRenderCards;
local v22 = game:DefineFastFlag("PeoplePageCardMenuUseVisibleProperty", false);
return v2.memo(function(v23) --[[ Line: 43 ]] --[[ Name: CardThumbnail ]]
    -- upvalues: v2 (copy), l_GetFFlagPeoplePageLazyRenderCards_0 (copy), l_usePreferredInput_0 (copy), l_useLastInputMode_0 (copy), v18 (copy), v17 (copy), v3 (copy), v19 (copy), l_ControlState_0 (copy), l_Input_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_Image_0 (copy), l_getRbxThumb_0 (copy), l_ThumbnailType_0 (copy), l_ThumbnailSize_0 (copy), v22 (copy), v20 (copy)
    local v24 = v2.useRef(nil);
    local v25 = if not l_GetFFlagPeoplePageLazyRenderCards_0() then l_usePreferredInput_0() else nil;
    local v26 = if not l_GetFFlagPeoplePageLazyRenderCards_0() then l_useLastInputMode_0() else nil;
    local v27 = v18("Constants");
    local v28 = v18("PeopleVoiceChatStore");
    local v29 = v17(v23.person.UserId);
    local v30 = v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v29 (copy), v27 (copy)
        return v29[v27.PERSON_BUTTONS.INSPECT];
    end, {
        v29
    });
    local v31 = v3.useSignalState(v28.getPlayerIsTalking(v23.person.UserId));
    local v32, v33 = v2.useState(false);
    local v34, v35 = v2.useState(false);
    local v36, v37 = v2.useState(false);
    local v38 = v19(v24);
    local v40 = v2.useCallback(function(v39) --[[ Line: 65 ]]
        -- upvalues: v33 (copy), l_ControlState_0 (ref)
        v33(v39 == l_ControlState_0.Hover);
    end, {});
    local v42 = v2.useCallback(function(v41) --[[ Line: 69 ]]
        -- upvalues: v35 (copy), l_ControlState_0 (ref)
        v35(v41 == l_ControlState_0.Hover);
    end, {});
    local v44 = v2.useMemo(function() --[[ Line: 73 ]]
        -- upvalues: l_GetFFlagPeoplePageLazyRenderCards_0 (ref), v23 (copy), v26 (copy), v25 (copy), l_Input_0 (ref), v32 (copy), v36 (copy), v31 (copy)
        local v43 = if l_GetFFlagPeoplePageLazyRenderCards_0() then v23.shouldShowMenu else v26 == "Focus" or v25 ~= l_Input_0.Pointer;
        return v32 or v36 or v31 or v43;
    end, {
        v32, 
        v36, 
        v31, 
        v25, 
        v26, 
        v23.shouldShowMenu
    });
    local v45 = v2.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v34 (copy), v36 (copy), v38 (copy)
        return v34 or v36 or v38;
    end, {
        v34, 
        v36, 
        v38
    });
    local v46 = v2.useCallback(function() --[[ Line: 85 ]]
        -- upvalues: v30 (copy), v27 (copy)
        v30.onActivated(v27.ANALYTICS.ENTRY_POINT.PEOPLE_CARD);
    end, {
        v30.onActivated
    });
    return v2.createElement(l_View_0, {
        tag = "size-full aspect-1-1 radius-medium", 
        selection = {
            Selectable = v30.shouldShow()
        }, 
        LayoutOrder = v23.layoutOrder, 
        stateLayer = {
            affordance = if v45 then l_StateLayerAffordance_0.None else l_StateLayerAffordance_0.Background
        }, 
        onActivated = if v30.shouldShow() then v46 else nil, 
        onStateChanged = v40, 
        ref = v24
    }, {
        AvatarThumbnailContainer = v2.createElement(l_View_0, {
            tag = "size-full padding-medium"
        }, {
            AvatarThumbnail = v2.createElement(l_Image_0, {
                tag = "size-full", 
                Image = l_getRbxThumb_0(l_ThumbnailType_0.Avatar, v23.person.UserId, l_ThumbnailSize_0.Medium)
            })
        }), 
        ThumbnailHeaderBar = v2.createElement(l_View_0, {
            tag = "row size-full-0 auto-y align-x-right padding-small"
        }, {
            CardMenuBackground = if not not v22 or v44 then v2.createElement(l_View_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                selection = {
                    Selectable = false
                }, 
                stateLayer = {
                    affordance = l_StateLayerAffordance_0.None
                }, 
                onStateChanged = v42, 
                Visible = if v22 then v44 else nil
            }, {
                CardMenu = v2.createElement(v20, {
                    person = v23.person, 
                    onIsOpenChanged = v37
                })
            }) else nil
        })
    });
end);
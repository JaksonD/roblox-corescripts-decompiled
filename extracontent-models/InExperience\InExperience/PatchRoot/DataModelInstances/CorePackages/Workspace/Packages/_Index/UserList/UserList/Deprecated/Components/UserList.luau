local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserList");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_script_FirstAncestor_0.Networking.NetworkingPresence);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v8 = require(l_script_FirstAncestor_0.Common.Constants);
local v9 = require(script.Parent.UserRowWrapper);
return function(v10) --[[ Line: 21 ]] --[[ Name: UserList ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v8 (copy), v4 (copy), l_View_0 (copy), v9 (copy)
    local v11 = l_useDispatch_0();
    local v13 = v2.useCallback(function(v12) --[[ Line: 24 ]]
        -- upvalues: v10 (copy), v11 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref), v8 (ref)
        if v10.onUserSelected then
            v10.onUserSelected(v12);
            return;
        else
            v11(l_NavigateDown_0({
                name = l_AppPage_0.ProfilePlatform, 
                detail = v12, 
                extraProps = {
                    profileType = v8.PROFILE_TYPE
                }
            }));
            return;
        end;
    end, {
        v10.onUserSelected, 
        v11
    });
    v2.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v10 (copy), v11 (copy), v4 (ref)
        if #v10.userIds > 0 then
            v11(v4.GetPresencesFromUserIds.API(v10.userIds));
        end;
    end, {
        v10.userIds
    });
    if #v10.userIds == 0 then
        return nil;
    else
        return v2.createElement(l_View_0, {
            tag = "size-full-0 auto-y col gap-large", 
            LayoutOrder = v10.layoutOrder or 0
        }, {
            UserRows = v2.createElement(v2.Fragment, {}, unpack(v2.useMemo(function() --[[ Line: 57 ]]
                -- upvalues: v10 (copy), v2 (ref), v9 (ref), v13 (copy)
                local v14 = {};
                for v15, v16 in ipairs(v10.userIds) do
                    v14[v15] = v2.createElement(v9, {
                        userId = v16, 
                        LayoutOrder = v15, 
                        onActivated = v13
                    });
                end;
                return v14;
            end, {
                v10.userIds
            })))
        });
    end;
end;
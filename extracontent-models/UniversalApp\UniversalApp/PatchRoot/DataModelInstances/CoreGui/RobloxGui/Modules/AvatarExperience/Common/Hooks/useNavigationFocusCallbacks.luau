local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
return function(v4) --[[ Line: 34 ]] --[[ Name: useNavigationFocusCallbacks ]]
    -- upvalues: l_useNavigation_0 (copy), v1 (copy), v2 (copy)
    local v5 = l_useNavigation_0();
    v1.useEffect(function() --[[ Line: 37 ]]
        -- upvalues: v4 (copy), v5 (copy), v2 (ref)
        local v6 = {};
        local function _(v7, v8) --[[ Line: 40 ]] --[[ Name: addSubscription ]]
            -- upvalues: v4 (ref), v6 (copy), v5 (ref)
            if v4[v8] then
                table.insert(v6, v5.addListener(v7, v4[v8]));
            end;
        end;
        local l_WillFocus_0 = v2.Events.WillFocus;
        if v4.onWillFocus then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onWillFocus));
        end;
        l_WillFocus_0 = v2.Events.WillBlur;
        if v4.onWillBlur then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onWillBlur));
        end;
        l_WillFocus_0 = v2.Events.DidFocus;
        if v4.onDidFocus then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onDidFocus));
        end;
        l_WillFocus_0 = v2.Events.DidBlur;
        if v4.onDidBlur then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onDidBlur));
        end;
        return function() --[[ Line: 51 ]]
            -- upvalues: v6 (copy)
            for _, v12 in v6 do
                v12.remove();
            end;
        end;
    end, {
        v4.onWillFocus, 
        v4.onWillBlur, 
        v4.onDidFocus, 
        v4.onDidBlur
    });
end;
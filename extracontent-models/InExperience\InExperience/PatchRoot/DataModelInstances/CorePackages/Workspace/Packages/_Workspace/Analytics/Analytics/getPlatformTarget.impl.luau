return function(v0) --[[ Line: 1 ]]
    return function() --[[ Line: 2 ]] --[[ Name: getPlatformTarget ]]
        -- upvalues: v0 (copy)
        local v1 = "unknownLua";
        local l_None_0 = Enum.Platform.None;
        pcall(function() --[[ Line: 8 ]]
            -- upvalues: l_None_0 (ref), v0 (ref)
            l_None_0 = v0:GetPlatform();
        end);
        local v3 = true;
        if l_None_0 ~= Enum.Platform.Windows then
            v3 = l_None_0 == Enum.Platform.OSX;
        end;
        local v4 = true;
        if l_None_0 ~= Enum.Platform.IOS then
            v4 = l_None_0 == Enum.Platform.Android;
        end;
        v4 = v4 or l_None_0 == Enum.Platform.UWP;
        local v5 = true;
        if l_None_0 ~= Enum.Platform.XBox360 then
            v5 = l_None_0 == Enum.Platform.XBoxOne;
        end;
        v5 = v5 or l_None_0 == Enum.Platform.PS3 or l_None_0 == Enum.Platform.PS4 or game:GetEngineFeature("PlatformEnumPS5") and l_None_0 == Enum.Platform.PS5 or l_None_0 == Enum.Platform.WiiU;
        return v3 and "client" or v4 and "mobile" or v5 and "console" or v1 .. tostring(l_None_0);
    end;
end;
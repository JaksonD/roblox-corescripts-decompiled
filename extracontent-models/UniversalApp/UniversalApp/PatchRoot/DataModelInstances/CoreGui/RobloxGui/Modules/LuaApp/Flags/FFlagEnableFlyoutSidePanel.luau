if not game:DefineFastFlag("EnableFlyoutSidePanel14", false) then
    return false;
else
    local l_CorePackages_0 = game:GetService("CorePackages");
    return require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP.isFlyoutSidePanelEnabled();
end;
getgenv().Egg = ''
getgenv().H1 = false
getgenv().H3 = false
getgenv().autoRebirth = false
getgenv().Rebirth = 0
getgenv().drop = ''
getgenv().autoVial = false
getgenv().autoEquip = false
getgenv().antiafk = false

local Eggs = {}
for i, v in pairs(workspace.Eggs:GetChildren()) do
    table.insert(Eggs, v.Name:sub(1, -5))
end

local Rebirths = {}
maxRebirths = 43
for i=1, maxRebirths, 1 do
    table.insert(Rebirths, i)
end

game.Players.LocalPlayer.Character.LeftFoot.Touched:Connect(function(hit)
        if hit.Parent.Parent.Parent.Name == "Drops" then
        drop = hit.Parent.Name
    end
end)


local getName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

print("Demi Hub | ".. getName.Name)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Demi Hub | ".. getName.Name, HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest", IntroIcon = "https://www.roblox.com/library/10677758875/DH", IntroText = "Demi Hub"})

local Tab = Window:MakeTab({
	Name = "Auto",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab1 = Window:MakeTab({
	Name = "Menus",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://5012544693",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6022668888",
	PremiumOnly = false
})

Tab3:AddParagraph("                                             Credits", string.format("\nTLX Script: Streamy#1480, Lagend#4320 \nDemi Hub: Streamy#1480, Lagend#4320"))

Tab:AddToggle({
	Name = "Click",
	Default = false,
	Callback = function(Value)
		aT = Value
		spawn(function()
		    while aT do
		    wait()
		    game:GetService("ReplicatedStorage").Remotes.Tap:FireServer(drop)
		 end
	end)
end
})

Tab:AddToggle({
    Name = "Vials",
    Default = false,
    Callback = function(Value)
        autoVial = Value
        spawn(function()
            while autoVial do
                wait(1)
                for i, v in pairs(game.ReplicatedStorage.Stats[game.Players.LocalPlayer.Name].TimeBoosts:GetChildren()) do
                    if v.Value <= 60 then
                        if v.Name == "Tap" then
                            local args = {[1] = "Vial".. "Taps"}
                            game:GetService("ReplicatedStorage").Remotes.UseVial:FireServer(unpack(args))
                        else
                            local args = {[1] = "Vial".. v.Name}
                            game:GetService("ReplicatedStorage").Remotes.UseVial:FireServer(unpack(args))
                        end
                    end
                end
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Collect Chests",
    Default = false,
    Callback = function(Value)
        autoChest = Value
        spawn(function()
            while autoChest do
                wait(5)
                
                local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

                for _, v in pairs(workspace.Chest:GetChildren()) do
                    wait(0.5)
                    
                    if v[v.Name].PrimaryPart.Gui.Timer.Text == "Ready!" then
                        
                        game.Players.LocalPlayer.Character:MoveTo(v[v.Name].Part.Position)
                        wait(0.1)
                        fireproximityprompt(v[v.Name].Part:GetChildren()[1])
                    end
                end
                game.Players.LocalPlayer.Character:MoveTo(pos)
            end
        end)
    end
})

Tab2:AddToggle({
    Name = "Anti Afk",
    Default = false,
    Callback = function(Value)
        local vu = game:GetService("VirtualUser")
        antiafk = Value
        
        spawn(function()
            while antiafk do
                wait(60)
                if not antiafk then return end
                game:GetService("Players").LocalPlayer.Idled:connect(function()
                   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                   wait(0.5)
                   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end)
            end
        end)
    end
})

local Section = Tab:AddSection({
	Name = "Hatching"
})

Tab:AddToggle({
    Name = "Hatch x1",
    Default = false,
    Callback = function(Value)
        H1 = Value
        spawn(function()
            while H1 do
              wait()
              local args = {[1] = Egg.. " Egg", [2] = 1}
              game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(unpack(args))
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Hatch x3",
    Default = false,
    Callback = function(Value)
        H3 = Value
        spawn(function()
            while H3 do
            wait()
            local args = {[1] = Egg.. " Egg", [2] = 3}
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(unpack(args))
         end
    end)
end
})

Tab:AddDropdown({
    Name = "Select Egg",
    Default = "Select Egg",
    Options = {unpack(Eggs)},
    Callback = function(Value)
        Egg = Value
        game:GetService("Players").LocalPlayer.Character:MoveTo(workspace.Eggs[Egg.. " Egg"].E.Position)
    end
})

Tab:AddToggle({
	Name = "Equip Best",
	Default = false,
	Callback = function(Value)
	    autoEquip = Value
        spawn(function()
            while autoEquip do
                wait(2.5)
                if not autoEquip then return end
                game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
                game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
            end
        end)
	end
})

local Section2 = Tab:AddSection({
	Name = "Rebirths"
})

Tab:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        autoRebirth = Value
        spawn(function()
            while autoRebirth do
            wait()
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(Rebirth)
		 end
	end)
end
})

Tab:AddDropdown({
    Name = "Select Rebirth",
    Default = "Select Rebirth",
    Options = {unpack(Rebirths)},
    Callback = function(Value)
        Rebirth = Value
    end    
})

Tab1:AddBind({
	Name = "Index",
	Default = Enum.KeyCode.R,
	Hold = false,
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Menus.Index.Enabled = true
        game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.Upgrades.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.TapSkins.Enabled = false
	end    
})

Tab1:AddBind({
	Name = "Upgrades",
	Default = Enum.KeyCode.T,
	Hold = false,
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Menus.Index.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.Upgrades.Enabled = true
        game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.TapSkins.Enabled = false
	end    
})

Tab1:AddBind({
	Name = "Skins",
	Default = Enum.KeyCode.Y,
	Hold = false,
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Menus.Index.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.Upgrades.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.TapSkins.Enabled = true
	end    
})

Tab1:AddBind({
	Name = "Golden Machine",
	Default = Enum.KeyCode.U,
	Hold = false,
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Menus.Index.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.Upgrades.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.TapSkins.Enabled = false
        wait(0.1)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        local goldclone = workspace.UIProx.GoldenMachine:Clone()
        goldclone.Parent = workspace.UIProx
        goldclone.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
        spawn(function()
            while wait() do
                if game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled == false and game.Players.LocalPlayer.PlayerGui.Menus.MachineResult.Enabled == false then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
                    goldclone:Destroy()
                    return
                end
            end
        end)
        spawn(function()
            while wait() do
                if game.Players.LocalPlayer.PlayerGui.Menus.MachineResult.Enabled == true or game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled == true then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
                end
            end
        end)
        if rainbowclone then
            rainbowclone:Destroy()
        end
	end    
})

Tab1:AddBind({
	Name = "Rainbow Machine",
	Default = Enum.KeyCode.F,
	Hold = false,
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.Menus.Index.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.Upgrades.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.GoldenMachine.Enabled = false
        game.Players.LocalPlayer.PlayerGui.Menus.TapSkins.Enabled = false
        wait(0.1)
        local rainbowclone = workspace.UIProx.RainbowMachine:Clone()
        rainbowclone.Parent = workspace.UIProx
        rainbowclone.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
        spawn(function()
            while wait() do
                if game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled == false and game.Players.LocalPlayer.PlayerGui.Menus.MachineResult.Enabled == false then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 25
                    rainbowclone:Destroy()
                    return
                end
            end
        end)
        spawn(function()
            while wait() do
                if game.Players.LocalPlayer.PlayerGui.Menus.MachineResult.Enabled == true or game.Players.LocalPlayer.PlayerGui.Menus.RainbowMachine.Enabled == true then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
                end
            end
        end)
        if goldclone then
            goldclone:Destroy()
        end
	end    
})

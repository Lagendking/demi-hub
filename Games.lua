local ScreenGui = Instance.new("ScreenGui")
local Shadow = Instance.new("ImageLabel")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Title = Instance.new("TextLabel")
local Line = Instance.new("Frame")
local Games = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local TLX = Instance.new("ImageButton")
local gameName = Instance.new("TextLabel")
local Join = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local UICorner_3 = Instance.new("UICorner")
local OT = Instance.new("ImageButton")
local gameName_2 = Instance.new("TextLabel")
local Join_2 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UICorner_5 = Instance.new("UICorner")
local RC = Instance.new("ImageButton")
local gameName_3 = Instance.new("TextLabel")
local Join_3 = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UICorner_7 = Instance.new("UICorner")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Shadow.Name = "Shadow"
Shadow.Parent = ScreenGui
Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shadow.BackgroundTransparency = 1.000
Shadow.Position = UDim2.new(0.275988281, 0, 0.220520675, 0)
Shadow.Size = UDim2.new(0, 612, 0, 364)
Shadow.Image = "rbxassetid://10668890171"

Main.Name = "Main"
Main.Parent = Shadow
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.Position = UDim2.new(0.0294117648, 0, 0.0494505502, 0)
Main.Size = UDim2.new(0, 576, 0, 328)

UICorner.Parent = Main

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(21, 0, 255)), ColorSequenceKeypoint.new(0.58, Color3.fromRGB(179, 0, 255)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(179, 0, 255)), ColorSequenceKeypoint.new(0.72, Color3.fromRGB(180, 0, 255)), ColorSequenceKeypoint.new(0.78, Color3.fromRGB(179, 0, 255)), ColorSequenceKeypoint.new(0.86, Color3.fromRGB(180, 0, 255)), ColorSequenceKeypoint.new(0.93, Color3.fromRGB(179, 0, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(183, 0, 255))}
UIGradient.Rotation = 35
UIGradient.Parent = Main

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 574, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "Demi Hub | Games"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

Line.Name = "Line"
Line.Parent = Title
Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Line.Position = UDim2.new(0, 0, 1.12, 0)
Line.Size = UDim2.new(0, 574, 0, 0)

Games.Name = "Games"
Games.Parent = Main
Games.Active = true
Games.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Games.BackgroundTransparency = 1.000
Games.Position = UDim2.new(0.0503896065, 0, 0.217050791, 0)
Games.Size = UDim2.new(0, 545, 0, 250)

UIGridLayout.Parent = Games
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 25, 0, 22)
UIGridLayout.CellSize = UDim2.new(0, 150, 0, 150)
UIGridLayout.FillDirectionMaxCells = 100

TLX.Name = "TLX"
TLX.Parent = Games
TLX.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TLX.Size = UDim2.new(0, 100, 0, 100)
TLX.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

gameName.Name = "gameName"
gameName.Parent = TLX
gameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gameName.BackgroundTransparency = 1.000
gameName.Size = UDim2.new(0, 150, 0, 29)
gameName.Font = Enum.Font.SourceSansBold
gameName.Text = "Tapping Legends X"
gameName.TextColor3 = Color3.fromRGB(255, 255, 255)
gameName.TextScaled = true
gameName.TextSize = 14.000
gameName.TextStrokeTransparency = 0.600
gameName.TextWrapped = true

Join.Name = "Join"
Join.Parent = TLX
Join.BackgroundColor3 = Color3.fromRGB(64, 255, 6)
Join.BorderSizePixel = 2
Join.Position = UDim2.new(0.0933333337, 0, 0.726666689, 0)
Join.Size = UDim2.new(0, 121, 0, 31)
Join.Font = Enum.Font.SourceSansBold
Join.Text = "Play Game"
Join.TextColor3 = Color3.fromRGB(255, 255, 255)
Join.TextScaled = true
Join.TextSize = 14.000
Join.TextStrokeTransparency = 0.700
Join.TextWrapped = true

UICorner_2.Parent = Join

UICorner_3.Parent = TLX

OT.Name = "OT"
OT.Parent = Games
OT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OT.Size = UDim2.new(0, 100, 0, 100)
OT.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

gameName_2.Name = "gameName"
gameName_2.Parent = OT
gameName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gameName_2.BackgroundTransparency = 1.000
gameName_2.Size = UDim2.new(0, 150, 0, 29)
gameName_2.Font = Enum.Font.SourceSansBold
gameName_2.Text = "Oof Tycoon"
gameName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
gameName_2.TextScaled = true
gameName_2.TextSize = 14.000
gameName_2.TextStrokeTransparency = 0.600
gameName_2.TextWrapped = true

Join_2.Name = "Join"
Join_2.Parent = OT
Join_2.BackgroundColor3 = Color3.fromRGB(64, 255, 6)
Join_2.BorderSizePixel = 2
Join_2.Position = UDim2.new(0.0933333337, 0, 0.726666689, 0)
Join_2.Size = UDim2.new(0, 121, 0, 31)
Join_2.Font = Enum.Font.SourceSansBold
Join_2.Text = "Play Game"
Join_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Join_2.TextScaled = true
Join_2.TextSize = 14.000
Join_2.TextStrokeTransparency = 0.700
Join_2.TextWrapped = true

UICorner_4.Parent = Join_2

UICorner_5.Parent = OT

RC.Name = "RC"
RC.Parent = Games
RC.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RC.Size = UDim2.new(0, 100, 0, 100)
RC.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

gameName_3.Name = "gameName"
gameName_3.Parent = RC
gameName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gameName_3.BackgroundTransparency = 1.000
gameName_3.Size = UDim2.new(0, 150, 0, 29)
gameName_3.Font = Enum.Font.SourceSansBold
gameName_3.Text = "Race Clicker"
gameName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
gameName_3.TextScaled = true
gameName_3.TextSize = 14.000
gameName_3.TextStrokeTransparency = 0.600
gameName_3.TextWrapped = true

Join_3.Name = "Join"
Join_3.Parent = RC
Join_3.BackgroundColor3 = Color3.fromRGB(64, 255, 6)
Join_3.BorderSizePixel = 2
Join_3.Position = UDim2.new(0.0933333337, 0, 0.726666689, 0)
Join_3.Size = UDim2.new(0, 121, 0, 31)
Join_3.Font = Enum.Font.SourceSansBold
Join_3.Text = "Play Game"
Join_3.TextColor3 = Color3.fromRGB(255, 255, 255)
Join_3.TextScaled = true
Join_3.TextSize = 14.000
Join_3.TextStrokeTransparency = 0.700
Join_3.TextWrapped = true

UICorner_6.Parent = Join_3

UICorner_7.Parent = RC

local function SQLJ_fake_script()
	local script = Instance.new('LocalScript', TLX)

	local placeId = 8750997647
	script.Parent.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..placeId.."&fmt=png&wd=420&ht=420"
end
coroutine.wrap(SQLJ_fake_script)()
local function DJZTHCO_fake_script()
	local script = Instance.new('LocalScript', Join)

	local tps = game:GetService("TeleportService")
	local placeid = 8750997647
	
	script.Parent.MouseButton1Click:Connect(function()
		tps:Teleport(placeid, game:GetService("Players").LocalPlayer)
	end)
end
coroutine.wrap(DJZTHCO_fake_script)()
local function GBQKY_fake_script()
	local script = Instance.new('LocalScript', OT)

	local placeId = 10325366821
	script.Parent.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..placeId.."&fmt=png&wd=420&ht=420"
end
coroutine.wrap(GBQKY_fake_script)()
local function NGPYE_fake_script()
	local script = Instance.new('LocalScript', Join_2)

	local tps = game:GetService("TeleportService")
	local placeid = 10325366821
	
	script.Parent.MouseButton1Click:Connect(function()
		tps:Teleport(placeid, game:GetService("Players").LocalPlayer)
	end)
end
coroutine.wrap(NGPYE_fake_script)()
local function OZZTNXL_fake_script() 
	local script = Instance.new('LocalScript', RC)

	local placeId = 9285238704
	script.Parent.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..placeId.."&fmt=png&wd=420&ht=420"
end
coroutine.wrap(OZZTNXL_fake_script)()
local function CSJZA_fake_script()
	local script = Instance.new('LocalScript', Join_3)

	local tps = game:GetService("TeleportService")
	local placeid = 9285238704
	script.Parent.MouseButton1Click:Connect(function()
		tps:Teleport(placeid, game:GetService("Players").LocalPlayer)
	end)
end
coroutine.wrap(CSJZA_fake_script)()

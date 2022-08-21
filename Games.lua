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
Games.Position = UDim2.new(0.0121951215, 0, 0.192660555, 0)
Games.Size = UDim2.new(0, 567, 0, 258)

UIGridLayout.Parent = Games
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 22, 0, 22)
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



local function WBYYBW_fake_script() -- TLX.IMG Updater 
	local script = Instance.new('LocalScript', TLX)

	local placeId = 8750997647
	script.Parent.Image = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid="..placeId.."&fmt=png&wd=420&ht=420"
end
coroutine.wrap(WBYYBW_fake_script)()
local function HKNQG_fake_script() -- Join.LocalScript 
	local script = Instance.new('LocalScript', Join)

	local tps = game:GetService("TeleportService")
	local placeid = 8750997647
	
	script.Parent.MouseButton1Click:Connect(function()
		tps:Teleport(placeid, game:GetService("Players").LocalPlayer)
	end)
end
coroutine.wrap(HKNQG_fake_script)()

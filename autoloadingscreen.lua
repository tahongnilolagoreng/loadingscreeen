-- Auto-Teleport to Less Populated Server with Custom Loading Screen
-- For Grow A Garden or any public server game

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local placeId = game.PlaceId

-- Loading Screen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SafeServerLoadingScreen"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local TextLabel = Instance.new("TextLabel")
TextLabel.Text = "If being kicked from the server please do not close.\nWait patiently as the script is taking you to a less populated server."
TextLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
TextLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

-- Function to find a less populated server
local function findServer()
	local servers = {}
	local cursor = ""
	local found = false
	local tryCount = 0

	repeat
		local url = "https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor
		local response = HttpService:JSONDecode(game:HttpGet(url))

		for _, server in pairs(response.data) do
			if server.playing < server.maxPlayers - 2 and server.id ~= game.JobId then
				return server.id
			end
		end

		cursor = response.nextPageCursor or ""
		tryCount += 1
		task.wait(0.5)
	until found or cursor == "" or tryCount >= 5

	return nil
end

-- Teleport the player to the best server found
task.spawn(function()
	local server
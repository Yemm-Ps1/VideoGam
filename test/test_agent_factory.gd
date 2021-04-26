extends "res://addons/gut/test.gd"

var AgentFactory = preload("res://ai/AgentFactory.gd")
var BotAgent = preload("res://ai/BotAgent.gd")
var test_grid = [[0, 0]]


func test_addAndGetBots_twentyBots_shouldHaveTwentyBots():
	var expected_pool_size = 20
	
	var agent_factory = AgentFactory.new(test_grid)
	agent_factory.add_bots(20)
	var found_pool = agent_factory.get_bot_pool()
	
	var pool_size = len(found_pool)
	
	assert_eq(pool_size, expected_pool_size, "Incorrect pool size")
	
	for obj in found_pool:
		assert_true(typeof(obj) == typeof(BotAgent), "Non-bot agent found in pool.")
	

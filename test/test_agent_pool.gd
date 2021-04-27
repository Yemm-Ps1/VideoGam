extends "res://addons/gut/test.gd"

var AgentPool = preload("res://ai/AgentPool.gd")
var BotAgent = preload("res://ai/BotAgent.gd")
var tiny_grid = [[15]]
var small_grid = [[11, 15, 11], [8, 5, 2], [14, 13, 6]]


func test_addAndGetBots_twentyBots_shouldHaveTwentyBots():
	var expected_pool_size = 20
	
	var agent_pool = AgentPool.new(tiny_grid)
	agent_pool.add_bots(20)
	var found_pool = agent_pool.get_bot_pool()
	
	var pool_size = len(found_pool)
	
	assert_eq(pool_size, expected_pool_size, "Incorrect pool size")
	
	for obj in found_pool:
		assert_true(typeof(obj) == typeof(BotAgent), "Non-bot agent found in pool.")
	
func test_andAndUpdate_shouldHaveBotsAtExpectedInitLocale():
	var test_pool_size = 5
	var agent_pool = AgentPool.new(small_grid)
	agent_pool.add_bots(test_pool_size)

	var agents_at_start_position = agent_pool.get_bots_by_locale(0, 0)
	assert_eq_shallow(len(agents_at_start_position), 5)
	
func test_andAndUpdate_shouldHaveBotsAtExpectedNextLocations():
	var test_pool_size = 5
	var agent_pool = AgentPool.new(small_grid)
	agent_pool.add_bots(test_pool_size)

	var return_of_update = agent_pool.update_locale_and_get_paths(0, 0)
	var expected_return = {[[0, 1]]: 5}
	assert_eq_shallow(return_of_update, expected_return)
	
	var return_of_update_two = agent_pool.update_locale_and_get_paths(0, 1)
	var expected_return_two = {[[1, 1], [2, 1]]: 5}
	assert_eq_shallow(return_of_update_two, expected_return_two)
	
	var return_of_update_three = agent_pool.update_locale_and_get_paths(2, 1)
	var expected_return_three = {[[2, 2], [1, 2]]: 5}
	assert_eq_shallow(return_of_update, expected_return)
	


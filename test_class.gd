class_name test_script

var test_int
var test_str

func _init(arg_int := 123, arg_str := "abc") -> void:
	if arg_int:
		test_int = arg_int
	if arg_str:
		test_str = arg_str

func test_func() -> void:
	print('test func invoked')
	
func print_test_vars(type: String) -> void:
	if type == "string":
		print(test_str)
	if type == "integer":
		print(test_int)


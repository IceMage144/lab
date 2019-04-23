init:
	bazel clean --expunge
	bazel build -c opt //:deepmind_lab.so --python_path=/usr/bin/python3.5
	bazel test -c opt //python/tests:python_module_test --python_path=/usr/bin/python3.5

game:
	bazel run :game --python_path=/usr/bin/python3.5 -- -l tests/empty_room_test -s logToStdErr=true

random:
	bazel run :python_random_agent --python_path=/usr/bin/python3.5 --define graphics=sdl -- --length=10000 --width=640 --height=480

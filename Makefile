
all: test1 test2

test1:
	echo "running $@"
	./error_script.sh

test2:
	echo "running $@"
	./passed_script.sh

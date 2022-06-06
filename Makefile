
all: check-tools test1 test2

check-tools:
	./check_tools.sh

test1:
	echo "running $@"
	./error_script.sh

test2:
	echo "running $@"
	./passed_script.sh

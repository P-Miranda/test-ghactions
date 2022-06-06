
all: test

test:
	echo "running test"
	make run-script

run-script:
	./error_script.sh

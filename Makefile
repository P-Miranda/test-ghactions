ARTIFACT_DIR := ./build
ARTIFACT := artifact.tar

all: test1 test2

check-tools:
	./check_tools.sh

test1:
	echo "running $@"
	./error_script.sh

test2:
	echo "running $@"
	./passed_script.sh

build-artifact:
	echo "building artifact"
	rm -rf $(ARTIFACT_DIR)
	mkdir -p $(ARTIFACT_DIR)
	cp Makefile $(ARTIFACT_DIR)/
	cp *.sh $(ARTIFACT_DIR)/
	cp README.md $(ARTIFACT_DIR)/
	tar -cvf $(ARTIFACT) $(ARTIFACT_DIR)
	

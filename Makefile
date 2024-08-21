CC=C:/raylib/w64devkit/bin/gcc

CFLAGS=-Wimplicit-function-declaration -std=c17
CFLAGS_DBUG=-DDEBUG -g
CFLAGS_RELEASE=-O3
TARGET=test
BUILD_DIR=build

OBJS=test.o skiplist.o

ifdef DEBUG
CFLAGS += $(CFLAGS_DBUG)
else
CFLAGS += $(CFLAGS_RELEASE)
endif

ifdef VERBOSE
VERBOSE = @echo
else
VERBOSE = 
endif

$(TARGET): $(OBJS) $(BUILD_DIR)
	$(VERBOSE)$(CC) $(addprefix $(BUILD_DIR)/, $(OBJS)) -o $(BUILD_DIR)/$@

$(BUILD_DIR):
	mkdir ./$(BUILD_DIR)

%.o: %.c $(BUILD_DIR)
	$(VERBOSE)$(CC) $(CFLAGS) -c $< -o $(BUILD_DIR)/$@

clean:
	$(VERBOSE)rm $(addprefix $(BUILD_DIR)/, $(OBJS)) $(BUILD_DIR)/$(TARGET).exe

run: $(TARGET)
	$(VERBOSE) $(BUILD_DIR)/$(TARGET)
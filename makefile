CFLAGS = `sdl2-config --cflags` -O4 -Wall -Wextra -Wfloat-equal -pedantic -std=c89 -lm -lSDL2_image -lSDL2_mixer -lSDL2_ttf
INCS = neillsdl2.h
TARGET = teletext
SOURCES =  neillsdl2.c $(TARGET).c
LIBS =  `sdl2-config --libs`
CC = gcc


all: $(TARGET)

$(TARGET): $(SOURCES) $(INCS)
	$(CC) $(SOURCES) -o $(TARGET) $(CFLAGS) $(LIBS)

clean:
	rm -f $(TARGET)

run: all
	./$(TARGET) eowl_english_words.txt

push:
	git commit -a -m $$(date +%d-%m-%Y/%H:%M)
	git push
pull:
	git pull
